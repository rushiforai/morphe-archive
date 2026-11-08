/*
 * Copyright (C) 2026 sqzass
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.sqzass.patches.protonvpn.misc.profiles

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.matchSingle
import app.sqzass.patches.protonvpn.misc.anchors.findPropertyField
import app.sqzass.patches.protonvpn.misc.anchors.setExtensionMember
import app.sqzass.patches.protonvpn.misc.restrictions.clearFreeUserCheck
import app.sqzass.patches.protonvpn.misc.restrictions.filterConstructorProperty
import app.sqzass.patches.protonvpn.misc.restrictions.filterReturnValue
import app.sqzass.patches.protonvpn.misc.restrictions.freeAccountStatePatch
import app.sqzass.patches.protonvpn.misc.restrictions.freeServerMethod
import app.sqzass.patches.protonvpn.misc.restrictions.invertFreeServerCheckForFreeAccount
import app.sqzass.patches.protonvpn.misc.settings.patchesSettingsPatch
import app.sqzass.patches.shared.compat.AppCompatibilities
import app.sqzass.patches.shared.misc.proton.markPatchApplied
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val FREE_SERVER_LOCATIONS = "Lapp/sqzass/extension/protonvpn/FreeServerLocations;"

@Suppress("unused")
val unlockProfilesPatch: BytecodePatch = bytecodePatch(
    name = "Unlock profiles",
    description = "Unlocks profiles on free plans and limits them to free locations. " +
        "Profiles for other locations are hidden.",
) {
    compatibleWith(AppCompatibilities.PROTON_VPN)
    dependsOn(patchesSettingsPatch, freeAccountStatePatch)

    execute {
        markPatchApplied("unlockProfiles", unlockProfilesPatch)
        setExtensionMember(
            "profileAvailability",
            findPropertyField(ProfileViewItemToStringFingerprint, "availability").name,
        )
        setExtensionMember("serverIsFree", freeServerMethod.name)
        setExtensionMember("countryServers", findPropertyField(VpnCountryToStringFingerprint, "serverList").name)
        clearFreeUserCheck(profileAvailabilityFingerprint())
        vpnCountriesFingerprint().matchSingle().method.filterReturnValue(
            "$FREE_SERVER_LOCATIONS->countriesForAccount(Ljava/util/List;)Ljava/util/List;",
        )
        invertFreeServerCheckForFreeAccount(profileServerFilterFingerprint())
        profileCitiesOrStatesFingerprint().matchSingle().run {
            val serverList = instructionMatches.last()
            val register = serverList.getInstruction<OneRegisterInstruction>().registerA
            method.addInstructions(
                serverList.index + 1,
                """
                    invoke-static { v$register }, $FREE_SERVER_LOCATIONS->serversForAccount(Ljava/util/List;)Ljava/util/List;
                    move-result-object v$register
                """,
            )
        }
        filterConstructorProperty(
            ProfilesListToStringFingerprint,
            "profiles",
            "$FREE_SERVER_LOCATIONS->profilesForAccount(Ljava/util/List;)Ljava/util/List;",
        )
        profileTypesToStringFingerprints.forEach {
            filterConstructorProperty(
                it,
                "availableTypes",
                "$FREE_SERVER_LOCATIONS->profileTypesForAccount(Ljava/util/List;)Ljava/util/List;",
            )
        }
    }
}
