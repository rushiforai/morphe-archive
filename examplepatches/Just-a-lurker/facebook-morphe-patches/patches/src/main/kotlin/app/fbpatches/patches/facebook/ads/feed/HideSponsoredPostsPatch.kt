/*
 * The feed funnel hook and the edge swap guard follow Hushfacebook
 * (https://github.com/SysAdminDoc/Hushfacebook, GPL-3.0), feed/hook/FeedFilterHookPatch.kt and
 * EdgeSwap.kt, rewritten for facebook-morphe-patches, 2026.
 */
package app.fbpatches.patches.facebook.ads.feed

import app.fbpatches.patches.facebook.shared.EXTENSION_PACKAGE
import app.fbpatches.patches.facebook.shared.extensionPatch
import app.fbpatches.patches.facebook.shared.holdsString
import app.fbpatches.patches.facebook.shared.parameterRegister
import app.fbpatches.patches.facebook.shared.patchLog
import app.fbpatches.patches.facebook.shared.requireLocals
import app.fbpatches.patches.shared.Constants.COMPATIBILITY_FACEBOOK
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

/** Kept (not obfuscated) GraphQL model class for one feed entry. */
internal const val FEED_UNIT_EDGE = "Lcom/facebook/graphql/model/GraphQLFeedUnitEdge;"

/** Kept enum with the server's story category (ORGANIC, SPONSORED, PROMOTION, ...). */
internal const val FEED_STORY_CATEGORY = "Lcom/crossapp/graphql/facebook/enums/GraphQLFeedStoryCategory;"

private const val FEED_ADS = "$EXTENSION_PACKAGE/ads/FeedAds;"

/** The static helper added to GraphQLFeedUnitEdge: reads the category and asks the extension. */
private const val HIDES_EDGE_HELPER = "fbpatchesHidesEdge"
private const val HIDES_EDGE = "$FEED_UNIT_EDGE->$HIDES_EDGE_HELPER($FEED_UNIT_EDGE)Z"

/** The log line only the edge swap runnable holds. */
private const val EDGE_SWAP_DROPPED = "Edge swap dropped"

/**
 * The private method of the feed collection manager that adds one edge to the feed list builder.
 * It returns false when an edge is rejected, so returning false early drops the edge before any
 * list entry or impression is created.
 */
internal object FeedEdgeAddFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(
        "L", // placement/source enum (obfuscated)
        FEED_UNIT_EDGE,
        "Lcom/google/common/collect/ImmutableList${'$'}Builder;",
        "Ljava/lang/Long;",
    ),
    filters = listOf(
        string("Edge not added to FUC"),
    ),
)

@Suppress("unused")
val hideSponsoredPostsPatch = bytecodePatch(
    name = "Hide sponsored posts",
    description = "Removes sponsored and promoted posts from the news feed, including ads swapped in later.",
    default = true,
) {
    dependsOn(extensionPatch)
    compatibleWith(COMPATIBILITY_FACEBOOK)

    execute {
        // The edge's story-category getter is obfuscated: pick it by its kept return type.
        val edgeClass = mutableClassDefBy(FEED_UNIT_EDGE)
        val categoryGetter = edgeClass.methods.singleOrNull {
            it.returnType == FEED_STORY_CATEGORY && it.parameterTypes.isEmpty() &&
                !AccessFlags.STATIC.isSet(it.accessFlags)
        } ?: throw PatchException("GraphQLFeedUnitEdge category getter not found")

        edgeClass.methods.add(
            ImmutableMethod(
                FEED_UNIT_EDGE,
                HIDES_EDGE_HELPER,
                listOf(ImmutableMethodParameter(FEED_UNIT_EDGE, null, null)),
                "Z",
                AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                null,
                null,
                MutableMethodImplementation(2),
            ).toMutable().apply {
                addInstructions(
                    0,
                    """
                        invoke-virtual { p0 }, $FEED_UNIT_EDGE->${categoryGetter.name}()$FEED_STORY_CATEGORY
                        move-result-object v0
                        invoke-static { v0 }, $FEED_ADS->shouldHide(Ljava/lang/Object;)Z
                        move-result v0
                        return v0
                    """,
                )
            },
        )

        // The funnel: every edge added to the feed collection.
        val method = FeedEdgeAddFingerprint.method
        val edgeIndex = method.parameterTypes.indexOfFirst { it.toString() == FEED_UNIT_EDGE }
        method.requireLocals("Hide sponsored posts", 1)
        val edge = method.parameterRegister(edgeIndex)
        method.addInstructionsWithLabels(
            0,
            """
                invoke-static/range { $edge .. $edge }, $HIDES_EDGE
                move-result v0
                if-eqz v0, :keep
                const/4 v0, 0x0
                return v0
            """,
            ExternalLabel("keep", method.getInstruction(0)),
        )

        // Ads swapped in over another edge never pass the funnel.
        guardEdgeSwap()?.let { patchLog.warning("Hide sponsored posts: $it. Swapped-in ads may still show.") }
    }
}

/** The registers an instruction reads (best effort, enough to tell a free register apart). */
private fun Instruction.readRegisters(): Set<Int> = when (this) {
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toSet()
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount).toSet()
    is ThreeRegisterInstruction -> setOf(registerB, registerC)
    is TwoRegisterInstruction -> setOf(registerB)
    else -> emptySet()
}

/**
 * Puts the guard in the edge swap runnable right after the incoming edge's cast: an ad that would
 * be swapped in leaves the old edge where it was. Null when done, or why not.
 */
private fun BytecodePatchContext.guardEdgeSwap(): String? {
    val owners = classDefByStrings(EDGE_SWAP_DROPPED, StringComparisonType.EQUALS)
    val candidates = owners.flatMap { owner ->
        owner.methods.filter {
            ((it.name == "invoke" && it.returnType == "Ljava/lang/Object;") || (it.name == "run" && it.returnType == "V")) &&
                it.parameterTypes.isEmpty() && holdsString(it, EDGE_SWAP_DROPPED)
        }
    }
    val found = candidates.singleOrNull() ?: return "found ${candidates.size} edge swap runnables, expected 1"
    val run: MutableMethod = mutableClassDefBy(found.definingClass).methods.single {
        it.name == found.name && it.returnType == found.returnType && it.parameterTypes.isEmpty()
    }
    val code = run.instructions.toList()

    val cast = code.indexOfFirst {
        it.opcode == Opcode.CHECK_CAST && (it as ReferenceInstruction).reference.toString() == FEED_UNIT_EDGE
    }
    if (cast < 0 || cast + 1 >= code.size) return "the swap runnable casts no GraphQLFeedUnitEdge"
    val edge = (code[cast] as OneRegisterInstruction).registerA

    // A scratch register: the one the next instruction overwrites without reading it.
    val next = code[cast + 1]
    val scratch = (next as? OneRegisterInstruction)?.registerA
        ?.takeIf { next.opcode.setsRegister() && !next.opcode.setsWideRegister() && it != edge && it !in next.readRegisters() && it < 256 }
        ?: return "no free register after the swap runnable's cast"

    if (run.returnType == "V") {
        run.addInstructionsWithLabels(
            cast + 1,
            """
                invoke-static/range { v$edge .. v$edge }, $HIDES_EDGE
                move-result v$scratch
                if-eqz v$scratch, :swap
                return-void
            """,
            ExternalLabel("swap", run.getInstruction(cast + 1)),
        )
        return null
    }

    // Function0.invoke(): jump to the one Unit return (an sget-object of Unit, then return-object).
    val returned = code.indices.singleOrNull { code[it].opcode == Opcode.RETURN_OBJECT }
        ?: return "the swap runnable has more than one return"
    val unit = returned - 1
    val load = code.getOrNull(unit)
    val field = (load as? ReferenceInstruction)?.reference as? FieldReference
    if (load?.opcode != Opcode.SGET_OBJECT || field == null || field.type != field.definingClass) {
        return "the swap runnable doesn't return Unit"
    }
    run.addInstructionsWithLabels(
        cast + 1,
        """
            invoke-static/range { v$edge .. v$edge }, $HIDES_EDGE
            move-result v$scratch
            if-nez v$scratch, :unit
        """,
        ExternalLabel("unit", run.getInstruction(unit)),
    )
    return null
}
