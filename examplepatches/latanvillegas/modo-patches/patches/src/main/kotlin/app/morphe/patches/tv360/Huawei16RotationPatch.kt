package app.morphe.patches.tv360

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element
import org.w3c.dom.Node

private const val HUAWEI16_ANDROID_XML_NS = "http://schemas.android.com/apk/res/android"

/**
 * Huawei TV360 Bitel 1.6 (versionCode 161): manifest-only sensor rotation.
 *
 * The original APK's aapt dump reports android:screenOrientation=1 (portrait)
 * for HomeBoxActivity. Morphe's decoded resource DOM may omit the attribute:
 * a missing orientation is a valid manifest state and must not be confused
 * with an unsupported existing value.
 *
 * This patch changes only HomeBoxActivity, never SplashActivity or GameActivity.
 * It does not override runtime Activity.setRequestedOrientation calls.
 */
@Suppress("unused")
val tv360Huawei16SensorRotationPatch = resourcePatch(
    name = "TV360 Bitel 1.6 - Sensor Rotation",
    description = "Allows the main activity to follow the device sensor in portrait and landscape.",
    default = false,
) {
    compatibleWith("com.bitel.tv360"("1.6"))

    execute {
        document("AndroidManifest.xml").use { document ->
            val activities = document.getElementsByTagName("activity")
            val matches = (0 until activities.length)
                .mapNotNull { activities.item(it) as? Element }
                .filter {
                    it.getAttribute("android:name") ==
                        "com.viettel.tv360.ui.home.HomeBoxActivity" ||
                        it.getAttributeNS(HUAWEI16_ANDROID_XML_NS, "name") ==
                            "com.viettel.tv360.ui.home.HomeBoxActivity"
                }
            if (matches.size != 1) {
                throw PatchException(
                    "TV360 Huawei 1.6 rotation: expected exactly one HomeBoxActivity, found ${matches.size}"
                )
            }

            val activity = matches.single()

            // Match by namespace/localName, with qualified-name fallback for
            // non-namespace-aware XML parsers. Modify the original Attr node
            // when present, so an alternate XML prefix cannot create a second
            // screenOrientation attribute.
            val orientationAttrs = (0 until activity.attributes.length)
                .mapNotNull { activity.attributes.item(it) }
                .filter { attr: Node ->
                    (attr.namespaceURI == HUAWEI16_ANDROID_XML_NS &&
                        attr.localName == "screenOrientation") ||
                        attr.nodeName == "android:screenOrientation"
                }
            if (orientationAttrs.size > 1) {
                throw PatchException(
                    "TV360 Huawei 1.6 rotation: duplicate screenOrientation attributes"
                )
            }

            val orientationAttr = orientationAttrs.singleOrNull()
            val current = orientationAttr?.nodeValue.orEmpty()

            // An absent attribute means unspecified orientation: applying
            // fullSensor is intentional. An existing unexpected value must
            // never be silently overwritten.
            if (orientationAttr != null && current !in setOf("portrait", "1", "fullSensor", "10")) {
                throw PatchException(
                    "TV360 Huawei 1.6 rotation: unsupported original orientation '$current'"
                )
            }

            if (orientationAttr != null) {
                orientationAttr.nodeValue = "fullSensor"
            } else {
                activity.setAttributeNS(
                    HUAWEI16_ANDROID_XML_NS,
                    "android:screenOrientation",
                    "fullSensor",
                )
            }
        }
    }
}
