/*
 * Ported from KingOfPoptart/patcheddit (https://github.com/KingOfPoptart/patcheddit), which adapted it
 * from humzakh/HK-Morphe-Patches (https://github.com/humzakh/HK-Morphe-Patches), GPLv3.
 */
package app.syncfixes.patches.syncforreddit.ultra

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.syncfixes.patches.syncforreddit.shared.Constants.COMPATIBILITY_SYNC_ALL

@Suppress("unused")
val unlockSyncUltraPatch = bytecodePatch(
    name = "Unlock Sync Ultra",
    description = "Unlocks Sync Ultra Lifetime.",
) {
    compatibleWith(*COMPATIBILITY_SYNC_ALL)

    execute {
        // Return true when checking for a Sync Ultra subscription.
        UltraHelperFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )

        // Return Sync Ultra Lifetime when checking the subscription type.
        SyncUltraSubTypeFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "Sync Ultra Lifetime"
                return-object v0
            """,
        )

        // Return true when checking whether the user is an Ultra lifetime member.
        UltraLifetimeFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )
    }
}
