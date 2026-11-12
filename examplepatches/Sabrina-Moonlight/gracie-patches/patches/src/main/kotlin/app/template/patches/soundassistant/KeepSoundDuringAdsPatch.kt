package app.template.patches.soundassistant

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.template.patches.shared.cert.extractApkCertificatePatch
import app.template.patches.shared.firebase.spoofFirebaseCertHashPatch
import app.template.patches.shared.installer.spoofInstallSourcePatch
import app.template.patches.shared.signature.spoofSignatureVerificationPatch

private val SOUND_ASSISTANT = Compatibility(
    name = "Sound Assistant",
    packageName = "com.samsung.android.soundassistant",
    apkFileType = ApkFileType.APK,
    appIconColor = 0x2196F3,
    targets = listOf(
        AppTarget(version = "8.5.00.2"),
    ),
)

/**
 * n3.k.n(Context) — reads Settings.System "multi_audio_focus_enabled".
 * Always return true so dual-app / multi audio focus is considered on.
 */
private object IsMultiAudioFocusEnabledFingerprint : Fingerprint(
    definingClass = "Ln3/k;",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf("multi_audio_focus_enabled"),
)

/**
 * BootReceiver restores ignore-audio-focus for one uid.
 * We also force multi audio focus on at boot via the same flow.
 */
private object BootReceiverInitFingerprint : Fingerprint(
    definingClass = "Lcom/samsung/android/soundassistant/receivers/BootReceiver;",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf(
        "soundassistant_ignore_audio_focus_enabled",
        "soundassistant_ignore_audio_focus_uid",
        "SAT_BootReceiver",
    ),
)

@Suppress("unused")
val keepSoundDuringAdsPatch = bytecodePatch(
    name = "Keep sound during ads",
    description = "Prevents media from pausing when ads play.",
    default = true,
) {
    compatibleWith(SOUND_ASSISTANT)

    dependsOn(
        extractApkCertificatePatch,
        spoofFirebaseCertHashPatch,
        spoofInstallSourcePatch,
        spoofSignatureVerificationPatch,
    )

    execute {
        // Always report multi audio focus as enabled (so the UI and logic treat it as on).
        IsMultiAudioFocusEnabledFingerprint.method.returnEarly(true)

        // At boot force multi audio focus on via the real enable method.
        // p0 = Context (static method a(Context)).
        BootReceiverInitFingerprint.method.addInstructions(
            0,
            """
            const/4 v0, 0x1
            const/4 v1, 0x1
            invoke-static {p0, v0, v1}, Ln3/k;->F(Landroid/content/Context;ZZ)Z
            """.trimIndent(),
        )
    }
}
