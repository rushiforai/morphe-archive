package patches.tweedehands

import org.w3c.dom.Element

context(context: app.morphe.patcher.patch.ResourcePatchContext)
internal fun suppressBelgianTrackingResources() {
    context.document("AndroidManifest.xml").use { doc ->
        val android = "http://schemas.android.com/apk/res/android"
        val all = doc.getElementsByTagName("*")
        val nodes = (0 until all.length).map { all.item(it) as Element }
        val receiver = nodes.filter { it.tagName == "receiver" &&
            it.getAttributeNS(android, "name") == "com.google.android.gms.analytics.CampaignTrackingReceiver" }
        check(receiver.size == 1 && !receiver.single().hasAttributeNS(android, "enabled")) {
            "2dehands original campaign receiver changed"
        }
        receiver.single().setAttributeNS(android, "android:enabled", "false")
        val advertising = setOf("android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
            "android.permission.ACCESS_ADSERVICES_CUSTOM_AUDIENCE", "android.permission.ACCESS_ADSERVICES_TOPICS")
        val permissions = nodes.filter { it.tagName == "uses-permission" &&
            it.getAttributeNS(android, "name") in advertising }
        check(permissions.map { it.getAttributeNS(android, "name") }.toSet() == advertising &&
            permissions.size == advertising.size) { "2dehands original advertising permissions changed" }
        permissions.forEach { doc.documentElement.removeChild(it) }
    }
}
