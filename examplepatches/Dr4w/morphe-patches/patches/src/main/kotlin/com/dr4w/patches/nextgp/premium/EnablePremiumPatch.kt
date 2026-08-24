package com.dr4w.patches.nextgp.premium

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.dr4w.patches.nextgp.shared.Constants.COMPATIBILITY_NEXTGP

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Forces premium state to always be active.",
    default = true
) {
    compatibleWith(COMPATIBILITY_NEXTGP)

    execute {
        // Rimuove il controllo isDebuggable() da forceUpdateBypass()
        // così può essere chiamato sempre, non solo in debug
        ForceUpdateBypassFingerprint.method.replaceInstructions(
            0,
            """
                const/4 v0, 0x1
                sput-boolean v0, Lcom/jscti/commons/ui/premium/PremiumState;->_hasBypass:Z
                return-void
            """
        )
    }
}