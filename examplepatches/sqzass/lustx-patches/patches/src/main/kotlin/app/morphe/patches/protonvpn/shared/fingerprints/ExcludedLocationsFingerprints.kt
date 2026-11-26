/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 *
 * Ported from hxreborn/morphe-patches (protonvpn/misc/{connectionpreferences,profiles}/Fingerprints.kt).
 * Phase 2B: exclusion-filtering machinery for connection preferences.
 */

package app.morphe.patches.protonvpn.shared.fingerprints

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patches.protonvpn.shared.anchors.ToStringFingerprint
import app.morphe.patches.protonvpn.shared.anchors.vpnUserType
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val SERVER = "Lcom/protonvpn/android/servers/Server;"
internal const val SERVER_MANAGER = "Lcom/protonvpn/android/utils/ServerManager;"
internal const val PROTOCOL_SELECTION = "Lcom/protonvpn/android/vpn/ProtocolSelection;"

internal object VpnCountryToStringFingerprint : ToStringFingerprint("VpnCountry(flag=")

internal object VpnCountryConstructorFingerprint : Fingerprint(
    classFingerprint = VpnCountryToStringFingerprint,
    name = "<init>",
    parameters = listOf("Ljava/lang/String;", "Ljava/util/List;"),
)

internal object ExcludedLocationsConstructorFingerprint : Fingerprint(
    classFingerprint = ExcludedLocationsToStringFingerprint,
    name = "<init>",
    parameters = listOf("Ljava/util/List;"),
    filters = listOf(opcode(Opcode.RETURN_VOID)),
)

internal fun serverIsExcludedFingerprint() = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(SERVER, ExcludedLocationsToStringFingerprint.originalClassDef.type),
    filters = listOf(methodCall(definingClass = SERVER, name = "getExitCountry")),
)

internal fun randomServerFingerprint() = Fingerprint(
    definingClass = SERVER_MANAGER,
    returnType = SERVER,
    parameters = listOf(vpnUserType, PROTOCOL_SELECTION, "Ljava/util/List;"),
    filters = listOf(
        methodCall(definingClass = SERVER_MANAGER, parameters = listOf("Z"), returnType = "Ljava/util/List;"),
        opcode(Opcode.MOVE_RESULT_OBJECT, MatchAfterImmediately()),
        methodCall(name = "hasAccessibleOnlineServer"),
    ),
)

internal fun bestServerForConnectIntentCallFingerprint(): Fingerprint {
    val excludedLocations = ExcludedLocationsToStringFingerprint.originalClassDef.type
    return Fingerprint(
        parameters = listOf("L", vpnUserType, PROTOCOL_SELECTION, excludedLocations, "L"),
        filters = listOf(
            methodCall(
                definingClass = SERVER_MANAGER,
                parameters = listOf("L", vpnUserType, PROTOCOL_SELECTION, "Ljava/util/List;", excludedLocations),
                returnType = SERVER,
            ),
            opcode(Opcode.MOVE_RESULT_OBJECT, MatchAfterImmediately()),
        ),
    )
}

// ── Smali descriptor helpers ─────────────────────────────────────────────────

internal fun MethodReference.smaliDescriptor(): String = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

internal fun FieldReference.smaliDescriptor(): String = "$definingClass->$name:$type"
