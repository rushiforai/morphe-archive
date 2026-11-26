/*
 * Copyright 2026 smtgpm.
 * https://github.com/smtgpm/morphe-patches-smtgpm
 *
 * See the included NOTICE file for GPLv3 Section 7 terms.
 */

package app.smtgpm.patches.belote.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * Required by every patch, since patching re-signs the APK.
 *
 * Login with Amazon validates its API key against the signing certificate, so in a re-signed
 * APK AuthorizationManager.signOut throws "Invalid API Key". The game signs out of Amazon when
 * "Play as guest" is pressed, and the exception restarts the startup flow forever. Nobody can
 * be signed in to Amazon with the new signature, so report a successful sign-out instead.
 */
internal val resignFixPatch = bytecodePatch {
    execute {
        LoginWithAmazonLogoutFingerprint.method.addInstructions(
            0,
            """
                if-eqz p1, :done
                invoke-interface { p1 }, Lcom/gameduell/mobile/belote/plugin/LogoutListener;->onSuccess()V
                :done
                return-void
            """,
        )
    }
}
