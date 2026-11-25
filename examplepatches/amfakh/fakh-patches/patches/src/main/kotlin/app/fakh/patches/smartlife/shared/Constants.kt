/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.smartlife.shared

import app.fakh.patches.shared.Feature
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_SMARTLIFE = Compatibility(
        name = "Smart Life",
        packageName = "com.tuya.smartlife",
        signatures = setOf("0fc361999cc0c35ba8aca57daa5593a20cf55727702ea85ad7b3228949f888fe"),
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xFF5A1F,
        targets = listOf(AppTarget(version = "7.12.3", versionCode = 877), AppTarget(version = "7.12.6", versionCode = 880), AppTarget(version = "7.13.3", versionCode = 887)),
    )

    val COMPATIBILITY_TUYA_SMART = Compatibility(
        name = "Tuya Smart",
        packageName = "com.tuya.smart",
        signatures = setOf("93219fc273e2200f4adee5f7191dc656ba2a2d7b2ff5d24cd55c4b6155001e40"),
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xFF5A1F,
        targets = listOf(AppTarget(version = "7.12.3", versionCode = 870), AppTarget(version = "7.12.6", versionCode = 872), AppTarget(version = "7.13.0", versionCode = 875), AppTarget(version = "7.13.3", versionCode = 877)),
    )

    val COMPATIBILITY_BARDI = Compatibility(
        name = "BARDI Smart Home",
        packageName = "com.bardi.smart.home",
        signatures = setOf("f5b10815430e7cfaaa6bc5dd40bc475ced8bcf7959f3ba7cf52f46829b709877"),
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xFF5A1F,
        targets = listOf(AppTarget(version = "1.5.3", versionCode = 49)),
    )

    val COMPATIBILITY_KRISBOW = Compatibility(
        name = "SYNC by Krisbow",
        packageName = "com.kawanlama.smartklic",
        signatures = setOf("cd050cc76e7c4d70eb91689c0d526eaa054d8ecf5c25e9cc93340f184a2d182c"),
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xFF5A1F,
        targets = listOf(AppTarget(version = "3.1.2", versionCode = 15)),
    )

    // The switches of the Fakh Patches page, in the order it lists them, grouped by where they act.
    val HIDE_PLUS = Feature("fakh_hide_plus", "Hide Plus button", "Home")
    val HIDE_RECOMMENDED = Feature("fakh_hide_recommended", "Hide Recommended for you", "Home")
    val HIDE_AI_BAR = Feature("fakh_hide_ai_bar", "Hide AI ask bar", "Home")
    val HIDE_EXPLORE = Feature("fakh_hide_explore", "Hide Explore tab", "Navigation bar")
    val HIDE_MALL_TAB = Feature("fakh_hide_mall_tab", "Hide Mall tab", "Navigation bar")
    val HIDE_DISCOVERY_TAB = Feature("fakh_hide_discovery_tab", "Hide Discovery tab", "Navigation bar")
    val HIDE_TAB_LABELS = Feature("fakh_hide_tab_labels", "Hide tab labels", "Navigation bar", default = false)
    val SWIPE_TABS = Feature("fakh_swipe_tabs", "Swipe between tabs", "Navigation bar")
    val HIDE_DISCOVERY = Feature("fakh_hide_discovery", "Hide Discovery", "Home")
    val HIDE_REWARDS = Feature("fakh_hide_rewards", "Hide Rewards Hub", "Me")
    val HIDE_ORDERS = Feature("fakh_hide_orders", "Hide My Orders", "Me")
    val HIDE_AI_WEB = Feature("fakh_hide_ai_web", "Hide Tuya AI Web Version", "Me")
    val HIDE_ME_BANNER = Feature("fakh_hide_me_banner", "Hide Me banner", "Me")
    val HIDE_APP_MALL = Feature("fakh_hide_app_mall", "Hide App Mall", "Me")
    val HIDE_BACKGROUND = Feature("fakh_hide_background", "Hide background image", "Appearance")
    val LIQUID_GLASS = Feature("fakh_liquid_glass", "Liquid Glass", "Appearance")
    val DARK_PANELS = Feature(
        "fakh_dark_panels", "Dark Device Panels", "Appearance", restart = false, default = false,
        description = "Force dark on device control panels that have no dark mode. Applies when you open a panel, and only in dark mode.",
    )
    val HIDE_ADS = Feature("fakh_hide_ads", "Hide ads", "Ads")
}
