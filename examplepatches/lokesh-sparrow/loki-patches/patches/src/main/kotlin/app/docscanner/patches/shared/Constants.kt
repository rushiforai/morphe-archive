/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.docscanner.patches.shared

import app.morphe.patcher.patch.*

object Constants {
    const val PACKAGE = "com.cv.docscanner"

    /** SHA-1 of the app's real signing certificate: GmsCore presents it to Google in place of the patched app's own. */
    const val SIGNATURE = "83fb14575675038c311bd70809e6899bfd75f25d"

    /** The APKMirror upload is a bundle (base + ABI splits), so it is declared as APKM. */
    val COMPATIBILITY_DOCSCANNER = Compatibility(
        name = "Doc Scanner",
        packageName = PACKAGE,
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x2196F3,
        targets = listOf(AppTarget(version = "6.9.9"), AppTarget(version = null, isExperimental = true)),
    )
}
