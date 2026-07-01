/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/messenger/inbox/HideInboxSubtabsPatch.kt
 */
package app.morphe.patches.messenger.inbox

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val hideInboxSubtabsPatch = bytecodePatch(
    name = "Hide inbox subtabs",
    description = "Hides Home and Channels tabs between active now tray and chats.",
) {
    compatibleWith(AppCompatibilities.MESSENGER)

    execute {
        CreateInboxSubTabsFingerprint.method.replaceInstruction(2, "const/4 v0, 0x0")
    }
}
