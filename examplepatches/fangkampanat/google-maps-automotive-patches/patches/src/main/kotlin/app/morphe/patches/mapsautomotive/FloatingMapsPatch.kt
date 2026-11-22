package app.morphe.patches.mapsautomotive

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Document
import org.w3c.dom.Element
import java.util.logging.Logger

// The floating Maps window, a separate patch on top of the core one. FloatingMaps shows Maps' compact guidance screen
// (LimitedMapsActivity, which Maps declares for a launcher's map card) from a private virtual display in a window over
// other apps, while Maps is covered during guidance. The patch declares "Display over other apps" for that window and
// "Reorder tasks" to give Maps the input focus back after the card starts, installs FloatingMaps when MapsActivity is
// created, and adds a Settings row.
// Required: the card activity as inspected in 26.10.120003.E (embeddable, resizeable, in its own task) and its class,
// MapsActivity's onCreate in a class the card does not share, and the extension's entry points.

private const val FLOATING_MAPS_CLASS = "Lapp/morphe/extension/mapsautomotive/patches/FloatingMaps;"
// Must match FloatingMaps.CARD_ACTIVITY in the extension.
private const val CARD_ACTIVITY = "com.google.android.apps.gmm.car.embedded.activity.LimitedMapsActivity"
private val cardClass = "L" + CARD_ACTIVITY.replace('.', '/') + ";"
private val floatingPermissions = listOf("android.permission.SYSTEM_ALERT_WINDOW", "android.permission.REORDER_TASKS")
private val floatingLogger = Logger.getLogger("app.morphe.patches.mapsautomotive.FloatingMapsPatch")

private val floatingMapsManifestPatch = resourcePatch {
    dependsOn(manifestPatch)
    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            requireCardActivity(manifest)
            floatingPermissions.forEach { addPermission(document, manifest, it) }
        }
    }
}

@Suppress("unused")
val floatingMapsPatch = bytecodePatch(
    name = "Floating Maps window",
    description = "Shows the next turn, the map and the arrival time in a small window at the bottom right during guidance, " +
        "when the camera, another app or Home covers Maps. Tap the window to open Maps; drag it to move it, or drag its top-left " +
        "corner to resize it. On BYD it shows only in D; after P, R or N it comes back after 30 s in D. It needs \"Display over " +
        "other apps\"; its Settings row opens that page, turns the window on or off, keeps it off Home and sets its size and opacity.",
    default = true,
) {
    compatibleWith(compatibility)
    dependsOn(automotiveMicroGPatch, floatingMapsManifestPatch)

    execute {
        requireExtensionMethod(FLOATING_MAPS_CLASS, "install", listOf("Landroid/app/Activity;"), "V")
        requireExtensionMethod(FLOATING_MAPS_CLASS, "getSettingsTitle", listOf("Landroid/content/Context;"), "Ljava/lang/String;")
        requireExtensionMethod(FLOATING_MAPS_CLASS, "getSettingsSummary", listOf("Landroid/content/Context;"), "Ljava/lang/String;")
        requireExtensionMethod(
            FLOATING_MAPS_CLASS, "getSettingsAction",
            listOf("Landroid/content/Context;", "Landroid/view/View;"), "Ljava/lang/Runnable;",
        )
        installFloatingMaps()
        IncludedFeatures.settingsRows += FLOATING_MAPS_CLASS
        IncludedFeatures.features += "floating_maps"
    }
}

// The card activity: not exported, embeddable, resizeable, singleTask in a task of its own.
private fun requireCardActivity(manifest: Element) {
    val application = manifest.directChildren("application").single()
    val cards = application.directChildren("activity").filter { it.getAttribute("android:name") == CARD_ACTIVITY }
    val card = cards.singleOrNull() ?: throw PatchException("Expected one $CARD_ACTIVITY, found ${cards.size}")
    val expected = mapOf(
        "android:allowEmbedded" to "true",
        "android:resizeableActivity" to "true",
        "android:taskAffinity" to "",
        "android:excludeFromRecents" to "true",
    )
    val wrong = expected.filter { (name, value) -> card.getAttribute(name) != value || !card.hasAttribute(name) }
    if (wrong.isNotEmpty()) {
        throw PatchException("$CARD_ACTIVITY differs: ${wrong.keys.joinToString { "$it=${card.getAttribute(it)}" }}")
    }
    val launchMode = card.getAttribute("android:launchMode")
    if (launchMode != "singleTask" && launchMode != "2") throw PatchException("$CARD_ACTIVITY launchMode is '$launchMode'")
    val process = card.getAttribute("android:process")
    if (process.isNotEmpty()) throw PatchException("$CARD_ACTIVITY runs in process '$process', not Maps' own")
}

private fun addPermission(document: Document, manifest: Element, name: String) {
    if (manifest.directChildren("uses-permission").any { it.getAttribute("android:name") == name }) {
        floatingLogger.info("$name is already declared")
        return
    }
    val permission = document.createElement("uses-permission")
    permission.setAttribute("android:name", name)
    manifest.insertBefore(permission, manifest.directChildren("application").single())
    floatingLogger.info("Declared $name for the floating Maps window")
}

// FloatingMaps follows Maps' screens from MapsActivity's creation on. The hook goes into the first onCreate in
// MapsActivity's hierarchy, which must not be the card's too (its lifecycle is watched, not hooked).
private fun BytecodePatchContext.installFloatingMaps() {
    val card = classDefByOrNull(cardClass) ?: throw PatchException("Missing card class $cardClass")
    val method = findHierarchyHook(MAIN_CLASS, "Maps activity onCreate") {
        it.name == "onCreate" && it.returnType == "V" &&
            it.parameterTypes.map { type -> type.toString() } == listOf("Landroid/os/Bundle;")
    }
    // The card's classes up to the first framework class, which must be Activity.
    val cardHierarchy = mutableSetOf<String>()
    var type: String? = card.type
    while (type != null && !type.startsWith("Landroid/") && !type.startsWith("Ljava/") && cardHierarchy.add(type)) {
        type = classDefByOrNull(type)?.superclass
    }
    if (type != "Landroid/app/Activity;") throw PatchException("$cardClass is not an activity (reached $type)")
    if (method.definingClass in cardHierarchy) {
        throw PatchException("MapsActivity's onCreate ${method.definingClass} is the card's too")
    }
    method.addInstruction(
        0,
        "invoke-static/range { p0 .. p0 }, $FLOATING_MAPS_CLASS->install(Landroid/app/Activity;)V",
    )
    floatingLogger.info("Floating Maps window: installed from $method; card $cardClass (hierarchy ${cardHierarchy.joinToString()})")
}
