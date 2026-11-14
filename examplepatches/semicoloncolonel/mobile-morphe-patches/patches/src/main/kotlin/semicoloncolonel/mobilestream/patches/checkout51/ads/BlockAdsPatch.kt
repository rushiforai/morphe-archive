package semicoloncolonel.mobilestream.patches.checkout51.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import semicoloncolonel.mobilestream.patches.checkout51.shared.Constants
import semicoloncolonel.mobilestream.patches.checkout51.shared.GetListItemsFromOfferModelsFingerprint
import semicoloncolonel.mobilestream.patches.checkout51.shared.SHOPPING_ADS_FILTER
import semicoloncolonel.mobilestream.patches.checkout51.shared.fixStuckDialogPatch

// ─────────────────────────────────────────────────────────────────────────────
// Block ads.
//
// Checkout 51 9.22.10 shows Google Ad Manager ads in three places, all
// decided in its own, unobfuscated code:
//
//   Launch ad      LoggedInUserState.autoLoginExistingUser loads a native ad
//                  and opens the full-screen AD_TRANSITION page before the
//                  offer list. The ad load is removed and the method opens
//                  OFFER_LIST, the page it already opens for users who opted
//                  out of data sale.
//   Offer rows     offer models whose meta names an ad unit (isDfpAd) become
//                  GoogleAdListItem rows.
//   Highlight ads  highlights whose meta names a highlight ad become
//                  HighlightsGoogleAdListItem cards in the carousel.
//
// The offer models for the last two are dropped before they become rows, so
// no ad is requested and no gap is left.
//
// Not touched: offers, receipts, the Button and Branch links, and the
// grocery-store offers, which cash back depends on.
// ─────────────────────────────────────────────────────────────────────────────

internal object AutoLoginExistingUserFingerprint : Fingerprint(
    definingClass = "Lcom/c51/core/service/users/LoggedInUserState;",
    name = "autoLoginExistingUser",
    returnType = "V",
)

private const val FRAGMENT_TYPE = "Lcom/c51/core/fragment/FragmentType;"

@Suppress("unused")
val blockAdsPatch = bytecodePatch(
    name = "Block ads",
    description = "Removes the ad shown on launch and the ads in the offer list and highlights.",
) {
    category("Ads")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(fixStuckDialogPatch)

    extendWith("extensions/extension.mpe")

    execute {
        AutoLoginExistingUserFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            val transition = instructions.indexOfFirst {
                it.opcode == Opcode.SGET_OBJECT &&
                    ((it as ReferenceInstruction).reference as FieldReference).let { field ->
                        field.definingClass == FRAGMENT_TYPE && field.name == "AD_TRANSITION"
                    }
            }
            if (transition < 0) throw PatchException("Checkout 51: AD_TRANSITION not found")
            val register = getInstruction<OneRegisterInstruction>(transition).registerA
            replaceInstruction(transition, "sget-object v$register, $FRAGMENT_TYPE->OFFER_LIST:$FRAGMENT_TYPE")

            val adLoad = instructions.indexOfFirst {
                it.opcode == Opcode.INVOKE_VIRTUAL &&
                    ((it as ReferenceInstruction).reference as MethodReference).name == "loadNativeAd"
            }
            if (adLoad < 0) throw PatchException("Checkout 51: loadNativeAd not found")
            removeInstruction(adLoad)
        }

        GetListItemsFromOfferModelsFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                invoke-static {p1, v0}, $SHOPPING_ADS_FILTER->checkout51Offers(Ljava/util/List;I)Ljava/util/List;
                move-result-object p1
            """,
        )
    }
}
