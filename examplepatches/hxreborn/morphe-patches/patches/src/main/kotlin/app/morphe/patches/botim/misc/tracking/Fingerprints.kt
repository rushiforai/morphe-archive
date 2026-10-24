/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.botim.misc.tracking

import app.morphe.patcher.Fingerprint

internal object AdjustInitFingerprint : Fingerprint(
    definingClass = "Lcom/adjust/sdk/Adjust;",
    name = "initSdk",
    returnType = "V",
    parameters = listOf("Lcom/adjust/sdk/AdjustConfig;"),
)

internal object MoEngageInitFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/app/Application;"),
    strings = listOf("MoEngage SDK is disabled by configuration."),
)

internal object CrashlyticsEnableCollectionFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    strings = listOf("firebase_crashlytics_collection_enabled"),
)
