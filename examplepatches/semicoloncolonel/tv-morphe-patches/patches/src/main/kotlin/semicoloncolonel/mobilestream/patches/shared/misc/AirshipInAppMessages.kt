package semicoloncolonel.mobilestream.patches.shared.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

// Airship's in-app module (in-app messages and automations) gets its content
// by subscribing to the "in_app_messages" remote-data feed, in one coroutine:
// RemoteData.payloadFlow("in_app_messages"). Airship is obfuscated, so the
// coroutine is found by that literal: an invokeSuspend in a Function2 lambda.
// Pointing it at a feed name that does not exist leaves the module with no
// message to show. Push uses Airship's device API and is not affected.
private const val FEED = "in_app_messages"

internal object AirshipInAppFeedFingerprint : Fingerprint(
    name = "invokeSuspend",
    strings = listOf(FEED),
    custom = { _, classDef -> classDef.interfaces.contains("Lkotlin/jvm/functions/Function2;") },
)

// Older Airship builds (The Washington Post 7.18.1) process the feed in a
// plain method instead: the remote-data observer that schedules each in-app
// campaign and returns whether anything changed. Returning FALSE, its own
// answer for "nothing new", schedules nothing.
internal object AirshipInAppRemoteDataFingerprint : Fingerprint(
    returnType = "Ljava/lang/Boolean;",
    strings = listOf("com.urbanairship.iaa.REMOTE_DATA_INFO", "frequency_constraints"),
)

internal fun BytecodePatchContext.disableAirshipInAppMessages() {
    val feed = AirshipInAppFeedFingerprint.methodOrNull
    if (feed == null) {
        AirshipInAppRemoteDataFingerprint.method.returnEarly(
            "sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;\nreturn-object v0",
        )
        return
    }
    feed.apply {
        val index = implementation!!.instructions.indexOfFirst {
            it.opcode == Opcode.CONST_STRING &&
                ((it as ReferenceInstruction).reference as StringReference).string == FEED
        }
        val register = (implementation!!.instructions.elementAt(index) as OneRegisterInstruction).registerA
        replaceInstruction(index, "const-string v$register, \"${FEED}_disabled\"")
    }
}
