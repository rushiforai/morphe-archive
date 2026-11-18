package patches.magicearth

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val ANDROID = "http://schemas.android.com/apk/res/android"

/** Discovery only: preserve the real Flutter activity and its graphics requirements. */
internal fun enableTvDiscovery(manifest: Document) {
    fun Element.children(tag: String) = (0 until childNodes.length)
        .map { childNodes.item(it) }.filterIsInstance<Element>().filter { it.tagName == tag }
    fun Element.name() = getAttributeNS(ANDROID, "name")

    val activities = manifest.getElementsByTagName("activity")
    val activity = (0 until activities.length).map { activities.item(it) as Element }
        .single { it.name() == "com.generalmagic.magicearth.MainActivity" }
    check(activity.getAttributeNS(ANDROID, "exported") == "true") { "Magic Earth launcher is not exported" }
    val filter = activity.children("intent-filter").single {
        it.children("action").any { action -> action.name() == "android.intent.action.MAIN" } &&
            it.children("category").any { category -> category.name() == "android.intent.category.LAUNCHER" }
    }
    check(filter.children("category").none { it.name() == "android.intent.category.LEANBACK_LAUNCHER" }) {
        "Magic Earth TV declaration already present"
    }
    // Resolve all potential duplicate declarations before changing the DOM.
    val features = manifest.getElementsByTagName("uses-feature")
    val optional = listOf("android.hardware.touchscreen", "android.hardware.faketouch", "android.software.leanback")
        .associateWith { name ->
            val matches = (0 until features.length).map { features.item(it) as Element }.filter { it.name() == name }
            check(matches.size <= 1) { "Duplicate Magic Earth feature: $name" }
            matches.singleOrNull()
        }
    filter.appendChild(manifest.createElement("category").apply {
        setAttributeNS(ANDROID, "android:name", "android.intent.category.LEANBACK_LAUNCHER")
    })
    optional.forEach { (name, existing) ->
        val feature = existing ?: manifest.createElement("uses-feature").also {
            it.setAttributeNS(ANDROID, "android:name", name)
            manifest.documentElement.appendChild(it)
        }
        feature.setAttributeNS(ANDROID, "android:required", "false")
    }
}

@Suppress("unused")
val enableTvLauncher = resourcePatch(
    name = "Enable TV launcher",
    description = "Lists Magic Earth in Android TV launchers and makes touch input optional. Remote navigation and rendering depend on the device.",
) {
    compatibleWith(magicEarth)
    dependsOn(originalInput)
    execute {
        document("AndroidManifest.xml").use { enableTvDiscovery(it) }
    }
}
