package me.toidicakhia.patches.proxyman

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import me.toidicakhia.patches.shared.Constants.PROXYMAN_COMPATIBILITY

@Suppress("unused")
val proxymanUnlockProPatch = bytecodePatch(
    name = "Unlock Pro",
    description = "Unlocks Pro: unlimited SSL proxying entries, filters, pinning, block/map/rewrite " +
        "and breakpoint rules, the advanced body editor, Compose entries, Live Update and the " +
        "widget. Also bypasses the PairIP license check so the repacked app starts.",
    default = true
) {
    compatibleWith(PROXYMAN_COMPATIBILITY)

    execute {
        // ── PairIP ────────────────────────────────────────────────────────────
        // The manifest Application and the license content provider both start
        // the check. A repacked APK is no longer a Play installation, so the
        // check would close the app or open the license activity.
        PairIpCheckLicenseFingerprint.match().method.addInstructions(0, "return-void")
        PairIpInitializeLicenseCheckFingerprint.match().method.addInstructions(0, "return-void")

        // ── Unlock Pro ────────────────────────────────────────────────────────
        // Every cached, restored and freshly verified entitlement is built
        // through LicenseEntitlement's primary constructor. Force the premium
        // flag and an active lifetime plan before the fields are written, so
        // all feature gates and the Pro screen see an active subscription.
        val entitlementClass = LicenseEntitlementToStringFingerprint.match().classDef
        val constructor = entitlementClass.methods.singleOrNull {
            it.name == "<init>" &&
                it.returnType == "V" &&
                it.parameterTypes.size == 6
        } ?: throw PatchException("LicenseEntitlement primary constructor not found")

        constructor.addInstructions(
            0,
            """
                const/4 p1, 0x1
                sget-object p2, Ly9/d;->d:Ly9/d;
                sget-object p5, Ly9/c;->c:Ly9/c;
            """.trimIndent()
        )
    }
}
