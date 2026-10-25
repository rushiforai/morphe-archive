/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.reels

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.facebook.downloads.reel.SIDEBAR
import app.morphe.patches.facebook.downloads.reel.isSidebarBuilder
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.facebook.misc.extension.freeLocalsAt
import app.morphe.util.classDefForEachReferencing
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/*
 * The Save button down a reel's right side (#190). Read from 583, 2026-10-19, arm64 and armv7; the
 * obfuscated names here are for reviewers, the code never writes one down.
 *
 * - The reel sidebar's builder (arm64 LX/APP;->A02, armv7 LX/AR8;->A02, the method Download any
 *   reel adds its button in) walks a list of button types, one constant of Facebook's icon enum
 *   (LX/1UP; on both) for each button, and builds, marks and names one button per type. The walk
 *   reads each type with Iterator.next() and casts it to the enum straight away.
 * - Save is the BOOKMARK constant: the per-type factory (arm64 LX/ARY;->A06) builds "save_button"
 *   for ordinal 274, which the enum's <clinit> names BOOKMARK. Like, Comment and Share are LIKE,
 *   COMMENT and SHARE. The enum's names are strings in its <clinit>, so name() reads them at run
 *   time on any build.
 * - Skipping a type before it's built leaves the three lists in step, since nothing has been
 *   added for it yet. The assembly call only asks the type list where one other button sits
 *   (ImmutableList.indexOf), to place a badge beside it.
 * - The hook goes right after the cast: the extension is handed the type, and true jumps back to
 *   the walk's hasNext(), as the walk's own `continue` does.
 */

internal const val REEL_SIDEBAR_BUTTON = "$EXTENSION_PACKAGE/reels/ReelDeclutter;->hideSidebarButton(Ljava/lang/Object;)Z"

private const val PATCH = "Clean up Reels"
private const val ITERATOR = "Ljava/util/Iterator;"
private const val ENUM = "Ljava/lang/Enum;"

/** Where the sidebar builder reads one button type: the next() call, its cast, and the loop's hasNext(). */
internal data class ButtonTypeWalk(val next: Int, val cast: Int, val hasNext: Int, val type: Int, val enumType: String)

/**
 * The one place [builder] takes a button type off an iterator and casts it to an enum, with the
 * hasNext() on the same iterator nearest before it. [isEnum] answers whether a type extends
 * java.lang.Enum. Null unless there's exactly one.
 */
internal fun buttonTypeWalk(builder: Method, isEnum: (String) -> Boolean): ButtonTypeWalk? {
    val code = builder.implementation?.instructions?.toList() ?: return null
    val walks = code.indices.mapNotNull { at ->
        val call = code[at].iteratorCall("next") ?: return@mapNotNull null
        val result = code.getOrNull(at + 1)?.takeIf { it.opcode == Opcode.MOVE_RESULT_OBJECT } as? OneRegisterInstruction
            ?: return@mapNotNull null
        val cast = code.getOrNull(at + 2)?.takeIf { it.opcode == Opcode.CHECK_CAST } ?: return@mapNotNull null
        if ((cast as OneRegisterInstruction).registerA != result.registerA) return@mapNotNull null
        val type = ((cast as ReferenceInstruction).reference as TypeReference).type
        if (!isEnum(type)) return@mapNotNull null
        val hasNext = (at - 1 downTo 0).firstOrNull { code[it].iteratorCall("hasNext") == call } ?: return@mapNotNull null
        ButtonTypeWalk(at, at + 2, hasNext, result.registerA, type)
    }
    return walks.singleOrNull()
}

/** The iterator register of an Iterator.[name]() call, or null when [this] isn't one. */
private fun Instruction.iteratorCall(name: String): Int? {
    val reference = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return null
    if (reference.definingClass != ITERATOR || reference.name != name || reference.parameterTypes.isNotEmpty()) return null
    return when (this) {
        is RegisterRangeInstruction -> startRegister.takeIf { registerCount == 1 }
        is FiveRegisterInstruction -> registerC.takeIf { registerCount == 1 }
        else -> null
    }
}

/**
 * Puts the Save switch's check right after the sidebar builder casts each button type: the type
 * goes to the extension, and true goes back to hasNext() before anything is built for it. Refuses
 * unless there's one sidebar builder, one such walk in it, and a free local for the answer.
 */
internal fun BytecodePatchContext.hideReelSaveButton() {
    val builders = mutableListOf<Pair<String, Method>>()
    // A sidebar builder names SIDEBAR ([isSidebarBuilder]).
    classDefForEachReferencing(strings = listOf(SIDEBAR)) { classDef ->
        if (classDef.type.startsWith(EXTENSION_PACKAGE)) return@classDefForEachReferencing
        classDef.methods.filter { isSidebarBuilder(it, classDef.methods) }.forEach { builders += classDef.type to it }
    }
    val (owner, found) = builders.singleOrNull()
        ?: throw PatchException("$PATCH: expected one reel sidebar builder, found ${builders.size}")
    // Read from the method being edited: Download any reel adds its block to the same builder, and
    // either patch can run first.
    val builder = mutableClassDefBy(owner).methods.single {
        it.name == found.name && it.parameterTypes.map(CharSequence::toString) == found.parameterTypes.map(CharSequence::toString)
    }
    val walk = buttonTypeWalk(builder) { classDefByOrNull(it)?.superclass == ENUM }
        ?: throw PatchException("$PATCH: $owner->${found.name} doesn't read its button types off one iterator into an enum")
    val at = walk.cast + 1
    val answer = builder.freeLocalsAt("$PATCH: the Save switch's answer", at, 1, targets = listOf(walk.hasNext), highest = 255).single()
    builder.addInstructionsWithLabels(
        at,
        """
            invoke-static/range { v${walk.type} .. v${walk.type} }, $REEL_SIDEBAR_BUTTON
            move-result v$answer
            if-nez v$answer, :next_button
        """,
        ExternalLabel("next_button", builder.getInstruction(walk.hasNext)),
    )
}
