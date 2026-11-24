/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.idn.shared

import app.fakh.patches.shared.Feature
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_IDN = Compatibility(
        name = "IDN",
        packageName = "com.idntimes.idntimes",
        signatures = setOf("e5b9a14c81067bc215d6e0168cc37fb9789e211a8cb9430bf0883f0de22b5bd6"),
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xED1C24,
        targets = listOf(
            AppTarget(version = "6.69.1", versionCode = 2303),
            AppTarget(version = "6.70.0", versionCode = 2318),
        ),
    )

    // The switches of the Fakh Patches page, in the order it lists them. On means the thing shows, as the app's own
    // Settings chips read: the patches remove the ads, banner and button until their switch is turned on.
    val HOME_TABS = listOf("SHORT_MOVIE" to "Nonton", "LIVE" to "IDN Live", "NEWS" to "Berita", "QUIZ" to "Quiz")
        .map { (tab, label) -> Feature("show_tab_$tab", label, "Tab Home") }
    val SHOW_CREATE_BUTTON = Feature("show_create_button", "Tombol Create (+)", "Bilah bawah", default = false)
    val AUTOPLAY = Feature("autoplay", "Autoplay", "Pemutaran")
    val SHOW_ADS = Feature("show_ads", "Iklan", "Promo", default = false)
    val SHOW_PACKAGE_BANNER = Feature("show_package_banner", "Banner \"Beli Paket\"", "Promo", default = false)
}
