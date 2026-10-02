/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.ads.sponsoredreels

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.ads.sponsoredprofile.SPONSORED_DATA_FIELD
import app.morphe.patches.facebook.ads.sponsoredprofile.SPONSORED_DATA_TYPE
import app.morphe.patches.facebook.feed.GRAPHQL_STORY
import app.morphe.patches.facebook.feed.fillStoryModelStub
import app.morphe.patches.facebook.feed.storyModelAccessors
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method

/** The extension class the page filters live on, and the stubs the patch fills in on it. */
internal const val REELS_AD_FILTER = "$EXTENSION_PACKAGE/ads/ReelsAdFilter;"
internal const val IS_REEL_ITEM_STUB = "isReelItem"
internal const val ITEM_STORY_STUB = "itemStory"
internal const val REEL_SPONSORED_DATA_STUB = "sponsoredData"

/**
 * How the page filters ask an item for its story, and the story for its `sponsored_data`.
 *
 * Every Reels and Watch item implements an interface whose one method answers the item's story,
 * and Facebook's own Reels code tells an ad by asking an item for its story through it and reading
 * the story's `sponsored_data`: it shows no promotion over a reel whose story has some (580
 * `LX/8P6;->A01`). The ad item base answers its story through the same interface, which is how it's
 * found: the base's one no-argument GraphQLStory method is declared on one interface up its
 * hierarchy (580 `LX/9Va;->BSc`, 577 `LX/V4T;->BUL`).
 */
internal class ReelItemStory(
    /** The item interface, which the extension's instance-of names. */
    val type: String,
    /** Its story getter. */
    val getter: Method,
    /** GraphQLStory's accessor of the `sponsored_data` model. */
    val sponsoredData: Method,
)

/** The item interface [adBase] answers its story through, and the story's sponsored data accessor. */
internal fun BytecodePatchContext.reelItemStory(adBase: String): ReelItemStory {
    val own = classDefBy(adBase).methods.filter(::isStoryGetter)
    val getter = own.singleOrNull() ?: throw PatchException(
        "$SPONSORED_REELS_PATCH: the ad item base $adBase has ${own.size} no-argument GraphQLStory methods, expected one",
    )
    val declared = supertypesOf(adBase).mapNotNull { classDefByOrNull(it) }
        .filter { AccessFlags.INTERFACE.isSet(it.accessFlags) }
        .flatMap { type -> type.methods.filter { isStoryGetter(it) && it.name == getter.name } }
    val method = declared.singleOrNull() ?: throw PatchException(
        "$SPONSORED_REELS_PATCH: $adBase->${getter.name}() is declared on ${declared.size} interfaces up its hierarchy, " +
            "expected one: ${declared.joinToString { it.definingClass }}",
    )
    if (!AccessFlags.PUBLIC.isSet(classDefBy(method.definingClass).accessFlags)) {
        throw PatchException("$SPONSORED_REELS_PATCH: the item interface ${method.definingClass} isn't public, so the extension can't reach it")
    }

    val accessors = storyModelAccessors(classDefBy(GRAPHQL_STORY), SPONSORED_DATA_FIELD, SPONSORED_DATA_TYPE)
    val sponsoredData = accessors.singleOrNull() ?: throw PatchException(
        "$SPONSORED_REELS_PATCH: GraphQLStory has ${accessors.size} accessors of $SPONSORED_DATA_FIELD as $SPONSORED_DATA_TYPE, expected one",
    )
    return ReelItemStory(method.definingClass, method, sponsoredData)
}

private fun isStoryGetter(method: Method) = method.parameterTypes.isEmpty() && method.returnType == GRAPHQL_STORY &&
    !AccessFlags.STATIC.isSet(method.accessFlags)

/** Every superclass and interface of [type], the interfaces' own included. */
private fun BytecodePatchContext.supertypesOf(type: String): Set<String> {
    val found = linkedSetOf<String>()
    val pending = ArrayDeque(listOf(type))
    while (pending.isNotEmpty()) {
        val classDef = classDefByOrNull(pending.removeFirst()) ?: continue
        (listOfNotNull(classDef.superclass) + classDef.interfaces).forEach { if (found.add(it)) pending += it }
    }
    return found
}

/**
 * Fills the extension's three stubs: whether an object is an item, the item's story, and the story's
 * sponsored data. Each uses only its parameter register, so the stub's own register count doesn't
 * matter; the extension asks whether an object is an item before it asks for its story.
 */
internal fun BytecodePatchContext.fillReelItemStubs(item: ReelItemStory) {
    val filter = mutableClassDefBy(REELS_AD_FILTER)
    fun stub(name: String, returnType: String): MutableMethod = filter.methods.singleOrNull {
        it.name == name && it.returnType == returnType && AccessFlags.STATIC.isSet(it.accessFlags) &&
            it.parameterTypes.map { type -> type.toString() } == listOf("Ljava/lang/Object;")
    } ?: throw PatchException("$REELS_AD_FILTER has no static $returnType $name(Object)")

    stub(IS_REEL_ITEM_STUB, "Z").addInstructions(
        0,
        """
            instance-of p0, p0, ${item.type}
            return p0
        """,
    )
    stub(ITEM_STORY_STUB, "Ljava/lang/Object;").addInstructions(
        0,
        """
            check-cast p0, ${item.type}
            invoke-interface { p0 }, ${item.type}->${item.getter.name}()$GRAPHQL_STORY
            move-result-object p0
            return-object p0
        """,
    )
    fillStoryModelStub(REELS_AD_FILTER, REEL_SPONSORED_DATA_STUB, item.sponsoredData)
}
