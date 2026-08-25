package app.mctoolbox.patches.installlocation

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.mctoolbox.patches.shared.Constants.COMPATIBILITY_MCTOOLBOX

private const val TOOLBOX_PACKAGE = "io.mrarm.mctoolbox"

/**
 * Toolbox for Minecraft PE — Always Valid Install Location
 *
 * The launcher verifies the Minecraft install by querying
 * PackageManager.getPackageInfo("com.mojang.minecraftpe"). When that lookup
 * fails (MCPE installed under a different location/package, split APKs not
 * visible, emulator setups) the app aborts with ErrorActivity("not_installed")
 * from three places; a strict supported-version list check (Li60.c) can also
 * reject valid installs with "not_supported".
 *
 * Two-layer fix, verified against 5.4.58 smali:
 *
 * 1. Package lookup redirect — the single const-string
 *    "com.mojang.minecraftpe" at the top of MinecraftActivity.onCreate and
 *    RelaunchActivity.onCreate is replaced with the Toolbox package name.
 *    PackageManager can always resolve the app's own package, so the lookup
 *    never throws, V/PackageInfo stays non-null and every downstream use of
 *    it remains consistent. The NameNotFoundException handlers become
 *    unreachable dead code.
 *
 * 2. Supported-version force — right after the first Li60.c(versionName, Z)
 *    result in both onCreate methods, the result register is overwritten with
 *    1, so the version gate always passes regardless of which MCPE build is
 *    detected. Register choice verified: MA uses v5, RelaunchActivity uses v5;
 *    in both methods the register is written by move-result immediately prior
 *    and re-read only by the following if-nez, so clobbering it is safe.
 */
@Suppress("unused")
val minecraftLocationCheckPatch = bytecodePatch(
    name = "Toolbox Always Valid Install Location",
    description = "The Minecraft installation check always succeeds: package lookups resolve to the app itself, and both the generic and the 32/64-bit supported-version gates accept any version (no more \"Unsupported 64-bit Minecraft\").",
    default = true
) {
    compatibleWith(COMPATIBILITY_MCTOOLBOX)

    execute {
        // 1a. MinecraftActivity: swap the queried package name (register v0).
        McPackageLookupFingerprint.method.apply {
            val idx = McPackageLookupFingerprint.instructionMatches[0].index
            removeInstructions(idx, 1)
            addInstructions(idx, """
                const-string v0, "$TOOLBOX_PACKAGE"
            """.trimIndent())
        }

        // 1b. RelaunchActivity: same swap (register v3).
        RelaunchPackageLookupFingerprint.method.apply {
            val idx = RelaunchPackageLookupFingerprint.instructionMatches[0].index
            removeInstructions(idx, 1)
            addInstructions(idx, """
                const-string v3, "$TOOLBOX_PACKAGE"
            """.trimIndent())
        }

        // 2a. MinecraftActivity: first i60.c() call → force true (v5).
        McSupportedVersionFingerprint.method.addInstructions(
            McSupportedVersionFingerprint.instructionMatches[0].index + 2,
            """
                const/4 v5, 0x1
            """.trimIndent()
        )

        // 2b. RelaunchActivity: same force (v5).
        RelaunchSupportedVersionFingerprint.method.addInstructions(
            RelaunchSupportedVersionFingerprint.instructionMatches[0].index + 2,
            """
                const/4 v5, 0x1
            """.trimIndent()
        )

        // 2c. MinecraftActivity ABI-aware gates (64-bit / 32-bit errors):
        // force the Li60.c() result of BOTH gate sites to 1 so any MCPE
        // version passes after the 64-bit relaunch as well. Insertions are
        // done in descending match order because each insert shifts the
        // instruction offsets of everything after it.
        val abiGate = McAbiVersionGateFingerprint
        abiGate.instructionMatches
            .map { it.index }
            .sortedDescending()
            .forEach { idx ->
                abiGate.method.addInstructions(idx + 2, """
                    const/4 v5, 0x1
                """.trimIndent())
            }
    }
}
