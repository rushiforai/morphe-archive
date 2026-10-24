/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.yuka.misc.pairip

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

internal object OfflineStorageTaskConstructorFingerprint : Fingerprint(
    name = "<init>",
    parameters = listOf("Lio/yuka/android/account/manageoffline/ManageOfflineActivity;", "L"),
    filters = listOf(
        methodCall(definingClass = "Landroid/content/Context;", name = "getApplicationInfo"),
    ),
)

internal object OfflineStorageResultFingerprint : Fingerprint(
    classFingerprint = OfflineStorageTaskConstructorFingerprint,
    name = "onPostExecute",
    returnType = "V",
    parameters = listOf("Ljava/lang/Object;"),
)

internal object SecurityProviderResultFingerprint : Fingerprint(
    name = "onPostExecute",
    returnType = "V",
    parameters = listOf("Ljava/lang/Object;"),
    strings = listOf("Failed to update ssl context"),
)

internal object SecurityProviderTaskFingerprint : Fingerprint(
    classFingerprint = SecurityProviderResultFingerprint,
    name = "doInBackground",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("[Ljava/lang/Object;"),
)
