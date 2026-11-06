package semicoloncolonel.mobilestream.patches.washingtonpost.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import semicoloncolonel.mobilestream.patches.washingtonpost.shared.Constants

// WaPo phone 7.18.1. Every ad slot is a com.wapo.adsinf.BannerAdView, which
// runs the whole stack itself: Google Ad Manager, with Amazon and Nimbus
// bidding. Two methods drive it, renamed in this build:
//   n(config) — starts the ad request coroutine (and its refresh timer)
//   a(config) — the AdView interface call that swaps in the rendered ad
// The patch returns from n before anything is requested, and turns a into
// "hide this slot".
//
// The slot around the ad (ad_layout: a grey "Advertisement" label above the
// BannerAdView) would still show, empty. Each BannerAdView constructor now
// hands the view to AdSlotCollapser, which hides the slot and gives it no
// height once it is on screen, so lists leave no gap.
//
// Articles are drawn in Jetpack Compose, where each ad slot is the AdView
// composable (an "Advertisement" label over a BannerAdView). It is found by
// its Compose trace name and returns before drawing anything, so the slot
// takes no space.
private const val BANNER_AD_VIEW = "Lcom/wapo/adsinf/BannerAdView;"
private const val COLLAPSER = "Lsemicoloncolonel/mobilestream/extension/washingtonpost/AdSlotCollapser;"

internal object BannerAdLoadFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, classDef ->
        classDef.type == BANNER_AD_VIEW && method.name == "n" && method.parameterTypes.size == 1
    },
)

internal object BannerAdShowFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, classDef ->
        classDef.type == BANNER_AD_VIEW && method.name == "a" && method.parameterTypes.size == 1 &&
            method.parameterTypes.first().toString() ==
            classDef.methods.first { it.name == "n" && it.parameterTypes.size == 1 }.parameterTypes.first().toString()
    },
)

internal object ArticleAdViewComposableFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        method.implementation?.instructions?.any {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
                ?.startsWith("com.wapo.flagship.features.articles3.views.AdView (") == true
        } == true
    },
)

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Removes the ads from the app and hides each ad slot.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        BannerAdLoadFingerprint.method.addInstructions(0, "return-void")

        // .locals 0, so only p0/p1 exist; p1 (the config) is not needed after.
        BannerAdShowFingerprint.method.addInstructions(
            0,
            """
                const/16 p1, 0x8
                invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V
                return-void
            """.trimIndent(),
        )

        // Collapse each ad slot. Before every return-void in each constructor,
        // after the superclass constructor has run.
        var constructors = 0
        mutableClassDefBy(BANNER_AD_VIEW).methods.filter { it.name == "<init>" }.forEach { method ->
            val returns = method.implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }
            returns.sortedDescending().forEach { index ->
                method.addInstructions(index, "invoke-static/range { p0 .. p0 }, $COLLAPSER->track(Landroid/view/View;)V")
            }
            if (returns.isNotEmpty()) constructors++
        }
        if (constructors == 0) throw PatchException("BannerAdView constructors not found")

        // Article ad slots (Compose): draw nothing.
        ArticleAdViewComposableFingerprint.method.addInstructions(0, "return-void")
    }
}
