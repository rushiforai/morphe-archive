package app.template.patches.all.misc.tv

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"
private const val LAUNCHER = "android.intent.category.LAUNCHER"
private const val LEANBACK_LAUNCHER = "android.intent.category.LEANBACK_LAUNCHER"

private val ADDED_FEATURES = setOf(
    "android.software.leanback",
    "android.hardware.touchscreen",
)

private val OPTIONAL_FEATURES = ADDED_FEATURES + setOf(
    "android.hardware.touchscreen.multitouch",
    "android.hardware.touchscreen.multitouch.distinct",
    "android.hardware.faketouch",
    "android.hardware.telephony",
    "android.hardware.camera",
    "android.hardware.camera.any",
    "android.hardware.camera.autofocus",
    "android.hardware.location",
    "android.hardware.location.gps",
    "android.hardware.microphone",
    "android.hardware.sensor.accelerometer",
    "android.hardware.screen.portrait",
    "android.hardware.wifi",
)

private fun Document.elements(tag: String): List<Element> =
    getElementsByTagName(tag).let { nodes -> (0 until nodes.length).map { nodes.item(it) as Element } }

private fun Element.children(tag: String): List<Element> =
    (0 until childNodes.length).mapNotNull { childNodes.item(it) as? Element }.filter { it.tagName == tag }

private fun Element.android(name: String): String = getAttributeNS(ANDROID_NS, name)

private fun Element.setAndroid(name: String, value: String) = setAttributeNS(ANDROID_NS, "android:$name", value)

private fun Element.hasAndroid(name: String): Boolean = hasAttributeNS(ANDROID_NS, name)

@Suppress("unused")
val tvCompatibilityPatch = resourcePatch(
    name = "TV Compatibility",
    description = "Makes the app installable and launchable on Android TV by adding the leanback launcher entry, a TV banner and marking hardware features as optional.",
    default = false,
) {
    execute {
        document("AndroidManifest.xml").use { doc ->
            val manifest = doc.documentElement
            val application = doc.elements("application").first()
            val features = doc.elements("uses-feature")

            features.filter { it.android("name") in OPTIONAL_FEATURES }
                .forEach { it.setAndroid("required", "false") }

            ADDED_FEATURES.filter { name -> features.none { it.android("name") == name } }
                .forEach { name ->
                    manifest.insertBefore(
                        doc.createElement("uses-feature").apply {
                            setAndroid("name", name)
                            setAndroid("required", "false")
                        },
                        application,
                    )
                }

            val appIcon = application.android("icon").ifEmpty { application.android("roundIcon") }
            if (!application.hasAndroid("banner") && appIcon.isNotEmpty()) {
                application.setAndroid("banner", appIcon)
            }

            (doc.elements("activity") + doc.elements("activity-alias")).forEach { activity ->
                activity.children("intent-filter").forEach { filter ->
                    val categories = filter.children("category").map { it.android("name") }
                    if (LAUNCHER in categories && LEANBACK_LAUNCHER !in categories) {
                        filter.appendChild(
                            doc.createElement("category").apply { setAndroid("name", LEANBACK_LAUNCHER) },
                        )
                        val activityIcon = activity.android("icon")
                        if (!activity.hasAndroid("banner") && !application.hasAndroid("banner") && activityIcon.isNotEmpty()) {
                            activity.setAndroid("banner", activityIcon)
                        }
                    }
                }
            }
        }
    }
}
