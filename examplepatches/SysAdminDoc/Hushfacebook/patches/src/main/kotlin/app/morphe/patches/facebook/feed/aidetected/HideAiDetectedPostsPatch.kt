/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed.aidetected

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.facebook.ads.sponsoredreels.filterPageFirst
import app.morphe.patches.facebook.ads.sponsoredreels.filterSectionsFirst
import app.morphe.patches.facebook.ads.sponsoredreels.reelPages
import app.morphe.patches.facebook.ads.sponsoredreels.toBinaryName
import app.morphe.patches.facebook.feed.GRAPHQL_STORY
import app.morphe.patches.facebook.feed.fillStoryModelStub
import app.morphe.patches.facebook.feed.hook.feedFilterHookPatch
import app.morphe.patches.facebook.feed.methodsHolding
import app.morphe.patches.facebook.feed.requireStoryFlagReaders
import app.morphe.patches.facebook.feed.resolveStatic
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.facebook.misc.extension.enableStatus
import app.morphe.patches.facebook.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities

/** The extension class that reads the feed's flag, and its accessor this patch fills in. */
internal const val GEN_AI_LABEL = "$EXTENSION_PACKAGE/feed/GenAiLabel;"
internal const val DETECTED_INFO_STUB = "detectedInfo"

/** The extension class that filters the Reels pages, its finder stub this patch fills in, and its two page filters. */
internal const val GEN_AI_REEL_FILTER = "$EXTENSION_PACKAGE/feed/GenAiReelFilter;"
internal const val ATTRIBUTION_STUB = "transparencyAttribution"
private const val REEL_FILTER = "$GEN_AI_REEL_FILTER->withoutAiReels(Ljava/util/Collection;Ljava/lang/String;)Ljava/util/Collection;"
private const val REEL_SECTION_FILTER = "$GEN_AI_REEL_FILTER->withoutAiSections(Ljava/util/List;Ljava/lang/String;)Ljava/util/List;"

private const val PATCH = "Hide AI-detected posts"

/**
 * Hides feed posts, reels and Watch videos that Facebook's own detection marked as made with AI.
 *
 * The feed rule runs in the shared feed guard like every other feed rule, so `addNewEdgeToCollection`
 * still carries one Hushfacebook guard. What this patch adds there is the one read the guard can't
 * make by name: GraphQLStory's accessor of the detected-AI info model, which Redex renames every
 * build. It is found by the two schema keys it loads (see Fingerprints.kt), held to the model
 * GenAiTransparencyPlugin reads the flag on, and written into `GenAiLabel.detectedInfo`, which
 * answers a marker until then. Everything else, the flag included, the extension reads through
 * members Facebook keeps.
 *
 * The Reels rule runs where a fetched page enters the Reels and Watch item collection, on the same
 * three methods the sponsored reels filter runs on, each prepended with a call of its own; the two
 * patches work alone or together. What this patch adds there is Facebook's own finder of the
 * attribution the Reels viewer draws its AI label from, found by the type name literal it is
 * handed (see ReelLabel.kt) and written into `GenAiReelFilter.transparencyAttribution`. The flag
 * on that attribution the extension reads through `TreeJNI.getBooleanValue`, the kept reader the
 * viewer's own label decision calls, and the patch stops if that decision no longer does.
 *
 * Both switches start off. Nobody has yet recorded a signed-in feed with one AI-labeled post and
 * one ordinary post beside it, nor a Reels feed with an AI-labelled reel, and until someone does,
 * each rule waits to be turned on.
 */
@Suppress("unused")
val hideAiDetectedPostsPatch = bytecodePatch(
    name = "Hide AI-detected posts",
    description = "Removes feed posts that Facebook's own detection marked as made with AI, and the reels " +
        "and Watch videos it flagged the same way. Both switches start off, so turn them on in " +
        "Hushfacebook's settings.",
    default = true,
) {
    category("Feed")
    dependsOn(settingsPatch)
    dependsOn(feedFilterHookPatch)
    compatibleWith(*AppCompatibilities.facebook())

    execute {
        val story = classDefBy(GRAPHQL_STORY)
        val accessors = detectedInfoAccessors(story)
        val accessor = accessors.singleOrNull() ?: throw PatchException(
            "GraphQLStory has ${accessors.size} accessors of $DETECTED_INFO_FIELD as $DETECTED_INFO_TYPE, " +
                "expected one: ${accessors.joinToString { it.name }}",
        )

        // Facebook's own label reads the flag on this model. If it stops doing that, the flag may
        // have moved or changed meaning, and a rule that guesses could hide the wrong posts.
        val plugin = classDefByOrNull(GEN_AI_TRANSPARENCY_PLUGIN)
            ?: throw PatchException("GenAiTransparencyPlugin is gone, so nothing shows which flag Facebook's AI label reads")
        if (plugin.methods.none { readsDetectedFlag(it, accessor) }) {
            throw PatchException(
                "GenAiTransparencyPlugin no longer reads $DETECTED_FLAG through GraphQLStory.${accessor.name}()",
            )
        }

        // The extension reads the flag and the model's type tag through these, by reflection.
        requireStoryFlagReaders()
        fillStoryModelStub(GEN_AI_LABEL, DETECTED_INFO_STUB, accessor)

        hideReels()

        enableStatus("aiDetectedPosts")
    }
}

/** The Reels and Watch side: the finder stub, and the page filters at both levels a page enters. */
private fun BytecodePatchContext.hideReels() {
    val holders = classDefByStrings(TRANSPARENCY_ATTRIBUTION, StringComparisonType.EQUALS)
        .flatMap { methodsHolding(it, TRANSPARENCY_ATTRIBUTION) }
    val found = attributionFinder(holders)
    val finder = found.call ?: throw PatchException("$PATCH: ${found.problem}")
    val finderMethod = classDefByOrNull(finder.definingClass)?.let { resolveStatic(it, finder) }
        ?: throw PatchException("$PATCH: ${finder.definingClass} declares no static ${finder.name} the literal is handed to")
    if (!isAttributionFinder(finderMethod)) {
        throw PatchException(
            "$PATCH: ${finder.definingClass}->${finder.name} doesn't pick an attribution by getTypeName(), so it isn't the finder",
        )
    }
    val modelType = finder.parameterTypes[0].toString()
    val attributionType = finder.returnType

    // Facebook's own label decision reads the detected flag on the attribution the finder answers.
    // If it stops doing that, the flag may have moved, and a rule that guesses could hide the
    // wrong reels.
    var reads = false
    classDefForEach { classDef ->
        if (!reads && classDef.methods.any { readsReelDetectedFlag(it, attributionType, modelType) }) reads = true
    }
    if (!reads) {
        throw PatchException(
            "$PATCH: no reel label decision reads $DETECTED_FLAG on $attributionType through TreeJNI.$TREE_BOOLEAN_READER",
        )
    }

    // The extension reads the flag through these, by reflection.
    requireTreeReaders()
    fillFinderStub(GEN_AI_REEL_FILTER, ATTRIBUTION_STUB, finder)

    // The page filters, at both levels a page enters, with the reel model's class beside each so
    // the extension knows which of an item's fields holds the model.
    val pages = reelPages(PATCH)
    val model = modelType.toBinaryName()
    listOf(pages.insertPage, pages.announcePage).forEach { it.filterPageFirst(model, REEL_FILTER, PATCH) }
    pages.addPage.filterSectionsFirst(model, REEL_SECTION_FILTER, PATCH)
}
