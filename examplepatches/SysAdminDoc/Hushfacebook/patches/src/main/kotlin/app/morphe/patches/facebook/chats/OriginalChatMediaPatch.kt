/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 * Ported from https://github.com/SysAdminDoc/HushMessenger (its original photo and original video controls)
 */
package app.morphe.patches.facebook.chats

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.facebook.misc.extension.enableStatus
import app.morphe.patches.facebook.misc.extension.requireStatusMethod
import app.morphe.patches.facebook.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities

/**
 * Photos and videos sent from a chat that opens inside Facebook go out as the originals.
 * See OriginalChatMediaAnchors.kt for the three places that change, and the extension's
 * OriginalChatMedia for when they do.
 *
 * In Morphe Manager's default selection with the switch off, so nothing changes until it's turned on.
 */
@Suppress("unused")
val originalChatMediaPatch = bytecodePatch(
    // The README table check reads this literal; ORIGINAL_MEDIA_PATCH carries the same text for the messages.
    name = "Send chat photos and videos at original quality",
    description = "Photos and videos you send from a chat that opens inside Facebook go out as the originals " +
        "instead of Facebook's smaller copies. The switch starts off, under Chats.",
) {
    category("Interface")
    dependsOn(settingsPatch)
    compatibleWith(*AppCompatibilities.facebook())

    execute {
        requireStatusMethod("originalChatMedia")
        val anchors = findOriginalMediaAnchors()
        hookOriginalMedia(anchors)
        enableStatus("originalChatMedia")
    }
}
