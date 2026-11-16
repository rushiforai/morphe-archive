package io.github.jordanwoodson.patches.twitch.updates

import app.morphe.patcher.Fingerprint

private const val FORCED_UPDATE = "Ltv/twitch/android/feature/forced/updates/pub/ForcedUpdateResponseModel;"

// Twitch's remote "forced updates" setting (min_app_ver, specific_app_ver_to_update_arr, disallowed_ver_arr),
// whose class and method names Twitch keeps. Whether the version Google Play offers may be prompted for:
// the one check the in-app update prompt ("New Update Ready to Install") makes before it starts.
internal object UpdateAllowedFingerprint : Fingerprint(
    definingClass = FORCED_UPDATE, name = "isVersionCodeAllowed", returnType = "Z", parameters = listOf("I"),
)

// Whether the installed version must be upgraded ("App Update Required").
internal object UpdateRequiredFingerprint : Fingerprint(
    definingClass = FORCED_UPDATE, name = "shouldPromptForUpgrade", returnType = "Z", parameters = listOf("I"),
)
