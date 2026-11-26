/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 *
 * Ported from hxreborn/morphe-patches
 * (protonvpn/misc/{restrictions/FreeAccountState,freeservers/Fingerprints}.kt).
 */

package app.morphe.patches.protonvpn.shared.fingerprints

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.extensions.InstructionExtensions.instructionsOrNull
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.opcode
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.util.getReference
import app.morphe.patches.protonvpn.shared.anchors.ToStringFingerprint
import app.morphe.patches.protonvpn.shared.anchors.resourceField
import app.morphe.patches.protonvpn.shared.restrictions.freeServerCheckFingerprint
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

// ── FreeAccount state tracking ──────────────────────────────────────────────

internal object UserInfoToStringFingerprint : ToStringFingerprint("PartialJointUserInt(user=")

private val stateFlowInvokes = listOf(Opcode.INVOKE_INTERFACE, Opcode.INVOKE_VIRTUAL)

private fun stateFlowSetValue(
    location: InstructionLocation = InstructionLocation.MatchAfterAnywhere(),
) = methodCall(
    parameters = listOf("Ljava/lang/Object;"),
    returnType = "V",
    opcodes = stateFlowInvokes,
    location = location,
)

private fun Method.receivesType(type: String) = parameterTypes.firstOrNull()?.toString() == type ||
    instructionsOrNull?.firstOrNull()?.let {
        it.opcode == Opcode.CHECK_CAST &&
            it.getReference<TypeReference>()?.type == type
    } == true

internal fun userInfoUpdateFingerprint(): Fingerprint {
    val userInfo = UserInfoToStringFingerprint.originalClassDef.type
    return Fingerprint(
        returnType = "Ljava/lang/Object;",
        parameters = listOf("L", "L"),
        filters = listOf(
            methodCall(definingClass = "Ljava/lang/Number;", name = "longValue"),
            opcode(Opcode.MOVE_RESULT_WIDE, MatchAfterImmediately()),
            stateFlowSetValue(),
        ),
        custom = { method, _ -> method.receivesType(userInfo) },
    )
}

internal object UserInfoInvalidateFingerprint : Fingerprint(
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        literal(0),
        stateFlowSetValue(MatchAfterImmediately()),
        methodCall(definingClass = "Ljava/lang/Number;", name = "longValue"),
        methodCall(definingClass = "Ljava/lang/Long;", name = "valueOf"),
        methodCall(
            parameters = listOf("Ljava/lang/Object;", "Ljava/lang/Object;"),
            returnType = "Z",
            opcodes = stateFlowInvokes,
        ),
    ),
)

// ── Display filter ──────────────────────────────────────────────────────────

internal fun serverListFilterFingerprint() = freeServerCheckFingerprint(
    opcode(Opcode.IF_NEZ, MatchAfterImmediately()),
)

// ── Tier bump ───────────────────────────────────────────────────────────────

internal object ServerGroupToStringFingerprint : ToStringFingerprint("ServerGroup(data=")

internal fun Method.tierParameterIndex(): Int = parameterTypes.indexOfFirst { it.toString() == "Ljava/lang/Integer;" }

internal fun serverGroupItemStateFingerprint(): Fingerprint {
    val serverGroup = ServerGroupToStringFingerprint.originalClassDef.type
    return Fingerprint(
        returnType = serverGroup,
        filters = listOf(newInstance(serverGroup)),
        custom = { method, _ -> method.tierParameterIndex() > 0 },
    )
}

// ── Phase 3D: UI polish fingerprints ────────────────────────────────────────

internal object CountriesHeaderLabelFingerprint : Fingerprint(
    filters = listOf(resourceField(ResourceType.STRING, "country_filter_all_list_header_free")),
)

internal object ServerGroupsMainScreenStateToStringFingerprint :
    ToStringFingerprint("ServerGroupsMainScreenState(selectedFilter=")

internal val saveStateToStringFingerprints = listOf(
    "ServerGroupsMainScreenSaveState(selectedFilter=",
    "CitiesScreenSaveState(countryId=",
    "ServersScreenSaveState(countryId=",
).map(::ToStringFingerprint)

internal fun searchResultSectionFingerprint() = Fingerprint(
    filters = listOf(methodCall(serverGroupItemStateFingerprint().originalMethod)),
    custom = { method, _ ->
        val parameters = method.parameterTypes.map { it.toString() }
            .let { if (AccessFlags.STATIC.isSet(method.accessFlags)) it.drop(1) else it }
        !AccessFlags.SYNTHETIC.isSet(method.accessFlags) &&
            parameters.size == 6 &&
            parameters[0] == "I" &&
            parameters[1] == "Ljava/util/List;" &&
            parameters[3] == "Ljava/lang/Integer;" &&
            parameters[5] == "Ljava/util/Locale;"
    },
)

// ── Phase 3D.5: free-connections info panel upsell row ──────────────────────

internal fun freeConnectionsUpsellRowFingerprint() = Fingerprint(
    filters = listOf(
        resourceField(ResourceType.STRING, "free_connections_info_banner_text"),
        opcode(Opcode.INVOKE_VIRTUAL, MatchAfterImmediately()),
        methodCall(
            definingClass = "Landroid/view/View;",
            name = "setOnClickListener",
            parameters = listOf("Landroid/view/View\$OnClickListener;"),
            returnType = "V",
        ),
    ),
)

// ── Phase 3D.6: Compose banner items (upsell rows inside lists) ─────────────

internal fun serverGroupBannerRendererFingerprint() = Fingerprint(
    filters = listOf(resourceField(ResourceType.STRING, "countries_upsell_banner_description")),
)
