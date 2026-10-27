package app.noam.patches.geocaching.misc.extension

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.noam.patches.geocaching.shared.Constants
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal object GeoApplicationOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/groundspeak/geocaching/intro/GeoApplication;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf(),
)

private object UserStatisticsCallFingerprint : Fingerprint(
    definingClass = "Lcom/groundspeak/geocaching/intro/network/api/stats/b;",
    name = "a",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/String;", "Lkotlin/coroutines/jvm/internal/ContinuationImpl;"),
)

/** GeocacheLogsApi: b = delete a log, e = edit a log, g = post a log. */
private const val LOGS_API = "Lcom/groundspeak/geocaching/intro/network/api/geocaches/logs/a;"

/** Gives the extension the app's context, its API client id, and a signal when your logs change. */
internal val extensionHookPatch = bytecodePatch(
    description = "Connects the Morphe extension to the app.",
) {
    extendWith(Constants.EXTENSION_FILE)

    execute {
        GeoApplicationOnCreateFingerprint.method.apply {
            val superCall = instructions.indexOfFirst { it.opcode == Opcode.INVOKE_SUPER }
            addInstruction(
                superCall + 1,
                "invoke-static { p0 }, ${Constants.UTILS}->onApplicationCreate(Landroid/app/Application;)V",
            )
        }

        // The finds list needs the app's API client id: the string the stats call sends after "Consumer-Key".
        val strings = UserStatisticsCallFingerprint.method.instructions
            .filter { it.opcode == Opcode.CONST_STRING || it.opcode == Opcode.CONST_STRING_JUMBO }
            .map { ((it as ReferenceInstruction).reference as StringReference).string }
        val consumerKey = strings.getOrNull(strings.indexOf("Consumer-Key") + 1)
        require(strings.contains("Consumer-Key") && !consumerKey.isNullOrEmpty()) { "App API client id not found" }
        mutableClassDefBy(Constants.GC_USER_STATS).methods.first { it.name == "consumerKey" }.replaceInstructions(
            0,
            """
                const-string v0, "$consumerKey"
                return-object v0
            """,
        )

        // Posting, editing or deleting a log changes found status; cached caches are rebuilt after it.
        for (name in listOf("b", "e", "g")) {
            mutableClassDefBy(LOGS_API).methods.first { it.name == name && it.returnType == "Ljava/lang/Object;" }
                .addInstruction(0, "invoke-static { }, ${Constants.GC_LIVE_DETAIL}->forgetRecent()V")
        }
    }
}
