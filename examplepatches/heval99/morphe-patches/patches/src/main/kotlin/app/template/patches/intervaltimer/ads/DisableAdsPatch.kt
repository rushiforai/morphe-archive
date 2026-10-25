package app.template.patches.intervaltimer.ads

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_INTERVALTIMER

// "Ad-free" (adbuster) is the app's only entitlement. The ad state is an int: 3 = ad-free, 2 =
// rewarded-ad window active, 1 = show ads (User also has 0 = unknown). Every ad path asks the
// signed-in User first and falls back to the AppInstallation, so both getters answer 3:
//   - ApplicationViewModel: 3 or 2 publishes an empty native-ad slot map and never calls
//     MobileAds.initialize (the only call site), so no native ad rows are reserved or loaded.
//   - ApplicationViewModel "finish_av": the workout-finished banner shows only when the
//     installation answers 1; otherwise the finish screen gets "NONE".
//   - MainFragment: 3 removes the toolbar's "Remove ads" item, the only way to open the
//     Remove ads dialog (purchase and rewarded-ad offers).
// Server sync (me/config, me/device/{sid}/config) still writes the cached adbuster flags, but
// nothing reads them for ads except these getters. No purchase is faked on the server.
// GMA is R8-shrunk here (MobileAds keeps only initialize, renamed), so there is no stable
// library surface for load hooks; none is needed because no placement bypasses the state.
private const val AD_FREE = 3

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads.",
) {
    compatibleWith(COMPATIBILITY_INTERVALTIMER)

    execute {
        InstallationAdStateFingerprint.method.returnEarly(AD_FREE)
        UserAdStateFingerprint.method.returnEarly(AD_FREE)
    }
}
