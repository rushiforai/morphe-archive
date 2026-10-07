package app.anghami.patches.plus

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.Opcode

/**
 * Shuffle-badge targets (Anghami 8.0.28, verified in Anghami 8.0.28).
 *
 * Used by the "Hide shuffle badges" patch. Badges are purely cosmetic; the
 * shuffle playback behavior itself is covered by "Unforce shuffle".
 * - Header badges: all 3 header models' getHasShuffleBadge() feed
 *   setShuffleBadgeView(), which sets the ShuffleBadgeGroup GONE.
 * - Card/row badges: each model reads the item's `isShuffleMode` in _bind
 *   (or a subtitle/drawable getter) with no gate method; every read is
 *   swapped to const/4. LinkModel.setSubtitleView has TWO reads — both swap.
 */

object ShuffleBadgeBaseFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/model/adapter/headers/BaseHeaderModel;",
    name = "getHasShuffleBadge",
    // NOTE: no accessFlags; class + name + signature pin it.
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(
            smali = "Lcom/anghami/model/adapter/headers/BaseHeaderModel;->hasShuffleBadge:Z"
        ),
    )
)

object ShuffleBadgePlaylistFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/model/adapter/headers/PlaylistHeaderModel;",
    name = "getHasShuffleBadge",
    // NOTE: no accessFlags; class + name + signature pin it.
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(
            smali = "Lcom/anghami/ghost/pojo/PossiblyGenericModel;->isShuffleMode:Z"
        ),
    )
)

object ShuffleBadgeAlbumFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/model/adapter/headers/AlbumHeaderModel;",
    name = "getHasShuffleBadge",
    // NOTE: no accessFlags; class + name + signature pin it.
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(
            smali = "Lcom/anghami/ghost/pojo/PossiblyGenericModel;->isShuffleMode:Z"
        ),
    )
)

object LinkNewCardBindFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/model/adapter/LinkNewCardModel;",
    name = "_bind",
    // NOTE: no accessFlags; the HeaderLinkHolder param disambiguates the
    // three _bind overloads.
    returnType = "V",
    parameters = listOf("Lcom/anghami/model/adapter/LinkNewCardModel\$HeaderLinkHolder;"),
    filters = listOf(
        fieldAccess(
            smali = "Lcom/anghami/model/adapter/LinkNewCardModel\$HeaderLinkHolder;->shuffleBadge:Landroid/view/View;"
        ),
    )
)

object StoreCarouselSubBindFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/model/adapter/store/StoreCarouselSubModel;",
    name = "_bind",
    // NOTE: no accessFlags; the StoreSubViewHolder param disambiguates the
    // three _bind overloads.
    returnType = "V",
    parameters = listOf("Lcom/anghami/model/adapter/store/StoreCarouselSubModel\$StoreSubViewHolder;"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/anghami/model/adapter/store/StoreCarouselSubModel\$StoreSubViewHolder;",
            name = "getShuffleBadge",
        ),
    )
)

object PlaylistRowSubtitleFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/model/adapter/PlaylistRowModel;",
    name = "getSubtitleText",
    // NOTE: no accessFlags; class + name + signature pin it.
    returnType = "Ljava/lang/CharSequence;",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/anghami/util/u;",
            name = "b",
        ),
    )
)

object AlbumRowSubtitleFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/model/adapter/AlbumRowModel;",
    name = "getSubtitleText",
    // NOTE: no accessFlags; class + name + signature pin it.
    returnType = "Ljava/lang/CharSequence;",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/anghami/util/u;",
            name = "b",
        ),
    )
)

object PlaylistCardDrawableFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/model/adapter/PlaylistCardModel;",
    name = "getSubtitleStartingDrawable",
    // NOTE: no accessFlags; class + name + signature pin it.
    returnType = "I",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(
            smali = "Lcom/anghami/ghost/pojo/PossiblyGenericModel;->isShuffleMode:Z"
        ),
    )
)

object AlbumCardDrawableFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/model/adapter/AlbumCardModel;",
    name = "getSubtitleStartingDrawable",
    // NOTE: no accessFlags; class + name + signature pin it.
    returnType = "I",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(
            smali = "Lcom/anghami/ghost/pojo/PossiblyGenericModel;->isShuffleMode:Z"
        ),
    )
)

object LinkCardDrawableFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/model/adapter/LinkCardModel;",
    name = "getSubtitleStartingDrawable",
    // NOTE: no accessFlags; class + name + signature pin it.
    returnType = "I",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(
            smali = "Lcom/anghami/ghost/pojo/PossiblyGenericModel;->isShuffleMode:Z"
        ),
    )
)

object LinkModelSubtitleFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/model/adapter/LinkModel;",
    name = "setSubtitleView",
    // NOTE: no accessFlags; the LinkViewHolder param pins it (private).
    returnType = "V",
    parameters = listOf("Lcom/anghami/model/adapter/LinkModel\$LinkViewHolder;"),
    filters = listOf(
        fieldAccess(
            smali = "Lcom/anghami/model/adapter/LinkModel\$LinkViewHolder;->subtitleTextView:Landroid/widget/TextView;"
        ),
    )
)
