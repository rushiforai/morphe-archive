/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.badfella.patches.ultimea.upstream.theme

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import app.morphe.patcher.methodCall
import app.morphe.patcher.InstructionLocation

internal object ActivityCreateFingerprint : Fingerprint(
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    filters = listOf(string("onCreate: checkGooglePlayServices:")),
)

internal object SystemBarStyleFingerprint : Fingerprint(
    returnType = "L",
    filters = listOf(string("statusBarIconBrightness"), string("systemNavigationBarIconBrightness")),
)

internal object PlatformBrightnessFingerprint : Fingerprint(
    filters = listOf(
        string("platformBrightness"),
        methodCall(definingClass = "Ljava/util/HashMap;", name = "put", location = InstructionLocation.MatchAfterImmediately()),
    ),
)
