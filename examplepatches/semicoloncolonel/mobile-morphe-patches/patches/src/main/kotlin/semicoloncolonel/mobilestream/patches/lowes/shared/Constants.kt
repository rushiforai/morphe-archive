package semicoloncolonel.mobilestream.patches.lowes.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Lowe's",
        packageName = "com.lowes.android",
        description = "The Lowe's shopping app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x012169,
        targets = listOf(AppTarget("26.10.7"))
    )
}

// Lowe's 26.10.7 reads every on/off feature switch through one method,
// LocalRemoteConfigImpl.b(SwitchDevControl). Each switch is a constant of the
// SwitchDevControl enum, and the enum's names are not obfuscated.
internal object FeatureSwitchReaderFingerprint : Fingerprint(
    definingClass = "Lcom/lowes/android/core/debug/LocalRemoteConfigImpl;",
    parameters = listOf("Lcom/lowes/android/core/debug/SwitchDevControl;"),
    returnType = "Z",
)

/** A gate for the switch reader: switches that [filter] accepts read as off. */
internal fun switchGate(filter: String) = """
    invoke-static/range { p1 .. p1 }, $filter(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :msp_orig
    const/4 v0, 0x0
    return v0
"""
