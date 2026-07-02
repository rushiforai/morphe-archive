/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/shared/compat/AppCompatibilities.kt
 *
 * Central Morphe `Compatibility` metadata so Morphe Manager shows human-readable app names.
 */
package app.morphe.patches.shared.compat

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

@Suppress("MemberVisibilityCanBePrivate")
internal object AppCompatibilities {

    val FACEBOOK = Compatibility(
        name = "Facebook",
        packageName = "com.facebook.katana",
        appIconColor = 0x0866FF,
        targets = listOf(AppTarget("490.0.0.63.82")),
    )
}
