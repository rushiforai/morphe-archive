/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.smartlife

import app.fakh.patches.smartlife.shared.Constants.COMPATIBILITY_BARDI
import app.fakh.patches.smartlife.shared.Constants.HIDE_APP_MALL
import app.fakh.patches.smartlife.shared.Constants.HIDE_MALL_TAB
import app.fakh.patches.smartlife.shared.Constants.HIDE_ME_BANNER
import app.morphe.patcher.patch.patch

// BARDI renames the visibility method (`d` instead of `f`), so the cells are matched by their signature alone.
private val advertisingFingerprint = cellVisibilityFingerprint("AdvertisingCell", name = null)
private val miniWidgetFingerprint = cellVisibilityFingerprint("PersonalMiniWidgetCell", name = null)
private val appMallFingerprint = cellVisibilityFingerprint("MallCell", name = null)

@Suppress("unused")
val hideMallTabPatch = patch(
    name = "Hide Mall tab",
    description = "Removes the Mall tab from the navigation bar.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BARDI)
    category("Layout")
    dependsOn(tabFilterPatch, switchRow(HIDE_MALL_TAB), settingsSwitchesPatch)
}

@Suppress("unused")
val hideMeBannerPatch = patch(
    name = "Hide Me banner",
    description = "Removes the promo banner (\"Enjoy Your Smart Life\") and the ad slot from the Me tab.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BARDI)
    category("Layout")
    extendWith("extensions/extension.mpe")
    dependsOn(switchRow(HIDE_ME_BANNER), settingsSwitchesPatch)

    execute {
        // The banner is a mini-app card the Tuya cloud configures; the advertising cell is the ad slot above it.
        advertisingFingerprint.method.whenSwitchOn("fakh_hide_me_banner", HIDE_CELL)
        miniWidgetFingerprint.method.whenSwitchOn("fakh_hide_me_banner", HIDE_CELL)
    }
}

@Suppress("unused")
val hideAppMallPatch = patch(
    name = "Hide App Mall",
    description = "Removes the \"App Mall\" row from the Me tab.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BARDI)
    category("Layout")
    extendWith("extensions/extension.mpe")
    dependsOn(switchRow(HIDE_APP_MALL), settingsSwitchesPatch)

    execute { appMallFingerprint.method.whenSwitchOn("fakh_hide_app_mall", HIDE_CELL) }
}
