/*
 * Forked from:
 * https://github.com/andrewliang25/morphe-patches/blob/5db2e57e133aede5297c48b419168cf30fd89953/patches/src/main/kotlin/app/andrewliang/patches/facebook/hidesponsoredreels/HideSponsoredReelsPatch.kt
 * Copyright 2026 Andrew Liang (GPL-3.0).
 *
 * Modified for Hushfacebook (Facebook), 2026.
 */
package app.morphe.patches.facebook.ads.sponsoredreels

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.feed.GRAPHQL_STORY
import app.morphe.patches.facebook.misc.extension.freeLocalsAt
import app.morphe.patches.facebook.misc.extension.parameterRegister
import app.morphe.util.singleOrPatchException

internal const val SPONSORED_REELS_PATCH = "Hide sponsored reels"

internal const val COLLECTION = "Ljava/util/Collection;"
internal const val LIST = "Ljava/util/List;"

/** The two ad filters the sponsored reels patch sends each page through, one per level. */
internal const val AD_FILTER = "Lapp/morphe/extension/facebook/ads/ReelsAdFilter;->" +
    "withoutAds(Ljava/util/Collection;Ljava/lang/String;)Ljava/util/Collection;"
internal const val AD_SECTION_FILTER = "Lapp/morphe/extension/facebook/ads/ReelsAdFilter;->" +
    "withoutAdSections(Ljava/util/List;Ljava/lang/String;)Ljava/util/List;"

/**
 * Where a fetched page enters the Reels and Watch item collection, and the ad item base class.
 *
 * Facebook does not splice ads into Reels on the device. A logging build showed items reaching the
 * collection only as whole fetched pages, never one at a time, with the ad already in the page
 * beside the organic reels -- the server inlines it. So the page arriving at the collection is the
 * only place left to drop it, the same way the news feed patch rejects an edge rather than trying
 * to prevent its insertion. Every filter of a page, the ad filter and the GenAI one, goes on these
 * three methods, each prepended with a call that hands the page to the extension and goes on with
 * what comes back.
 *
 * Nothing obfuscated is named. The task that inserts an SFD ad carries a trace literal, and its
 * constructor is handed both the collection and the ad item -- so one string anchor yields both
 * classes, each picked out by a shape no sibling parameter shares.
 */
internal class ReelPages(
    /** The ad item base class, which every ad item extends. */
    val adBase: String,
    /** The item collection's method that puts a page into the backing list: (int, Collection)Z. */
    val insertPage: MutableMethod,
    /** The collection's listener walk over a new page: (collection, Collection)V. */
    val announcePage: MutableMethod,
    /** The controller's method taking a page of fetched sections: (List)Z. */
    val addPage: MutableMethod,
)

/** The reel page methods, resolved for [patch], whose name goes in any refusal. */
internal fun BytecodePatchContext.reelPages(patch: String): ReelPages {
    val adTask = SfdAdInsertFingerprint.method.definingClass
    val taken = mutableClassDefBy(adTask).methods
        .filter { it.name == "<init>" }
        .singleOrPatchException("$patch: the one constructor of the SFD ad insert task $adTask")
        .parameterTypes
        .map { it.toString() }

    fun pick(what: String, matches: (List<String>) -> Boolean) = taken
        .filter { parameter ->
            mutableClassDefByOrNull(parameter)
                ?.methods
                ?.any { matches(listOf(it.returnType) + it.parameterTypes.map(CharSequence::toString)) }
                ?: false
        }
        .also { check(it.size == 1) { "Expected 1 $what among ${taken.joinToString()}, found $it" } }
        .single()

    // The ad item base: the only one of them that can hand back a story.
    val adBase = pick("ad item type") { shape -> shape == listOf(GRAPHQL_STORY) }

    // The item collection: the only one of them that takes a whole collection and answers.
    val collection = pick("item collection") { shape -> shape == listOf("Z", COLLECTION) }

    val collectionClass = mutableClassDefBy(collection)

    // The method that actually puts the page into the backing list: it takes the position to
    // insert at as well as the page. Its sibling only walks the page afterwards telling
    // listeners about each item, which is why filtering that one alone removed nothing.
    val insertPage = collectionClass.methods.filter {
        it.returnType == "Z" &&
            it.parameterTypes.map(CharSequence::toString) == listOf("I", COLLECTION)
    }.singleOrPatchException("$patch: the item collection's page insert, (int, Collection)Z, on $collection")

    // The listener walk. Filtered too, so nothing is announced that was just dropped.
    val announcePage = collectionClass.methods.filter {
        it.returnType == "V" &&
            it.parameterTypes.map(CharSequence::toString) == listOf(collection, COLLECTION)
    }.singleOrPatchException("$patch: the item collection's page announcement, (collection, Collection)V, on $collection")

    // The filter on the collection is not enough. A device round on 2026-09-19 showed why. It
    // caught an ad in a page and logged the drop. The app then showed that ad as the third
    // reel. One step earlier, the controller adds a section wrapper. The wrapper holds its own
    // list of items, and the screen reads that list. Thus the ad stayed in the wrapper, and
    // the drop count in the log stayed correct.
    //
    // So the same filter also runs one level up, over the sections that the controller gets.
    // Both levels stay. This level reaches the screen. The collection level still covers
    // anything that enters the list by another route.
    val controller = mutableClassDefBy(VideoHomeInsertAdsFingerprint.method.definingClass)

    // A page of fetched sections: one List in, boolean out.
    val addPage = controller.methods.filter {
        it.returnType == "Z" && it.parameterTypes.map(CharSequence::toString) == listOf(LIST)
    }.singleOrPatchException("$patch: the Reels controller's (List)Z method that takes a page of sections")

    return ReelPages(adBase, insertPage, announcePage, addPage)
}

/**
 * Sends the page this method receives through [filter] before its own code runs, with [className]
 * beside it: the binary name of the class the filter tells its items by. The helper hands back the
 * very same collection when it takes nothing out, so the usual page is untouched and keeps its type.
 *
 * The page is the method's one Collection parameter, and its register comes from the declared
 * parameters. Redex makes a method static in one build and leaves it an instance method in the
 * next, and a p register written down for one of those would hand the filter the collection
 * object, or `this`, in place of the page.
 */
internal fun MutableMethod.filterPageFirst(className: String, filter: String = AD_FILTER, patch: String = SPONSORED_REELS_PATCH) {
    val page = parameterTypes.indices.filter { parameterTypes[it].toString() == COLLECTION }
        .singleOrPatchException("$patch: the one Collection parameter of $definingClass->$name")
    filterParameterFirst(page, className, filter, patch)
}

/**
 * Sends the page of sections this controller method receives through [filter] before its own code
 * runs, with [className] beside it. The page is its List parameter, found the way
 * [filterPageFirst] finds the page.
 */
internal fun MutableMethod.filterSectionsFirst(className: String, filter: String = AD_SECTION_FILTER, patch: String = SPONSORED_REELS_PATCH) {
    val sections = parameterTypes.indices.filter { parameterTypes[it].toString() == LIST }
        .singleOrPatchException("$patch: the one List parameter of $definingClass->$name")
    filterParameterFirst(sections, className, filter, patch)
}

/**
 * Sends declared parameter [parameter] through [filter], with [className] beside it, before the
 * method's own code runs, and goes on with the answer in the parameter's own register.
 *
 * The filter call names its operands in four bits, so it never names the parameter: the page is
 * copied down into a local first and the answer copied back. 577's controller page method already
 * has 15 registers, and two more would put its page above v15, where the patcher's smali compiler
 * leaves out a call that names it without a word.
 *
 * Both locals come from [freeLocalsAt] at the top of the method, so neither is ever a parameter,
 * nor a local the method reads before writing. The one the first instruction named used to be
 * taken, which was the page itself when a method opened by testing or casting it. A filter put in
 * front of another, as Hide AI-detected posts puts its own, borrows the same two, and the one
 * after writes them again before reading them.
 */
private fun MutableMethod.filterParameterFirst(parameter: Int, className: String, filter: String, patch: String) {
    val (copy, label) = freeLocalsAt(patch, 0, 2)
    val register = parameterRegister(parameter)
    addInstructions(
        0,
        """
            move-object/from16 v$copy, $register
            const-string v$label, "$className"
            invoke-static { v$copy, v$label }, $filter
            move-result-object v$copy
            move-object/16 $register, v$copy
        """,
    )
}

/** `LX/B89;` as the runtime reports it: `X.B89`. */
internal fun String.toBinaryName() = removePrefix("L").removeSuffix(";").replace('/', '.')
