package app.jouss.patches.protonvpn.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.jouss.patches.protonvpn.shared.Constants.COMPATIBILITY_PROTONVPN

@Suppress("unused")
val protonVpnPremiumPatch = bytecodePatch(
    name = "Proton VPN Premium",
    description = "Unlocks premium UI features: removes upsells, enables NetShield ad-blocker, hides upgrade prompts, shows free servers with premium interface (Plus badge, no speed limits display, all feature flags enabled)."
) {
    compatibleWith(COMPATIBILITY_PROTONVPN)

    execute {
        // === Premium UI unlocks ===

        GetUserTierFingerprint.method.addInstructions(0, "const/4 v0, 0x2\nreturn v0")
        IsFreeUserFingerprint.method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        IsUserPlusOrAboveFingerprint.method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
        HasAccessToServerFingerprint.method.addInstructions(0, "const/4 p0, 0x1\nreturn p0")
        GetHasSubscriptionFingerprint.method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
        IsFeatureFlagEnabledFingerprint.method.addInstructions(0, "const/4 p1, 0x1\nreturn p1")
        ServerGroupGetAvailableFingerprint.method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
        GetUserTierNameFingerprint.method.addInstructions(0, "const-string v0, \"vpn2022\"\nreturn-object v0")

        GetNetShieldAvailabilityFingerprint.method.addInstructions(0, """
            sget-object p0, Lcom/protonvpn/android/netshield/NetShieldAvailability;->AVAILABLE:Lcom/protonvpn/android/netshield/NetShieldAvailability;
            return-object p0
        """)

        GetMaxTierFingerprint.method.addInstructions(0, """
            const/4 v0, 0x2
            invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
            move-result-object v0
            return-object v0
        """)

        // === Free servers only ===

        // Countries tab: show only free servers (invert the filter)
        ServerListFilterFingerprint.let {
            val idx = it.instructionMatches[0].index
            it.method.removeInstruction(idx + 2)
            it.method.removeInstruction(idx + 1)
            it.method.removeInstruction(idx)
            it.method.removeInstruction(idx - 1)
            it.method.addInstructionsWithLabels(idx - 1, """
                invoke-virtual {p6}, Lcom/protonvpn/android/servers/Server;->isFreeServer()Z
                move-result p0
                if-nez p0, :pass
                const/4 p0, 0x0
                return p0
                :pass
                nop
            """)
        }

        // Connection: only pick free servers
        GetBestScoreServerFingerprint.method.addInstructions(0, """
            new-instance v0, Ljava/util/ArrayList;
            invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
            invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;
            move-result-object v1
            :loop
            invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z
            move-result v2
            if-eqz v2, :done
            invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;
            move-result-object v2
            check-cast v2, Lcom/protonvpn/android/servers/Server;
            invoke-virtual {v2}, Lcom/protonvpn/android/servers/Server;->isFreeServer()Z
            move-result v3
            if-eqz v3, :loop
            invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
            goto :loop
            :done
            invoke-interface {v0}, Ljava/util/List;->isEmpty()Z
            move-result v1
            if-nez v1, :skip
            move-object p1, v0
            :skip
        """)

        // Error fallback: only use free servers
        ConnectionServerFilterFingerprint.method.addInstructionsWithLabels(0, """
            invoke-virtual {p3}, Lcom/protonvpn/android/servers/Server;->isFreeServer()Z
            move-result v0
            if-nez v0, :free
            const/4 v0, 0x0
            return v0
            :free
            nop
        """)

        // === Hide premium-only UI ===

        // Hide filter tabs (SecureCore/P2P/Tor)
        GetFilterButtonsFingerprint.method.addInstructions(0, """
            invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
            move-result-object v0
            return-object v0
        """)

        // Profile: only Standard type
        ProfileAvailableTypesFingerprint.method.addInstructions(0, """
            new-instance v0, Ljava/util/ArrayList;
            invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
            sget-object v1, Lcom/protonvpn/android/profiles/ui/ProfileType;->Standard:Lcom/protonvpn/android/profiles/ui/ProfileType;
            invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
            return-object v0
        """)

        // Profile: only free countries
        ProfileCountriesFingerprint.let {
            it.method.replaceInstruction(it.instructionMatches[0].index,
                "invoke-virtual {p2, v0}, Lcom/protonvpn/android/servers/ServerManager2;->getFreeCountries(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;"
            )
        }

        // Skip upgrade onboarding dialog after login
        UpgradeOnboardingLaunchFingerprint.method.addInstructions(0, "return-void")
    }
}
