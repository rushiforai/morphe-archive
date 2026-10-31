package app.aapam.patches.coloringlearn.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.aapam.patches.coloringlearn.shared.AdmobInitFingerprint
import app.aapam.patches.coloringlearn.shared.AdmobLoadFingerprint
import app.aapam.patches.coloringlearn.shared.AdmobShowFingerprint
import app.aapam.patches.coloringlearn.shared.Constants

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all AdMob ads (banner, interstitial, rewarded, " +
        "rewarded interstitial, app open) by intercepting the Corona SDK " +
        "AdMob plugin bridge before any ad is initialised, loaded, or shown.",
) {
    compatibleWith(Constants.COMPATIBILITY_COLORING_LEARN)

    execute {
        // Block SDK init — isSDKInitialized stays false, so all subsequent
        // load/show calls return 0 (Lua no-op) without doing anything.
        AdmobInitFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "[AAPAM_LOG]"
                const-string v1, "admob.init() intercepted"
                invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
                const/4 v0, 0x0
                return v0
            """,
        )

        // Belt-and-suspenders: also block load() and show() directly so the
        // patch stays robust if the init guard logic ever changes.
        AdmobLoadFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "[AAPAM_LOG]"
                const-string v1, "admob.load() intercepted"
                invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
                const/4 v0, 0x0
                return v0
            """,
        )
        AdmobShowFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "[AAPAM_LOG]"
                const-string v1, "admob.show() intercepted"
                invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
                const/4 v0, 0x0
                return v0
            """,
        )
    }
}
