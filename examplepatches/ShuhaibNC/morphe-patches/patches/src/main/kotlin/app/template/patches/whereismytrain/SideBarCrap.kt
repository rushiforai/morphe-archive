package app.template.patches.whereismytrain

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.WHEREISMYTRAIN_COMPATIBILITY
import org.w3c.dom.Element

private const val ANDROID_NAMESPACE = "http://schemas.android.com/apk/res/android"

@Suppress("unused")
val hideSidebarItemsPatch = resourcePatch(
    name = "Hide Items From Sidebar",
    description = "Hides sharing, rating, reporting, feature request, and language options."
) {
    compatibleWith(WHEREISMYTRAIN_COMPATIBILITY)

    execute {
        val itemIds = setOf(
            "share_app",
            "rate_us",
            "report_bug",
            "request_feature",
            "change_language"
        )
        val hiddenItems = mutableSetOf<String>()

        document("res/menu/menu_home_activity_navbar_local.xml").use { document ->
            val items = document.getElementsByTagName("item")
            for (i in 0 until items.length) {
                val item = items.item(i) as? Element ?: continue
                val id = item.getAttribute("android:id").substringAfterLast('/')
                if (id in itemIds) {
                    item.setAttributeNS(ANDROID_NAMESPACE, "android:visible", "false")
                    hiddenItems.add(id)
                }
            }
        }

        val missingItems = itemIds - hiddenItems
        if (missingItems.isNotEmpty()) {
            throw PatchException(
                "Could not find menu item(s): ${missingItems.sorted().joinToString()}."
            )
        }
    }
}