/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.internetspeedmeter.misc.counters

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

internal object InterfaceCountersInitializerFingerprint : Fingerprint(
    name = "<clinit>",
    filters = listOf(
        string("traffic_interface1"),
        methodCall(definingClass = "Ljava/lang/System;", name = "loadLibrary"),
    ),
)
