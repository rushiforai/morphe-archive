/*
 * Copyright 2026 sqzass.
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.patches.turbovpn.subscription

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.mutableClassDefByOrNull

private const val VIP_INFO = "Lco/allconnected/lib/model/VipInfo;"
private const val VPN_SERVER = "Lco/allconnected/lib/model/VpnServer;"

@Suppress("unused")
val unlockVipModelPatch = bytecodePatch(
    name = "Unlock VIP Model",
    description = "Forces Turbo VPN's VipInfo/VpnServer entitlement checks to premium values.",
) {
    compatibleWith(
        Compatibility(
            name = "Turbo VPN - Secure VPN Proxy",
            packageName = "free.vpn.unblock.proxy.turbovpn",
            targets = listOf(
                AppTarget(version = "4.3.2.2", versionCode = 2026102111),
            ),
        ),
    )

    execute {
        val vipInfo = mutableClassDefByOrNull(VIP_INFO)
            ?: throw PatchException("TurboVPN: VipInfo not found (version drift?)")

        fun forceTrue(name: String) {
            val method = vipInfo.methods.singleOrNull {
                it.name == name &&
                    it.returnType == "Z" &&
                    it.parameterTypes.isEmpty()
            } ?: throw PatchException("TurboVPN: VipInfo.$name()Z not found (version drift?)")

            method.addInstructions(
                0,
                """
                const/4 v0, 0x1
                return v0
                """.trimIndent(),
            )
        }

        forceTrue("u")
        forceTrue("r")

        val level = vipInfo.methods.singleOrNull {
            it.name == "e" &&
                it.returnType == "I" &&
                it.parameterTypes.isEmpty()
        } ?: throw PatchException("TurboVPN: VipInfo.e()I not found (version drift?)")

        level.addInstructions(
            0,
            """
            const/16 v0, 0xa
            return v0
            """.trimIndent(),
        )

        val expire = vipInfo.methods.singleOrNull {
            it.name == "c" &&
                it.returnType == "J" &&
                it.parameterTypes.isEmpty()
        } ?: throw PatchException("TurboVPN: VipInfo.c()J not found (version drift?)")

        expire.addInstructions(
            0,
            """
            const-wide v0, 0x7fffffffffffffffL
            return-wide v0
            """.trimIndent(),
        )

        val vpnServer = mutableClassDefByOrNull(VPN_SERVER)
            ?: throw PatchException("TurboVPN: VpnServer not found (version drift?)")

        val serverLevel = vpnServer.methods.singleOrNull {
            it.name == "getVipLevel" &&
                it.returnType == "I" &&
                it.parameterTypes.isEmpty()
        } ?: throw PatchException("TurboVPN: VpnServer.getVipLevel()I not found (version drift?)")

        serverLevel.addInstructions(
            0,
            """
            const/4 v0, 0x0
            return v0
            """.trimIndent(),
        )
    }
}
