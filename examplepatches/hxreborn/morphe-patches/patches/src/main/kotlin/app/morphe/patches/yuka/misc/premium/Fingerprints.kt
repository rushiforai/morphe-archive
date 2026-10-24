/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.yuka.misc.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

private const val STRING = "Ljava/lang/String;"

internal object YukaUserToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = STRING,
    parameters = emptyList(),
    strings = listOf("YukaUser(fcmToken=", ", premium="),
)

internal object YukaUserConstructorFingerprint : Fingerprint(
    classFingerprint = YukaUserToStringFingerprint,
    name = "<init>",
    returnType = "V",
    parameters = List(9) { STRING } + listOf("Ljava/lang/Boolean;", "Z", "Z"),
)

internal object CachedPremiumFingerprint : Fingerprint(
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        string("cache_is_premium"),
        methodCall(definingClass = "Landroid/content/SharedPreferences;", name = "getBoolean"),
    ),
)
