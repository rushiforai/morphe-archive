/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.navigation.bottomtabbar

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.misc.extension.facebookExtensionPatch
import app.morphe.patches.facebook.misc.extension.freeLocalsAt
import app.morphe.util.ControlFlow
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * The name Facebook's main screen gives the bottom tab bar's entry in its scroll-away list, the
 * list of views that slide off screen as the feed scrolls down and back as it scrolls up.
 */
internal const val BOTTOM_TABS_CONTAINER = "bottom_tabs_container"

internal const val ACTIVITY = "Landroid/app/Activity;"

internal const val TAB_BAR_SCROLL_AWAY = "Lapp/morphe/extension/facebook/navigation/TabBarScrollAway;"
internal const val SLIDES_AWAY = "$TAB_BAR_SCROLL_AWAY->slidesAway()Z"

/** How far before the entry's name the start may ask the gate. 581 asks 11 instructions before. */
private const val GATE_WINDOW = 16

/**
 * Facebook already knows how to slide its bottom tab bar away while the feed scrolls down. As the
 * main screen starts, it builds the bar's scroll-away entry, named [BOTTOM_TABS_CONTAINER], only
 * when one check answers yes (581 `LX/1wt;->A0A`, 580 `LX/1rJ;->A0A`, 577 `LX/1qY;->A0B`). The
 * same check is asked by the feed's floating button, the mini player and the screens that make
 * room for the bar, so they all agree on whether it slides. It answers yes when scroll-away runs
 * at all on this phone, the bar is at the bottom (the class's own check of
 * fb4a_bottom_tabs_override_enabled, the read Tab bar at the bottom answers), and two server
 * settings turn the experiment on for the account.
 *
 * The extension goes in right after the bar's position check passes. While the switch is on it
 * answers yes in place of the two server settings; otherwise Facebook carries on to them. With the
 * bar at the top, or scroll-away off for the phone, the extension isn't reached at all. Facebook's
 * own scroll-away code then moves the bar, snaps it back at the top and keeps the feed's bottom
 * inset, the way it does for the accounts it gives the experiment to.
 */
internal val tabBarScrollAwayPatch = bytecodePatch {
    dependsOn(facebookExtensionPatch)

    execute {
        val holders = classDefByStrings(BOTTOM_TABS_CONTAINER, StringComparisonType.EQUALS)
            .filterNot { it.type.startsWith(EXTENSION_CLASSES) }
        val gate = scrollAwayGate(holders)
        val gateClass = mutableClassDefBy(gate.definingClass)
        val method = gateClass.findMutableMethodOf(gate)
        method.slideAwayAfterBarCheck(barAtBottomCheck(method, gateClass))
    }
}

private fun refuse(detail: String): Nothing = throw PatchException("$PATCH: $detail")

private fun MethodReference.takesOnlyActivity() =
    returnType == "Z" && parameterTypes.size == 1 && parameterTypes[0].toString() == ACTIVITY

private fun calledMethod(instruction: Instruction) =
    instruction.takeIf { it.opcode.name.startsWith("invoke") }
        ?.let { (it as ReferenceInstruction).reference as? MethodReference }

private fun loadsContainerName(instruction: Instruction) =
    instruction.opcode.name.startsWith("const-string") &&
        ((instruction as ReferenceInstruction).reference as StringReference).string == BOTTOM_TABS_CONTAINER

/**
 * Whether [code] at [call] keeps its answer with a move-result and branches away on false right
 * after, and returns that register, or null.
 */
private fun testedResult(code: List<Instruction>, call: Int): Int? {
    val result = code.getOrNull(call + 1)?.takeIf { it.opcode == Opcode.MOVE_RESULT } ?: return null
    val register = (result as OneRegisterInstruction).registerA
    val branch = code.getOrNull(call + 2)?.takeIf { it.opcode == Opcode.IF_EQZ } ?: return null
    return register.takeIf { (branch as OneRegisterInstruction).registerA == it }
}

/**
 * The check the start asks before it builds the bottom tab bar's scroll-away entry: in each method
 * of [holders] that loads [BOTTOM_TABS_CONTAINER], the nearest call before the load that takes an
 * Activity and answers a boolean, whose false jumps past the load. Refuses unless exactly one check
 * is found, since another load deciding the bar on its own would go unseen.
 */
internal fun scrollAwayGate(holders: List<ClassDef>): MethodReference {
    val gates = holders.flatMap { holder ->
        holder.methods.flatMap { method ->
            val code = method.implementation?.instructions?.toList().orEmpty()
            code.indices.filter { loadsContainerName(code[it]) }.mapNotNull { load ->
                val call = (load - 1 downTo maxOf(0, load - GATE_WINDOW))
                    .firstOrNull { calledMethod(code[it])?.takesOnlyActivity() == true } ?: return@mapNotNull null
                testedResult(code, call) ?: return@mapNotNull null
                // The false way has to skip the entry, or the check wouldn't decide it.
                val skips = ControlFlow.of(method).normal[call + 2].any { it > load }
                calledMethod(code[call])!!.takeIf { skips }
            }
        }
    }.distinctBy { "${it.definingClass}->${it.name}" }
    return gates.singleOrNull()
        ?: refuse("expected one check before the start builds \"$BOTTOM_TABS_CONTAINER\", found ${gates.size}")
}

/**
 * Where the extension goes in [gate]: right after the one call to [gateClass]'s own
 * `(Activity)Z` method that reads a TriState from FbSharedPreferences, the bar's position check,
 * and the branch that leaves when it answers no. Refuses a gate without exactly one such check.
 */
internal fun barAtBottomCheck(gate: Method, gateClass: ClassDef): Int {
    val code = gate.implementation?.instructions?.toList() ?: refuse("${gate.definingClass}->${gate.name} has no body")
    val checks = code.indices.filter { index ->
        val called = calledMethod(code[index]) ?: return@filter false
        called.definingClass == gate.definingClass && called.takesOnlyActivity() &&
            gateClass.methods.any { it.name == called.name && it.takesOnlyActivity() && it.readsTriState() }
    }
    val call = checks.singleOrNull()
        ?: refuse("${gate.definingClass}->${gate.name} asks where the tab bar goes ${checks.size} times, expected once")
    testedResult(code, call)
        ?: refuse("${gate.definingClass}->${gate.name} doesn't leave right after the tab bar's position check answers no")
    return call + 3
}

private fun Method.readsTriState() = implementation?.instructions?.any { instruction ->
    val called = calledMethod(instruction)
    called != null && called.definingClass == FB_SHARED_PREFERENCES && called.returnType == TRI_STATE
} == true

/**
 * Puts the extension at [at], the bar at the bottom: a yes returns yes, and a no goes on to
 * Facebook's own server settings. The register is one nothing reads from there. Nothing may jump
 * to [at], since code arriving there would skip the call.
 */
internal fun MutableMethod.slideAwayAfterBarCheck(at: Int) {
    val next = implementation!!.instructions[at] as BuilderInstruction
    if (next.location.labels.isNotEmpty()) refuse("$definingClass->$name has a jump past its tab bar position check")
    val register = freeLocalsAt(PATCH, at, 1, highest = 255).single()
    addInstructionsWithLabels(
        at,
        """
            invoke-static { }, $SLIDES_AWAY
            move-result v$register
            if-eqz v$register, :facebook
            return v$register
        """,
        ExternalLabel("facebook", getInstruction(at)),
    )
}
