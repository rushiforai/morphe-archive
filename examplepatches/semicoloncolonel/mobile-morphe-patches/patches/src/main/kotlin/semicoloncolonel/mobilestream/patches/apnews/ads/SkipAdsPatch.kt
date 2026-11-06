package semicoloncolonel.mobilestream.patches.apnews.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import semicoloncolonel.mobilestream.patches.apnews.shared.Constants

// AP News 6.31.2. The app's com.apnews model classes keep their names; its
// other code is obfuscated and moved under net.nativo.android, so those hooks
// are found by their strings.
//
// - Feed: the Ad Manager / PubMatic ad rows and the Nativo sponsored-content
//   rows are not added to the feed list, so no row or spacer is left.
// - Articles: the ads below an article never load, and those rows stay
//   hidden. The sticky banner at the bottom is not shown, on both native and
//   web articles. The "Sponsored by" rows and their sponsor-logo ads are not
//   added.
// - Video: the JW Player takes the app's own "remove ads" setting, so videos
//   start with no IMA pre-roll.

private const val NATIVO_ITEM = "Lcom/apnews/app/ui/bindable/nativo/NativoNativeAdItem;"

internal object FeedGoogleAdFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("handleGoogleAdListItem", "OpenWrap", "GAM"),
)

internal object FeedNativoAdFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        AccessFlags.STATIC.isSet(method.accessFlags) &&
            method.definingClass != NATIVO_ITEM &&
            method.implementation?.instructions?.any {
                (it.opcode == Opcode.INVOKE_DIRECT || it.opcode == Opcode.INVOKE_DIRECT_RANGE) &&
                    ((it as ReferenceInstruction).reference as MethodReference).let { ref ->
                        ref.definingClass == NATIVO_ITEM && ref.name == "<init>"
                    }
            } == true
    },
)

internal object ArticleBannerFingerprint : Fingerprint(
    definingClass = "Lcom/apnews/app/core/common/model/article/ArticleDataContainer;",
    name = "getAdBanner",
    returnType = "Lcom/apnews/app/core/common/model/article/ArticleGoogleAd;",
)

internal object StickyBannerFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Lcom/apnews/app/core/common/model/article/ArticleGoogleAd;"),
    strings = listOf("Pubmatic -> AdID: "),
)

internal object SponsoredFingerprint : Fingerprint(
    definingClass = "Lcom/apnews/app/core/common/model/graphql/KitchenSinkData;",
    name = "getSponsored",
)

internal object VideoRemoveAdsFingerprint : Fingerprint(
    definingClass = "Lcom/apnews/app/core/common/model/video/VideoSettings;",
    name = "getAppRemoveAds",
    returnType = "Ljava/lang/Boolean;",
)

internal object PlayAdFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("Cannot play ad: Advertising config is null."),
)

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Removes the ads and sponsored rows in the feed and articles, the sticky banner, and the ads before videos.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        FeedGoogleAdFingerprint.method.addInstructions(0, "return-void")
        FeedNativoAdFingerprint.method.addInstructions(0, "return-void")

        // Every ad row (Ad Manager, PubMatic, Nativo) loads through
        // preFetchAd(Z)V; with no load, the row keeps its hidden state.
        var preFetch = 0
        classDefForEach { classDef ->
            if (classDef.methods.none { it.name == "preFetchAd" && it.parameterTypes == listOf("Z") }) return@classDefForEach
            mutableClassDefBy(classDef.type).methods
                .filter { it.name == "preFetchAd" && it.parameterTypes == listOf("Z") && it.implementation != null }
                .forEach {
                    it.addInstructions(0, "return-void")
                    preFetch++
                }
        }
        if (preFetch == 0) throw PatchException("No ad preFetchAd methods found")

        ArticleBannerFingerprint.method.addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
        StickyBannerFingerprint.method.addInstructions(0, "return-void")
        SponsoredFingerprint.method.addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
        VideoRemoveAdsFingerprint.method.addInstructions(
            0,
            "sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;\nreturn-object v0",
        )
        PlayAdFingerprint.methodOrNull?.addInstructions(0, "return-void")
    }
}
