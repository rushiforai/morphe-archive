/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.idn

import app.fakh.patches.idn.shared.Constants.COMPATIBILITY_IDN
import app.fakh.patches.shared.featuresPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.document

internal const val EXTENSION_SETTINGS = "Lapp/fakh/extension/idn/IdnSettings;"

/** Declares the settings activity of the extension. */
private val settingsManifestPatch = patch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val activity = document.createElement("activity")
            activity.setAttribute("android:name", "app.fakh.extension.idn.IdnSettingsActivity")
            activity.setAttribute("android:exported", "false")
            activity.setAttribute("android:label", "Fakh Patches")
            activity.setAttribute("android:theme", "@android:style/Theme.DeviceDefault.DayNight")
            document.getElementsByTagName("application").item(0).appendChild(activity)
        }
    }
}

/** The Settings fragment's onViewCreated, where the "Fakh Patches" row goes. R8 renames the class; it reads the app version and the navigate_param argument. */
private object SettingsScreenFingerprint : Fingerprint(
    name = "onViewCreated",
    returnType = "V",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
    strings = listOf("navigate_param", " build "),
)

/** The "Fakh Patches" row on the app's Settings screen, and the page it opens. Every feature below depends on it. */
internal val settingsPatch = patch(description = "Adds a Fakh Patches page to the app's Settings screen.") {
    compatibleWith(COMPATIBILITY_IDN)
    dependsOn(settingsManifestPatch, featuresPatch)
    extendWith("extensions/extension.mpe")

    execute {
        // p1 is the root view; the extension posts its work, so it runs after the app set its own listeners.
        SettingsScreenFingerprint.method.addInstruction(
            0,
            "invoke-static { p1 }, $EXTENSION_SETTINGS->installEntry(Landroid/view/View;)V",
        )
    }
}
