package semicoloncolonel.mobilestream.patches.nba.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import semicoloncolonel.mobilestream.patches.nba.shared.Constants

private const val FEATURES = "Lcom/nba/base/model/Features;"
private const val SKIP_PAYWALL_CONTINUATION = "Lcom/nba/nextgen/onboarding/OnboardingGraphKt\$skipPaywall\$1;"
private const val UPSELL_BANNER_CARD = "Lcom/nba/nextgen/feed/cards/FeedCard\$UpsellBannerCard;"
private const val NBA_PRODUCT = "Lcom/nba/base/model/commerce/NbaProduct;"
private const val LEAGUE_PASS_FILTER = "Lsemicoloncolonel/mobilestream/extension/nba/misc/NbaLeaguePassFilter;"

private fun com.android.tools.smali.dexlib2.iface.Method.uses(opcode: Opcode, type: String) =
    implementation?.instructions?.any {
        it.opcode == opcode && ((it as ReferenceInstruction).reference as? TypeReference)?.type == type
    } == true

// NBA 1.3.0. After sign-in, the onboarding graph (OnboardingGraphKt, renamed by R8)
// asks the suspend function skipPaywall whether to show the League Pass
// paywall ("Activate NBA League Pass Premium ... Subscribe"). It is the only
// method outside its continuation class that creates OnboardingGraphKt$skipPaywall$1.
// Returning Boolean.TRUE skips the paywall.
internal object SkipPaywallFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    custom = { method, classDef ->
        classDef.type != SKIP_PAYWALL_CONTINUATION && method.uses(Opcode.NEW_INSTANCE, SKIP_PAYWALL_CONTINUATION)
    },
)

// The app config's interstitialOffers are the upgrade screens shown between
// screens. The getter keeps its field name, which Moshi reads.
internal object InterstitialOffersFingerprint : Fingerprint(
    definingClass = FEATURES,
    returnType = "Ljava/util/List;",
    parameters = listOf(),
    custom = { method, _ ->
        method.implementation?.instructions?.any {
            it.opcode == Opcode.IGET_OBJECT &&
                ((it as ReferenceInstruction).reference as FieldReference).name == "interstitialOffers"
        } == true
    },
)

// The feed mapper (com.nba.nextgen.feed.cards.a in 1.3.0) turns FeedItems into
// cards, among them League Pass upsell banners, generic upsell banners, and
// League Pass promo cards. The extension drops those items first.
internal object FeedCardMapperFingerprint : Fingerprint(
    returnType = "Ljava/util/ArrayList;",
    parameters = listOf("Ljava/util/List;"),
    custom = { method, _ -> method.uses(Opcode.NEW_INSTANCE, UPSELL_BANNER_CARD) },
)

// The "Stream live games ... Subscribe" banner in Discover and the feed's
// upsell banners are drawn by one composable (com.nba.nextgen.compose.a.l in
// 1.3.0), the CTA banner for a product: (headline, subcopy, button text, logo
// URL, icon, background URL, color, NbaProduct, ...). It always sells a
// product, so returning before it composes anything removes every product
// banner and leaves no empty space.
internal object ProductBannerFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    custom = { method, _ ->
        method.parameterTypes.take(8) == listOf(
            "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;",
            "I", "Ljava/lang/String;", "J", NBA_PRODUCT,
        )
    },
)

@Suppress("unused")
val hideLeaguePassUpsellsPatch = bytecodePatch(
    name = "Hide League Pass upsells",
    description = "Skips the League Pass paywall after sign-in and removes League Pass upgrade screens and banners.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        SkipPaywallFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                return-object v0
            """,
        )

        InterstitialOffersFingerprint.method.addInstructions(
            0,
            """
                invoke-static { }, Ljava/util/Collections;->emptyList()Ljava/util/List;
                move-result-object v0
                return-object v0
            """,
        )

        ProductBannerFingerprint.method.addInstructions(0, "return-void")

        FeedCardMapperFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p1 .. p1 }, $LEAGUE_PASS_FILTER->filterFeed(Ljava/util/List;)Ljava/util/List;
                move-result-object p1
            """,
        )
    }
}
