package id.ikuradachi.patches.crunchyroll.ui.feed

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import id.ikuradachi.patches.crunchyroll.shared.Constants.COMPATIBILITY_CRUNCHYROLL

private const val MEDIA_CARD_TO_STRING_PREFIX = "MediaCardItem(id="

@Suppress("unused")
val hideFeedPromosPatch = bytecodePatch(
    name = "Hide feed & show promos",
    description = "Hides promotional cards, vertical promo rows, floating action buttons, and show-page promo banners.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CRUNCHYROLL)
    category("UI")

    val hideArcFeedCard = booleanOption(
        key = "hideArcFeedCard",
        default = true,
        title = "Hide CR Arc feed card",
        description = "Prevents the CR Arc promotional card from being injected into the home feed.",
    )
    val hideHeroCarousel = booleanOption(
        key = "hideHeroCarousel",
        default = false,
        title = "Hide hero carousel",
        description = "Hides the top hero banner carousel on the home feed.",
    )
    val hideGamePromoCards = booleanOption(
        key = "hideGamePromoCards",
        default = true,
        title = "Hide game promo cards",
        description = "Hides standalone game promotional cards in the home feed.",
    )
    val hideMediaCards = booleanOption(
        key = "hideMediaCards",
        default = true,
        title = "Hide media promo cards",
        description = "Hides standalone media promotional cards in the home feed.",
    )
    val hideGamesRows = booleanOption(
        key = "hideGamesRows",
        default = true,
        title = "Hide Games rows",
        description = "Hides Crunchyroll Games collection rows from the home feed.",
    )
    val hideMangaRows = booleanOption(
        key = "hideMangaRows",
        default = true,
        title = "Hide Manga rows",
        description = "Hides Crunchyroll Manga collection rows from the home feed.",
    )
    val hideMusicRows = booleanOption(
        key = "hideMusicRows",
        default = false,
        title = "Hide Music rows",
        description = "Hides music collection rows from the home feed.",
    )
    val hideGoPremiumButton = booleanOption(
        key = "hideGoPremiumButton",
        default = true,
        title = "Hide Go Premium button",
        description = "Hides the floating Go Premium button overlay on the home feed.",
    )
    val hidePromotionalFab = booleanOption(
        key = "hidePromotionalFab",
        default = true,
        title = "Hide promotional FAB",
        description = "Hides the floating promotional action button on the home feed.",
    )
    val hideArcFab = booleanOption(
        key = "hideArcFab",
        default = true,
        title = "Hide CR Arc FAB",
        description = "Hides the floating CR Arc quick-access action button on the home feed.",
    )
    val hideShowPagePromoBanner = booleanOption(
        key = "hideShowPagePromoBanner",
        default = true,
        title = "Hide show page promo banner",
        description = "Hides the cross-promo banner shown on series pages.",
    )

    execute {
        if (hideArcFeedCard.value == true) {
            val arcInjectMatch = HomeFeedArcInjectFingerprint.matchAll(1..1).single()
            val arcInjectImpl = requireNotNull(arcInjectMatch.method.implementation) {
                "Missing implementation for HomeFeedInteractor Arc injection"
            }
            check(arcInjectImpl.registerCount >= 3) {
                "Unexpected register count in HomeFeedInteractor Arc injection: ${arcInjectImpl.registerCount}"
            }
            arcInjectMatch.method.addInstruction(0, "return-object p1")
        }

        val rowSuppressions = listOf(
            hideHeroCarousel to "HeroFeedItem(id=",
            hideGamePromoCards to "GamePromoCardFeedItem(id=",
            hideMediaCards to MEDIA_CARD_TO_STRING_PREFIX,
            hideGamesRows to "GamesCollectionFeedItem(id=",
            hideMangaRows to "MangaCollectionFeedItem(id=",
            hideMusicRows to "MusicAssetsFeedItem(id=",
        ).filter { (option, _) -> option.value == true }

        if (rowSuppressions.isNotEmpty()) {
            val mediaCardMatch = createFeedItemClassFingerprint(MEDIA_CARD_TO_STRING_PREFIX)
                .matchAll(1..1)
                .single()
            val feedItemType = mediaCardMatch.originalClassDef.interfaces.firstOrNull()
                ?: error("MediaCardItem does not implement FeedItem interface")

            val suppressedTypes = rowSuppressions.map { (_, prefix) ->
                if (prefix == MEDIA_CARD_TO_STRING_PREFIX) {
                    mediaCardMatch.originalClassDef.type
                } else {
                    createFeedItemClassFingerprint(prefix).matchAll(1..1).single().originalClassDef.type
                }
            }

            val filterMatch = createHomeFeedItemVisibilityFilterFingerprint(feedItemType)
                .matchAll(1..1)
                .single()
            val filterImpl = requireNotNull(filterMatch.method.implementation) {
                "Missing implementation for home feed item visibility filter"
            }
            check(filterImpl.registerCount in 2..16) {
                "Unexpected register count in home feed item visibility filter: ${filterImpl.registerCount}"
            }
            check(filterImpl.tryBlocks.isEmpty()) {
                "Unexpected try blocks in home feed item visibility filter"
            }
            val originalFirstInstruction = filterImpl.instructions.first()
            check(originalFirstInstruction.location.labels.isEmpty()) {
                "Unexpected branch labels on first instruction of home feed item visibility filter"
            }

            val guardSmali = buildString {
                suppressedTypes.forEachIndexed { idx, classType ->
                    val nextLabel = if (idx == suppressedTypes.lastIndex) ":resume" else ":check_${idx + 1}"
                    if (idx > 0) appendLine(":check_$idx")
                    appendLine("instance-of v0, p0, $classType")
                    appendLine("if-eqz v0, $nextLabel")
                    appendLine("const/4 v0, 0x0")
                    appendLine("return v0")
                }
            }.trimEnd()

            filterMatch.method.addInstructionsWithLabels(
                0,
                guardSmali,
                ExternalLabel("resume", originalFirstInstruction),
            )
        }

        if (hideGoPremiumButton.value == true) {
            GoPremiumButtonViewFingerprint.matchAll(1..1).single().method.addInstruction(0, "return-void")
        }

        if (hidePromotionalFab.value == true) {
            PromotionalFabRenderFingerprint.matchAll(1..1).single().method.addInstruction(0, "return-void")
        }

        if (hideArcFab.value == true) {
            val arcConfigProviderType = ArcFabConfigProviderFingerprint.matchAll(1..1)
                .single()
                .originalClassDef
                .type
            createArcFabRenderFingerprint(arcConfigProviderType)
                .matchAll(1..1)
                .single()
                .method
                .addInstruction(0, "return-void")
        }

        if (hideShowPagePromoBanner.value == true) {
            val errorEmitterMethod = SeriesPromoErrorEmitterFingerprint.matchAll(1..1)
                .single()
                .originalMethod
            val errorEmitterRef =
                "${errorEmitterMethod.definingClass}->${errorEmitterMethod.name}(Ljava/lang/String;Ljava/lang/Exception;)V"

            val loadMatch = SeriesPromoLoadFingerprint.matchAll(1..1).single()
            val loadImpl = requireNotNull(loadMatch.method.implementation) {
                "Missing implementation for SeriesPromoContainerController load"
            }
            check(loadImpl.registerCount in 5..19) {
                "Unexpected register count in SeriesPromoContainerController load: ${loadImpl.registerCount}"
            }

            val unitFieldRef = loadImpl.instructions
                .zipWithNext()
                .lastOrNull { (first, second) ->
                    first.opcode == Opcode.SGET_OBJECT && second.opcode == Opcode.RETURN_OBJECT
                }
                ?.first
                ?.let { (it as ReferenceInstruction).reference as FieldReference }
                ?: error("Failed to resolve Unit.INSTANCE field in SeriesPromoContainerController load")
            check(unitFieldRef.definingClass == unitFieldRef.type) {
                "Unexpected Unit.INSTANCE field reference: $unitFieldRef"
            }

            loadMatch.method.addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    invoke-virtual {p0, v0, v0}, $errorEmitterRef
                    sget-object v0, $unitFieldRef
                    return-object v0
                """.trimIndent(),
            )

            val deserializeMatch = SeriesPromoConfigDeserializeFingerprint.matchAll(1..1).single()
            val deserializeImpl = requireNotNull(deserializeMatch.method.implementation) {
                "Missing implementation for SeriesGetTicketsPromoConfigImpl deserialize"
            }
            val configType = deserializeImpl.instructions
                .lastOrNull { it.opcode == Opcode.NEW_INSTANCE }
                ?.let { (it as ReferenceInstruction).reference.toString() }
                ?: error("Failed to resolve SeriesGetTicketsPromoConfigImpl type")

            val isEnabledMatch = createSeriesPromoConfigIsEnabledFingerprint(configType)
                .matchAll(1..1)
                .single()
            val isEnabledImpl = requireNotNull(isEnabledMatch.method.implementation) {
                "Missing implementation for SeriesGetTicketsPromoConfigImpl.isEnabled"
            }
            check(isEnabledImpl.registerCount >= 1) {
                "Unexpected register count in SeriesGetTicketsPromoConfigImpl.isEnabled: ${isEnabledImpl.registerCount}"
            }
            isEnabledMatch.method.addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return v0
                """.trimIndent(),
            )
        }
    }
}
