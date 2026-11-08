package semicoloncolonel.mobilestream.patches.shared.misc

import app.morphe.patcher.patch.AppTarget

/**
 * An app version added or changed on the dev branch. Dev builds mark it as
 * experimental in Morphe Manager. Builds from main mark it as stable, so the
 * version needs no change when dev is merged into main. After that merge,
 * change it back to a plain AppTarget, so the next dev cycle does not mark a
 * released version as experimental.
 *
 * [versionCode] and [description] are optional, as on AppTarget: Morphe Manager
 * shows the description next to the version and checks an APK against the code.
 */
fun devTarget(version: String, versionCode: Int? = null, description: String? = null) =
    if (versionCode != null) {
        AppTarget(version, versionCode, isExperimental = IS_DEV_BUILD, description = description)
    } else {
        AppTarget(version = version, isExperimental = IS_DEV_BUILD, description = description)
    }
