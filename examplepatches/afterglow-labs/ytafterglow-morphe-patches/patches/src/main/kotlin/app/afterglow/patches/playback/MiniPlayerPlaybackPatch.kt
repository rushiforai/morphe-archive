package app.afterglow.patches.playback

import app.afterglow.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.afterglowExtensionPatch
import app.afterglow.patches.shared.invokeRegisters
import app.afterglow.patches.shared.smali
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

private const val MINI_PLAYER_MODE = "Lbjhy;->c:I"
private const val MINI_PLAYER_DECODE_MODE = "Laxgy;->bP(I)I"
private const val MINI_PLAYER_MINIMIZED = "Ljkj;->c:Ljkj;"

/**
 * 21.43.523 reads the mini-player renderer's playback mode at exactly two sites.
 * Lrku.g enforces pause-only on WATCH_WHILE_MINIMIZED; Lizo.h retains that same
 * restriction when evaluating native resume eligibility. Override only the local
 * decoded mode, after bookkeeping, without replacing a renderer or forcing Play.
 *
 * BackgroundPlaybackPatch also guards Lrku.g at entry. Its opcode fingerprint
 * starts later than this read, and our fingerprint survives its entry guard, so
 * either patch order is valid. Selecting Mini player does not install that patch.
 */
internal val miniPlayerPlaybackHookPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowExtensionPatch)
    execute {
        // The version-specific enum must still identify the in-app minimized state.
        Fingerprint(definingClass = "Ljkj;", name = "<clinit>", returnType = "V",
            filters = listOf(string("WATCH_WHILE_MINIMIZED"), literal(2),
                methodCall(smali = "Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V",
                    location = MatchAfterImmediately()),
                fieldAccess(smali = MINI_PLAYER_MINIMIZED, opcode = Opcode.SPUT_OBJECT,
                    location = MatchAfterImmediately()))).method

        val decoder = Fingerprint(definingClass = "Laxgy;", name = "bP",
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
            parameters = listOf("I"), returnType = "I").method
        val decoderCode = decoder.implementation!!.instructions.toList()
        require(decoderCode.map { it.opcode } == listOf(
            Opcode.IF_EQZ, Opcode.CONST_4, Opcode.IF_EQ, Opcode.CONST_4,
            Opcode.CONST_4, Opcode.IF_EQ, Opcode.IF_EQ, Opcode.CONST_4,
            Opcode.GOTO, Opcode.CONST_4, Opcode.GOTO, Opcode.CONST_4,
            Opcode.GOTO, Opcode.CONST_4, Opcode.RETURN)) {
            "Native mini-player mode decoder changed"
        }
        require(decoderCode.filterIsInstance<NarrowLiteralInstruction>().map { it.narrowLiteral }
            == listOf(2, 4, 5, 0, 6, 3, 1)) { "Native mini-player mode values changed" }

        val modeRead = listOf(
            fieldAccess(smali = MINI_PLAYER_MODE, opcode = Opcode.IGET),
            methodCall(smali = MINI_PLAYER_DECODE_MODE, opcode = Opcode.INVOKE_STATIC,
                location = MatchAfterImmediately()),
            opcode(Opcode.MOVE_RESULT, location = MatchAfterImmediately()),
            opcode(Opcode.IF_EQZ, location = MatchAfterImmediately()),
            opcode(Opcode.CONST_4, location = MatchAfterImmediately()),
            opcode(Opcode.IF_NE, location = MatchAfterImmediately())
        )
        val policy = Fingerprint(definingClass = "Lrku;", name = "g",
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
            parameters = listOf("I", "Ljkj;", "Lbjhy;"), returnType = "V",
            filters = modeRead + listOf(
                fieldAccess(smali = MINI_PLAYER_MINIMIZED, opcode = Opcode.SGET_OBJECT),
                methodCall(smali = "Lrsx;->q()V"),
                methodCall(smali = "Laske;->aK(ZI)V")))
        val resume = Fingerprint(definingClass = "Lizo;", name = "h",
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
            parameters = listOf(), returnType = "Z",
            filters = listOf(literal(0x02ba68c1L),
                methodCall(smali = "Lrku;->e(Lalfi;)Lbjhy;")) + modeRead + listOf(
                fieldAccess(smali = MINI_PLAYER_MINIMIZED, opcode = Opcode.SGET_OBJECT,
                    location = MatchAfterImmediately()),
                opcode(Opcode.IF_NE, location = MatchAfterImmediately()),
                methodCall(smali = "Lafaq;->j()Z")))

        val sites = listOf(policy, resume).map { fingerprint ->
            val method = fingerprint.method
            val read = Fingerprint(filters = modeRead).match(method).instructionMatches
            val code = method.implementation!!.instructions
            val input = (code[read[0].index] as TwoRegisterInstruction).registerA
            val result = (code[read[2].index] as OneRegisterInstruction).registerA
            val zero = code[read[3].index] as OneRegisterInstruction
            val constant = code[read[4].index]
            val compare = code[read[5].index] as TwoRegisterInstruction
            require(code[read[1].index].invokeRegisters == listOf(input)
                && zero.registerA == result
                && (constant as NarrowLiteralInstruction).narrowLiteral == 5
                && setOf(compare.registerA, compare.registerB)
                    == setOf(result, (constant as OneRegisterInstruction).registerA)) {
                "Native mini-player pause-only comparison changed: ${method.smali}"
            }
            Triple(method, read[2].index + 1, result)
        }
        val consumers = Fingerprint(filters = listOf(fieldAccess(smali = MINI_PLAYER_MODE,
            opcode = Opcode.IGET))).matchAll().map { it.method.smali }.toSet()
        require(consumers == sites.map { it.first.smali }.toSet()) {
            "Unexpected native mini-player playback-mode consumers: $consumers"
        }

        sites.forEach { (method, index, register) ->
            method.addInstructions(index, """
                invoke-static/range { v$register .. v$register }, $EXTENSION_PACKAGE/playback/MiniPlayerPlayback;->playbackMode(I)I
                move-result v$register
            """)
            println("Afterglow mini-player pause-only mode: ${method.smali}, register=v$register")
        }
    }
}
