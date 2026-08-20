/*
 * Copyright 2026 PetalAA.
 * https://github.com/petalaa/PetalMaps-AndroidAuto
 *
 * This file is part of the PetalAA patches project and is licensed under
 * the GNU General Public License version 3 (GPLv3).
 *
 * https://www.gnu.org/licenses/gpl-3.0.html
 */

package dev.petalaa.patches.androidauto

import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.AccessFlags
import dev.petalaa.patches.androidauto.Constants.COMPATIBILITY_PETAL_MAPS
import org.w3c.dom.Element

/**
 * Resource patch that changes PetalMapsActivity's screenOrientation from
 * "behind" to "unspecified", allowing the activity to rotate freely.
 *
 * Petal Maps declares the main activity with android:screenOrientation="behind",
 * so it follows the orientation of the activity behind it. "unspecified" lets
 * the system decide based on the device's natural orientation and sensor input.
 *
 * Idempotent: no-op if screenOrientation is already "unspecified".
 */
@Suppress("unused")
val mainActivityOrientationPatch = resourcePatch(
    name = "Main activity orientation fix",
    description = "Changes PetalMapsActivity's screenOrientation from " +
            "\"behind\" to \"unspecified\", allowing the app to rotate freely.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_PETAL_MAPS)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val activityName = "com.huawei.maps.app.petalmaps.PetalMapsActivity"
            val activities = doc.getElementsByTagName("activity")
            val activity = (0 until activities.length)
                .asSequence()
                .mapNotNull { activities.item(it) as? Element }
                .firstOrNull { it.getAttribute("android:name") == activityName }

            if (activity == null) {
                println("Orientation fix: $activityName not found in manifest — no-op")
                return@use
            }

            val orientation = activity.getAttribute("android:screenOrientation")
            when {
                orientation == "unspecified" ->
                    println("Orientation fix: $activityName already has screenOrientation=\"unspecified\" — no-op")

                else -> {
                    activity.setAttribute("android:screenOrientation", "unspecified")
                    println("Orientation fix: $activityName screenOrientation \"$orientation\" -> \"unspecified\"")
                }
            }
        }
    }
}