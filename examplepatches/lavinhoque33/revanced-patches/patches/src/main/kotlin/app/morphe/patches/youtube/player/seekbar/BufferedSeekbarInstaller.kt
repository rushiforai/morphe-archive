/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-22.
 */

package app.morphe.patches.youtube.player.seekbar

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.youtube.utils.extension.Constants.PLAYER_PATH
import app.morphe.util.cloneMutable
import app.morphe.util.Utils.printWarn
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val CANVAS = "Landroid/graphics/Canvas;"
private const val PAINT = "Landroid/graphics/Paint;"
private const val ANIMATOR = "Landroid/animation/ValueAnimator;"
private const val RECT_SET = "Landroid/graphics/Rect;->set(IIII)V"
private const val EXTENSION = "$PLAYER_PATH/BufferedSeekbarPatch;"
private const val FADE_BRIDGE = "patch_hiddenPortraitBufferFade"
private const val CHAPTER_ZERO = "patch_hiddenPortraitChapterBufferZero"

// Obfuscated callback/field roles differ even within the supported versions. The draw sites are checked
// against these shapes before installing anything; do not apply them to forced, untraced versions.
private data class BufferedPainterLayout(
    val view: String,
    val chapter: String,
    val flat: String,
    val paints: String,
    val fade: String,
    val fadeOwner: String,
    val scrub: String,
    val modelField: String,
    val model: String,
    val liveWindow: String,
    val oldFlat: Boolean = false,
    val sharedFadeRead: Boolean = false,
)

internal fun BytecodePatchContext.installBufferedSeekbar() {
    val layout = when (packageMetadata.versionName) {
        "20.05.46" -> BufferedPainterLayout(
            "hcw", "hdc", "hdc", "hcx", "hdz", "hcs", "ft", "L", "ahwk", "p", oldFlat = true,
        )
        "21.13.164" -> BufferedPainterLayout(
            "ion", "iot", "iov", "ioo", "ips", "ioj", "fP", "L", "anqf", "p",
        )
        "21.39.525" -> BufferedPainterLayout(
            "jol", "jor", "jot", "jom", "jpp", "joh", "gY", "P", "arco", "q", sharedFadeRead = true,
        )
        "21.45.90" -> BufferedPainterLayout(
            "jta", "jtg", "jti", "jtb", "jue", "jsw", "hY", "Q", "asdt", "r", sharedFadeRead = true,
        )
        else -> null
    }

    val install = layout?.let { runCatching { prepareBufferedSeekbar(it) }.getOrNull() }
    if (install == null) {
        printWarn("Persistent portrait seekbar buffer is not supported: native buffered painter not found.")
    } else {
        install()
    }
}

private fun BytecodePatchContext.prepareBufferedSeekbar(layout: BufferedPainterLayout): (() -> Unit)? {
    val view = "L${layout.view};"
    val fade = "L${layout.fade};"
    val fadeOwner = "L${layout.fadeOwner};"
    val paints = "L${layout.paints};"
    val readFade = "$fade->c()F"
    val chapterClass = mutableClassDefBy("L${layout.chapter};")
    val chapter = chapterClass.methods.single { it.parameterTypes == listOf(CANVAS) && it.returnType == "V" }
    val flat = if (layout.oldFlat) chapter else mutableClassDefBy("L${layout.flat};").methods.single {
        it.parameterTypes == listOf(CANVAS) && it.returnType == "V"
    }
    val animatorClass = mutableClassDefBy(fade)
    val owner = mutableClassDefBy(fadeOwner)
    val timebar = mutableClassDefBy(view)
    if (owner.superclass != fade) return null
    val onDraw = timebar.methods.single { it.name == "onDraw" && it.parameterTypes == listOf(CANVAS) }
    val scrub = onDraw.implementation!!.instructions.asSequence()
        .mapNotNull { it.getReference<MethodReference>() }
        .filter { it.name == layout.scrub && it.parameterTypes.isEmpty() && it.returnType == "Z" }
        .distinctBy { it.toString() }
        .single()
    val nativeModel = "L${layout.model};"
    val modelClass = mutableClassDefBy(nativeModel)
    val modelField = mutableClassDefBy(scrub.definingClass).fields.single {
        it.name == layout.modelField && it.type in modelClass.interfaces && AccessFlags.PUBLIC.isSet(it.accessFlags)
    }
    val liveWindow = modelClass.methods.single {
        it.name == layout.liveWindow && it.parameterTypes.isEmpty() && it.returnType == "Z"
    }

    val ownerView = owner.fields.single { it.type == view && AccessFlags.PUBLIC.isSet(it.accessFlags) }
    val animator = animatorClass.fields.single { it.type == ANIMATOR }
    val fadeMethod = animatorClass.methods.single { it.toString() == readFade }
    if (fadeMethod.implementation?.instructions?.none { it.calls("$ANIMATOR->isRunning()Z") } != false) return null

    val chapterInstructions = chapter.implementation!!.instructions
    val chapterRange = chapterInstructions.packedCase(if (layout.oldFlat) 3 else 2) ?: return null
    val chapterFade = chapterRange.filter { chapterInstructions[it].calls(readFade) }
    if (chapterFade.size != 3 || !chapterInstructions.isBufferedPaintRange(chapterRange, paints) ||
        !chapterInstructions[chapterFade[1] + 2].hasLiteral(255f.toRawBits())
    ) return null

    val flatInstructions = flat.implementation!!.instructions
    val flatRange = if (layout.oldFlat) flatInstructions.packedCase(2) else flatInstructions.flatBufferCase()
    if (flatRange == null || !flatInstructions.isBufferedPaintRange(flatRange, paints)) return null
    val flatFade = flatRange.filter { flatInstructions[it].calls(readFade) }
    if (flatFade.size != (if (layout.sharedFadeRead) 1 else 3)) return null
    val flatBufferReads = if (layout.sharedFadeRead) flatFade else flatFade.drop(1)

    // Both chapter buffer paints have a zero-fade substitution. The other call to this predicate
    // selects a special played-color paint; leave that call (and the played alpha read) stock.
    val zero = chapterClass.methods.single { it.name == "a" && it.parameterTypes.isEmpty() && it.returnType == "Z" }
    val zeroInstructions = zero.implementation!!.instructions
    val zeroRead = zeroInstructions.indices.single { zeroInstructions[it].calls(readFade) }
    val zeroCalls = chapterInstructions.indices.filter { chapterInstructions[it].calls(zero.toString()) }
    if (zeroCalls.size != 3 || zeroCalls.any { it !in chapterRange } ||
        !zeroCalls.all { chapterInstructions[it].isOneArgInvoke(Opcode.INVOKE_DIRECT) } ||
        !chapterFade.all { chapterInstructions[it].isOneArgInvoke(Opcode.INVOKE_VIRTUAL) } ||
        !flatBufferReads.all { flatInstructions[it].isOneArgInvoke(Opcode.INVOKE_VIRTUAL) } ||
        !zeroInstructions[zeroRead].isOneArgInvoke(Opcode.INVOKE_VIRTUAL) ||
        zeroInstructions[zeroRead + 2].opcode != Opcode.CONST_4 ||
        !zeroInstructions[zeroRead + 2].hasLiteral(0) ||
        zeroInstructions[zeroRead + 3].opcode != Opcode.CMPL_FLOAT
    ) return null

    val bridge = "$fade->$FADE_BRIDGE($fade)F"
    val bufferedZero = zero.cloneMutable(name = CHAPTER_ZERO).apply { replaceInvoke(zeroRead, bridge) }
    val fadeBridge = ImmutableMethod(
        fade, FADE_BRIDGE, listOf(ImmutableMethodParameter(fade, null, null)), "F",
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null, MutableMethodImplementation(5),
    ).toMutable().apply {
        addInstructions(0, """
            invoke-virtual {p0}, $readFade
            move-result v0
            const/4 v1, 0x0
            cmpl-float v1, v0, v1
            if-nez v1, :done
            instance-of v1, p0, $fadeOwner
            if-eqz v1, :done
            iget-object v1, p0, $animator
            invoke-virtual {v1}, $ANIMATOR->isRunning()Z
            move-result v1
            if-nez v1, :done
            check-cast p0, $fadeOwner
            iget-object v2, p0, $ownerView
            iget-object v1, v2, $modelField
            instance-of v3, v1, $nativeModel
            if-eqz v3, :done
            check-cast v1, $nativeModel
            invoke-virtual {v1}, $liveWindow
            move-result v1
            if-nez v1, :done
            invoke-virtual {v2}, $scrub
            move-result v1
            invoke-static {v2, v0, v1}, $EXTENSION->restoreBufferedFade(Landroid/view/View;FZ)F
            move-result v0
            :done
            return v0
        """)
    }

    return {
        animatorClass.methods.add(fadeBridge)
        chapterClass.methods.add(bufferedZero)
        chapter.replaceInvoke(chapterFade.first(), bridge)
        chapter.replaceInvoke(chapterFade.last(), bridge)
        chapter.replaceInvoke(zeroCalls.first(), bufferedZero.toString(), direct = true)
        chapter.replaceInvoke(zeroCalls.last(), bufferedZero.toString(), direct = true)
        flatBufferReads.forEach { flat.replaceInvoke(it, bridge) }
    }
}

private fun Instruction.calls(reference: String): Boolean = getReference<MethodReference>()?.toString() == reference

private fun Instruction.hasLiteral(value: Int): Boolean = (this as? NarrowLiteralInstruction)?.narrowLiteral == value

private fun List<Instruction>.packedCase(selector: Int): IntRange? {
    val switch = indices.singleOrNull { this[it].opcode == Opcode.PACKED_SWITCH } ?: return null
    val addresses = IntArray(size)
    for (index in 1 until size) addresses[index] = addresses[index - 1] + this[index - 1].codeUnits

    val payloadAddress = addresses[switch] + (this[switch] as OffsetInstruction).codeOffset
    val payloadIndex = addresses.binarySearch(payloadAddress)
    val payload = getOrNull(payloadIndex) as? SwitchPayload ?: return null
    val targetAddress = addresses[switch] + (payload.switchElements.singleOrNull { it.key == selector }
        ?: return null).offset
    val start = addresses.binarySearch(targetAddress)
    if (start < 0) return null

    val next = payload.switchElements.asSequence().map { addresses[switch] + it.offset }
        .filter { it > targetAddress }.minOrNull() ?: payloadAddress
    return start until addresses.binarySearch(next)
}

private fun List<Instruction>.flatBufferCase(): IntRange? {
    // Selector 1 is a direct conditional on the newer flat delegate, not a packed switch.
    val branch = (1 until minOf(6, size)).singleOrNull {
        this[it].opcode == Opcode.IF_EQ && this[it - 1].hasLiteral(1)
    } ?: return null
    val address = take(branch).sumOf { it.codeUnits } + (this[branch] as OffsetInstruction).codeOffset
    var current = 0
    val start = indices.firstOrNull {
        val matches = current == address
        current += this[it].codeUnits
        matches
    } ?: return null
    val end = (start until size).firstOrNull { this[it].opcode == Opcode.RETURN_VOID } ?: return null
    return start..end
}

private fun List<Instruction>.isBufferedPaintRange(range: IntRange, paints: String): Boolean =
    range.any { this[it].calls(RECT_SET) } &&
        range.any { this[it].calls("$PAINT->getAlpha()I") } &&
        range.any { this[it].calls("$PAINT->setAlpha(I)V") } &&
        range.any { this[it].getReference<FieldReference>()?.toString() == "$paints->c:$PAINT" } &&
        range.any { this[it].getReference<FieldReference>()?.toString() == "$paints->d:$PAINT" }

private fun Instruction.isOneArgInvoke(expected: Opcode): Boolean =
    opcode == expected && this is FiveRegisterInstruction && registerCount == 1

private fun MutableMethod.replaceInvoke(index: Int, target: String, direct: Boolean = false) {
    val original = implementation!!.instructions[index] as FiveRegisterInstruction
    val invoke = if (direct) "invoke-direct" else "invoke-static"
    replaceInstruction(index, "$invoke {v${original.registerC}}, $target")
}
