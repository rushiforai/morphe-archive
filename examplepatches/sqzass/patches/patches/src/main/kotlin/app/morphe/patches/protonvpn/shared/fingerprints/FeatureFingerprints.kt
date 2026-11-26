/*
 * Copyright (C) 2026 Hoo-dles
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 *
 * Ported from hxreborn/morphe-patches (protonvpn/misc/{lan,customdns,splittunneling,netshield}/Fingerprints.kt).
 */

package app.morphe.patches.protonvpn.shared.fingerprints

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.anyInstruction
import app.morphe.patcher.checkCast
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.classDefBy
import app.morphe.patcher.resource.ResourceType
import app.morphe.patches.protonvpn.shared.anchors.resourceField
import app.morphe.patches.protonvpn.shared.restrictions.freeUserCheckFingerprint
import app.morphe.patches.protonvpn.shared.restrictions.restrictionGuardFingerprint
import com.android.tools.smali.dexlib2.Opcode

// ── LAN ─────────────────────────────────────────────────────────────────────
internal object LanConnectionsViewStateFingerprint : Fingerprint(
    name = "<init>",
    filters = listOf(resourceField(ResourceType.STRING, "settings_advanced_allow_lan_title")),
)

internal fun lanConnectionsRestrictionFingerprint() = restrictionGuardFingerprint("getLanConnections")

// ── Custom DNS ──────────────────────────────────────────────────────────────
internal object CustomDnsViewStateFingerprint : Fingerprint(
    name = "<init>",
    filters = listOf(resourceField(ResourceType.STRING, "settings_custom_dns_title")),
)

internal fun customDnsRestrictionFingerprint() = restrictionGuardFingerprint("getCustomDns")

// ── Split Tunneling ─────────────────────────────────────────────────────────
internal object SplitTunnelingViewStateFingerprint : Fingerprint(
    name = "<init>",
    filters = listOf(resourceField(ResourceType.STRING, "settings_split_tunneling_title")),
)

internal fun splitTunnelingRestrictionFingerprint() = restrictionGuardFingerprint("getSplitTunneling")

// ── NetShield ───────────────────────────────────────────────────────────────
private const val NETSHIELD_AVAILABILITY_READ_DISTANCE = 3
private const val NETSHIELD_RESET_READ_DISTANCE = 8
private const val NETSHIELD_PROPERTY = "NetShield"

internal object NetShieldAvailabilityEnumFingerprint : Fingerprint(
    name = "<clinit>",
    strings = listOf("AVAILABLE", "UPGRADE_VPN_PLUS"),
)

internal fun netShieldAvailabilityFingerprint(): Fingerprint {
    val netShieldAvailability =
        NetShieldAvailabilityEnumFingerprint.originalClassDef.type
    return freeUserCheckFingerprint(
        followingFilters = arrayOf(
            fieldAccess(
                opcode = Opcode.SGET_OBJECT,
                definingClass = netShieldAvailability,
                type = netShieldAvailability,
                location = MatchAfterWithin(NETSHIELD_AVAILABILITY_READ_DISTANCE),
            ),
        ),
    )
}

internal fun netShieldResetFingerprint(): Fingerprint {
    val netShieldGetters =
        classDefBy("Lcom/protonvpn/android/settings/data/LocalUserSettings;").methods.filter {
            NETSHIELD_PROPERTY in it.name && it.parameterTypes.isEmpty() && it.returnType != "V"
        }
    val netShieldReads = netShieldGetters.map { methodCall(it) } +
        netShieldGetters.filter { it.returnType.startsWith("L") }
            .map { checkCast(it.returnType) }
    return freeUserCheckFingerprint(
        strings = listOf("reset default profile: "),
        followingFilters = arrayOf(
            anyInstruction(
                *netShieldReads.toTypedArray(),
                location = MatchAfterWithin(NETSHIELD_RESET_READ_DISTANCE),
            ),
        ),
    )
}
