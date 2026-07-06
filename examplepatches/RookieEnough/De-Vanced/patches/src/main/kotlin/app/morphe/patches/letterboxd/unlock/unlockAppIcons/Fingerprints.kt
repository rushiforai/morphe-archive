/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/letterboxd/unlock/unlockAppIcons/Fingerprints.kt
 */
package app.morphe.patches.letterboxd.unlock.unlockAppIcons

import app.morphe.patcher.Fingerprint

internal object GetCanChangeAppIconFingerprint : Fingerprint(
    custom = { method, classDef ->
        method.name == "getCanChangeAppIcon" && classDef.type.endsWith("SettingsAppIconFragment;")
    },
)

