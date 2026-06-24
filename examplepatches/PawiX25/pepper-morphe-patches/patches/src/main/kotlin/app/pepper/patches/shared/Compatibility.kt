package app.pepper.patches.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/**
 * All Pepper.com Group / TippingCanoe sister apps that share the same
 * obfuscated codebase. Every fingerprint string and class name used by the
 * patches in this module matches identically across the family.
 *
 * `targets = listOf(AppTarget(version = null))` declares "any version" —
 * fingerprints in this bundle handle all version drift dynamically, so
 * pinning to specific `AppTarget(version = "x.y.z")` rows here would only
 * cause Morphe Manager to hide working patches for newer builds.
 * (`emptyList()` is rejected at patch-load time with
 * `IllegalArgumentException("Must declare at least one app target")`.)
 */
private fun pepperVariant(name: String, packageName: String) = Compatibility(
    name = name,
    packageName = packageName,
    targets = listOf(AppTarget(version = null)),
)

val PEPPER_PL = pepperVariant("Pepper PL", "com.tippingcanoe.pepperpl")
val PEPPER_NL = pepperVariant("Pepper NL", "com.tippingcanoe.peppernl")
val MYDEALZ = pepperVariant("Mydealz", "com.tippingcanoe.mydealz")
val HUKD = pepperVariant("HotUKDeals", "com.tippingcanoe.hukd")
val PROMODESCUENTOS = pepperVariant("PromoDescuentos", "com.tippingcanoe.promodescuentos")
val CHOLLOMETROS = pepperVariant("Chollometros", "com.chollometro")
val DEALABS = pepperVariant("Dealabs", "com.dealabs.apps.android")
val PREISJAEGER = pepperVariant("Preisjäger", "com.preisjaeger")
val PEPPERDEALS_US = pepperVariant("Pepper.com", "com.pepperdeals")
val PEPPER_SE = pepperVariant("Pepper SE", "se.pepperdeals")

/** Whole family — use with `compatibleWith(*PEPPER_FAMILY)`. */
val PEPPER_FAMILY: Array<Compatibility> = arrayOf(
    PEPPER_PL,
    PEPPER_NL,
    MYDEALZ,
    HUKD,
    PROMODESCUENTOS,
    CHOLLOMETROS,
    DEALABS,
    PREISJAEGER,
    PEPPERDEALS_US,
    PEPPER_SE,
)
