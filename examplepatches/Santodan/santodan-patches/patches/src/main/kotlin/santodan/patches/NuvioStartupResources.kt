package santodan.patches

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Document
import org.w3c.dom.Element
import software.santodan.nuvio.NuvioNative

/** Original beta.8 resource 0x7f08011f is stored as res/0n.xml. */
val nuvioStartupResourcesPatch = resourcePatch(default = false) {
    execute {
        document("AndroidManifest.xml").use {
            check(it.documentElement.getAttribute("android:versionName") == NuvioNative.VERSION)
            configureNuvioStartupManifest(it)
        }
        document("res/0n.xml").use { addNuvioLaunchLogo(it) }
    }
}

internal const val NUVIO_STARTUP_ACTIVITY = "software.santodan.extension.nuviomerged.NuvioStartupActivity"

internal fun configureNuvioStartupManifest(document: Document) {
    val ns = "http://schemas.android.com/apk/res/android"
    val applications = document.getElementsByTagName("application")
    check(applications.length == 1)
    val application = applications.item(0)
    val activities = document.getElementsByTagName("activity")
    val elements = (0 until activities.length).map { activities.item(it) as Element }
    check(elements.none { it.getAttributeNS(ns, "name") == NUVIO_STARTUP_ACTIVITY }) { "Startup entry already patched" }
    val main = elements.single { it.getAttributeNS(ns, "name") in setOf(".MainActivity", "com.nuvio.tv.MainActivity") }
    val launchers = elements.filter { entry ->
        val categories = entry.getElementsByTagName("category")
        (0 until categories.length).any {
            (categories.item(it) as Element).getAttributeNS(ns, "name") in setOf("android.intent.category.LAUNCHER", "android.intent.category.LEANBACK_LAUNCHER")
        }
    }
    val nativeNames = setOf("AppIconDefault", "AppIconArcticBlue", "AppIconEmerald", "AppIconRoseGold", "AppIconCopper", "AppIconGraphite")
        .map { "com.nuvio.tv.launcher.$it" }.toSet()
    check(launchers.map { it.getAttributeNS(ns, "name") }.toSet() == nativeNames && launchers.size == 6) {
        "Unexpected beta.8 launcher activities"
    }
    val theme = main.getAttributeNS(ns, "theme")
    check(theme.isNotBlank()) { "Native launcher theme missing" }
    val early = document.createElement("activity")
    early.setAttributeNS(ns, "android:name", NUVIO_STARTUP_ACTIVITY)
    early.setAttributeNS(ns, "android:exported", "false")
    early.setAttributeNS(ns, "android:noHistory", "true")
    early.setAttributeNS(ns, "android:launchMode", "singleTop")
    early.setAttributeNS(ns, "android:theme", theme)
    early.setAttributeNS(ns, "android:configChanges", main.getAttributeNS(ns, "configChanges"))
    application.insertBefore(early, main)
    launchers.forEach { original ->
        // beta.8 ships real MainActivity subclasses for its six icons. Keep
        // their component identities and icon state, but make them aliases of
        // the lightweight entry so none constructs MainActivity prematurely.
        val alias = document.createElement("activity-alias")
        for (i in 0 until original.attributes.length) {
            val attribute = original.attributes.item(i)
            if (attribute.localName !in setOf("theme", "configChanges", "launchMode"))
                alias.setAttributeNS(attribute.namespaceURI, attribute.nodeName, attribute.nodeValue)
        }
        while (original.hasChildNodes()) alias.appendChild(original.firstChild)
        alias.setAttributeNS(ns, "android:targetActivity", NUVIO_STARTUP_ACTIVITY)
        application.replaceChild(alias, original)
    }
}

internal fun addNuvioLaunchLogo(document: Document) {
    val ns = "http://schemas.android.com/apk/res/android"
    val original = document.documentElement
    val children = (0 until original.childNodes.length).mapNotNull { original.childNodes.item(it) as? Element }
    check(original.tagName == "shape" && children.size == 1 && children.single().tagName == "solid") {
        "Unexpected or already-patched beta.8 launch background"
    }
    val color = children.single().getAttributeNS(ns, "color")
    check(color in setOf("@color/splash_background", "@0x7f06005d", "@7f06005d")) {
        "Unexpected beta.8 launch background color: $color"
    }
    val layers = document.createElement("layer-list")
    layers.setAttributeNS("http://www.w3.org/2000/xmlns/", "xmlns:android", ns)
    val background = document.createElement("item")
    background.appendChild(original.cloneNode(true))
    layers.appendChild(background)
    fun gradient(vararg attributes: Pair<String, String>) {
        val item = document.createElement("item")
        val shape = document.createElement("shape")
        val gradient = document.createElement("gradient")
        attributes.forEach { (name, value) -> gradient.setAttributeNS(ns, "android:$name", value) }
        shape.appendChild(gradient)
        item.appendChild(shape)
        layers.appendChild(item)
    }
    gradient("angle" to "270", "startColor" to "#ff1e3d59", "centerColor" to "#ff142330", "endColor" to "#ff121212", "centerY" to "0.42")
    gradient("angle" to "0", "startColor" to "#421e88e5", "centerColor" to "#141e88e5", "endColor" to "#001e88e5", "centerX" to "0.45")
    val logo = document.createElement("item")
    logo.setAttributeNS(ns, "android:width", "151.4dp")
    logo.setAttributeNS(ns, "android:height", "48dp")
    logo.setAttributeNS(ns, "android:bottom", "80dp")
    logo.setAttributeNS(ns, "android:gravity", "center")
    val bitmap = document.createElement("bitmap")
    bitmap.setAttributeNS(ns, "android:src", "@drawable/app_logo_wordmark")
    bitmap.setAttributeNS(ns, "android:gravity", "fill")
    bitmap.setAttributeNS(ns, "android:filter", "true")
    logo.appendChild(bitmap)
    layers.appendChild(logo)
    document.replaceChild(layers, original)
}
