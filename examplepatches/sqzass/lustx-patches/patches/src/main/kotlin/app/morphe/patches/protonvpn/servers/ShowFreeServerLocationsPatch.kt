/*
 * Copyright 2026 sqzass.
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 *
 * Phase 3B + 3D: free servers visible/connectable, paid hidden/locked, plus
 * UI polish (header label, filter tabs, selected filter, search filtering).
 */

package app.morphe.patches.protonvpn.servers

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resource.resourceId
import app.morphe.patches.protonvpn.shared.PROTON_VPN
import app.morphe.patches.protonvpn.shared.PROTON_VPN_FOSS
import app.morphe.patches.protonvpn.shared.anchors.resourceFieldsPatch
import app.morphe.patches.protonvpn.shared.fingerprints.CountriesHeaderLabelFingerprint
import app.morphe.patches.protonvpn.shared.fingerprints.SERVER_MANAGER
import app.morphe.patches.protonvpn.shared.fingerprints.ServerGroupsMainScreenStateToStringFingerprint
import app.morphe.patches.protonvpn.shared.fingerprints.freeConnectionsUpsellRowFingerprint
import app.morphe.patches.protonvpn.shared.fingerprints.saveStateToStringFingerprints
import app.morphe.patches.protonvpn.shared.fingerprints.searchResultSectionFingerprint
import app.morphe.patches.protonvpn.shared.fingerprints.serverGroupBannerRendererFingerprint
import app.morphe.patches.protonvpn.shared.fingerprints.serverGroupItemStateFingerprint
import app.morphe.patches.protonvpn.shared.fingerprints.serverListFilterFingerprint
import app.morphe.patches.protonvpn.shared.fingerprints.tierParameterIndex
import app.morphe.patches.protonvpn.shared.helpers.injectFreeServerInfrastructure
import app.morphe.patches.protonvpn.shared.helpers.injectFreeServerUIFilters
import app.morphe.patches.protonvpn.shared.restrictions.filterConstructorProperty
import app.morphe.patches.protonvpn.shared.restrictions.invertFreeServerCheckForFreeAccount
import app.morphe.patches.shared.misc.smali.parameterRegister
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

@Suppress("unused")
val showFreeServerLocationsPatch = bytecodePatch(
    name = "Show Free Server Locations",
    description = "Shows free server locations in the Countries list and Search, and connects to them " +
        "on free plans. Paid servers stay hidden and locked.",
) {
    compatibleWith(PROTON_VPN, PROTON_VPN_FOSS)
    dependsOn(resourceFieldsPatch)

    execute {
        // ── Phase 3B: infrastructure + display filter + tier bump ──
        injectFreeServerInfrastructure()
        injectFreeServerUIFilters()

        invertFreeServerCheckForFreeAccount(serverListFilterFingerprint())

        serverGroupItemStateFingerprint().match().run {
            val tierIdx = method.tierParameterIndex()
            if (tierIdx <= 0) throw PatchException("Tier Integer param not at index > 0 in $method")
            val itemRegister = method.parameterRegister(tierIdx - 1)
            val tierRegister = method.parameterRegister(tierIdx)
            method.addInstructions(
                0,
                """
                    invoke-static { $itemRegister, $tierRegister }, ${SERVER_MANAGER}->hxTierForAvailabilityCheck(Ljava/lang/Object;Ljava/lang/Integer;)Ljava/lang/Integer;
                    move-result-object $tierRegister
                """,
            )
        }

        // ── Phase 3D.1: header label swap ("Plus countries" → "Free locations") ──
        val freeLocationsHeader = resourceId(ResourceType.STRING, "free_connections_info_server_locations")
        CountriesHeaderLabelFingerprint.match().run {
            val label = instructionMatches.first()
            val labelRegister = label.getInstruction<OneRegisterInstruction>().registerA
            method.replaceInstruction(label.index, "const v$labelRegister, $freeLocationsHeader")
        }

        // ── Phase 3D.2: hide filter tabs (Free / P2P / SecureCore) ──
        filterConstructorProperty(
            ServerGroupsMainScreenStateToStringFingerprint,
            "filterButtons",
            "$SERVER_MANAGER->hxResolveFilterButtons(Ljava/util/List;)Ljava/util/List;",
        )

        // ── Phase 3D.3: force selected filter to "All" on every save-state ──
        saveStateToStringFingerprints.forEach {
            filterConstructorProperty(
                it,
                "selectedFilter",
                "$SERVER_MANAGER->hxResolveSelectedFilter(Ljava/lang/Object;)Ljava/lang/Object;",
            )
        }

        // ── Phase 3D.4: filter search results to free-tier items only ──
        searchResultSectionFingerprint().method.addInstructions(
            0,
            """
                invoke-static { p2, p4 }, ${SERVER_MANAGER}->hxItemsVisibleToTier(Ljava/util/List;Ljava/lang/Integer;)Ljava/util/List;
                move-result-object p2
            """,
        )

        // ── Phase 3D.5: strip the upsell row from the free-connections info panel ──
        freeConnectionsUpsellRowFingerprint().match().run {
            val bannerTextConst = instructionMatches[0]
            val setTextCall = instructionMatches[1]
            val setListenerCall = instructionMatches[2]

            // Hide the banner TextView itself: the id const's register becomes
            // the GONE value and the setText invoke becomes setVisibility on
            // the same receiver — identical registers, no reallocation.
            val hideRegister = bannerTextConst.getInstruction<OneRegisterInstruction>().registerA
            method.replaceInstruction(bannerTextConst.index, "const/16 v$hideRegister, 0x8")
            val textReceiver = setTextCall.getInstruction<FiveRegisterInstruction>().registerC
            method.replaceInstruction(
                setTextCall.index,
                "invoke-virtual { v$textReceiver, v$hideRegister }, Landroid/view/View;->setVisibility(I)V",
            )

            // And hide the row container before its click listener attaches.
            val rowRegister = setListenerCall.getInstruction<FiveRegisterInstruction>().registerC
            method.addInstructions(
                setListenerCall.index,
                """
                    const/16 v$hideRegister, 0x8
                    invoke-virtual { v$rowRegister, v$hideRegister }, Landroid/view/View;->setVisibility(I)V
                """,
            )
        }

        // ── Phase 3D.6: drop Compose banner items (upsell rows inside lists) ──
        serverGroupBannerRendererFingerprint().match().method.addInstructions(
            0,
            """
                return-void
            """,
        )

        println("[protonvpn] freeservers: display+search filtered, header swapped, tabs hidden")
    }
}
