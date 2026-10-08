package app.template.patches.nativecamera.premium

import app.morphe.patcher.Fingerprint

// Method adapted from the Native Camera patches by WaggBR (Wagg13Patch_Morphe) and
// franticg33k (morphe-patches), both GPL-3.0: anchor on the stable "rawcam_prefs" file and
// "is_premium" key instead of the obfuscated CameraViewModel names.

// CameraViewModel constructor: builds the premium StateFlow from the persisted flag.
// 1.4.3 reads it through a shared helper, o(SharedPreferences, String, Z) -> StateFlow.
object PremiumInitFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    parameters = listOf("Landroid/app/Application;"),
    strings = listOf("is_premium", "rawcam_prefs"),
)

// CameraViewModel premium setter: updates the StateFlow, persists "is_premium" through the
// shared helper p(SharedPreferences, String, Z) and resets premium-only features on downgrade.
object SetPremiumFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Z"),
    strings = listOf("is_premium"),
)
