package org.carbridge.patches.androidauto

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val CAR_APP_META = "com.google.android.gms.car.application"
private const val DESCRIPTOR_NAME = "carbridge_automotive_app_desc"

private val CAR_PERMISSIONS = listOf(
    "androidx.car.app.ACCESS_SURFACE",
    "androidx.car.app.MAP_TEMPLATES",
)
private val CAR_CATEGORIES = listOf(
    "android.intent.category.CAR_LAUNCHER",
    "androidx.car.app.category.NAVIGATION",
    "android.intent.category.APP_MAPS",
)
private val MEDIA_SERVICE_ACTIONS = setOf(
    "android.media.browse.MediaBrowserService",
    "androidx.media3.session.MediaLibraryService",
)
private const val CAR_APP_SERVICE_ACTION = "androidx.car.app.CarAppService"

@Suppress("unused")
val showInAndroidAutoPatch = patch(
    name = "Show in Android Auto",
    description = "Lists the app in the Android Auto launcher and shows its full interface " +
        "on the car screen while parked.",
    default = false,
) {
    // No compatibleWith: the patch applies to any app.
    val keepMediaServicesOption = booleanOption(
        key = "keepMediaServices",
        default = false,
        title = "Keep media services",
        description = "Keep the app's media browser service, so music and podcast apps keep their " +
            "Android Auto audio player. Android Auto may then show that player instead of the full app.",
    )

    execute {
        document("AndroidManifest.xml").use { doc ->
            val manifest = doc.documentElement
            val app = manifest.children("application").firstOrNull()
                ?: throw PatchException("Manifest has no <application>")

            addCarEntries(doc, manifest, app)
            val stripped = if (keepMediaServicesOption.value == true) {
                setOf(CAR_APP_SERVICE_ACTION)
            } else {
                MEDIA_SERVICE_ACTIONS + CAR_APP_SERVICE_ACTION
            }
            stripTemplateServices(app, stripped)
        }
    }
}

private fun addCarEntries(doc: Document, manifest: Element, app: Element) {
    app.setAttribute("android:appCategory", "game")
    doc.ensureMeta(app, "distractionOptimized", "value", "true")
    doc.ensureMeta(app, "androidx.car.app.minCarApiLevel", "value", "7")
    if (app.findMeta(CAR_APP_META) == null) {
        addAutomotiveDescriptor()
        doc.ensureMeta(app, CAR_APP_META, "resource", "@xml/$DESCRIPTOR_NAME")
    }

    val declared = manifest.children("uses-permission").mapNotNull { it.androidName }.toSet()
    for (perm in CAR_PERMISSIONS - declared) {
        // Permissions must come before <application> in the manifest
        val el = doc.createElement("uses-permission")
        el.setAttribute("android:name", perm)
        manifest.insertBefore(el, app)
    }

    val patched = mutableListOf<String>()
    for (activity in app.children("activity") + app.children("activity-alias")) {
        for (filter in activity.children("intent-filter")) {
            if (!filter.isLauncherFilter()) continue
            val existing = filter.children("category").mapNotNull { it.androidName }.toSet()
            for (cat in CAR_CATEGORIES - existing) {
                val el = doc.createElement("category")
                el.setAttribute("android:name", cat)
                filter.appendChild(el)
            }
            doc.ensureMeta(activity, "distractionOptimized", "value", "true")
            activity.setAttribute("android:resizeableActivity", "true")
            activity.androidName?.let(patched::add)
        }
    }
    if (patched.isEmpty()) throw PatchException("No launcher activity found")
}

/** Declares the app as a car app; Android Auto only lists apps that have this descriptor. */
private fun addAutomotiveDescriptor() {
    resourceFile("res/xml/$DESCRIPTOR_NAME.xml", false).apply {
        parentFile.mkdirs()
        writeText(
            """
            <?xml version="1.0" encoding="utf-8"?>
            <automotiveApp>
                <uses name="media"/>
            </automotiveApp>
            """.trimIndent() + "\n",
        )
    }
}

/** A media or car-template service makes Android Auto show its template UI instead of the app. */
private fun stripTemplateServices(app: Element, strippedActions: Set<String>) {
    for (service in app.children("service")) {
        for (filter in service.children("intent-filter")) {
            val actions = filter.children("action").mapNotNull { it.androidName }
            if (actions.any { it in strippedActions }) service.removeChild(filter)
        }
    }
}

private fun Document.ensureMeta(parent: Element, name: String, valueAttr: String, value: String) {
    if (parent.findMeta(name) != null) return
    val meta = createElement("meta-data")
    meta.setAttribute("android:name", name)
    meta.setAttribute("android:$valueAttr", value)
    parent.appendChild(meta)
}

private fun Element.findMeta(name: String) = children("meta-data").firstOrNull { it.androidName == name }

private fun Element.isLauncherFilter(): Boolean {
    val actions = children("action").mapNotNull { it.androidName }
    val cats = children("category").mapNotNull { it.androidName }
    return "android.intent.action.MAIN" in actions && "android.intent.category.LAUNCHER" in cats
}

private val Element.androidName: String?
    get() = getAttribute("android:name").ifEmpty { null }

private fun Element.children(tag: String): List<Element> {
    val nodes = childNodes
    return (0 until nodes.length).mapNotNull { nodes.item(it) as? Element }.filter { it.tagName == tag }
}
