/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.internetspeedmeter.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral

internal object PremiumRowClickFingerprint : Fingerprint(
    definingClass = "Lcom/internet/speed/meter/lite/settings/PreferencesListActivity;",
    name = "onListItemClick",
    filters = listOf(resourceLiteral(ResourceType.LAYOUT, "buyapp_dialog")),
)

internal object SettingsRowViewFingerprint : Fingerprint(
    name = "getView",
    returnType = "Landroid/view/View;",
    strings = listOf("show_up_and_down"),
)

internal object BuildNotificationFingerprint : Fingerprint(
    definingClass = "Lcom/internet/speed/meter/lite/SpeedMeterService;",
    returnType = "Landroid/app/Notification;",
    parameters = listOf("J", "J", "J", "Landroid/graphics/drawable/Icon;", "L"),
    filters = listOf(methodCall(definingClass = "Landroid/app/Notification\$Builder;", name = "build")),
)

internal object ServiceStartCommandFingerprint : Fingerprint(
    definingClass = "Lcom/internet/speed/meter/lite/SpeedMeterService;",
    name = "onStartCommand",
)

internal object SessionReferenceFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/SharedPreferences;"),
    strings = listOf("session_usage_ref", "session_start_time"),
    filters = listOf(
        methodCall(definingClass = "Landroid/content/SharedPreferences;", name = "edit"),
        methodCall(definingClass = "Landroid/content/SharedPreferences\$Editor;", name = "putFloat"),
    ),
)

internal object OverviewSessionCounterFingerprint : Fingerprint(
    definingClass = "Lapp/hxreborn/extension/internetspeedmeter/QuickOverviewActivity;",
    name = "sessionCounter",
)
