/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 *
 * Found by reading 450, 449 and 448 (2026-10-06).
 */
package app.morphe.patches.threads.feed.imagequality

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.threads.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.threads.misc.extension.enableStatus
import app.morphe.patches.threads.misc.extension.parameterRegister
import app.morphe.patches.threads.misc.extension.parameterRegisterNumber
import app.morphe.patches.threads.misc.extension.requireParameterIntact
import app.morphe.patches.threads.misc.extension.requireStatusMethod
import app.morphe.patches.threads.misc.extension.threadsExtensionPatch
import app.morphe.patches.threads.misc.settings.EXTENSION_ROOT
import app.morphe.patches.threads.misc.settings.settingsPatch
import app.morphe.util.findMutableMethodOf
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val PATCH = "Max image quality"
internal const val IMAGE_QUALITY = "$EXTENSION_PACKAGE/feed/ImageQuality;"
internal const val TARGET_WIDTH = "$IMAGE_QUALITY->targetWidth(I)I"

/** One size of a photo: its address, width and height. A kept class. */
internal const val EXTENDED_IMAGE_URL = "Lcom/instagram/model/mediasize/ExtendedImageUrl;"

/** The chooser's parameters: which shapes count, the sizes the server sent, and the width to aim for. */
internal val CHOOSER_PARAMETERS = listOf("Ljava/lang/Integer;", "Ljava/util/List;", "I")

/** The chooser aims a twentieth past its target: target + target / 20. */
private const val TWENTIETH = 20

/**
 * Loads the largest size of each photo.
 *
 * Threads gets every photo in several sizes and picks one in a single static chooser shared with
 * Instagram's code: among the sizes with the wanted shape (square or not), the one whose width
 * comes closest to a twentieth past the width it was given, which is usually the screen's width
 * capped at 1080. The extension is asked first thing for that width, and while the switch is on it
 * answers one no photo reaches, so the closest size is the widest. The shape rule, the tie rule and
 * the fallback to any shape stay as Threads wrote them, so a square crop stays square and nothing
 * changes size on screen. Avatars and video renditions are picked elsewhere and aren't touched.
 *
 * The chooser is found by its kept types and what it does with them (each size's width and height,
 * the distance from its target, and the fallback call to itself), and the patch refuses rather than
 * guessing when there isn't exactly one, or when the width it aims at isn't the parameter.
 */
@Suppress("unused")
val maxImageQualityPatch = bytecodePatch(
    name = PATCH,
    description = "Loads photos at the largest size Threads has, instead of one picked for your screen. Photos look" +
        " sharper but use more data. Starts off. Turn it on in HushThreads settings > Feed.",
) {
    category("Feed")
    dependsOn(settingsPatch)
    dependsOn(threadsExtensionPatch)
    compatibleWith(*AppCompatibilities.threads())

    execute {
        requireStatusMethod("maxImageQuality")
        val chooser = sizeChooser()
        val target = chooser.parameterRegister(2)
        mutableClassDefBy(chooser.definingClass).findMutableMethodOf(chooser).addInstructions(
            0,
            """
                invoke-static/range { $target .. $target }, $TARGET_WIDTH
                move-result $target
            """,
        )
        enableStatus("maxImageQuality")
    }
}

private fun Instruction.methodReference(): MethodReference? = getReference<MethodReference>()

/** A method's full signature. A Method is a MethodReference too. */
private fun MethodReference.signature() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

/** Whether [this] has the chooser's signature: static, answering one size for a shape, a list and a width. */
internal fun Method.isSizeChooserShape(): Boolean =
    AccessFlags.STATIC.isSet(accessFlags) && returnType == EXTENDED_IMAGE_URL &&
        parameterTypes.map { it.toString() } == CHOOSER_PARAMETERS

/** The registers an invoke passes, in order. */
private fun Instruction.arguments(): List<Int> = when (this) {
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    else -> emptyList()
}

/**
 * The indices where the chooser reads its target width: the twentieth it adds, the sum and the
 * fallback call to itself. Throws unless the body is the chooser's: it reads each size's width and
 * height, measures with Math.abs, and calls itself once with the same width.
 */
internal fun Method.targetReads(): List<Int> {
    val body = implementation?.instructions?.toList() ?: throw PatchException("$PATCH: ${signature()} has no body")
    val calls = body.mapNotNull { it.methodReference()?.signature() }
    for (needed in listOf("$EXTENDED_IMAGE_URL->getWidth()I", "$EXTENDED_IMAGE_URL->getHeight()I", "Ljava/lang/Math;->abs(I)I")) {
        if (needed !in calls) throw PatchException("$PATCH: ${signature()} never calls $needed")
    }
    val width = parameterRegisterNumber(2)
    val twentieths = body.indices.filter { index ->
        val instruction = body[index]
        instruction.opcode == Opcode.DIV_INT_LIT8 && (instruction as TwoRegisterInstruction).registerB == width &&
            (instruction as NarrowLiteralInstruction).narrowLiteral == TWENTIETH
    }
    val twentieth = twentieths.singleOrNull()
        ?: throw PatchException("$PATCH: expected one twentieth of the target width in ${signature()}, found ${twentieths.size}")
    val part = (body[twentieth] as TwoRegisterInstruction).registerA
    val sum = body.getOrNull(twentieth + 1) as? TwoRegisterInstruction
    if (sum == null || sum.opcode != Opcode.ADD_INT_2ADDR || sum.registerA != part || sum.registerB != width) {
        throw PatchException("$PATCH: ${signature()} doesn't add its target width to the twentieth")
    }
    val fallbacks = body.indices.filter { body[it].methodReference()?.signature() == signature() }
    val fallback = fallbacks.singleOrNull()
        ?: throw PatchException("$PATCH: expected one fallback call in ${signature()}, found ${fallbacks.size}")
    if (body[fallback].arguments().getOrNull(2) != width) {
        throw PatchException("$PATCH: ${signature()} falls back with another width")
    }
    val reads = listOf(twentieth, twentieth + 1, fallback)
    val elsewhere = body.indices.filter { it !in reads && width in body[it].registersRead() }
    if (elsewhere.isNotEmpty()) throw PatchException("$PATCH: ${signature()} reads its target width at $elsewhere too")
    return reads
}

/** The registers [this] reads, as far as a chooser of ints and objects goes. */
private fun Instruction.registersRead(): Set<Int> = when (this) {
    is FiveRegisterInstruction, is RegisterRangeInstruction -> arguments().toSet()
    is ThreeRegisterInstruction -> setOfNotNull(registerB, registerC, registerA.takeUnless { opcode.setsRegister() })
    is TwoRegisterInstruction -> setOfNotNull(registerB, registerA.takeUnless { opcode.setsRegister() && "2addr" !in opcode.name.lowercase() })
    is OneRegisterInstruction -> setOfNotNull(registerA.takeUnless { opcode.setsRegister() })
    else -> emptySet()
}

/** Threads' photo size chooser: the one method outside the extension with its signature and body. */
internal fun BytecodePatchContext.sizeChooser(): Method {
    val found = mutableListOf<Method>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        classDef.methods.filterTo(found) { it.isSizeChooserShape() }
    }
    val chooser = found.singleOrNull()
        ?: throw PatchException("$PATCH: expected one photo size chooser, found ${found.map { it.signature() }}")
    val reads = chooser.targetReads()
    // The width the hook replaces is the parameter itself wherever Threads reads it.
    chooser.requireParameterIntact(PATCH, 2, reads)
    return chooser
}
