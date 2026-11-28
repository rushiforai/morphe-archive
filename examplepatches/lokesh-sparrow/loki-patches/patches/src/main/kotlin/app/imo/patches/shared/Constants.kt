/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.imo.patches.shared

import app.morphe.patcher.patch.*

/**
 * IMO HD is distributed as an APKM: base plus 80 split APKs (ABI, density, language and per-feature ad SDK
 * modules). 2026.10.1048 is the build this was read from; the patcher merges the splits itself, so the native
 * libraries are reachable at `lib/<abi>/` after the merge.
 *
 * The app has no paid tier of its own in the international build - the profile "VIP" badge and the voice-room
 * "SVIP" come from the server as part of the account data and cannot be set by the app.
 */
object Constants {
    const val PACKAGE = "com.imo.android.imoimhd"

    /** The stock signer's MD5, which `libanti.so` compares against its own certificate at start. */
    const val STOCK_CERT_MD5 = "866b4199f7db774e43068f64c0fc3789"

    val COMPATIBILITY_IMO = Compatibility(
        name = "IMO",
        packageName = PACKAGE,
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0B84FF,
        targets = listOf(AppTarget(version = "2026.10.1048")),
    )
}
