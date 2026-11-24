package app.morphe.patches.meitu.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.patch.mutableClassDefBy

/**
 * Forces the client-side VIP state.
 *
 * The VIP decision lives in `com.meitu.vip.util.XXVipUtil`:
 * - `isVip()` (x0) checks module type then `isValidUser()` (w0)
 * - `getVipType()` (m0) returns cached `F` field or reads SP `sp_key_subscribe_type`
 * - Static fields `E` (isValidUser) and `F` (vipType) are set by `h1()`/`d1()`
 *
 * This patch forces all VIP checks to return true/1 AND initializes the static
 * VIP state fields (E=1, F=1) in the class initializer so the app starts with
 * VIP state without needing SP initialization or network calls.
 *
 * Server-driven rights (per-material entitlements and AIGC quotas) still come from the
 * network and are not covered here.
 */
@Suppress("unused")
val unlockVipPatch = patch(
    name = "Unlock VIP",
    description = "Reports an active VIP subscriber: isVip() returns true, isValidUser() returns 1, " +
        "getVipType() returns 1 and VIP trial materials count as unlocked. " +
        "Static fields E (isValidUser) and F (vipType) are initialized to 1. " +
        "Server-side per-material rights and AIGC quotas are not affected.",
    default = true,
) {
    category("Premium")
    compatibleWith(*AppCompatibilities.meitu())

    execute {
        // Patch isVip() (x0) to always return true
        IsVipFingerprint.method.apply {
            addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """,
            )
        }

        // Patch isValidUser() (w0) to always return 1
        ValidUserFingerprint.method.apply {
            addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """,
            )
        }

        // Patch getVipType() (m0) to always return 1
        VipTypeFingerprint.method.apply {
            addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """,
            )
        }

        // Patch isVipTrialMaterial() (y0) to always return true
        TrialMaterialFingerprint.method.apply {
            addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """,
            )
        }

        // Also initialize static VIP state fields E and F to 1 in <clinit>
        // This ensures the app starts with VIP state even before any method is called
        mutableClassDefBy("Lcom/meitu/vip/util/XXVipUtil;").apply {
            // Find <clinit> and add initialization of E=1 and F=1 at the end
            val clinit = methods.first { it.name == "<clinit>" }
            val insertIndex = clinit.instructions.size
            clinit.addInstructions(
                insertIndex, // Insert at end of <clinit>
                """
                    const/4 v0, 0x1
                    sput v0, Lcom/meitu/vip/util/XXVipUtil;->E:I
                    const/4 v0, 0x1
                    sput v0, Lcom/meitu/vip/util/XXVipUtil;->F:I
                """,
            )
        }
    }
}
