/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.misc.settings

import app.morphe.patcher.patch.resourcePatch
import app.morphe.util.ResourceGroup
import app.morphe.util.copyResources
import org.w3c.dom.Element

/** Resource copied by [settingsActivityPatch]; the extension resolves its id at runtime. */
internal const val PIKO_SETTINGS_ICON_DRAWABLE = "piko_ic_settings"

/** Declares the settings activity and copies the Piko icon its entry point shows. */
internal val settingsActivityPatch =
    resourcePatch(
        description = "Adds the Piko settings activity and icon.",
    ) {
        execute {
            copyResources(
                "instagram/settings",
                ResourceGroup("drawable", "$PIKO_SETTINGS_ICON_DRAWABLE.xml"),
            )

            document("AndroidManifest.xml").use { document ->
                val application = document.getElementsByTagName("application").item(0) as Element

                val activity = document.createElement("activity")
                activity.setAttribute("android:name", "app.morphe.extension.instagram.settings.InstagramSettingsActivity")
                activity.setAttribute("android:exported", "false")
                activity.setAttribute("android:theme", "@android:style/Theme.DeviceDefault.NoActionBar")
                application.appendChild(activity)
            }
        }
    }
