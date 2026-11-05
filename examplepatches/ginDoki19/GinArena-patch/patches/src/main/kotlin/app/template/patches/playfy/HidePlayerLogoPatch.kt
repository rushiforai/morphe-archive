package app.template.patches.playfy

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/** Hide only the player-layout logo, preserving the shared image elsewhere. */
internal val hidePlayerAppLogoPatch = resourcePatch {
    execute {
        check(packageMetadata.packageName == "com.playfy.tv" &&
            packageMetadata.versionName == "1.7" && packageMetadata.versionCode == "8") {
            "Player logo patch is only supported on Playfy TV 1.7 (8)."
        }
        val ns = "http://schemas.android.com/apk/res/android"
        document("res/layout/exo_player_view.xml").use { doc ->
            check(doc.documentElement.tagName == "merge") { "Unexpected player layout root." }
            val nodes = doc.documentElement.childNodes
            val targets = (0 until nodes.length).mapNotNull { nodes.item(it) as? Element }
                .filter { it.tagName == "ImageView" && it.getAttributeNS(ns, "src") == "@drawable/placholder" }
            check(targets.size == 1) { "Expected one player app logo, found ${targets.size}." }
            val logo = targets.single()
            val gravity = logo.getAttributeNS(ns, "layout_gravity").split('|').toSet()
            check(gravity.containsAll(setOf("end", "bottom")) &&
                logo.getAttributeNS(ns, "layout_width") == "@dimen/_15sdp" &&
                logo.getAttributeNS(ns, "layout_height") == "@dimen/_15sdp" &&
                logo.getAttributeNS(ns, "layout_margin") == "@dimen/_5sdp" &&
                logo.getAttributeNS(ns, "id").isEmpty() &&
                logo.getAttributeNS(ns, "visibility").isEmpty()) {
                "Unexpected player app logo structure; refusing to modify it."
            }
            logo.setAttributeNS(ns, "android:visibility", "gone")
        }
    }
}
