package tutto.patches

import app.morphe.patcher.patch.*
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val UI = "Lorg/ungoogled/ui/"
private const val PLACE = "${UI}SavedStore\$Place;"
private const val ACTIVITY = "Landroid/app/Activity;"
private const val CONTEXT = "Landroid/content/Context;"

private fun requireCompatible(ok: Boolean, reason: String) {
    if (!ok) throw PatchException("Tutto Enhancements: $reason. Use the supported Maps version with " +
        "bearinmind patches and Offline saved places enabled; do not enable a microG variant.")
}

private fun BytecodePatchContext.method(owner: String, name: String, result: String, vararg params: String): MutableMethod {
    val matches = mutableClassDefByOrNull(owner)?.methods?.filter {
        it.name == name && it.returnType == result && it.parameterTypes.map(CharSequence::toString) == params.toList()
    }.orEmpty()
    requireCompatible(matches.size == 1, "Required method changed: $owner->$name")
    return matches.single()
}

private fun BytecodePatchContext.field(owner: String, name: String, type: String) {
    requireCompatible(classDefByOrNull(owner)?.fields?.any { it.name == name && it.type == type } == true,
        "Required field changed: $owner->$name")
}

private fun Method.calls(owner: String, name: String? = null) = implementation?.instructions?.any {
    val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
    ref?.definingClass == owner && (name == null || ref.name == name)
} == true

private fun BytecodePatchContext.checkBindings() {
    requireCompatible(classDefByOrNull("${UI}SavedStore;") != null, "Local saved extension is missing")
    val microg = classDefByOrNull("${UI}Shapes;")?.methods?.singleOrNull { it.name == "microgPatched" }
    if (microg != null) requireCompatible(
        (microg.implementation?.instructions?.firstOrNull() as? NarrowLiteralInstruction)?.narrowLiteral == 0,
        "The microG variant is not supported")

    // Merely finding SavedStore is insufficient: upstream includes it even when saving is disabled.
    var savingEnabled = false
    classDefForEach { c ->
        if (!savingEnabled && !c.type.startsWith(UI))
            savingEnabled = c.methods.any { it.calls("${UI}SavedPlaces;", "save") }
    }
    requireCompatible(savingEnabled, "Offline saved places was not applied")
    val store = "${UI}SavedStore;"
    field(store, "home", PLACE); field(store, "work", PLACE)
    field(PLACE, "lat", "D"); field(PLACE, "lng", "D")
    method(store, "load", "V", CONTEXT)
}

/** Calls [helper]'s resume/pause from Local saved's activity callbacks. */
private fun BytecodePatchContext.hookLifecycle(helper: String) {
    for ((event, action) in listOf("Resumed" to "resume", "Paused" to "pause", "Destroyed" to "pause")) {
        val m = method("${UI}SavedPlaces\$Front;", "onActivity$event", "V", ACTIVITY)
        // LocalMarkers and LocalLabels were 1.3.x helpers that already drew labels.
        requireCompatible(!m.calls(helper) && !m.calls("${UI}LocalMarkers;") && !m.calls("${UI}LocalLabels;"),
            "The input already contains our enhancements; start from the original APK")
        m.addInstructions(0, """
            invoke-static {p1}, $helper->$action($ACTIVITY)V
        """)
    }
}

private val maps = Compatibility(name = "Google Maps", packageName = "com.google.android.apps.maps",
    apkFileType = ApkFileType.APKM, appIconColor = 0xFFFFFF,
    targets = listOf(AppTarget(version = "26.44.06.1006895251")))

// Unnamed: merges our helper DEX once, whichever of the patches below are selected.
private val tuttoExtensionPatch = bytecodePatch {
    extendWith("extensions/tutto.mpe")
}

@Suppress("unused")
val tuttoEnhancementsPatch = bytecodePatch(
    name = "Home and Work shortcuts",
    description = "Adds Home and Work shortcut chips beside Maps' category carousel, with clean Back " +
        "navigation. Select alongside bearinmind's Offline saved places, which draws saved places, " +
        "labels and starred places on the map. Built for bearinmind 2.10.0 and Maps " +
        "26.44.06.1006895251. Does not support the microG variants.",
    default = true,
) {
    compatibleWith(maps)
    dependsOn(tuttoExtensionPatch)
    // A cross-source dependsOn would bundle/execute another copy of upstream patches.
    // Finalize runs after ALL execute blocks; validate upstream ABI before touching its methods.
    finalize {
        checkBindings()
        method("${UI}SavedPlaces;", "directions", "V", CONTEXT, PLACE)
        hookLifecycle("${UI}HomeWorkShortcuts;")
    }
}

@Suppress("unused")
val labelSuggestionsPatch = bytecodePatch(
    name = "Label search suggestions",
    description = "Shows your Local saved places above Maps' search suggestions: while you type, matching " +
        "Home, Work and labels, saved places (by name, note or category) and recent places; with an empty " +
        "search box or directions stop, Home, Work and every label. Case and accents are ignored and nothing " +
        "is sent to Google. Tap one to open the place, or in directions to set the stop being edited. Select " +
        "alongside bearinmind's Offline saved places. Built for bearinmind 2.10.0 and Maps 26.44.06.1006895251. " +
        "Does not support the microG variants.",
    default = true,
) {
    compatibleWith(maps)
    dependsOn(tuttoExtensionPatch)
    finalize {
        checkBindings()
        val store = "${UI}SavedStore;"
        field(store, "labels", "Ljava/util/Map;"); field(store, "lists", "Ljava/util/Map;")
        field(store, "places", "Ljava/util/Map;")
        for (name in listOf("name", "ftid", "note", "category")) field(PLACE, name, "Ljava/lang/String;")
        field(PLACE, "lists", "Ljava/util/Set;")
        method(PLACE, "located", "Z"); method(PLACE, "<init>", "V")
        val history = "${UI}HistoryStore;"
        val entry = "${UI}HistoryStore\$Entry;"
        method(history, "enabled", "Z", CONTEXT); method(history, "load", "V", CONTEXT)
        method(history, "newestFirst", "Ljava/util/List;")
        for (name in listOf("ftid", "name", "category")) field(entry, name, "Ljava/lang/String;")
        field(entry, "lat", "D"); field(entry, "lng", "D")
        // A tapped row is submitted through Maps' search box; these turn its text into the place.
        method("${UI}SavedPlaces;", "searchLabel", "Z", "Ljava/lang/String;")
        method("${UI}SavedPlaces;", "labelWaypoint", "V", "Ljava/lang/Object;", "Ljava/lang/String;")
        // Both look the text up here: a saved or recent place just tapped answers first.
        val labelled = method(store, "labelled", PLACE, "Ljava/lang/String;")
        val helper = "${UI}LabelSuggestions;"
        requireCompatible(!labelled.calls(helper), "The input already contains our enhancements; start from the original APK")
        requireCompatible((labelled.implementation?.registerCount ?: 0) > 1, "Required method changed: $store->labelled")
        labelled.addInstructionsWithLabels(0, """
            invoke-static {p0}, $helper->picked(Ljava/lang/String;)$PLACE
            move-result-object v0
            if-eqz v0, :original
            return-object v0
        """, ExternalLabel("original", labelled.getInstruction(0)))
        hookLifecycle(helper)
    }
}
