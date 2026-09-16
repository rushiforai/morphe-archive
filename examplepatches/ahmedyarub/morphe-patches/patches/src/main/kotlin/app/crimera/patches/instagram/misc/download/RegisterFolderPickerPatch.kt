/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.misc.download

import app.crimera.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private const val FOLDER_PICKER_ACTIVITY = "app.morphe.extension.crimera.downloader.FolderPickerActivity"

/**
 * Declares the folder picker activity in the host app's manifest.
 *
 * The downloader writes through the Storage Access Framework, so it needs a tree uri the user has
 * granted, and it asks for one by starting this activity. An activity that is not in the manifest
 * cannot be started at all, which surfaced only as "Could not open folder picker" — piko declares
 * it from the settings patch this bundle does not ship.
 */
val registerFolderPickerPatch =
    resourcePatch(
        description = "Declares the download folder picker activity so the app can start it",
    ) {
        compatibleWith(COMPATIBILITY_INSTAGRAM)

        execute {
            document("AndroidManifest.xml").use { document ->
                val activities = document.getElementsByTagName("activity")
                for (index in 0 until activities.length) {
                    val activity = activities.item(index) as Element
                    if (activity.getAttribute("android:name") == FOLDER_PICKER_ACTIVITY) return@use
                }

                val application = document.getElementsByTagName("application").item(0) as Element
                application.appendChild(
                    document.createElement("activity").apply {
                        setAttribute("android:name", FOLDER_PICKER_ACTIVITY)
                        setAttribute("android:exported", "false")
                        setAttribute("android:excludeFromRecents", "true")
                        setAttribute("android:theme", "@android:style/Theme.Translucent.NoTitleBar")
                    },
                )
            }
        }
    }
