/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-25
 */

package app.morphe.patches.music.player.components

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.music.actionbar.components.lottieAnimationViewTagFingerprint
import app.morphe.patches.music.utils.extension.Constants.EXTENSION_PATH
import app.morphe.patches.music.utils.resourceid.elementsLottieAnimationViewTagId
import app.morphe.util.Utils.printWarn
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val LIKE_PALETTE = "$EXTENSION_PATH/patches/player/MusicPlayerLightLike;"
private const val LOTTIE = "Lcom/airbnb/lottie/LottieAnimationView;"
private const val COMPONENT_TREE = "Lcom/facebook/litho/ComponentTree;"
private const val STRING = "Ljava/lang/String;"

context(_: BytecodePatchContext)
internal fun hookMusicPlayerLightLike() {
    if (lottieAnimationViewTagFingerprint.methodOrNull?.hookLikeAnimationUrl() != true) {
        printWarn("Music light theme: the Now Playing Like animation hook is unavailable in this version.")
    }
}

context(ctx: BytecodePatchContext)
private fun MutableMethod.hookLikeAnimationUrl(): Boolean {
    val contextType = parameterTypes.firstOrNull()?.toString() ?: return false
    val tree = ctx.mutableClassDefByOrNull(contextType)?.fields?.singleOrNull {
        it.type == COMPONENT_TREE && AccessFlags.PUBLIC.isSet(it.accessFlags)
    } ?: return false
    val root = ctx.mutableClassDefByOrNull(COMPONENT_TREE)?.methods?.singleOrNull {
        it.name == "getLithoView" && it.parameterTypes.isEmpty() && AccessFlags.PUBLIC.isSet(it.accessFlags)
    } ?: return false

    val body = implementation ?: return false
    val instructions = body.instructions.toList()
    val getTagIndex = instructions.indexOfFirst {
        it.opcode == Opcode.INVOKE_VIRTUAL &&
                it.getReference<MethodReference>()?.toString() == "$LOTTIE->getTag(I)Ljava/lang/Object;"
    }
    val getTag = instructions.getOrNull(getTagIndex) as? FiveRegisterInstruction ?: return false
    val urlGetter = (getTagIndex - 1 downTo 0).firstOrNull { index ->
        val instruction = instructions[index]
        val method = instruction.getReference<MethodReference>()
        (instruction.opcode == Opcode.INVOKE_INTERFACE || instruction.opcode == Opcode.INVOKE_INTERFACE_RANGE) &&
                method?.returnType == STRING && method.parameterTypes.isEmpty()
    } ?: return false
    val url = instructions.objectResultRegister(urlGetter + 1) ?: return false
    val scratch = instructions.objectResultRegister(getTagIndex + 1) ?: return false
    val insert = urlGetter + 2
    if (url > 15 || scratch > 15 || scratch == url || scratch == getTag.registerC) return false
    if (insert == getTagIndex - 1) {
        // Older clients set the tag ID here, so the tag register is also available as scratch.
        val tagId = instructions[insert] as? NarrowLiteralInstruction ?: return false
        val destination = instructions[insert] as? OneRegisterInstruction ?: return false
        if (tagId.narrowLiteral.toLong() != elementsLottieAnimationViewTagId ||
            destination.registerA != getTag.registerD
        ) return false
    } else if (insert != getTagIndex || scratch == getTag.registerD) return false

    // p1 is the native Litho component context. The mountable image can still be unparented here.
    if (parameterTypes.size != 3 || parameterTypes.any { !it.startsWith("L") }) return false
    val contextRegister = body.registerCount - 3
    val contextWasOverwritten = (0 until insert).any { index ->
        val instruction = instructions[index]
        instruction.opcode.setsRegister() &&
                (instruction as? OneRegisterInstruction)?.registerA == contextRegister
    }
    if (contextWasOverwritten) return false

    // Before the stock comparison: the effective URL is used consistently for caching and loading.
    addInstructionsWithLabels(
        insert,
        """
            move-object/from16 v$scratch, p1
            iget-object v$scratch, v$scratch, $tree
            if-eqz v$scratch, :stock
            invoke-virtual {v$scratch}, $root
            move-result-object v$scratch
            invoke-static {v$scratch, v$url}, $LIKE_PALETTE->selectAnimation(Landroid/view/View;$STRING)$STRING
            move-result-object v$url
        """,
        ExternalLabel("stock", getInstruction(insert)),
    )
    return true
}

private fun List<Instruction>.objectResultRegister(index: Int): Int? {
    val instruction = getOrNull(index)?.takeIf { it.opcode == Opcode.MOVE_RESULT_OBJECT } ?: return null
    return (instruction as OneRegisterInstruction).registerA
}
