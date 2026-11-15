/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.splitwise.patches.telemetry

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.loki.patches.universal.addMenuFlag
import app.loki.patches.universal.menuPatch
import app.splitwise.patches.shared.Constants.COMPATIBILITY_SPLITWISE
import org.w3c.dom.Element

/**
 * Turns off the analytics and crash reporting that live in the app's own manifest: Firebase Analytics, Crashlytics
 * and the advertising-ID collection flag. No bytecode, so it survives app updates that do not rename the flags.
 */
private val quietFlags = resourcePatch {
    compatibleWith(COMPATIBILITY_SPLITWISE)

    execute {
        document("AndroidManifest.xml").use { document ->
            document.addMenuFlag("app.loki.menu.analytics")
            val application = document.getElementsByTagName("application").item(0) as? Element ?: return@use
            val flags = mapOf(
                "firebase_analytics_collection_deactivated" to "true",
                "firebase_crashlytics_collection_enabled" to "false",
                "google_analytics_adid_collection_enabled" to "false",
            )
            flags.forEach { (name, value) ->
                // Replace an existing entry instead of adding a second one: Android keeps the first value it reads.
                val existing = document.getElementsByTagName("meta-data")
                var replaced = false
                for (index in 0 until existing.length) {
                    val entry = existing.item(index) as? Element ?: continue
                    if (entry.getAttribute("android:name") == name) {
                        entry.setAttribute("android:value", value)
                        replaced = true
                    }
                }
                if (!replaced) {
                    application.appendChild(document.createElement("meta-data").also { entry ->
                        entry.setAttribute("android:name", name)
                        entry.setAttribute("android:value", value)
                    })
                }
            }
        }
    }
}

@Suppress("unused")
val removeAnalyticsAndCrashReportingPatch = bytecodePatch(
    name = "Remove analytics and crash reporting",
    description = "Turns off Firebase Analytics, Crashlytics and the advertising-ID collection the app declares " +
        "in its manifest.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_SPLITWISE)
    dependsOn(quietFlags, menuPatch)
}
