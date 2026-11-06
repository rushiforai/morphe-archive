package app.template.patches.ntiles

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags

private val QUICK_SETTINGS = Compatibility(
    name = "Quick Settings",
    packageName = "it.simonesestito.ntiles",
    apkFileType = ApkFileType.APK,
    appIconColor = 0x2196F3,
    targets = listOf(AppTarget(version = "12.0.3-17888438")),
)

/**
 * Method P() in MainActivity.
 * Only loads the interstitial if flag N (qs_remove_ads_sub) is false.
 * Fixed log strings and unit ID → stable fingerprint.
 * Early return prevents loading the interstitial.
 */
private object LoadInterstitialFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(),
    strings = listOf(
        "resetInterstitialAd: loading interstitial ad",
        "app_tiles_already_used",
        "ca-app-pub-6689194408787233/5241506906",
    ),
)

/**
 * MainActivity onCreate.
 * On start set N = true so the app treats the local ads preference as active
 * (hides purchase buttons and skips banners).
 */
private object MainActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lit/simonesestito/ntiles/ui/activity/MainActivity;",
    name = "onCreate",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

@Suppress("unused")
val unlockRemoveAdsPatch = bytecodePatch(
    name = "Hide Ads Preference",
    description = "Uses a local preference so interstitial and banner ads stay off.",
    default = true,
) {
    compatibleWith(QUICK_SETTINGS)

    execute {
        // No carga el intersticial.
        LoadInterstitialFingerprint.method.returnEarly()

        // At onCreate start (after super), set N = true.
        // p0 = this (MainActivity).
        val onCreate = MainActivityOnCreateFingerprint.method
        onCreate.addInstructions(
            1,
            """
                const/4 v0, 0x1
                iput-boolean v0, p0, Lit/simonesestito/ntiles/ui/activity/MainActivity;->N:Z
            """,
        )
    }
}
