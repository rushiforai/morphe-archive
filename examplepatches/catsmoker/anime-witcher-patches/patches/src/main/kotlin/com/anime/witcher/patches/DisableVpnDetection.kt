package com.anime.witcher.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * Removes VPN/DNS detection and the VPN alert dialogs.
 *
 * - HomeActivity.showVpnAlertDialog() shows a VPN alert when settings fail to load.
 * - AnimeDetailsActivity.showVpnAlertDialog() shows the same VPN alert dialog.
 * - ServersActivity.checkDNS() detects an active Private DNS (a common way ISPs/users
 *   block the app) and refuses to load the server list until it is disabled.
 *
 * All three methods are turned into no-ops (or a direct loadData() call) so the app
 * just works without any VPN/DNS nagging.
 */
val disableVpnDetectionsPatch = bytecodePatch(
    name = "Disable VPN detection and alerts",
    description = "Removes VPN/DNS detection and the VPN alert dialogs.",
    default = true
) {
    compatibleWith(COMPATIBILITY_ANIME_WITCHER)

    execute {
        HomeShowVpnAlertDialogFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        AnimeDetailsShowVpnAlertDialogFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        CheckDnsFingerprint.method.addInstructions(
            0,
            """
                invoke-direct {p0}, Lcom/anime/witcher/activites/ServersActivity;->loadData()V
                return-void
            """
        )
    }
}