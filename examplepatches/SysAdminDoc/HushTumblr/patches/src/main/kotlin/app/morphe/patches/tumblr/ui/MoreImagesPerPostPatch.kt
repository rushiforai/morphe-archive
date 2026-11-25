/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tumblr.lookup.fieldRef
import app.morphe.patches.tumblr.lookup.instructionList
import app.morphe.patches.tumblr.lookup.methodRef
import app.morphe.patches.tumblr.lookup.mutableOf
import app.morphe.patches.tumblr.lookup.only
import app.morphe.patches.tumblr.lookup.requireExtensionHook
import app.morphe.patches.tumblr.lookup.requireShape
import app.morphe.patches.tumblr.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.tumblr.misc.extension.enableCapability
import app.morphe.patches.tumblr.misc.extension.enableStatus
import app.morphe.patches.tumblr.misc.extension.requireStatusMethod
import app.morphe.patches.tumblr.misc.extension.tumblrExtensionPatch
import app.morphe.patches.tumblr.misc.settings.EXTENSION_ROOT
import app.morphe.patches.tumblr.misc.settings.settingsPatch
import app.morphe.util.writesRegister
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val PATCH = "More images per post"
internal const val IMAGE_LIMIT_HOOK = "$EXTENSION_PACKAGE/ui/MoreImages;->imageBlocks(I)I"

/** The message Tumblr shows at the image limit. R8 keeps the resource class, so its name is the anchor. */
internal const val IMAGE_LIMIT_MESSAGE = "canvas_image_blocks_limit"
internal const val TUMBLR_ARRAYS = "Lcom/tumblr/R\$array;"
internal const val SHARE_ACTIVITY = "Lcom/tumblr/creation/receiver/ShareActivity;"
private const val SHARED_LIST = "getParcelableArrayListExtra"

/**
 * Where each limit is raised: before the editor's image limit is built, with the stock number put
 * back in its register once that limit is stored, and before the share screen reads its cap.
 */
internal class ImageLimitPlan(
    val limits: MutableMethod,
    /** The call that builds the image limit: the hook goes in right before it. */
    val buildAt: Int,
    val limitRegister: Int,
    val stock: Int,
    /** Right after the image limit is stored, where the register gets its stock number back. */
    val storedAt: Int,
    val share: MutableMethod,
    /** The share screen's read of the images it was handed: its cap is raised right before it. */
    val readAt: Int,
    val capRegister: Int,
)

/**
 * Tumblr's post editor builds its block limits once (`kn3.<clinit>` in 47.3.0.110): 1000 blocks of
 * any kind, 1000 text blocks, 10 images, 10 links, 10 videos, and so on, each with the message shown
 * at its limit. The image limit's number goes through the extension on its way into its constructor,
 * and the same register then gets 10 back for the link, video and audio limits after it. Adding
 * images, GIFs and camera shots all check this limit, and the gallery picker is told how many are
 * left from it.
 *
 * Sharing several images into Tumblr from another app (`ShareActivity`) cuts the list at its own 10,
 * with the same message. That cap goes through the extension too, on the images-only path. A mixed
 * share of images and videos keeps Tumblr's 10, since its videos are counted against it too.
 */
@Suppress("unused")
val moreImagesPerPostPatch = bytecodePatch(
    name = PATCH,
    description = "Lets you add up to 30 images to a post, as Tumblr's website does, instead of 10." +
        " Starts off. Turn it on in Tumblr settings > HushTumblr > Interface.",
    default = true,
) {
    category("Interface")
    dependsOn(settingsPatch, tumblrExtensionPatch)
    compatibleWith(*AppCompatibilities.tumblr())
    execute {
        requireStatusMethod("moreImagesPerPost")
        requireStatusMethod("imageLimit")
        val plan = resolveImageLimits()
        val limit = plan.limitRegister
        // The later insert first, so the earlier index still points where it did.
        plan.limits.addInstructions(plan.storedAt, "const v$limit, ${plan.stock}")
        plan.limits.addInstructions(plan.buildAt, "invoke-static { v$limit }, $IMAGE_LIMIT_HOOK\nmove-result v$limit")
        val cap = plan.capRegister
        plan.share.addInstructions(plan.readAt, "invoke-static { v$cap }, $IMAGE_LIMIT_HOOK\nmove-result v$cap")
        enableCapability("imageLimit")
        enableStatus("moreImagesPerPost")
    }
}

private fun Instruction.readsImageLimitMessage(): Boolean =
    opcode == Opcode.SGET && fieldRef()?.let { it.definingClass == TUMBLR_ARRAYS && it.name == IMAGE_LIMIT_MESSAGE } == true

private fun Instruction.literal(): Int? = when (opcode) {
    Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST -> (this as NarrowLiteralInstruction).narrowLiteral
    else -> null
}

/** Whether any branch in [method] lands on [index]. */
private fun MutableMethod.branchesOnto(index: Int): Boolean =
    implementation!!.instructions.any { it is BuilderOffsetInstruction && it.target.location.index == index }

internal fun BytecodePatchContext.resolveImageLimits(): ImageLimitPlan {
    requireExtensionHook(PATCH, IMAGE_LIMIT_HOOK)
    val found = mutableListOf<Method>()
    classDefForEach { owner ->
        if (owner.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        owner.methods.filter { it.name == "<clinit>" }.forEach { method ->
            if (method.instructionList().any { it.readsImageLimitMessage() }) found += method
        }
    }
    val limits = mutableOf(found.only(PATCH, "the post editor's block limits"))
    val steps = limits.instructionList()
    requireShape(PATCH, steps.none { it is OffsetInstruction }, "the post editor's block limits branch now")
    val message = steps.indices.filter { steps[it].readsImageLimitMessage() }.only(PATCH, "the image limit's message")
    val number = steps.getOrNull(message + 1)
    val build = steps.getOrNull(message + 2) as? FiveRegisterInstruction
    val store = steps.getOrNull(message + 3)
    val stock = number?.literal()
    requireShape(PATCH, stock != null && stock in 1 until MORE_IMAGES_LIMIT, "the image limit isn't a number right after its message")
    val limit = (number as OneRegisterInstruction).registerA
    val made = (build as? Instruction)?.methodRef()
    requireShape(
        PATCH,
        build != null && (build as Instruction).opcode == Opcode.INVOKE_DIRECT && made?.name == "<init>" &&
            made.parameterTypes.map(CharSequence::toString).let { it.size == 3 && it[1] == "I" && it[2] == "I" } &&
            build.registerCount == 4 && build.registerE == limit &&
            build.registerF == (steps[message] as OneRegisterInstruction).registerA,
        "the image limit isn't built from its number and its message",
    )
    requireShape(
        PATCH,
        store?.opcode == Opcode.SPUT_OBJECT && (store as OneRegisterInstruction).registerA == build!!.registerC,
        "the image limit isn't stored right after it's built",
    )
    requireShape(PATCH, limit < 16, "the image limit sits in a register the hook can't name")

    val shareClass = classDefByOrNull(SHARE_ACTIVITY) ?: throw PatchException("$PATCH: Tumblr's share screen isn't in this build")
    val share = mutableOf(shareClass.methods.filter { method -> method.instructionList().any { it.readsImageLimitMessage() } }
        .only(PATCH, "the share screen's image cap"))
    val sharing = share.instructionList()
    val said = sharing.indices.filter { sharing[it].readsImageLimitMessage() }.only(PATCH, "the share screen's image message")
    val boxed = sharing.getOrNull(said + 1)
    requireShape(
        PATCH,
        boxed?.opcode == Opcode.INVOKE_STATIC && boxed.methodRef()?.let {
            it.definingClass == "Ljava/lang/Integer;" && it.name == "valueOf"
        } == true,
        "the share screen doesn't name its cap in the message",
    )
    val cap = (boxed as FiveRegisterInstruction).registerC
    val read = (said downTo 0).firstOrNull { sharing[it].methodRef()?.name == SHARED_LIST }
    requireShape(PATCH, read != null, "the share screen doesn't read the images it was handed before its cap")
    val set = (read!! downTo 0).firstOrNull { at ->
        sharing[at].literal() != null && (sharing[at] as OneRegisterInstruction).registerA == cap
    }
    requireShape(
        PATCH,
        set != null && sharing[set].literal() == stock,
        "the share screen's cap isn't the editor's ${stock} set before it reads the images",
    )
    requireShape(
        PATCH,
        (set!! + 1 until read).none { writesRegister(sharing[it], cap) },
        "the share screen changes its cap before it reads the images",
    )
    requireShape(PATCH, !share.branchesOnto(read), "something jumps onto the share screen's read of its images")
    requireShape(PATCH, cap < 16, "the share screen's cap sits in a register the hook can't name")
    return ImageLimitPlan(limits, message + 2, limit, stock!!, message + 4, share, read, cap)
}

/** What the extension raises the limit to. A stock limit at or past it is left as Tumblr has it. */
internal const val MORE_IMAGES_LIMIT = 30
