/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.reels

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.facebook.layout.theme.branchTargets
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.facebook.search.branchTarget
import app.morphe.util.classDefForEachReferencing
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/*
 * The feed's Reels row, whose tiles repeat a second or two of each reel (#228). Read from 584,
 * 2026-10-24, arm64; the obfuscated names here are for reviewers, the code never writes one down.
 *
 * - Each tile is one video component (LX/7Rh;) whose render news up the reel's VideoDataSource and
 *   then the tile's player settings builder (LX/5Ab;, what VideoPlayerParams is built from).
 * - Before that, render reads the reel's smart preview off its GraphQL model, getDoubleValue by the
 *   hash of preview_start_timestamp, preview_length and preview_speed, and hands the three with the
 *   video's length to one helper (LX/7JA;->A01(DDDFZ)) that answers the clip to play: a start, a
 *   length, a speed and whether it's the server's clip. A clip the helper can't use comes back as
 *   one second from the start, which is the second the row repeats.
 * - Two checks come first, a server flag and one of the device and network (LX/9vF;->A02), and
 *   either saying no skips the helper. Render then plays the tile with no clip: no start partway
 *   in, no speed change and no seek back to the clip's start on each loop.
 * - Whatever the clip, render stores one end, (start + length) * 1000, or a server number when
 *   there's no clip, into two int fields of the builder back to back: the overrides of the
 *   player's buffer watermark and of its end position, where it stops and loops. The builder
 *   starts both at -1, no override.
 * - The other tile render that reads the same three fields (LX/7RU;) builds only a debug overlay
 *   from them and no player, and the prefetcher that reads them (LX/4eT;) builds no player either.
 *
 * The hooks: the extension is handed the second check's answer before render branches on it, so
 * false takes Facebook's own no-clip path, and it's handed the end before the first store, so -1
 * leaves the player to play the reel to its end and loop it whole.
 */

internal const val PREVIEW_CLIP_ALLOWED = "$EXTENSION_PACKAGE/reels/ReelDeclutter;->allowsPreviewClip(Z)Z"
internal const val PREVIEW_CLIP_END = "$EXTENSION_PACKAGE/reels/ReelDeclutter;->previewClipEnd(I)I"

/** The GraphQL fields a reel's smart preview is read by, which Facebook keys by the name's hash. */
internal val PREVIEW_FIELDS = listOf("preview_start_timestamp", "preview_length", "preview_speed")

internal const val VIDEO_DATA_SOURCE = "Lcom/facebook/video/engine/api/VideoDataSource;"

private const val PATCH = "Clean up Reels"
private val CLIP_PARAMETERS = listOf("D", "D", "D", "F", "Z")
private val INVOKES = setOf(
    Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE, Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE,
    Opcode.INVOKE_DIRECT, Opcode.INVOKE_DIRECT_RANGE, Opcode.INVOKE_INTERFACE, Opcode.INVOKE_INTERFACE_RANGE,
)

/**
 * Where a tile's render takes the hooks: the if-eqz at [gate] on [gateAnswer], the last check before
 * the clip helper at [helper], and the first of the two stores of the end, at [store] from [end].
 */
internal data class PreviewClipPoints(val gate: Int, val gateAnswer: Int, val helper: Int, val store: Int, val end: Int)

private fun Instruction.methodCalled() = if (opcode in INVOKES) (this as ReferenceInstruction).reference as? MethodReference else null

private fun Instruction.fieldNamed() = (this as? ReferenceInstruction)?.reference as? FieldReference

/**
 * The hook points in [method] when it's a Reels row tile's render: it reads all three
 * [PREVIEW_FIELDS] with getDoubleValue, calls one (DDDFZ) helper answering an object behind an
 * if-eqz on a call's answer that jumps past it, news up a [VIDEO_DATA_SOURCE] and then a builder, and
 * after the helper stores one register into two int fields of that builder back to back, once.
 * Neither place a hook goes is a branch target, so nothing jumps past one. Null otherwise.
 */
internal fun previewClipPoints(method: Method): PreviewClipPoints? {
    val code = method.implementation?.instructions?.toList() ?: return null
    val reads = PREVIEW_FIELDS.map(String::hashCode).all { hash ->
        (0 until code.size - 1).any { at ->
            code[at].opcode == Opcode.CONST && (code[at] as NarrowLiteralInstruction).narrowLiteral == hash &&
                code[at + 1].methodCalled()?.let { it.name == "getDoubleValue" && it.returnType == "D" } == true
        }
    }
    if (!reads) return null

    val helper = code.indices.filter { at ->
        val call = code[at].methodCalled() ?: return@filter false
        call.parameterTypes.map(CharSequence::toString) == CLIP_PARAMETERS && call.returnType.startsWith("L")
    }.singleOrNull() ?: return null
    val gate = (helper - 1 downTo 1).firstOrNull { code[it].opcode == Opcode.IF_EQZ } ?: return null
    val gateAnswer = (code[gate] as OneRegisterInstruction).registerA
    val answer = code[gate - 1]
    if (answer.opcode != Opcode.MOVE_RESULT || (answer as OneRegisterInstruction).registerA != gateAnswer) return null
    if ((branchTarget(code, gate) ?: return null) <= helper) return null

    val source = code.indices.singleOrNull { at ->
        code[at].opcode == Opcode.NEW_INSTANCE &&
            ((code[at] as ReferenceInstruction).reference as TypeReference).type == VIDEO_DATA_SOURCE
    } ?: return null
    val builder = (source + 1 until code.size).firstOrNull { code[it].opcode == Opcode.NEW_INSTANCE }
        ?.let { ((code[it] as ReferenceInstruction).reference as TypeReference).type } ?: return null
    val stores = (helper + 1 until code.size - 1).filter { at ->
        val first = code[at]
        val second = code[at + 1]
        if (first.opcode != Opcode.IPUT || second.opcode != Opcode.IPUT) return@filter false
        val one = first.fieldNamed() ?: return@filter false
        val other = second.fieldNamed() ?: return@filter false
        first as TwoRegisterInstruction
        second as TwoRegisterInstruction
        one.definingClass == builder && other.definingClass == builder && one.type == "I" && other.type == "I" &&
            one.name != other.name && first.registerA == second.registerA && first.registerB == second.registerB
    }
    val store = stores.singleOrNull() ?: return null
    val end = (code[store] as TwoRegisterInstruction).registerA

    val targets = branchTargets(code)
    if (gate in targets || store in targets) return null
    return PreviewClipPoints(gate, gateAnswer, helper, store, end)
}

/**
 * Hands a Reels row tile's last clip check and its end to the extension. Refuses unless exactly one
 * method outside the extension has the shape [previewClipPoints] looks for.
 */
internal fun BytecodePatchContext.playFeedReelsWhole() {
    val found = mutableListOf<Pair<String, Method>>()
    classDefForEachReferencing(types = listOf(VIDEO_DATA_SOURCE)) { classDef ->
        if (classDef.type.startsWith(EXTENSION_PACKAGE)) return@classDefForEachReferencing
        classDef.methods.filter { previewClipPoints(it) != null }.mapTo(found) { classDef.type to it }
    }
    val (owner, holder) = found.singleOrNull() ?: throw PatchException(
        "$PATCH: expected one render that reads a reel's preview clip (${PREVIEW_FIELDS.joinToString()}) and builds its " +
            "player from a VideoDataSource, found ${found.size}",
    )
    val method = mutableClassDefBy(owner).methods.single {
        it.name == holder.name && it.parameterTypes.map(CharSequence::toString) == holder.parameterTypes.map(CharSequence::toString)
    }
    val points = previewClipPoints(method)
        ?: throw PatchException("$PATCH: $owner->${holder.name} lost its preview clip before it was hooked")
    // The later place first, so the earlier one's index still holds.
    method.addInstructions(
        points.store,
        """
            invoke-static/range { v${points.end} .. v${points.end} }, $PREVIEW_CLIP_END
            move-result v${points.end}
        """,
    )
    method.addInstructions(
        points.gate,
        """
            invoke-static/range { v${points.gateAnswer} .. v${points.gateAnswer} }, $PREVIEW_CLIP_ALLOWED
            move-result v${points.gateAnswer}
        """,
    )
}
