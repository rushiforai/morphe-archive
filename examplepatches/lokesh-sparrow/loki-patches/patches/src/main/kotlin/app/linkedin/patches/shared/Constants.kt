/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.patches.shared

import app.morphe.patcher.patch.*

/**
 * LinkedIn builds this bundle has been checked against, oldest first. The manager suggests the last entry,
 * so a newly verified build is appended at the end and the oldest one dropped: the newest two are kept.
 */
private val VERIFIED_LINKEDIN_BUILDS = listOf("4.1.1270", "4.1.1272")

object Constants {
    /** Smali package of the runtime extension that the patches call into. */
    const val EXTENSION_PACKAGE = "Lapp/linkedin/extension"

    /**
     * Newer LinkedIn builds are published as bundles only, so the manager is pointed at the bundle download.
     * This is a preference, not a requirement: a single APK of the same version patches just as well.
     * Any other version can still be tried, flagged as experimental.
     */
    val COMPATIBILITY_LINKEDIN = Compatibility(
        name = "LinkedIn",
        packageName = "com.linkedin.android",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0A66C2,
        targets = VERIFIED_LINKEDIN_BUILDS.map { AppTarget(version = it) } +
            AppTarget(version = null, isExperimental = true),
    )
}
