package app.template.patches.universal.root

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.returnEarly

/*
 * Adapted from kveld's universal patch set (morphe community patches, GPLv3) —
 * `universal/UniversalDisableRootChecksPatch.kt`. Re-implemented against this repo's
 * helpers; the target set and the "only void of state, never equals()" rule are kept.
 */

/** The RootBeer library — the most common root check bundled by third-party apps. */
private val ROOTBEER_CLASSES = listOf(
    "Lcom/scottyab/rootbeer/RootBeer;",
    "Lcom/scottyab/rootbeer/RootBeerNative;",
)

/**
 * Neutralises the common **RootBeer** root-detection library for any app that bundles it.
 *
 * Every no-argument `boolean` method on those two classes is forced to `false` — that covers
 * `isRooted()`, `isRootedWithoutBusyBoxCheck()`, `detectRootManagementApps()`, the per-check
 * `detect*()` methods and the native `checkForRootNative()`/`rootDetectionCheckNative()`.
 *
 * `equals()` is excluded (it is a `boolean` method but not a detection result), and only
 * methods with a body are touched, so abstract declarations in the interface implementation
 * stay intact.
 *
 * Deliberately **not** fail-closed: an app that does not bundle RootBeer is a normal,
 * successful outcome for a universal patch — it reports that it found nothing instead of
 * failing the build. Apps with their own hand-rolled checks need their own patch.
 */
@Suppress("unused")
val universalDisableRootChecksPatch = bytecodePatch(
    name = "Disable root checks (RootBeer)",
    description = "Forces the RootBeer library's detection methods to report a non-rooted " +
        "device, for apps that use it to refuse to run. Only affects RootBeer; app-specific " +
        "root checks are not covered.",
    default = false,
) {
    execute {
        var classesFound = 0
        var patched = 0

        ROOTBEER_CLASSES.forEach { descriptor ->
            val classDef = mutableClassDefByOrNull(descriptor) ?: return@forEach
            classesFound++
            classDef.methods
                .filter { it.returnType == "Z" && it.name != "equals" && it.implementation != null }
                .forEach { method ->
                    method.returnEarly(false)
                    patched++
                }
        }

        when {
            classesFound == 0 -> println("Disable root checks: RootBeer not bundled — nothing to do.")
            patched == 0 -> println("Disable root checks: RootBeer present but no detection methods matched.")
            else -> println("Disable root checks: neutralised $patched RootBeer detection method(s).")
        }
    }
}
