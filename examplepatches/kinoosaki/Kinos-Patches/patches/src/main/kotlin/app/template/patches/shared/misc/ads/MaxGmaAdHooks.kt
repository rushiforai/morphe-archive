package app.template.patches.shared.misc.ads

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.returnEarly
import app.template.patches.shared.addInstructionChecked
import app.template.patches.shared.addInstructionsChecked
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

// Public load/show surface of Google Mobile Ads and AppLovin MAX, shared by the Disable ads
// patches of apps that mediate through both (Castbox, Podcast Republic, Pi Music Player). R8
// keeps these public library names, so they are the stable anchors. The maps list every hook
// as mandatory: neuterAdHooks fails the patch when a class or a concrete void is missing,
// instead of silently skipping it (the old "AdView" entry matched nothing, because loadAd lives
// on BaseAdView and AdManagerAdView).

private const val GMA = "Lcom/google/android/gms/ads/"
private const val MAX = "Lcom/applovin/mediation/"

/** GMA's rewarded loader; Pi Music Player reports a failed load instead of a silent no-op. */
const val GMA_REWARDED_AD = "${GMA}rewarded/RewardedAd;"

/** AppLovin MAX banner/MREC view. */
const val MAX_AD_VIEW = "${MAX}ads/MaxAdView;"

/** Every GMA banner, native and full-screen load entry point. */
val GMA_LOAD_HOOKS: Map<String, Set<String>> = mapOf(
    // Banners: AdView has no loadAd of its own; AdManagerAdView has a separate
    // loadAd(AdManagerAdRequest) that does not call super.
    GMA + "BaseAdView;" to setOf("loadAd"),
    GMA + "admanager/AdManagerAdView;" to setOf("loadAd"),
    // Native ads.
    GMA + "AdLoader;" to setOf("loadAd", "loadAds"),
    // Full-screen formats: static load(...) on abstract classes (the abstract show()
    // members are filtered out by the implementation check).
    GMA + "interstitial/InterstitialAd;" to setOf("load"),
    GMA + "admanager/AdManagerInterstitialAd;" to setOf("load"),
    GMA_REWARDED_AD to setOf("load"),
    GMA + "rewardedinterstitial/RewardedInterstitialAd;" to setOf("load"),
    GMA + "appopen/AppOpenAd;" to setOf("load"),
)

/**
 * Every AppLovin MAX load/show entry point. The terminal interstitial overload is
 * showAd(String, String, Activity), so every concrete showAd is patched, not just the first.
 * startAutoRefresh is patched too, so a banner slot never schedules a refresh load.
 */
val MAX_LOAD_SHOW_HOOKS: Map<String, Set<String>> = mapOf(
    MAX_AD_VIEW to setOf("loadAd", "startAutoRefresh"),
    MAX + "ads/MaxInterstitialAd;" to setOf("loadAd", "showAd"),
    MAX + "ads/MaxRewardedAd;" to setOf("loadAd", "showAd"),
    MAX + "ads/MaxAppOpenAd;" to setOf("loadAd", "showAd"),
    MAX + "nativeAds/MaxNativeAdLoader;" to setOf("loadAd"),
)

/**
 * Makes every concrete void method named in [hooks] return at once. Mandatory: a missing class,
 * or a name with no concrete void implementation on it, fails the patch.
 */
fun BytecodePatchContext.neuterAdHooks(hooks: Map<String, Set<String>>) {
    for ((owner, names) in hooks) {
        val methods = mutableClassDefByOrNull(owner)?.methods
            ?: throw PatchException("Disable ads: $owner not found")

        for (name in names) {
            // returnEarly() is void-only and NPEs on abstract declarations.
            val targets = methods.filter {
                it.name == name && it.returnType == "V" && it.implementation != null
            }
            if (targets.isEmpty()) {
                throw PatchException("Disable ads: no concrete void $owner->$name")
            }
            targets.forEach { it.returnEarly() }
        }
    }
}

/**
 * Keeps every MaxAdView GONE, so an unfilled banner slot leaves no empty box. With its loads
 * neutered the view never fills, but apps still size it (match_parent in a FrameLayout, a
 * 50dp strip) and set it VISIBLE themselves (Castbox's banner helper does, right after loadAd).
 * Two parts, both on the SDK's public class:
 * 1. setVisibility(I) always passes GONE to the superclass (overridden when MaxAdView does not
 *    declare it, which is the case in every app seen so far).
 * 2. Every constructor ends with setVisibility(GONE), because a View starts out VISIBLE and
 *    nothing may ever call setVisibility on it. Each return-void is replaced in place by the
 *    const, so a branch that jumps to the return still runs the hide.
 */
fun BytecodePatchContext.hideMaxAdView() {
    val adView = mutableClassDefBy(MAX_AD_VIEW)

    // 1. setVisibility(I) forces GONE.
    val existing = adView.methods.firstOrNull {
        it.name == "setVisibility" && it.returnType == "V" &&
            it.parameterTypes.map(CharSequence::toString) == listOf("I")
    }
    if (existing != null) {
        if (existing.implementation == null) {
            throw PatchException("Disable ads: $MAX_AD_VIEW->setVisibility(I) has no implementation")
        }
        existing.addInstructionChecked(0, "const/16 p1, 0x8")
    } else {
        val superclass = adView.superclass
            ?: throw PatchException("Disable ads: $MAX_AD_VIEW has no superclass")
        adView.methods.add(
            ImmutableMethod(
                MAX_AD_VIEW,
                "setVisibility",
                listOf(ImmutableMethodParameter("I", null, null)),
                "V",
                AccessFlags.PUBLIC.value,
                null,
                null,
                MutableMethodImplementation(2),
            ).toMutable().apply {
                addInstructionsChecked(
                    0,
                    """
                        const/16 p1, 0x8
                        invoke-super {p0, p1}, $superclass->setVisibility(I)V
                        return-void
                    """.trimIndent(),
                )
            },
        )
    }

    // 2. Every constructor hides the view on its way out. p1 (every MaxAdView constructor
    // takes at least one non-wide argument) is dead at return-void, so it carries GONE.
    val constructors = adView.methods.filter { it.name == "<init>" && it.implementation != null }
    if (constructors.isEmpty()) throw PatchException("Disable ads: $MAX_AD_VIEW has no constructor")
    for (constructor in constructors) {
        if (constructor.parameterTypes.firstOrNull()?.toString() in listOf(null, "J", "D")) {
            throw PatchException("Disable ads: $MAX_AD_VIEW constructor has no narrow p1")
        }
        val returns = constructor.instructions
            .withIndex()
            .filter { it.value.opcode == Opcode.RETURN_VOID }
            .map { it.index }
        if (returns.isEmpty()) throw PatchException("Disable ads: $MAX_AD_VIEW constructor has no return-void")
        for (index in returns.asReversed()) {
            // The replacement keeps the return's labels, so every path into it is hidden too.
            constructor.addInstructionsChecked(
                index + 1,
                """
                    invoke-virtual {p0, p1}, $MAX_AD_VIEW->setVisibility(I)V
                    return-void
                """.trimIndent(),
            )
            constructor.replaceInstruction(index, "const/16 p1, 0x8")
        }
    }
}
