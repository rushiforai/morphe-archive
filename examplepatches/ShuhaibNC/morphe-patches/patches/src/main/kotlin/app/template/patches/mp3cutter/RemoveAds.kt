package app.template.patches.mp3cutter

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.MP3CUTTER_COMPATIBILITY
import org.w3c.dom.Element

@Suppress("unused")
val removeAdsPatch = resourcePatch(
    name = "Remove Ads",
    description = "Removes AdActivities and the internet permission from the manifest and hides ad containers.",
    default = true
) {
    compatibleWith(MP3CUTTER_COMPATIBILITY)

    execute {
        document("AndroidManifest.xml").use { document ->
            val activities = document.getElementsByTagName("activity")
            val adActivityName = "com.google.android.gms.ads.AdActivity"

            val activitiesToRemove = mutableListOf<Element>()
            val permissionsToRemove = mutableListOf<Element>()
            val elements = document.getElementsByTagName("*")
            for (i in 0 until activities.length) {
                val activity = activities.item(i) as? Element ?: continue
                val name = activity.getAttribute("android:name")
                if (name == adActivityName) {
                    activitiesToRemove.add(activity)
                }
            }

            for (i in 0 until elements.length) {
                val element = elements.item(i) as? Element ?: continue
                val tagName = element.tagName
                val isPermissionTag =
                    tagName == "uses-permission" || tagName.startsWith("uses-permission-sdk-")
                if (
                    isPermissionTag &&
                    element.getAttribute("android:name") == "android.permission.INTERNET"
                ) {
                    permissionsToRemove.add(element)
                }
            }

            activitiesToRemove.forEach { activity ->
                activity.parentNode?.removeChild(activity)
            }
            permissionsToRemove.forEach { permission ->
                permission.parentNode?.removeChild(permission)
            }
        }

        val layoutNames = listOf(
            "activity_after_save.xml",
            "activity_load_music.xml",
            "activity_save_music.xml",
            "editor.xml",
            "layout_save.xml",
            "media_select.xml",
            "record_activity.xml",
            "splash.xml",
        )

        layoutNames.forEach { layoutName ->
            document("res/layout/$layoutName").use { document ->
                val elements = document.getElementsByTagName("*")
                for (i in 0 until elements.length) {
                    val element = elements.item(i) as? Element ?: continue
                    val id = element.getAttribute("android:id")
                    if (
                        id.substringAfterLast('/') == "adholderwrapper" &&
                        element.hasAttribute("android:visibility")
                    ) {
                        element.setAttribute("android:visibility", "gone")
                    }
                }
            }
        }
    }
}
