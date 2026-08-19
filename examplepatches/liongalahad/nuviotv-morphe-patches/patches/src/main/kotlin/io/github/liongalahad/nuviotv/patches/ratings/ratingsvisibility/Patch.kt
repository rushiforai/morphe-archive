package io.github.liongalahad.nuviotv.patches.ratings.ratingsvisibility

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import io.github.liongalahad.nuviotv.patches.settings.hub.settingsUiPatch
import io.github.liongalahad.nuviotv.patches.shared.Constants.NUVIO_COMPATIBILITY
import org.w3c.dom.Element

private const val RUNTIME =
    "Lio/github/liongalahad/nuviotv/extension/settings/MorpheSettingsRuntime;"
private const val CATEGORY_METADATA =
    "io.github.liongalahad.nuviotv.settings.provider.rating_visibility"
private const val CATEGORY_PROVIDER =
    "io.github.liongalahad.nuviotv.extension.ratings.ratingsvisibility.RatingsSettingsCategory"

private val ratingsCategoryResourcePatch = resourcePatch {
    compatibleWith(NUVIO_COMPATIBILITY)
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element
            application.appendChild(document.createElement("meta-data").apply {
                setAttribute("android:name", CATEGORY_METADATA)
                setAttribute("android:value", CATEGORY_PROVIDER)
            })
        }
    }
}

private fun MutableMethod.filterReturnedOverallRating() {
    val returns = implementation!!.instructions.withIndex().mapNotNull { (index, instruction) ->
        if (instruction.opcode != Opcode.RETURN_OBJECT) return@mapNotNull null
        index to (instruction as OneRegisterInstruction).registerA
    }
    check(returns.isNotEmpty()) { "Expected a boxed rating return" }
    returns.asReversed().forEach { (index, register) ->
        addInstructions(
            index,
            """
                invoke-static/range { v$register .. v$register }, $RUNTIME->filterOverallRating(Ljava/lang/Float;)Ljava/lang/Float;
                move-result-object v$register
            """
        )
    }
}

private fun MutableMethod.filterModernContinueWatchingRatingResults() {
    val matches = implementation!!.instructions.withIndex().mapNotNull { (index, instruction) ->
        val reference = (instruction as? ReferenceInstruction)?.reference ?: return@mapNotNull null
        when (reference) {
            is FieldReference -> {
                if (reference.type != "Ljava/lang/Float;") return@mapNotNull null
                val fieldRead = instruction as? OneRegisterInstruction
                    ?: error("Modern Continue Watching rating field read has no destination register")
                index + 1 to fieldRead.registerA
            }
            is MethodReference -> {
                if (reference.returnType != "Ljava/lang/Float;" ||
                    reference.parameterTypes.isNotEmpty()
                ) return@mapNotNull null
                val moveResult = implementation!!.instructions.getOrNull(index + 1) as? OneRegisterInstruction
                    ?: error("Modern Continue Watching rating getter has no result register")
                check(moveResult.opcode == Opcode.MOVE_RESULT_OBJECT) {
                    "Modern Continue Watching rating getter is not followed by move-result-object"
                }
                index + 2 to moveResult.registerA
            }
            else -> null
        }
    }
    check(matches.size == 2) {
        "Expected exactly two Modern Continue Watching rating render paths; found ${matches.size}"
    }
    matches.asReversed().forEach { (index, register) ->
        addInstructions(
            index,
            """
                invoke-static/range { v$register .. v$register }, $RUNTIME->filterOverallRating(Ljava/lang/Float;)Ljava/lang/Float;
                move-result-object v$register
            """
        )
    }
}

/** Filters the completed native tab list without using obfuscated tab or enum names. */
private fun MutableMethod.filterEpisodeRatingsTab() {
    val instructions = implementation!!.instructions
    val ratingsLabelIndex = instructions.indexOfFirst { instruction ->
        (instruction as? WideLiteralInstruction)?.wideLiteral == 0x7f110493L
    }
    check(ratingsLabelIndex >= 0) { "Ratings tab label was not found" }
    val listBuilderIndex = instructions.withIndex().firstOrNull { (index, instruction) ->
        if (index <= ratingsLabelIndex) return@firstOrNull false
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        reference?.definingClass == "Lkotlin/collections/CollectionsKt;" &&
            reference.name == "createListBuilder"
    }?.index ?: error("Ratings tab list builder was not found")

    val buildIndex = instructions.withIndex().firstOrNull { (index, instruction) ->
        if (index <= listBuilderIndex) return@firstOrNull false
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        reference?.definingClass == "Lkotlin/collections/CollectionsKt;" &&
            reference.name == "build" && reference.returnType == "Ljava/util/List;"
    }?.index ?: error("Completed Ratings tab list was not found")
    val moveResult = instructions.getOrNull(buildIndex + 1) as? OneRegisterInstruction
        ?: error("Ratings tab list build has no result register")
    val register = moveResult.registerA
    check(register <= 0xff) { "Ratings tab list register is outside move-result range" }
    addInstructions(
        buildIndex + 2,
        """
            invoke-static/range { v$register .. v$register }, $RUNTIME->filterEpisodeRatingTabs(Ljava/util/List;)Ljava/util/List;
            move-result-object v$register
        """
    )
}

@Suppress("unused")
val ratingsvisibilityPatch = bytecodePatch(
    name = "Rating Visibility",
    description = "Adds Settings > Morphe > Ratings with independent overall and episode rating controls.",
    default = false
) {
    compatibleWith(NUVIO_COMPATIBILITY)
    dependsOn(settingsUiPatch, ratingsCategoryResourcePatch)
    extendWith("extensions/nuviotv.mpe")

    execute {
        listOf(
            MetaPreviewRatingGetterFingerprint,
            MetaRatingGetterFingerprint,
            ModernContinueWatchingRatingFingerprint,
            DetailMetaInfoRatingFingerprint,
            EpisodeCardRatingFingerprint,
            EpisodeRatingsSectionFingerprint,
            MetaDetailsContentFingerprint
        ).forEach { it.matchAll(1..1) }

        MetaPreviewRatingGetterFingerprint.method.filterReturnedOverallRating()
        MetaRatingGetterFingerprint.method.filterReturnedOverallRating()
        ModernContinueWatchingRatingFingerprint.method.filterModernContinueWatchingRatingResults()

        DetailMetaInfoRatingFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p1 .. p1 }, $RUNTIME->shouldHideOverallRating(Z)Z
                move-result p1
                invoke-static/range { p3 .. p3 }, $RUNTIME->filterOverallRating(Ljava/lang/Float;)Ljava/lang/Float;
                move-result-object p3
            """
        )

        EpisodeCardRatingFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p1 .. p3 }, $RUNTIME->filterEpisodeRating(Ljava/lang/Object;Ljava/lang/Double;Z)Ljava/lang/Double;
                move-result-object p2
            """
        )

        MetaDetailsContentFingerprint.method.filterEpisodeRatingsTab()
        MetaDetailsContentFingerprint.method.addInstructions(
            0,
            """
                move-object/from16 v0, p23
                move-object/from16 v1, p12
                move-object/from16 v2, p13
                invoke-static/range { v0 .. v2 }, $RUNTIME->filterEpisodeRatingsMap(Ljava/util/Map;Ljava/util/Map;Ljava/util/Set;)Ljava/util/Map;
                move-result-object v0
                move-object/16 p23, v0
            """
        )

        EpisodeRatingsSectionFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, $RUNTIME->shouldShowEpisodeRatingsSection()Z
                move-result v0
                if-nez v0, :morphe_episode_ratings_section_visible
                return-void
                :morphe_episode_ratings_section_visible
                nop
            """
        )
    }
}
