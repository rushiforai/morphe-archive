package app.template.patches.protonvpn.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.protonvpn.NetShieldGetAdsAndTrackersBlocking
import app.template.patches.protonvpn.NetShieldGetAdultContentBlocking
import app.template.patches.protonvpn.NetShieldGetMalwareBlocking
import app.template.patches.protonvpn.VpnInfoGetExpirationTime
import app.template.patches.protonvpn.VpnInfoGetMaxConnect
import app.template.patches.protonvpn.VpnInfoGetMaxTier
import app.template.patches.protonvpn.VpnInfoGetNetShield
import app.template.patches.protonvpn.VpnInfoGetPlanDisplayName
import app.template.patches.protonvpn.VpnInfoGetTierName
import app.template.patches.protonvpn.VpnInfoResponseGetDelinquent
import app.template.patches.protonvpn.VpnInfoResponseGetSubscribed
import app.template.patches.shared.Constants.PROTON_VPN_COMPATIBILITY
import app.template.patches.shared.clearBody
import app.template.patches.shared.returnEarly

/**
 * Unlocks every **client-side** Proton Plus feature by making the app build a Plus
 * VPN-user entity, instead of forcing a single derived boolean (the community patch).
 *
 * The app maps its login response to the `eg.a` VPN-user entity in exactly one place
 * (`me/proton/core/presentation/utils/x.N`). That mapper reads a handful of getters, so
 * overriding **those** makes the whole app — settings screens, feature availability and
 * the connection/device limit — see a Plus account consistently:
 *
 *  - `VpnInfoResponse.getSubscribed()`  → 1,
 *  - `VpnInfoResponse.getDelinquent()`  → 0 (a delinquent flag can lock features),
 *  - `VPNInfo.getMaxTier()`             → `Integer.valueOf(2)` (`eg.a.d()` == `maxTier >= 2` ⇒ Plus),
 *  - `VPNInfo.getMaxConnect()`          → 10 (Plus device/connection allowance),
 *  - `VPNInfo.getTierName()`/`getPlanDisplayName()` → "plus" / "Proton Plus",
 *  - `VPNInfo.getExpirationTime()`      → `Int.MAX_VALUE` (never expired),
 *  - `VPNInfo.getNetShield()` + the three `NetShieldConfig` getters → all levels available.
 *
 * Honest limits: Proton enforces plan on its **servers** — Plus-only server countries,
 * Secure Core/Tor back-ends and P2P availability are decided backend-side, so the client
 * can expose and select them, but a free account may still be refused when connecting.
 * This patch unlocks what the client controls.
 */
@Suppress("unused")
val unlockProtonPlusFeaturesPatch = bytecodePatch(
    name = "Unlock Proton Plus features",
    description = "Makes the client treat the account as Proton Plus: unlocks the " +
        "settings features, NetShield levels and the connection limit. Server-side " +
        "plan enforcement (Plus-only servers) cannot be changed by a client patch.",
    default = true,
) {
    category("Premium")
    compatibleWith(PROTON_VPN_COMPATIBILITY)

    val unlockPlusFeatures by booleanOption(
        key = "protonUnlockPlusFeatures",
        default = true,
        title = "Unlock Proton Plus features",
        description = "Treat the account as Proton Plus in the client (features, " +
            "NetShield levels and the device/connection limit).",
    )

    execute {
        if (unlockPlusFeatures != true) return@execute

        // Subscription / account state.
        VpnInfoResponseGetSubscribed.method.returnEarly(1)
        VpnInfoResponseGetDelinquent.method.returnEarly(0)
        VpnInfoGetExpirationTime.method.returnEarly(Int.MAX_VALUE)

        // Plan identity — eg.a.b() falls back to "free" when tierName is null.
        VpnInfoGetTierName.method.returnEarly("plus")
        VpnInfoGetPlanDisplayName.method.returnEarly("Proton Plus")

        // Device/connection allowance (Proton Plus allows 10).
        VpnInfoGetMaxConnect.method.returnEarly(10)

        // maxTier is a nullable Integer: tier >= 2 is what eg.a.d() treats as Plus.
        VpnInfoGetMaxTier.method.apply {
            clearBody()
            addInstructions(
                0,
                """
                const/4 v0, 0x2
                invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
                move-result-object v0
                return-object v0
                """.trimIndent(),
            )
        }

        // NetShield: return an all-available config (the entity keeps this object).
        VpnInfoGetNetShield.method.apply {
            clearBody()
            addInstructions(
                0,
                """
                new-instance v0, Lcom/protonvpn/android/models/login/NetShieldConfig;
                const/4 v1, 0x1
                const/4 v2, 0x1
                const/4 v3, 0x1
                invoke-direct {v0, v1, v2, v3}, Lcom/protonvpn/android/models/login/NetShieldConfig;-><init>(ZZZ)V
                return-object v0
                """.trimIndent(),
            )
        }
        NetShieldGetMalwareBlocking.method.returnEarly(true)
        NetShieldGetAdsAndTrackersBlocking.method.returnEarly(true)
        NetShieldGetAdultContentBlocking.method.returnEarly(true)
    }
}
