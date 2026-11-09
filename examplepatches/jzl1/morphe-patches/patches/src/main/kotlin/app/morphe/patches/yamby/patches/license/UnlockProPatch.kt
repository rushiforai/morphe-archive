package lab.yamby.patches.license

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import lab.yamby.patches.shared.COMPATIBILITY_YAMBY

/**
 * Unlocks Yamby Pro features without a Play purchase.
 *
 * Yamby's visible Pro page is a Google Play Billing paywall, but the actual
 * feature gates are client-side:
 *
 *  - `C5804.m10560()` returns a locally stored 24-digit HMAC time code;
 *  - every gate checks that string with `AbstractC6399.m11663(...)`;
 *  - the list-animation gate additionally caches the result in
 *    `C2725.f13536`.
 *
 * This patch makes the three local checks permissive:
 *
 *  1. `C5804.<clinit>` writes a non-empty sentinel code through the native
 *     setter, so the `isBlank`/length guard passes on a clean install.
 *  2. `AbstractC6399.m11663` returns true unconditionally.
 *  3. `C2725.<clinit>` forces the cached animation flag true at the end of
 *     its static initializer.
 *
 * Play Billing is untouched; purchase/restore UI still behaves normally.
 */
@Suppress("unused")
val unlockProPatch = bytecodePatch(
    name = "Unlock Pro",
    description = "Unlocks all Yamby Pro features by seeding a local licence code, " +
        "making the client-side HMAC comparator accept it, and forcing the cached " +
        "list-animation entitlement flag. No Play purchase is required.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YAMBY)

    execute {
        // 1. Seed a non-empty code in the MMKV-backed settings singleton.
        val storeInitializer = LicenseStoreClassInitFingerprint.method
        storeInitializer.addInstructions(
            storeInitializer.implementation!!.instructions.size - 1,
            """
                sget-object v0, Lrc/ۥۖۗ۬۠ۤۜ;->ۥۖۙ۟ۙ:Lrc/ۥۖۗ۬۠ۤۜ;
                const-string v1, "000000000000000000000000"
                invoke-virtual {v0, v1}, Lrc/ۥۖۗ۬۠ۤۜ;->ۥۡۡ۠ۛۙ(Ljava/lang/String;)V
            """.trimIndent(),
        )

        // 2. Every licence gate funnels through this equality helper.
        LicenseHmacEqualsFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent(),
        )

        // 3. Override the list-animation flag after the original computation.
        val flagInitializer = ListAnimationProFlagClassInitFingerprint.method
        val instructionCount = flagInitializer.implementation!!.instructions.size
        flagInitializer.addInstructions(
            instructionCount - 1,
            """
                const/4 v0, 0x1
                sput-boolean v0, Lfd/ۥۗۛۗ۬ۡ;->ۥ۫ۨۘۦۨۦ:Z
            """.trimIndent(),
        )
    }
}