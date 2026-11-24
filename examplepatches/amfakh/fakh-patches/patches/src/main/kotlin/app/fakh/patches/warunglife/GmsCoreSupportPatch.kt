/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.warunglife

import app.fakh.patches.shared.gms.gmsCoreSupportResourcePatch
import app.fakh.patches.shared.gms.redirectToGmsCore
import app.fakh.patches.shared.gms.warnWithoutGmsCore
import app.fakh.patches.warunglife.shared.Constants.COMPATIBILITY_WARUNGLIFE
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch

/** SHA-1 of Warung Life's Play App Signing certificate, which GmsCore presents to Google in place of the patched app's. */
private const val WARUNGLIFE_SIGNATURE = "86681bee00bf4bfbdc3e9348bbdb6b07220f77fe"

/**
 * "Tautkan akun" > Google runs the Godot plugin `GodotGoogleLogin.signIn`: Credential Manager first, then the legacy
 * `GoogleSignIn` client when that fails or shows nothing for 10 seconds. The ID token goes to the game's Supabase
 * backend, which keeps the cloud save, the "Tanpa Iklan" purchase and supporter perks. Google only issues that token
 * to the signing certificate registered for the game, so a patched game fails in Play services. GmsCore presents the
 * original package and certificate instead. The original package is kept when Clone renames the app.
 *
 * On Android 14 and newer the system Credential Manager hands the request to Google Play services itself, never to
 * GmsCore: it fails with "Developer console is not set up correctly", and once its account sheet was shown the plugin
 * takes the failure for a cancel and never reaches the legacy client. `mulaiCredential` (the Credential Manager stages)
 * therefore goes straight to `mulaiLama` (the legacy client), which GmsCore implements.
 */
@Suppress("unused")
val warungLifeGmsCoreSupportPatch = patch(
    name = "GmsCore support",
    description = "Makes \"Tautkan akun\" with Google work by signing in through microG RE (GmsCore) instead of " +
        "Google Play services, so the warung saved to your Google account comes back. Needs microG RE installed " +
        "and signed in to a Google account.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WARUNGLIFE)
    category("Mods")
    extendWith("extensions/extension.mpe")
    dependsOn(gmsCoreSupportResourcePatch("com.neopawstudio.warunglife", WARUNGLIFE_SIGNATURE))

    execute {
        redirectToGmsCore(WARUNGLIFE_SIGNATURE)
        warnWithoutGmsCore(
            "Lapp/fakh/extension/warunglife/GmsCore;->require()V",
            "Lcom/neopawstudio/googlelogin/GodotGoogleLogin;" to "signIn",
        )
        val plugin = mutableClassDefBy("Lcom/neopawstudio/googlelogin/GodotGoogleLogin;")
        if (plugin.methods.none { it.name == "mulaiLama" && it.parameterTypes.isEmpty() }) {
            throw PatchException("Warung Life: GodotGoogleLogin.mulaiLama not found.")
        }
        plugin.methods.singleOrNull { it.name == "mulaiCredential" && it.implementation != null }?.addInstructions(
            0,
            """
                invoke-direct { p0 }, Lcom/neopawstudio/googlelogin/GodotGoogleLogin;->mulaiLama()V
                return-void
            """,
        ) ?: throw PatchException("Warung Life: GodotGoogleLogin.mulaiCredential not found.")
    }
}
