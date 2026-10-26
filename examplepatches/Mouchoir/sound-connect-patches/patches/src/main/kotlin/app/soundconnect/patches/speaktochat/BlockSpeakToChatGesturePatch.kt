package app.soundconnect.patches.speaktochat

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private val COMPATIBILITY_SOUND_CONNECT = Compatibility(
    name = "Sound Connect",
    packageName = "com.sony.songpal.mdr",
    // Sound Connect ships as split APKs.
    apkFileType = ApkFileType.APKM,
    appIconColor = 0x1A1A1A,
    targets = listOf(
        AppTarget(version = "13.3.0"),
        // The fingerprints match on stable protocol names and log strings, not on obfuscated names.
        AppTarget(version = null, isExperimental = true),
    ),
)

/** Calls [hook] with the app-side Speak-to-Chat value held by the `move-result-object` [fingerprint] ends on. */
private fun BytecodePatchContext.hookConvertedValue(fingerprint: Fingerprint, hook: String) {
    val moveResult = fingerprint.instructionMatches.last()
    val register = moveResult.getInstruction<OneRegisterInstruction>().registerA
    fingerprint.method.addInstruction(
        moveResult.index + 1,
        "invoke-static { v$register }, $GUARD_CLASS->$hook(Ljava/lang/Object;)V",
    )
}

@Suppress("unused")
val blockSpeakToChatGesturePatch = bytecodePatch(
    name = "Block Speak-to-Chat gesture",
    description = "Turns Speak-to-Chat back off whenever the headset switches it on by itself, " +
        "such as the two-finger hold on the WH-1000XM4 touch panel. " +
        "The other touch controls and the in-app Speak-to-Chat switch keep working.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SOUND_CONNECT)

    extendWith("extensions/speaktochat.mpe")

    execute {
        // In-app requests: recorded before the sender sends them.
        SetSpeakToChatFingerprint.method.addInstruction(
            0,
            "invoke-static { p0, p1 }, $GUARD_CLASS->onAppRequest(Ljava/lang/Object;Z)V",
        )

        SenderConstructorFingerprint.let {
            it.method.addInstruction(
                it.instructionMatches.first().index + 1,
                "invoke-static { p0 }, $GUARD_CLASS->registerSender(Ljava/lang/Object;)V",
            )
        }

        // Let the extension call the setter by its obfuscated name.
        SetterNameFingerprint.method.replaceInstruction(
            0,
            "const-string v0, \"${SetSpeakToChatFingerprint.originalMethod.name}\"",
        )

        // Headset notifications and the state read at connection time.
        hookConvertedValue(SpeakToChatNotificationFingerprint, "onNotifiedState")
        hookConvertedValue(SpeakToChatInitialStateFingerprint, "onInitialState")
    }
}
