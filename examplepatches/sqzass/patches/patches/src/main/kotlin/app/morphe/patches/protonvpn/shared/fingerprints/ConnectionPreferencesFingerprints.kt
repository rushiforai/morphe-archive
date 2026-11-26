/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 *
 * Ported from hxreborn/morphe-patches (protonvpn/misc/connectionpreferences/Fingerprints.kt).
 * Phase 2A scope: fingerprints that don't require the ExcludedLocations helper.
 */

package app.morphe.patches.protonvpn.shared.fingerprints

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionFilter
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.anyInstruction
import app.morphe.patcher.checkCast
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.instanceOf
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import app.morphe.patches.protonvpn.shared.anchors.ToStringFingerprint
import app.morphe.patches.protonvpn.shared.anchors.isFreeUserCall
import app.morphe.patches.protonvpn.shared.anchors.vpnUserType
import app.morphe.patches.protonvpn.shared.restrictions.freeUserCheckFingerprint
import app.morphe.patches.protonvpn.shared.restrictions.restrictionGuardFingerprint
import com.android.tools.smali.dexlib2.Opcode

private const val OBJECT = "Ljava/lang/Object;"

internal object ConnectionPreferencesToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("ConnectionPreferencesState(isFeatureDiscovered="),
)

internal fun addExcludedLocationFingerprint() = freeUserCheckFingerprint(
    strings = listOf("Cannot add excluded location: free VPN user is not allowed"),
)

internal fun removeExcludedLocationFingerprint() = freeUserCheckFingerprint(
    strings = listOf("Cannot remove excluded location: free VPN user is not allowed"),
)

internal object ExcludedLocationsToStringFingerprint :
    ToStringFingerprint("ExcludedLocations(allLocations=")

internal fun excludedLocationsFlowFingerprint(): Fingerprint {
    val excludedLocations = ExcludedLocationsToStringFingerprint.originalClassDef.type
    return freeUserCheckFingerprint(
        name = "invokeSuspend",
        followingFilters = arrayOf(
            anyInstruction(
                fieldAccess(
                    opcode = Opcode.SGET_OBJECT,
                    definingClass = excludedLocations,
                    type = excludedLocations,
                ),
                methodCall(returnType = excludedLocations),
            ),
        ),
    )
}

internal fun defaultConnectionRestrictionFingerprint() = restrictionGuardFingerprint("getDefaultProfileId")

internal fun recentsRecordingFingerprint() = Fingerprint(
    name = "invokeSuspend",
    filters = listOf(
        isFreeUserCall(),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
        opcode(Opcode.IF_NEZ, MatchAfterImmediately()),
        recentsDaoReference(),
    ),
)

internal object RecentsDaoQueryFingerprint : Fingerprint(
    strings = listOf(
        string(
            "FROM `unnamedRecentsIntents` WHERE `recentId` IN (",
            StringComparisonType.CONTAINS,
        ),
    ),
)

internal fun recentsDaoReference(): InstructionFilter {
    val recentsDao = RecentsDaoQueryFingerprint.originalClassDef
    val types = listOfNotNull(recentsDao.type, recentsDao.superclass).filter { it != OBJECT }
    return anyInstruction(
        *types.flatMap {
            listOf(
                checkCast(it),
                fieldAccess(type = it, opcodes = listOf(Opcode.IGET_OBJECT)),
            )
        }.toTypedArray(),
    )
}

internal object RecentsListViewStateFlowFingerprint : Fingerprint(
    name = "<init>",
    strings = listOf("changeServerManager", "observeConnectionFeedbackViewState"),
)

internal object DefaultConnectionViewStateFlowFingerprint : Fingerprint(
    name = "<init>",
    strings = listOf(
        "effectiveCurrentUserSettings",
        "getConnectIntentViewState",
        "observeDefaultConnection",
    ),
)

internal fun defaultConnectionRecentsFingerprint(): Fingerprint {
    val owner = DefaultConnectionViewStateFlowFingerprint.originalClassDef.type
    return Fingerprint(
        name = "invokeSuspend",
        filters = listOf(
            isFreeUserCall(),
            methodCall(
                definingClass = owner,
                parameters = listOf(owner, "L", vpnUserType, "L", "L", "L", "L"),
                opcodes = listOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE),
            ),
        ),
    )
}

internal object GetQuickConnectIntentConstructorFingerprint : Fingerprint(
    name = "<init>",
    parameters = List(7) { "L" },
    strings = listOf("getDefaultConnectIntent", "observeDefaultConnection"),
)

internal fun quickConnectIntentFingerprint() = freeUserCheckFingerprint(
    definingClass = GetQuickConnectIntentConstructorFingerprint.originalClassDef.type,
    returnType = "Ljava/lang/Object;",
    parameters = listOf("L"),
)

internal object DefaultConnectionSettingStateToStringFingerprint :
    ToStringFingerprint("DefaultConnectionSettingState(iconRes=")

internal fun defaultConnectionSettingFingerprint() = Fingerprint(
    name = "invokeSuspend",
    filters = listOf(
        isFreeUserCall(),
        methodCall(
            parameters = listOf("L"),
            returnType = "Ljava/lang/Long;",
            opcodes = listOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE),
        ),
        newInstance(DefaultConnectionSettingStateToStringFingerprint.originalClassDef.type),
    ),
)

internal object ConnectionCardViewStateToStringFingerprint :
    ToStringFingerprint("VpnConnectionCardViewState(cardLabel=")

internal fun connectionCardLabelFingerprint() = freeUserCheckFingerprint(
    name = "invokeSuspend",
    followingFilters = arrayOf(
        methodCall(
            returnType = ConnectionCardViewStateToStringFingerprint.originalClassDef.type,
            location = MatchAfterWithin(3),
        ),
    ),
)

internal fun inlinedConnectionCardFingerprint() = Fingerprint(
    name = "invokeSuspend",
    filters = listOf(newInstance(ConnectionCardViewStateToStringFingerprint.originalClassDef.type)),
)

internal object RecentDefaultConnectionToStringFingerprint :
    ToStringFingerprint("Recent(recentId=")

internal fun inlinedDefaultConnectionSettingFingerprint() = Fingerprint(
    name = "invokeSuspend",
    filters = listOf(
        instanceOf(RecentDefaultConnectionToStringFingerprint.originalClassDef.type),
        newInstance(DefaultConnectionSettingStateToStringFingerprint.originalClassDef.type),
    ),
)
