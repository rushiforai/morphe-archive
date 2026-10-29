package app.masajid.patches.security

import app.masajid.patches.shared.Constants
import app.masajid.patches.shared.renameStringLiteral
import app.masajid.patches.shared.returnFalse
import app.morphe.patcher.patch.bytecodePatch

/**
 * The Dart side does not only read the `checkMockLocation` method channel; location
 * plugins ship the mock flag inside their position maps, and the app also probes the
 * `android:mock_location` app-op.
 *
 * Renaming the exact literals is the most obfuscation-proof approach: the Dart lookup
 * misses `is_mocked` / `isMock` entirely, and `AppOpsManager.checkOp` throws on the
 * unknown op name — which the app's own try/catch already turns into false.
 */
@Suppress("unused")
val bypassMockLocationPatch = bytecodePatch(
    name = "Bypass mock-location detection",
    description = "Renames the mock-location feature keys so a simulated GPS position is not flagged.",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY_MASAJID)

    execute {
        // Keys consumed by the Flutter location plugins.
        renameStringLiteral("is_mocked", "is_mocked_disabled")
        renameStringLiteral("isMock", "isMock_disabled")

        // AppOps op name used by the app-level mock-location check.
        renameStringLiteral("android:mock_location", "android:mock_location_disabled")

        // Belt-and-suspenders: force the boolean detectors to false. Class names are
        // obfuscated and verified on 1.0.1; the literal rename above is the resilient part.
        listOf(
            "Lsa/gov/moia/beneficiaryapp/MainActivity;",
            "Lb3/v;",
            "Lb3/u;",
            "Ld0/a;",
            "Lh6/a;",
        ).forEach { type ->
            mutableClassDefByOrNull(type)
                ?.methods?.filter { it.returnType == "Z" }?.forEach { it.returnFalse() }
        }
    }
}
