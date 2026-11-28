/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.misc.glass

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.instagram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.instagram.reels.fullscreen.barHeightStores
import app.morphe.patches.instagram.reels.fullscreen.barHeightsPatch
import app.morphe.patches.instagram.reels.fullscreen.findBarHeights
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val GLASS_TAB_BAR = "$EXTENSION_PACKAGE/misc/GlassTabBar;"
internal const val CAMERA_NAV_BAR_HEIGHT_HOOK = "Lapp/southstar21/extension/instagram/liquidglass/LiquidGlassNavBarPatch;->cameraNavBarHeight(I)I"

/** The camera's 9:16 layout, by the name Instagram keeps for it as a Parcelable. */
internal const val CAMERA_LAYOUT =
    "Lcom/instagram/creation/capture/quickcapture/aspectratioutil/targetviewsizeprovider/NineSixteenLayoutConfigImpl;"

private fun refuse(why: String): Nothing = throw PatchException("Liquid Glass navigation bar: $why")

/**
 * The camera's 9:16 layout reads the navigation bar's height Instagram keeps ([nav]) once, as its
 * constructor from a Context builds it, and lays the gallery button and the mode picker out above it.
 * The camera opens in the main window, where a floating pill had Instagram answered 0, so they sat
 * under the navigation bar (#646). That constructor asks [CAMERA_NAV_BAR_HEIGHT_HOOK] about the height
 * right before it hands it to the layout's own constructor, which nothing jumps to.
 */
internal fun BytecodePatchContext.giveTheCameraTheNavBar(nav: FieldReference) {
    classDefByOrNull(CAMERA_LAYOUT) ?: refuse("$CAMERA_LAYOUT isn't in the app")
    val holder = classDefByOrNull(nav.definingClass) ?: refuse("${nav.definingClass} isn't in the app")
    // 456 moved the height getters to the holder's companion, the class one of its static fields holds.
    val homes = listOf(holder) + holder.fields.filter { AccessFlags.STATIC.isSet(it.accessFlags) && it.type != holder.type }
        .map { it.type }.distinct().mapNotNull { classDefByOrNull(it) }
    val getters = homes.flatMap { home -> home.methods }.filter { method ->
        AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "I" && method.parameterTypes.isEmpty() &&
            method.implementation?.instructions?.any { it.opcode == Opcode.SGET && it.fieldIs(nav) } == true
    }.map { "${it.definingClass}->${it.name}" }.toSet()
    val method = mutableClassDefBy(CAMERA_LAYOUT).methods.singleOrNull {
        it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;", "Z", "Z")
    } ?: refuse("$CAMERA_LAYOUT has no constructor from a Context")
    val code = method.implementation?.instructions?.toList() ?: emptyList()
    val read = code.indices.singleOrNull { at ->
        val call = code[at].calls() ?: return@singleOrNull false
        code[at].opcode == Opcode.INVOKE_STATIC && "${call.definingClass}->${call.name}" in getters &&
            call.parameterTypes.isEmpty() && call.returnType == "I"
    } ?: refuse("the camera's layout reads the navigation bar's height ${nav.definingClass} keeps other than once")
    val result = code.getOrNull(read + 1)?.takeIf { it.opcode == Opcode.MOVE_RESULT } as? OneRegisterInstruction
        ?: refuse("the camera's layout keeps no navigation bar height")
    val height = result.registerA
    if (height > 15) refuse("the camera's layout keeps the navigation bar's height in v$height, past what an invoke names")
    val build = code.indices.singleOrNull { at ->
        val call = code[at].calls()
        (code[at].opcode == Opcode.INVOKE_DIRECT || code[at].opcode == Opcode.INVOKE_DIRECT_RANGE) &&
            call != null && call.definingClass == CAMERA_LAYOUT && call.name == "<init>"
    } ?: refuse("the camera's layout doesn't build itself once")
    if (build < read || height !in code[build].arguments()) refuse("the camera's layout doesn't hand on the height it read")
    if ((read + 2 until build).any { code[it].writes(height) }) refuse("the camera's layout changes the height before handing it on")
    if (build in code.branchTargets()) refuse("something in the camera's layout jumps to where it builds itself")
    method.addInstructions(
        build,
        """
            invoke-static { v$height }, $CAMERA_NAV_BAR_HEIGHT_HOOK
            move-result v$height
        """,
    )
}

private fun Instruction.calls() = (this as? ReferenceInstruction)?.reference as? MethodReference

private fun Instruction.fieldIs(field: FieldReference): Boolean {
    val read = (this as? ReferenceInstruction)?.reference as? FieldReference ?: return false
    return read.definingClass == field.definingClass && read.name == field.name && read.type == field.type
}

private fun Instruction.arguments(): List<Int> = when (this) {
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    else -> emptyList()
}

private fun Instruction.writes(register: Int): Boolean {
    val first = (this as? OneRegisterInstruction)?.registerA ?: return false
    return (opcode.setsRegister() && first == register) || (opcode.setsWideRegister() && first + 1 == register)
}

/** The index each branch and switch in the code goes to. A switch's cases count as all of its code. */
private fun List<Instruction>.branchTargets(): Set<Int> {
    if (any { it.opcode == Opcode.PACKED_SWITCH || it.opcode == Opcode.SPARSE_SWITCH }) return indices.toSet()
    val addresses = IntArray(size)
    var address = 0
    forEachIndexed { index, instruction -> addresses[index] = address; address += instruction.codeUnits }
    return indices.filter { this[it] is OffsetInstruction }
        .map { addresses.indexOf(addresses[it] + (this[it] as OffsetInstruction).codeOffset) }.toSet()
}
