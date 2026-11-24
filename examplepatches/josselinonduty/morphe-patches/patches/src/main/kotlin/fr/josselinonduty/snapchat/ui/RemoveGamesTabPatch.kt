package fr.josselinonduty.snapchat.ui

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import fr.josselinonduty.snapchat.snapBytecodePatch

// There is no Games tab of its own: the center Camera tab gets a plugin-supplied "Jeux" button.
// Trace (logcat): Lq5d0;->accept (consumer of the tab spec's Optional<Drawable> Observable) builds
// that SnapButtonView (id 0x7f0b1195). Anchors (14.33.1.0): the button's view id and the
// `Lrwg0;->d()Z` "drawable present" check just before it. Forcing "absent" takes the app's own
// no-button path. Class/method names are obfuscated: pinned to this build.
object TabButtonFingerprint : Fingerprint(
    filters = listOf(
        methodCall(definingClass = "Lrwg0;", name = "d"),
        literal(0x7f0b1195),
    ),
)

// Same for the label: Lp6v;->invoke() case 4 maps the plugin label Observable (Lrge0;->c) over the
// default string ("Appareil"). No plugin => the app falls back to an empty label; keep the default.
object TabLabelFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf(),
    filters = listOf(methodCall(definingClass = "Lrge0;", name = "c")),
)

val removeGamesTabPatch = snapBytecodePatch(
    name = "Remove Games tab",
    description = "Shows the plain Camera icon and label in the center tab instead of Games.",
) {
    execute {
        val present = TabButtonFingerprint.instructionMatches[0].index
        // `move-result v1` follows the call: overwrite with "absent".
        TabButtonFingerprint.method.replaceInstruction(present + 1, "const/4 v1, 0x0")

        val label = TabLabelFingerprint.method
        val code = label.implementation!!.instructions.toList()
        val plugin = TabLabelFingerprint.instructionMatches[0].index
        val lookup = code.subList(0, plugin).indexOfLast {
            it is ReferenceInstruction && (it.reference as? MethodReference)?.let { m -> m.definingClass == "Ljava/util/Map;" && m.name == "get" } == true
        }
        val blank = code.subList(plugin, code.size).indexOfFirst {
            it is ReferenceInstruction && (it.reference as? StringReference)?.string == ""
        } + plugin
        check(lookup > 0 && blank > plugin) { "Camera label arm not found" }
        label.removeInstruction(blank) // fallback keeps the default label already in v0
        label.replaceInstruction(lookup + 1, "const/4 v1, 0x0") // plugin lookup -> null
    }
}
