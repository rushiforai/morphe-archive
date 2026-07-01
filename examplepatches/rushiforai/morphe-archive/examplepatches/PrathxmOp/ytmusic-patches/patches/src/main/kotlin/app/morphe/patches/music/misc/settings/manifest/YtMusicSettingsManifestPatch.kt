/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.morphe.patches.music.misc.settings.manifest

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

val ytMusicSettingsManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element
            val activities = document.getElementsByTagName("activity")
            var gmsActivityExists = false
            for (i in 0 until activities.length) {
                val act = activities.item(i) as Element
                if (act.getAttribute("android:name") == "com.google.android.gms.common.api.GoogleApiActivity") {
                    gmsActivityExists = true
                    break
                }
            }
            if (!gmsActivityExists) {
                val activity = document.createElement("activity")
                activity.setAttribute("android:name", "com.google.android.gms.common.api.GoogleApiActivity")
                activity.setAttribute("android:exported", "false")
                activity.setAttribute("android:theme", "@style/Theme.AppCompat.DayNight.NoActionBar")
                activity.setAttribute("android:configChanges", "orientation|screenSize|keyboardHidden")
                application.appendChild(activity)
            }
        }
    }
}