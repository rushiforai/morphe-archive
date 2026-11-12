package app.template.patches.apksinstaller

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

/**
 * APKS Installer (com.inwepo.apkinstaller) ads are gated by ONE master flag:
 * MyApplication.m (static volatile boolean). It is set true in onCreate only
 * when the privacy_agreed + setup_completed prefs are true, and the ad
 * initializer l2/N.a() sets it true and calls MobileAds.initialize().
 * Every ad path (banner, app-open, interstitial) reads m and skips loading
 * when it is false. Forcing m to false disables all ads.
 * Verified on APKS Installer 2.8-Google, versionCode 27.
 */

/**
 * MyApplication.onCreate — sets m from the prefs.
 *
 * Instruction order in the method:
 *   const-string "AppPrefs" / "privacy_agreed" / "setup_completed"
 *   const/4 v1, 0x1            (only when privacy + setup are done)
 *   sput-boolean v1, Lcom/inwepo/apkinstaller/MyApplication;->m:Z
 */
object ApksInstallerMyApplicationFingerprint : Fingerprint(
    definingClass = "Lcom/inwepo/apkinstaller/MyApplication;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        string("setup_completed"),
        fieldAccess(
            opcode = Opcode.SPUT_BOOLEAN,
            definingClass = "Lcom/inwepo/apkinstaller/MyApplication;",
            name = "m",
            type = "Z",
        ),
    )
)

/**
 * l2/N.a — the ad initializer. It sets m=true and calls MobileAds.initialize().
 * It is the only method that both reads MyApplication.m and initializes MobileAds.
 *
 * Instruction order in the method:
 *   sget-boolean v0, Lcom/inwepo/apkinstaller/MyApplication;->m:Z
 *   if-eqz v0, :cond_0
 *   sput-boolean v0, Lcom/inwepo/apkinstaller/MyApplication;->m:Z
 *   invoke-static {v0, v1}, Lcom/google/android/gms/ads/MobileAds;->initialize(...)
 */
object ApksInstallerAdsInitFingerprint : Fingerprint(
    definingClass = "Ll2/N;",
    name = "a",
    isStatic = false,
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.SGET_BOOLEAN,
            definingClass = "Lcom/inwepo/apkinstaller/MyApplication;",
            name = "m",
            type = "Z",
        ),
        methodCall(
            definingClass = "Lcom/google/android/gms/ads/MobileAds;",
            name = "initialize",
        ),
    )
)
