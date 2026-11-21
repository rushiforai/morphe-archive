package patches.indrive

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

/*
 * inDrive does not render Google's ads directly from its own UI code — every Google placement
 * (banner, native/video card, interstitial, carousel) is brokered by inDrive's own "promo platform"
 * module, which asks Google's Mobile Ads SDK for a creative only when a set of *feature toggles*
 * say so. Those toggles are real, server-driven production switches: inDrive ships them so a region
 * (or a single placement) can have Google ads turned off remotely without an app release.
 *
 * So the kill switch already exists in the app — it just answers "on" by default. This patch makes
 * the app answer "off" for every Google-Ads toggle, which puts the app on its own supported
 * ads-off code path instead of inventing a hook: the promo platform skips the ad request entirely,
 * so there is no creative to render and no ad-load failure to crash on.
 *
 * Where it is applied matters. Rather than neutralizing the ~30 call sites that read these toggles
 * (each one a chance to miss the placement the user is actually seeing), the patch hooks the single
 * resolver every read goes through — the feature-toggle repository's boolean accessor
 *     c(<Toggle>;Z)Z      // resolve(toggle, default)
 * and returns `false` when the toggle handed in is one of the Google Ads ones. One injection point
 * therefore covers every placement and every future placement, including reads made directly by the
 * ad-delivery coroutine rather than through the promo platform helpers.
 *
 * Deliberately NOT touched:
 *  - `PROMO_PLATFORM_MAIN_GATE_ENABLED` (the promo platform as a whole) and
 *    `PROMO_PLATFORM_MAIN_GATE_PROMO_ENABLED` — those gate inDrive's own promo/coupon surfaces,
 *    which are not ads and are not what was asked for.
 *  - `PROMO_ADS_PANGLE_DISABLED` — that toggle is inverted ("isDisabled", default true); forcing it
 *    false would *enable* a network rather than disable one.
 *  - the manifest's Google Ads application id: removing it converts "no ads" into an
 *    IllegalStateException on the first ad call, i.e. a crash on the screen that used to show an ad.
 *
 * The toggle objects are compared by identity against the public singleton accessors, so the patch
 * depends only on `PromoPlatformToggleConstants` — a non-obfuscated, published API-module class —
 * and not on any R8-renamed helper name.
 */

/** Non-obfuscated holder of every promo-platform toggle (published `:api` module). */
private const val TOGGLE_CONSTANTS =
    "Lsinet/startup/inDriver/feature/promo_platform/api/data/PromoPlatformToggleConstants;"

/** The accessor every toggle read funnels through: `resolve(toggle, default): Boolean`. */
private const val TOGGLE_RESOLVER =
    "Lsinet/startup/inDriver/core/feature_toggles/impl/data/repository/ft/a;"

/**
 * Google Ads toggles, by the public getter that returns the singleton instance.
 *
 * All of these default to enabled in the app and all of them are Google-ad-format or
 * Google-ad-delivery switches. Anything whose description is not explicitly a Google Ads /
 * `promo_ads_*` concern is left alone.
 */
private val GOOGLE_ADS_TOGGLE_GETTERS = listOf(
    // "Promo platform Google Ads enabler" — the master Google Ads switch.
    "getPROMO_PLATFORM_GOOGLE_ADS_STATUS",
    // `isGoogleAdsAvailable` — whether the Google ad format is offered at all.
    "getPROMO_PLATFORM_MAIN_GATE_ADS_ENABLED",
    // "Google Ads Interstitial isEnabled".
    "getPROMO_PLATFORM_INTERSTITIAL_ENABLED",
    // "First Look Google Ads prefetching" — ads fetched ahead of being shown.
    "getPROMO_PLATFORM_ADS_PREFETCHING_STATUS",
    // "Google Native Advanced Banner".
    "getPROMO_ADS_NATIVE_ADVANCED_ENABLED",
    // "Google Custom Native Banner" — the in-ride card format in the report.
    "getPROMO_ADS_CUSTOM_NATIVE_ENABLED",
    // "Google adaptive Banner".
    "getPROMO_ADS_ADAPTIVE_ENABLED",
    // "Google Ads Carousel Banner".
    "getPROMO_ADS_CAROUSEL_ENABLED",
    // "Google Ads first look enabler".
    "getPROMO_ADS_FIRST_LOOK_STATUS",
    // "Google Ads Dynamic Feature install enabler" — the on-demand ads module.
    "getPROMO_ADS_DYNAMIC_FEATURE_STATUS",
    // "Google Ads custom key-value targeting" — pointless once nothing is requested.
    "getPROMO_ADS_TARGETING_STATUS",
)

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Removes inDrive's Google ads — the banner, the card shown during and after a " +
        "ride, and the full-screen ones — by switching the app's own Google Ads enable flags off, " +
        "so it never asks Google for an ad. Rides, chat, payments and inDrive's own promo codes " +
        "keep working.",
) {
    compatibleWith(COMPATIBILITY_INDRIVE)

    execute {
        val resolver = mutableClassDefByOrNull(TOGGLE_RESOLVER)
            ?: error("inDrive feature-toggle repository not found — package renamed?")

        // Exactly one c(L…;Z)Z must exist. If R8 ever reuses the name for a second overload (or
        // `ft/a` becomes a different class), refuse to patch rather than guess which one it is.
        val candidates = resolver.methods.filter { m ->
            m.name == "c" && m.returnType == "Z" && m.parameterTypes.size == 2 &&
                m.parameterTypes[0].startsWith("L") && m.parameterTypes[1].toString() == "Z"
        }
        check(candidates.size == 1) {
            "expected exactly one toggle resolver c(<Toggle>;Z)Z in $TOGGLE_RESOLVER, " +
                "found ${candidates.size}"
        }
        val method = candidates.single()

        // The toggle interface is R8-renamed and its name changes between inDrive releases
        // (Lyge1$b on 5.188.0, Lquf1$b on 5.189.0, Lfwk1$b on 5.193.0), so the value getters —
        // and the type the injected call must name — are taken from the resolver's own
        // signature, never written out by hand. That is what keeps this patch working across
        // releases.
        val toggleType = method.parameterTypes[0].toString()

        // Prove every reference the injected code makes exists in *this* APK with exactly the
        // shape the call names. The injection runs on every toggle read in the app, so a getter
        // that was renamed, dropped or retyped in a future release would not fail quietly: it
        // would throw NoSuchMethodError on the first toggle read and crash the app at startup.
        // Failing here instead turns that into a clear patch-time error. (Read-only lookup, so
        // the constants class is not added to the set of modified classes.)
        val constants = classDefByOrNull(TOGGLE_CONSTANTS)
            ?: error("$TOGGLE_CONSTANTS not found — promo platform API renamed?")
        check(
            constants.fields.any { f ->
                f.name == "INSTANCE" && f.type == TOGGLE_CONSTANTS &&
                    AccessFlags.STATIC.isSet(f.accessFlags)
            },
        ) { "$TOGGLE_CONSTANTS has no static INSTANCE field" }
        GOOGLE_ADS_TOGGLE_GETTERS.forEach { getter ->
            val present = constants.methods.any { m ->
                m.name == getter && m.parameterTypes.isEmpty() && m.returnType == toggleType &&
                    !AccessFlags.STATIC.isSet(m.accessFlags)
            }
            check(present) { "$TOGGLE_CONSTANTS->$getter()$toggleType is not in this APK" }
        }

        // Every parameter register is spoken for by p0/p1/p2; at method entry no local is
        // initialized (the verifier guarantees the original body writes each one before reading),
        // so the last local is free to clobber. One register is enough for the whole chain.
        val registers = method.implementation?.registerCount
            ?: error("toggle resolver has no method body")
        val locals = registers - 3
        check(locals >= 1) { "resolver has no spare local register (locals=$locals)" }
        val scratch = "v${locals - 1}"

        // if (toggle === <google ads toggle>) return false;   — repeated per toggle, then fall
        // through to the original resolution.
        val body = buildString {
            GOOGLE_ADS_TOGGLE_GETTERS.forEachIndexed { i, getter ->
                appendLine("    sget-object $scratch, $TOGGLE_CONSTANTS->INSTANCE:$TOGGLE_CONSTANTS")
                appendLine("    invoke-virtual {$scratch}, $TOGGLE_CONSTANTS->$getter()$toggleType")
                appendLine("    move-result-object $scratch")
                // Branch *away* when the toggle is not this one. An `if-eq` here inverts the
                // guard: any toggle that is not this one falls through to `return false`, and a
                // Google Ads toggle only skips its own guard before the next one returns false.
                // The result was that every feature toggle in the app read false (which hid the
                // fare +/- stepper and broke order creation), not only the ads ones.
                appendLine("    if-ne p1, $scratch, :indrive_ads_on_$i")
                appendLine("    const/4 $scratch, 0x0")
                appendLine("    return $scratch")
                appendLine("    :indrive_ads_on_$i")
            }
        }

        method.addInstructions(0, body)
        println(
            "indrive remove-ads: ${GOOGLE_ADS_TOGGLE_GETTERS.size} Google Ads toggles forced off " +
                "at the toggle resolver ($TOGGLE_RESOLVER, scratch=$scratch)",
        )
    }
}
