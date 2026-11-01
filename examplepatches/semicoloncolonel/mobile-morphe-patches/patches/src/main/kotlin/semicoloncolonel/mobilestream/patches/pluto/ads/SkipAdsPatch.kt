/*
 * Ported from ajstrick81's Pluto TV Android TV patch (GPL-3.0):
 * https://github.com/ajstrick81/morphe-androidtv-patches/tree/main/patches/src/main/kotlin/ajstrick81/morphe/patches/pluto/ads
 * ALL CREDIT FOR THE ORIGINAL HOOK DESIGN GOES TO ajstrick81.
 */

package semicoloncolonel.mobilestream.patches.pluto.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import semicoloncolonel.mobilestream.patches.pluto.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.ads.ImaPauseAdDisplayFingerprint

private const val MPD_FILTER = "Lsemicoloncolonel/mobilestream/extension/pluto/ads/PlutoMpdFilter;"

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Removes on-demand (VOD) ads in the Pluto TV phone app: the ad video is cut " +
        "from the stream, and ad markers, ad beacons and pause ads are removed. A resume point " +
        "saved before ads were removed is moved to match. Live TV ads are part of the " +
        "broadcast and are not removed. If a stream cannot be rewritten, it plays unchanged.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        // Hook 1 — the ad video. Route the raw MPD through PlutoMpdFilter
        // before Avia parses it. Ad periods are dropped and the rest re-based.
        // parse() has .locals 23, so p2 is v25: out of reach of the 4-bit
        // register form of invoke, hence /range.
        AviaDashParserParseFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p2 .. p2 }, $MPD_FILTER->filter(Ljava/io/InputStream;)Ljava/io/InputStream;
                move-result-object p2
            """.trimIndent(),
        )

        // Hook 2 — the ad-break timeline. With adBreaks empty, the timebar ad
        // markers, the ad-beacon controllers and the player's ad-break
        // handling all see no ads, which is what AdGuard's
        // "session.json$jsonprune=$.adBreaks" filter achieves on the wire.
        emptyListFieldOnConstruct(StitcherSessionToStringFingerprint, ", adBreaks=")

        // Hook 3 — pause ads: the pause-ads response carries no ads, and
        // IMA's own pause-ad display handler (shared with Paramount+) never
        // shows one.
        emptyListFieldOnConstruct(PauseAdsResponseToStringFingerprint, "PauseAdsResponse(ads=")
        ImaPauseAdDisplayFingerprint.methodOrNull?.addInstructions(0, "return-void")

        // Hook 4 — resume fix. Hook 1 shortens the timeline, but Pluto saves
        // "Continue Watching" positions in the original, ad-inclusive one. Map
        // the start position just before startExoplayer seeks to it, so a
        // resume does not land past the end and skip to the next episode.
        AviaStartExoplayerFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            val positionRead = instructions.indexOfLast {
                ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let { ref ->
                    ref.name == "getStartPosition" && ref.returnType == "J"
                } == true
            }
            check(positionRead >= 0) { "Pluto Skip ads: no getStartPosition() in startExoplayer" }
            val seekIndex = (positionRead + 1 until instructions.size).firstOrNull { index ->
                val instruction = instructions[index]
                (instruction.opcode == Opcode.INVOKE_VIRTUAL || instruction.opcode == Opcode.INVOKE_INTERFACE) &&
                    ((instruction as ReferenceInstruction).reference as MethodReference).let { ref ->
                        ref.returnType == "V" && ref.parameterTypes.map { it.toString() } == listOf("J")
                    }
            } ?: error("Pluto Skip ads: no seek(long) after getStartPosition() in startExoplayer")
            val seek = instructions[seekIndex] as FiveRegisterInstruction
            addInstructions(
                seekIndex,
                """
                    invoke-static { v${seek.registerD}, v${seek.registerE} }, $MPD_FILTER->mapResumePosition(J)J
                    move-result-wide v${seek.registerD}
                """.trimIndent(),
            )
        }
    }
}

// Replaces a List field with a fresh empty ArrayList as each constructor
// stores it. The field is found by name through the class's toString(): the
// first iget-object after the label string reads it. The empty list goes
// into the register the constructor was about to store, right before the
// store, so nothing else in the constructor changes.
private fun BytecodePatchContext.emptyListFieldOnConstruct(toString: Fingerprint, label: String) {
    val toStringInstructions = toString.method.implementation!!.instructions.toList()
    val labelIndex = toStringInstructions.indexOfFirst {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == label
    }
    check(labelIndex >= 0) { "toString() has no \"$label\"" }
    val field = toStringInstructions.drop(labelIndex + 1)
        .first { it.opcode == Opcode.IGET_OBJECT }
        .let { (it as ReferenceInstruction).reference as FieldReference }

    var patched = 0
    toString.classDef.methods.filter { it.name == "<init>" }.forEach { constructor ->
        val instructions = constructor.implementation?.instructions?.toList() ?: return@forEach
        // Highest index first, so earlier indices stay valid after inserting.
        instructions.indices.reversed().forEach { index ->
            val instruction = instructions[index]
            if (instruction.opcode != Opcode.IPUT_OBJECT) return@forEach
            val reference = (instruction as ReferenceInstruction).reference as FieldReference
            if (reference.name != field.name || reference.definingClass != field.definingClass) return@forEach
            val register = (instruction as TwoRegisterInstruction).registerA
            constructor.addInstructions(
                index,
                """
                    new-instance v$register, Ljava/util/ArrayList;
                    invoke-direct/range { v$register .. v$register }, Ljava/util/ArrayList;-><init>()V
                """.trimIndent(),
            )
            patched++
        }
    }
    check(patched > 0) { "no constructor stores ${field.definingClass}->${field.name}" }
}
