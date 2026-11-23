/*
 * Copyright 2026 sqzass.
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.patches.turbovpn

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.mutableClassDefByOrNull
import app.morphe.patches.all.shared.forceBooleanOnce

private const val VPN_USER = "Lco/allconnected/lib/model/VpnUser;"
private const val VPN_DATA = "Lk2/A;"

private val VPN_USER_GATES = setOf("b")
private val VPN_DATA_GATES = setOf("o", "p", "s", "t", "v")

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Forces Turbo VPN's local VIP/premium state checks to true.",
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
        val user = mutableClassDefByOrNull(VPN_USER)
            ?: throw PatchException("TurboVPN: VpnUser not found (version drift?)")

        var userPatched = 0
        user.methods
            .filter { method ->
                method.name in VPN_USER_GATES &&
                    method.returnType == "Z" &&
                    method.parameterTypes.isEmpty()
            }
            .forEach { method ->
                method.forceBooleanOnce(true, "TurboVPN: VpnUser.${method.name}()Z")
                userPatched++
            }

        if (userPatched != VPN_USER_GATES.size) {
            throw PatchException(
                "TurboVPN: expected ${VPN_USER_GATES.size} VpnUser gate(s), found $userPatched",
            )
        }

        val data = mutableClassDefByOrNull(VPN_DATA)
            ?: throw PatchException("TurboVPN: k2/A not found (version drift?)")

        var dataPatched = 0
        data.methods
            .filter { method ->
                method.name in VPN_DATA_GATES &&
                    method.returnType == "Z" &&
                    method.parameterTypes.isEmpty()
            }
            .forEach { method ->
                method.forceBooleanOnce(true, "TurboVPN: k2/A.${method.name}()Z")
                dataPatched++
            }

        if (dataPatched != VPN_DATA_GATES.size) {
            throw PatchException(
                "TurboVPN: expected ${VPN_DATA_GATES.size} k2/A gate(s), found $dataPatched",
            )
        }
    }
}
