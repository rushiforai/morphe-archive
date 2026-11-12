package app.template.patches.flashscore.misc.edge

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.template.patches.flashscore.controls.FLASHSCORE_EXTENSION
import app.template.patches.shared.Constants.COMPATIBILITY_FLASHSCORE
import app.template.patches.shared.addInstructionsChecked
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val NAVIGATION_BAR_STRIP = "Lapp/template/extension/flashscore/NavigationBarStrip;"
private const val EVENT_LIST_ACTIVITY = "Leu/livesport/LiveSport_cz/EventListActivity;"

/** android.R.id.content */
private const val ANDROID_CONTENT_ID = 0x01020002

private const val WINDOW = "Landroid/view/Window;"

/** `invoke-virtual Window.setNavigationBarColor(I)V` on the window register. */
private fun ReferenceInstruction.isSetNavigationBarColor(): Boolean {
    if (opcode != Opcode.INVOKE_VIRTUAL) return false
    val call = reference as? MethodReference ?: return false
    return call.definingClass == WINDOW && call.name == "setNavigationBarColor" && call.returnType == "V" &&
        call.parameterTypes.map(CharSequence::toString) == listOf("I")
}

/**
 * Flashscore paints the navigation bar with the Material edge-to-edge helper (one method per API
 * level, each setting the status bar colour, the navigation bar colour and then the bar icon
 * appearance). On the dark screens the painted bar does not match the content, so the gesture pill
 * sits on a bright strip.
 *
 * The patch finds every method that sets both bar colours (the three helpers) and forces the
 * navigation bar colour argument to transparent, leaving the status bar and the icon appearance
 * untouched. The app already lays out edge-to-edge, so the content and the pill then share one
 * background. Only Android 14 and older honour the colour: 26.11.4 targets API 36, and on Android 15+
 * the system keeps the navigation bar of such apps transparent and ignores setNavigationBarColor.
 *
 * Android 15+ (2026-11-07, #128): the main screen's inset listener pads android.R.id.content by
 * the navigation bar height and draws nothing there, so the pill sits on the page background
 * (#010a0f on the emulator) under a tab bar of another colour (#00141e). Right after
 * EventListActivity.onCreate looks up the content view, NavigationBarStrip (extensions/flashscore)
 * gives it a background that paints only that padding, in the tab bar's colour.
 */
@Suppress("unused")
val forceEdgeToEdgePatch = bytecodePatch(
    name = "Force edge-to-edge",
    description = "Blends the navigation bar area into the bottom tab bar.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_FLASHSCORE)

    extendWith(FLASHSCORE_EXTENSION)

    execute {
        classDefBy(NAVIGATION_BAR_STRIP)

        // The main screen's content view: the first findViewById(android.R.id.content) result in
        // EventListActivity.onCreate. The strip is installed on it right after the move-result.
        val onCreate = mutableClassDefBy(EVENT_LIST_ACTIVITY).methods.singleOrNull {
            it.name == "onCreate" && it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/os/Bundle;")
        } ?: throw PatchException("$EVENT_LIST_ACTIVITY.onCreate(Bundle) not found")
        val createInsns = onCreate.instructions
        val idLoad = createInsns.indices.firstOrNull { i ->
            (createInsns[i] as? NarrowLiteralInstruction)?.narrowLiteral == ANDROID_CONTENT_ID &&
                createInsns.getOrNull(i + 1)?.let { next ->
                    ((next as? ReferenceInstruction)?.reference as? MethodReference)?.name == "findViewById"
                } == true &&
                createInsns.getOrNull(i + 2)?.opcode == Opcode.MOVE_RESULT_OBJECT
        } ?: throw PatchException("$EVENT_LIST_ACTIVITY.onCreate no longer looks up android.R.id.content")
        val contentRegister = (createInsns[idLoad + 2] as OneRegisterInstruction).registerA
        onCreate.addInstructionsChecked(
            idLoad + 3,
            "invoke-static/range { v$contentRegister .. v$contentRegister }, $NAVIGATION_BAR_STRIP->install(Landroid/view/View;)V",
        )

        // Collect first: mutating classes while iterating them is not allowed.
        val owners = mutableListOf<ClassDef>()
        classDefForEach { classDef ->
            val hasNavigation = classDef.methods.any { method ->
                method.implementation?.instructions?.any { insn ->
                    insn is ReferenceInstruction && insn.isSetNavigationBarColor()
                } == true
            }
            val hasStatus = classDef.methods.any { method ->
                method.implementation?.instructions?.any { insn ->
                    val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
                    ref?.definingClass == WINDOW && ref.name == "setStatusBarColor"
                } == true
            }
            if (hasNavigation && hasStatus) owners += classDef
        }
        if (owners.isEmpty()) {
            throw PatchException("Force edge-to-edge: no method sets both system bar colours")
        }

        var forced = 0
        for (owner in owners) {
            for (method in mutableClassDefBy(owner).methods) {
                val insns = method.implementation?.instructions?.toList() ?: continue
                // Back to front, so the earlier indices stay valid.
                insns.withIndex()
                    .filter { (_, insn) -> insn is ReferenceInstruction && insn.isSetNavigationBarColor() }
                    .map { (index, insn) -> index to insn as ReferenceInstruction }
                    .reversed()
                    .forEach { (index, call) ->
                        val colour = (call as FiveRegisterInstruction).registerD
                        method.addInstructionsChecked(index, "const/16 v$colour, 0x0")
                        forced++
                    }
            }
        }
        if (forced == 0) throw PatchException("Force edge-to-edge: no setNavigationBarColor call was rewritten")
    }
}
