package app.template.patches.example

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * See:
 * https://github.com/MorpheApp/morphe-patcher/blob/main/docs
 * https://github.com/MorpheApp/morphe-patcher/blob/main/docs/2_2_1_fingerprinting.md
 *
 * Declaring fingerprints as objects is not required, but if a fingerprint fails
 * to match then the exception stack trace will include the fingerprint name.
 */
private const val ADVERT_DECISION_CHAIN = "Lhu/innoid/idokepv3/advert/AdvertDecisionChain;"

/**
 * AdvertDecisionChain.decide(type) is the central gate that decides whether an
 * ad of a given type should be shown. The list/interstitial/splash/etc.
 * decisions (decideOnList) and shouldShowStepAd() all route through it, so
 * forcing it to return false disables those ads.
 */
object DecideFingerprint : Fingerprint(
    definingClass = ADVERT_DECISION_CHAIN,
    name = "decide",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    // The single parameter is an obfuscated enum type (e.g. Lfc/a;) whose name
    // changes between app targets, so match it using the object type only.
    parameters = listOf("L"),
)

/**
 * AdvertDecisionChain.decideOnClothes() is a separate ad decision path that is
 * called directly (not routed through decide()), so it needs its own override.
 */
object DecideOnClothesFingerprint : Fingerprint(
    definingClass = ADVERT_DECISION_CHAIN,
    name = "decideOnClothes",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList(),
)
