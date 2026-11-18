/*
 * From ajstrick81's Tubi Android TV patch (GPL-3.0):
 * https://github.com/ajstrick81/morphe-androidtv-patches/tree/main/patches/src/main/kotlin/ajstrick81/morphe/patches/tubi/privacy
 * ALL CREDIT FOR THE ORIGINAL DESIGN GOES TO ajstrick81.
 */

package semicoloncolonel.mobilestream.patches.tubi.privacy

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// SDK entry points below are public API, which the SDKs' consumer ProGuard
// rules keep un-obfuscated, so they match across Tubi versions (verified
// against the 10.36.5000 and 10.40.5000 Android TV builds and the 10.42.0
// and 10.43.1 phone builds).

// Adjust 5.x — the SDK never starts, so it never reads ANDROID_ID / GAID or
// sends attribution events. Later Adjust.trackEvent() etc. only log
// "SDK not initialised".
object AdjustInitSdkFingerprint : Fingerprint(
    definingClass = "Lcom/adjust/sdk/Adjust;",
    name = "initSdk",
    parameters = listOf("Lcom/adjust/sdk/AdjustConfig;"),
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC)
)

// Adjust 4.x equivalent of initSdk, for older Tubi builds.
object AdjustOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/adjust/sdk/Adjust;",
    name = "onCreate",
    parameters = listOf("Lcom/adjust/sdk/AdjustConfig;"),
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC)
)
