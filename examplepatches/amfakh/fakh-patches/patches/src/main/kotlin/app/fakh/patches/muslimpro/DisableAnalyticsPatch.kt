/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.muslimpro

import app.fakh.patches.muslimpro.shared.Constants.COMPATIBILITY_MUSLIMPRO
import app.fakh.patches.muslimpro.shared.duplicateApplicationNamePatch
import app.fakh.patches.shared.firebase.firebaseManifestPatch
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.patch
import org.w3c.dom.Element

/** The Facebook SDK is started by the app (AutoInitEnabled is already false); these keep it from logging events. */
private val facebookManifestPatch = patch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element
            mapOf(
                "com.facebook.sdk.AutoLogAppEventsEnabled" to "false",
                "com.facebook.sdk.AdvertiserIDCollectionEnabled" to "false",
            ).forEach { (name, value) ->
                application.appendChild(document.createElement("meta-data").also {
                    it.setAttribute("android:name", name)
                    it.setAttribute("android:value", value)
                })
            }
        }
    }
}

@Suppress("unused")
val disableAnalyticsPatch = patch(
    name = "Disable analytics",
    description = "Turns off analytics and tracking.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MUSLIMPRO)
    category("Privacy")
    dependsOn(duplicateApplicationNamePatch, firebaseManifestPatch(), facebookManifestPatch)
}
