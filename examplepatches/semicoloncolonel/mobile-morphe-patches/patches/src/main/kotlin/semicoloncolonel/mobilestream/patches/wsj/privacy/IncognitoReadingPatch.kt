package semicoloncolonel.mobilestream.patches.wsj.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly
import semicoloncolonel.mobilestream.patches.shared.privacy.enableIncognitoReading
import semicoloncolonel.mobilestream.patches.wsj.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Incognito reading (OPT-IN, default OFF). WSJ 15.12.0 and 15.13.0.
//
// Keeps which articles you read away from the Journal's recommendation and
// offer services, while articles, sign-in, the paywall and push alerts keep
// working. It includes Block analytics & tracking (Adobe, AppsFlyer, Braze,
// comScore, LiveRamp, Parse.ly, Permutive, Snowplow, Firebase and others).
//
// - Piano's inline article experience: each article asked Piano (the paywall
//   and offer platform) for an in-article offer, sending the reader's Piano
//   token, the section and the article's tags. It is no longer requested.
//   The roadblock that Piano draws for readers without access is a separate
//   request and is not changed; the Journal sends those readers only a
//   preview of the article, so the paywall does not depend on Piano.
// - Cxense recommendations: the related-articles query sent the article URL
//   and the reader's Cxense ID through the Journal's GraphQL service. It now
//   sends neither, so the recommendations are general ones.
// ─────────────────────────────────────────────────────────────────────────────

private object PianoInlineExperienceFingerprint : Fingerprint(
    definingClass = "Lcom/dowjones/paywall/piano/repository/DjPianoRepository;",
    name = "requestArticleInlineExperience",
    returnType = "V",
)

// getThenFetchRecommendationsAsFlow(articleUrl, CxenseChannelInput, cxenseId).
private object CxenseRecommendationsFingerprint : Fingerprint(
    definingClass = "Lcom/dowjones/network/DJGraphQLClient;",
    name = "getThenFetchRecommendationsAsFlow",
    returnType = "Lkotlinx/coroutines/flow/Flow;",
    custom = { method, _ -> method.parameterTypes.size == 3 },
)

@Suppress("unused")
val incognitoReadingPatch = bytecodePatch(
    name = "Incognito reading",
    description = "Experimental. Stops the app from sending which articles you read to the Journal's recommendation and offer services. Includes Block analytics & tracking.",
    default = false,
) {
    category("Privacy")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(blockAnalyticsPatch)

    extendWith("extensions/extension.mpe")

    execute {
        enableIncognitoReading()

        PianoInlineExperienceFingerprint.methodOrNull?.returnEarly("return-void")
            ?: throw PatchException("Piano inline experience request not found")

        // p1 is the article URL (non-null, so it becomes ""), p3 the Cxense ID.
        CxenseRecommendationsFingerprint.methodOrNull?.addInstructions(
            0,
            """
                const-string p1, ""
                const/16 p3, 0x0
            """.trimIndent(),
        ) ?: throw PatchException("Cxense recommendations query not found")
    }
}
