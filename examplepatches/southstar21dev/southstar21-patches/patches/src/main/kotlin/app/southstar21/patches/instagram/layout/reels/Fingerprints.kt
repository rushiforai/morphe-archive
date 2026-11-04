package app.southstar21.patches.instagram.layout.reels

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

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

/** FeedItem's null-safe getter for its media, the one that unwraps the content holder. */
internal object FeedItemMediaFingerprint : Fingerprint(
    classFingerprint = FeedItemTypeFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = MEDIA_CLASS,
    parameters = listOf(),
    filters = listOf(
        methodCall(opcode = Opcode.INVOKE_STATIC, returnType = MEDIA_CLASS),
    ),
)

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
