package app.southstar21.patches.instagram.layout.reels

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val EXTENSION_CLASS =
    "Lapp/southstar21/extension/instagram/reels/DisableReelsPatch;"

private const val MEDIA_CLASS = "Lcom/instagram/feed/media/Media;"
private const val VIEW_PAGER_2_CLASS = "Landroidx/viewpager2/widget/ViewPager2;"

// region Home feed

/**
 * FeedItem's getter for its type (MEDIA, AD, CLIPS_NETEGO, ...), which names the missing
 * field when it throws. FeedItem is the class with a ClipsNetego field ("Suggested reels").
 */
internal object FeedItemTypeFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "L",
    parameters = listOf(),
    strings = listOf("feedItemType"),
    custom = { _, classDef ->
        classDef.fields.any { it.type == "Lcom/instagram/api/schemas/ClipsNetego;" }
    },
)

/**
 * FeedItem's getter for its media, the one that unwraps the content holder: its only
 * `public final ()Media` method.
 *
 * Builds of the same version differ inside it: 386014705 unwraps the content through a static
 * call, 386014775 has that call inlined to an interface call. So only the signature is relied
 * on, and the body only breaks a tie, by calling something else that returns Media.
 */
internal fun feedItemMediaGetter(): Method {
    val methods = FeedItemTypeFingerprint.originalClassDef.methods
    val getters = methods.filter { method ->
        method.accessFlags == (AccessFlags.PUBLIC.value or AccessFlags.FINAL.value) &&
                method.returnType == MEDIA_CLASS &&
                method.parameterTypes.isEmpty()
    }
    getters.singleOrNull()?.let { return it }

    val unwrapping = getters.filter { method ->
        method.implementation?.instructions?.any { instruction ->
            ((instruction as? ReferenceInstruction)?.reference as? MethodReference)
                ?.returnType == MEDIA_CLASS
        } == true
    }
    return unwrapping.singleOrNull() ?: throw PatchException(
        "Expected one media getter in FeedItem, found ${getters.size}: " +
                getters.joinToString { it.name } +
                ". Methods returning Media: " +
                methods.filter { it.returnType == MEDIA_CLASS }.joinToString { "${it.name}${it.parameterTypes}" }
    )
}

/** Parses one FeedItem from JSON. Every feed, and the feed cache, goes through it. */
internal object ParseFeedItemFingerprint : Fingerprint(
    classFingerprint = FeedItemTypeFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "L",
    parameters = listOf("L"),
    filters = listOf(
        methodCall(name = "parseFromJsonParser"),
    ),
)

/** Media's ProductType (FEED, CAROUSEL_CONTAINER, CLIPS, ...). */
internal object MediaProductTypeFingerprint : Fingerprint(
    definingClass = "Lcom/instagram/feed/media/MediaExtKt;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Lcom/instagram/model/mediatype/ProductType;",
    parameters = listOf(MEDIA_CLASS),
)

// endregion

/** Parses one section ("DiscoverySection") of the Explore grid. */
internal object ParseExploreSectionFingerprint : Fingerprint(
    name = "unsafeParseFromJson",
    returnType = "Ljava/lang/Object;",
    strings = listOf("DiscoverySection", "explore_item_info"),
)

// region Player

internal object ClipsViewerFragmentOnViewCreatedFingerprint : Fingerprint(
    classFingerprint = Fingerprint(
        strings = listOf("ClipsViewerFragment.onCreate:clipsViewerViewPager"),
    ),
    name = "onViewCreated",
    returnType = "V",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
)

internal object ViewPager2SetAdapterFingerprint : Fingerprint(
    definingClass = VIEW_PAGER_2_CLASS,
    name = "setAdapter",
    returnType = "V",
    parameters = listOf("L"),
)

internal object ViewPager2SetUserInputEnabledFingerprint : Fingerprint(
    definingClass = VIEW_PAGER_2_CLASS,
    name = "setUserInputEnabled",
    returnType = "V",
    parameters = listOf("Z"),
)

// endregion
