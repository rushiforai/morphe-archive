/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.patches.shared

import app.morphe.patcher.patch.*

/**
 * LinkedIn builds this bundle has been checked against, oldest first. The manager suggests the last entry,
 * so a newly verified build is appended at the end and the oldest one dropped (about three are kept).
 */
private val VERIFIED_LINKEDIN_BUILDS = listOf("4.1.1267", "4.1.1269", "4.1.1270")

object Constants {
    /** Smali package of the runtime extension that the patches call into. */
    const val EXTENSION_PACKAGE = "Lapp/linkedin/extension"

    /**
     * Only the APKMirror "Android 10+" upload of LinkedIn is a single APK; the 12L+ uploads are bundles,
     * which this bundle does not accept. Any other version can still be tried, flagged as experimental.
     */
    val COMPATIBILITY_LINKEDIN = Compatibility(
        name = "LinkedIn",
        packageName = "com.linkedin.android",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x0A66C2,
        targets = VERIFIED_LINKEDIN_BUILDS.map { AppTarget(version = it) } +
            AppTarget(version = null, isExperimental = true),
    )
}
