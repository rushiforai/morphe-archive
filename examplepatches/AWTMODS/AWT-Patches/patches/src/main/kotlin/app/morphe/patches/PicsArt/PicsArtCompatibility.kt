package app.morphe.patches.picsart

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/**
 * Picsart (com.picsart.studio) — tested against 30.9.5 (XAPK, APKPure).
 *
 * If your repo already has a shared Compatibility/Constants file, move this
 * constant there and adjust the fields to match (e.g. apkFileType / icon color).
 */
internal val COMPATIBILITY_PICSART = Compatibility(
    name = "Picsart",
    packageName = "com.picsart.studio",
    targets = listOf(
        AppTarget(version = "30.9.5"),
        AppTarget(version = "31.2.6"),
    ),
)
