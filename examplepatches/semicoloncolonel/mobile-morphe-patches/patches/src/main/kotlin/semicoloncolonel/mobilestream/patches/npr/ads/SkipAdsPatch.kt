package semicoloncolonel.mobilestream.patches.npr.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import semicoloncolonel.mobilestream.patches.npr.shared.Constants
import semicoloncolonel.mobilestream.patches.npr.shared.NPR_WEB_CLEANUP
import semicoloncolonel.mobilestream.patches.npr.shared.WebViewPageFingerprint

// NPR 7.10.0. The app's org.npr classes keep their names.
//
// - Sponsor banners: every sponsorship slot in the feed, both the full-width
//   modules and the ads placed inside headline lists, is rendered by
//   SponsorshipModuleViewHolder. Its bind method now hides the slot's root
//   view and gives it zero height: the slot is a RecyclerView row, and a
//   RecyclerView keeps a hidden row's height, which left a blank block. The
//   Prebid, Amazon, and Ad Manager requests behind it are also not made.
// - Video: full-screen videos get their pre-roll ad tag from the item's
//   sponsorship URL when the media item is built. With no ad tag, the player
//   skips IMA and starts the video. The same URL still works as the tap-through
//   link on audio sponsorship cards.
// - Web pages: stories that open as npr.org pages inside the app have their
//   ad slots collapsed, so no blank space is left where an ad would load.
//
// Sponsorship credits read inside podcast episodes and the live stream are
// part of the audio and still play.

private const val VIEW_HOLDER = "Lorg/npr/one/modules/module/SponsorshipModuleViewHolder;"

internal object SponsorshipBindFingerprint : Fingerprint(
    definingClass = VIEW_HOLDER,
    returnType = "V",
    parameters = listOf("Lorg/npr/one/base/data/model/NPRItemVM;"),
    custom = { method, _ -> method.name.startsWith("bind") },
)

internal object SponsorshipBidFingerprint : Fingerprint(
    definingClass = VIEW_HOLDER,
    name = "requestBidAndLoadAds",
    returnType = "V",
)

internal object VideoMediaItemFingerprint : Fingerprint(
    definingClass = "Lorg/npr/one/player/view/FullScreenVideoViewModel;",
    name = "recToMediaItem",
    returnType = "Landroidx/media3/common/MediaItem;",
)

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Removes the sponsor banners in the feed, the ad spaces in web stories, and the ads before videos.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        WebViewPageFingerprint.method.addInstruction(
            0,
            "invoke-static { p0 }, $NPR_WEB_CLEANUP->hideAds(Landroid/webkit/WebView;)V",
        )

        SponsorshipBindFingerprint.method.addInstructions(
            0,
            """
                iget-object v0, p0, $VIEW_HOLDER->rootView:Landroid/view/ViewGroup;
                invoke-static { v0 }, Lsemicoloncolonel/mobilestream/extension/npr/AdRowCollapser;->collapse(Landroid/view/View;)V
                return-void
            """,
        )
        SponsorshipBidFingerprint.method.addInstructions(0, "return-void")

        VideoMediaItemFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            val index = instructions.indexOfFirst {
                it.opcode == Opcode.IGET_OBJECT &&
                    ((it as ReferenceInstruction).reference as FieldReference).name == "sponsorshipRelatedUrl"
            }
            if (index == -1) throw PatchException("sponsorshipRelatedUrl read not found in recToMediaItem")
            val register = (instructions[index] as TwoRegisterInstruction).registerA
            replaceInstruction(index, "const/4 v$register, 0x0")
        }
    }
}
