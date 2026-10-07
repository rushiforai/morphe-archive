package app.anghami.patches.ui

import app.anghami.patches.core.AnghamiTarget
import app.anghami.patches.core.forceFalse
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction22c
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/**
 * Suppresses every "Plays in shuffle" badge drawn by the app.
 *
 * Two mechanisms are used, because the badge surfaces in two different ways:
 *
 * - the three header models answer `false` from `getHasShuffleBadge()`, which makes the
 *   hosting screen collapse its badge group instead of showing it;
 * - card and row models read the `isShuffleMode` field to decide whether to append the
 *   badge; each such read is turned into a constant `false`, reusing the register the
 *   original read wrote to.
 *
 * The badge is purely decorative; actual shuffle playback is handled by the separate
 * forced-shuffle removal patch.
 */
@Suppress("unused")
val shuffleBadgeBlockPatch = bytecodePatch(
    name = "Hide Shuffle Badges",
    description = "Hides 'Plays in shuffle' badges from playlists, album headers, and feed rows.",
    default = true,
) {
    compatibleWith(AnghamiTarget.COMPATIBILITY)

    execute {
        ShuffleBadgeBaseSignature.method.forceFalse()
        ShuffleBadgePlaylistSignature.method.forceFalse()
        ShuffleBadgeAlbumSignature.method.forceFalse()
        for (fingerprint in listOf(
            LinkNewCardBindSignature, StoreCarouselSubBindSignature,
            PlaylistRowSubtitleSignature, AlbumRowSubtitleSignature,
            PlaylistCardDrawableSignature, AlbumCardDrawableSignature,
            LinkCardDrawableSignature, LinkModelSubtitleSignature,
        )) {
            val cardBind = fingerprint.method
            val shuffleGets = cardBind.implementation!!.instructions
                .mapIndexedNotNull { index, ins ->
                    if (ins.opcode == Opcode.IGET_BOOLEAN && ins is Instruction22c &&
                        (ins.reference as? FieldReference)?.name == "isShuffleMode"
                    ) {
                        index to ins.registerA
                    } else {
                        null
                    }
                }
            check(shuffleGets.isNotEmpty()) {
                "expected at least 1 isShuffleMode iget in ${fingerprint.javaClass.simpleName}, found none"
            }
            for ((index, reg) in shuffleGets) {
                cardBind.replaceInstructions(index, "const/4 v$reg, 0x0")
            }
        }
    }
}

/** `BaseHeaderModel.getHasShuffleBadge()` — shared header implementation. */
object ShuffleBadgeBaseSignature : Fingerprint(
    definingClass = "Lcom/anghami/model/adapter/headers/BaseHeaderModel;",
    name = "getHasShuffleBadge",
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(
            smali = "Lcom/anghami/model/adapter/headers/BaseHeaderModel;->hasShuffleBadge:Z"
        ),
    )
)

/** `PlaylistHeaderModel.getHasShuffleBadge()` — playlist header override. */
object ShuffleBadgePlaylistSignature : Fingerprint(
    definingClass = "Lcom/anghami/model/adapter/headers/PlaylistHeaderModel;",
    name = "getHasShuffleBadge",
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(
            smali = "Lcom/anghami/ghost/pojo/PossiblyGenericModel;->isShuffleMode:Z"
        ),
    )
)

/** `AlbumHeaderModel.getHasShuffleBadge()` — album header override. */
object ShuffleBadgeAlbumSignature : Fingerprint(
    definingClass = "Lcom/anghami/model/adapter/headers/AlbumHeaderModel;",
    name = "getHasShuffleBadge",
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(
            smali = "Lcom/anghami/ghost/pojo/PossiblyGenericModel;->isShuffleMode:Z"
        ),
    )
)

/** `LinkNewCardModel._bind(HeaderLinkHolder)` — link card binding. */
object LinkNewCardBindSignature : Fingerprint(
    definingClass = "Lcom/anghami/model/adapter/LinkNewCardModel;",
    name = "_bind",
    returnType = "V",
    parameters = listOf("Lcom/anghami/model/adapter/LinkNewCardModel\$HeaderLinkHolder;"),
    filters = listOf(
        fieldAccess(
            smali = "Lcom/anghami/model/adapter/LinkNewCardModel\$HeaderLinkHolder;->shuffleBadge:Landroid/view/View;"
        ),
    )
)

/** `StoreCarouselSubModel._bind(StoreSubViewHolder)` — store carousel row binding. */
object StoreCarouselSubBindSignature : Fingerprint(
    definingClass = "Lcom/anghami/model/adapter/store/StoreCarouselSubModel;",
    name = "_bind",
    returnType = "V",
    parameters = listOf("Lcom/anghami/model/adapter/store/StoreCarouselSubModel\$StoreSubViewHolder;"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/anghami/model/adapter/store/StoreCarouselSubModel\$StoreSubViewHolder;",
            name = "getShuffleBadge",
        ),
    )
)

/** `PlaylistRowModel.getSubtitleText()` — playlist row subtitle. */
object PlaylistRowSubtitleSignature : Fingerprint(
    definingClass = "Lcom/anghami/model/adapter/PlaylistRowModel;",
    name = "getSubtitleText",
    returnType = "Ljava/lang/CharSequence;",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/anghami/util/u;",
            name = "b",
        ),
    )
)

/** `AlbumRowModel.getSubtitleText()` — album row subtitle. */
object AlbumRowSubtitleSignature : Fingerprint(
    definingClass = "Lcom/anghami/model/adapter/AlbumRowModel;",
    name = "getSubtitleText",
    returnType = "Ljava/lang/CharSequence;",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/anghami/util/u;",
            name = "b",
        ),
    )
)

/** `PlaylistCardModel.getSubtitleStartingDrawable()` — playlist card leading icon. */
object PlaylistCardDrawableSignature : Fingerprint(
    definingClass = "Lcom/anghami/model/adapter/PlaylistCardModel;",
    name = "getSubtitleStartingDrawable",
    returnType = "I",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(
            smali = "Lcom/anghami/ghost/pojo/PossiblyGenericModel;->isShuffleMode:Z"
        ),
    )
)

/** `AlbumCardModel.getSubtitleStartingDrawable()` — album card leading icon. */
object AlbumCardDrawableSignature : Fingerprint(
    definingClass = "Lcom/anghami/model/adapter/AlbumCardModel;",
    name = "getSubtitleStartingDrawable",
    returnType = "I",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(
            smali = "Lcom/anghami/ghost/pojo/PossiblyGenericModel;->isShuffleMode:Z"
        ),
    )
)

/** `LinkCardModel.getSubtitleStartingDrawable()` — link card leading icon. */
object LinkCardDrawableSignature : Fingerprint(
    definingClass = "Lcom/anghami/model/adapter/LinkCardModel;",
    name = "getSubtitleStartingDrawable",
    returnType = "I",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(
            smali = "Lcom/anghami/ghost/pojo/PossiblyGenericModel;->isShuffleMode:Z"
        ),
    )
)

/** `LinkModel.setSubtitleView(LinkViewHolder)` — link row subtitle; holds two shuffle reads. */
object LinkModelSubtitleSignature : Fingerprint(
    definingClass = "Lcom/anghami/model/adapter/LinkModel;",
    name = "setSubtitleView",
    returnType = "V",
    parameters = listOf("Lcom/anghami/model/adapter/LinkModel\$LinkViewHolder;"),
    filters = listOf(
        fieldAccess(
            smali = "Lcom/anghami/model/adapter/LinkModel\$LinkViewHolder;->subtitleTextView:Landroid/widget/TextView;"
        ),
    )
)
