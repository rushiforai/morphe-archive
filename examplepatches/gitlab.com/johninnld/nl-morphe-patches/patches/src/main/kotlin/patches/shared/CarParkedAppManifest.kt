package patches.shared

import org.w3c.dom.Document
import org.w3c.dom.Element

private const val ANDROID = "http://schemas.android.com/apk/res/android"
private const val CAR_LAUNCHER = "android.intent.category.CAR_LAUNCHER"

/**
 * Declares an app a parked app the way Google's Android Auto documentation requires: adds
 * android.intent.category.CAR_LAUNCHER to every MAIN/LAUNCHER intent filter and sets
 * android:appCategory when the manifest declares none. Apps listed on Android Auto through
 * Google's internal game allowlist do not declare the category themselves, so hosts that
 * follow the documented discovery (Android Auto opted-in apps, DriveDeck, Gearslip) cannot
 * list them until this declaration exists. Returns the number of intent filters that
 * received the category; fails when nothing was declared, so a changed or already patched
 * manifest never produces a silently unlisted app.
 */
/**
 * Makes android.hardware.type.automotive optional so an automotive-only build can be installed on
 * the phone that runs the car host. Games published for Android Automotive OS declare that feature
 * as required, which keeps them off the phone that projects Android Auto or runs DriveDeck. Apps
 * that never declare the feature are left untouched. Returns the number of feature declarations
 * that were changed.
 */
internal fun allowInstallOutsideAutomotive(manifest: Document): Int {
    val features = manifest.getElementsByTagName("uses-feature")
    var changed = 0
    for (i in 0 until features.length) {
        val feature = features.item(i) as Element
        if (feature.getAttributeNS(ANDROID, "name") != "android.hardware.type.automotive") continue
        if (feature.getAttributeNS(ANDROID, "required") != "false") {
            feature.setAttributeNS(ANDROID, "android:required", "false")
            changed++
        }
    }
    return changed
}

internal fun ensureCarParkedAppDeclaration(manifest: Document, appCategory: String): Int {
    fun Element.children(tag: String) = (0 until childNodes.length)
        .map { childNodes.item(it) }.filterIsInstance<Element>().filter { it.tagName == tag }
    fun Element.declares(tag: String, name: String) =
        children(tag).any { it.getAttributeNS(ANDROID, "name") == name }

    val application = manifest.getElementsByTagName("application").item(0) as Element
    if (application.getAttributeNS(ANDROID, "appCategory").isNullOrEmpty()) {
        application.setAttributeNS(ANDROID, "android:appCategory", appCategory)
    }

    var declared = 0
    for (tag in listOf("activity", "activity-alias")) {
        val components = manifest.getElementsByTagName(tag)
        for (i in 0 until components.length) {
            (components.item(i) as Element).children("intent-filter").forEach { filter ->
                if (filter.declares("action", "android.intent.action.MAIN") &&
                    filter.declares("category", "android.intent.category.LAUNCHER") &&
                    !filter.declares("category", CAR_LAUNCHER)
                ) {
                    filter.appendChild(manifest.createElement("category").apply {
                        setAttributeNS(ANDROID, "android:name", CAR_LAUNCHER)
                    })
                    declared++
                }
            }
        }
    }
    check(declared > 0) {
        "No launcher intent filter received the parked-app declaration; " +
            "patch already applied or the manifest changed"
    }
    return declared
}
