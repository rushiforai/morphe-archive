package app.patches.tg

import app.morphe.patcher.patch.bytecodePatch
import app.patches.tg.TgSupport.forceFieldReads
import app.patches.tg.TgSupport.replaceMethodBody
import com.android.tools.smali.dexlib2.Opcode

/** Patch 5 — Disable marking stories as read (StoriesController.markStoryAsRead). */
@Suppress("unused")
val disableMarkStoriesReadPatch = bytecodePatch(
    name = "Disable marking stories as read",
    description = "Makes StoriesController.markStoryAsRead(...) always return false so watched stories are not marked read.",
    default = true,
) {
    compatibleWith(*TG_COMPATIBILITY)
    execute {
        val classType = TgSupport.desc("org/telegram/ui/Stories/StoriesController")
        replaceMethodBody(
            classType = classType,
            name = "markStoryAsRead",
            parameters = listOf(
                "Lorg/telegram/tgnet/tl/TL_stories\$PeerStories;",
                "Lorg/telegram/tgnet/tl/TL_stories\$StoryItem;",
                "Z",
            ),
            locals = 1,
            body = """
                const/4 v0, 0x0
                return v0
            """.trimIndent(),
        )
        replaceMethodBody(
            classType = classType,
            name = "markStoryAsRead",
            parameters = listOf(
                "J",
                "Lorg/telegram/tgnet/tl/TL_stories\$StoryItem;",
            ),
            locals = 2,
            body = """
                const/4 p1, 0x0
                return p1
            """.trimIndent(),
        )
    }
}

/** Patch 8 — Allow saving media from forward-restricted chats (MessagesController.isChatNoForwards). */
@Suppress("unused")
val savingForwardsPatch = bytecodePatch(
    name = "Allow forwarding/saving restricted media",
    description = "Makes MessagesController.isChatNoForwards(...) always return false.",
    default = true,
) {
    compatibleWith(*TG_COMPATIBILITY)
    execute {
        val classType = TgSupport.desc("org/telegram/messenger/MessagesController")
        replaceMethodBody(
            classType = classType,
            name = "isChatNoForwards",
            parameters = listOf("J"),
            locals = 0,
            body = """
                const/4 p1, 0x0
                return p1
            """.trimIndent(),
        )
        replaceMethodBody(
            classType = classType,
            name = "isChatNoForwards",
            parameters = listOf("Lorg/telegram/tgnet/TLRPC\$Chat;"),
            locals = 2,
            body = """
                const/4 p1, 0x0
                return p1
            """.trimIndent(),
        )
    }
}

/** Patch 9 — Access banned channels (MessagesController.checkCanOpenChat). */
@Suppress("unused")
val bannedChannelsOpenPatch = bytecodePatch(
    name = "Access banned channels",
    description = "Makes every MessagesController.checkCanOpenChat(...) overload always return true.",
    default = true,
) {
    compatibleWith(*TG_COMPATIBILITY)
    execute {
        val classType = TgSupport.desc("org/telegram/messenger/MessagesController")
        val body = """
            const/4 p1, 0x1
            return p1
        """.trimIndent()
        replaceMethodBody(
            classType = classType,
            name = "checkCanOpenChat",
            parameters = listOf(
                "Landroid/os/Bundle;",
                "Lorg/telegram/ui/ActionBar/BaseFragment;",
            ),
            locals = 0,
            body = body,
        )
        replaceMethodBody(
            classType = classType,
            name = "checkCanOpenChat",
            parameters = listOf(
                "Landroid/os/Bundle;",
                "Lorg/telegram/ui/ActionBar/BaseFragment;",
                "Lorg/telegram/messenger/MessageObject;",
            ),
            locals = 0,
            body = body,
        )
        replaceMethodBody(
            classType = classType,
            name = "checkCanOpenChat",
            parameters = listOf(
                "Landroid/os/Bundle;",
                "Lorg/telegram/ui/ActionBar/BaseFragment;",
                "Lorg/telegram/messenger/MessageObject;",
                "Lorg/telegram/messenger/browser/Browser\$Progress;",
            ),
            locals = 0,
            body = body,
        )
    }
}

/** Patch 10 — Banned channels: force isRestrictedMessage readers to false. */
@Suppress("unused")
val restrictedMessagePatch = bytecodePatch(
    name = "Bypass isRestrictedMessage",
    description = "Forces every read of the isRestrictedMessage field to false.",
    default = true,
) {
    compatibleWith(*TG_COMPATIBILITY)
    execute {
        forceFieldReads(
            opcodes = setOf(Opcode.IGET_BOOLEAN),
            fieldName = "isRestrictedMessage",
            constRead = { dest -> "const/4 v$dest, 0x0" },
            fieldClassFilter = { it.startsWith("Lorg/telegram/") },
            minimum = 1,
        )
    }
}

/** Patch 11 — Enable saving media everywhere: force noforwards readers to false. */
@Suppress("unused")
val savingMediaPatch = bytecodePatch(
    name = "Enable saving media everywhere",
    description = "Forces every read of the noforwards field to false.",
    default = true,
) {
    compatibleWith(*TG_COMPATIBILITY)
    execute {
        forceFieldReads(
            opcodes = setOf(Opcode.IGET_BOOLEAN),
            fieldName = "noforwards",
            constRead = { dest -> "const/4 v$dest, 0x0" },
            fieldClassFilter = { it.startsWith("Lorg/telegram/") },
            minimum = 1,
        )
    }
}

/** Patch 12 — Make premiumLocked false. */
@Suppress("unused")
val premiumLockedPatch = bytecodePatch(
    name = "Unlock premium-locked content",
    description = "Forces every read of the premiumLocked field to false.",
    default = true,
) {
    compatibleWith(*TG_COMPATIBILITY)
    execute {
        forceFieldReads(
            opcodes = setOf(Opcode.IGET_BOOLEAN),
            fieldName = "premiumLocked",
            constRead = { dest -> "const/4 v$dest, 0x0" },
            fieldClassFilter = { it.startsWith("Lorg/telegram/") },
            minimum = 1,
        )
    }
}

/** Patch 15 — Remove proxy sponsored channels (MessagesController.checkPromoInfoInternal). */
@Suppress("unused")
val removeProxySponsoredPatch = bytecodePatch(
    name = "Remove proxy sponsored channels",
    description = "Empties MessagesController.checkPromoInfoInternal(boolean) so no promo channel request is made.",
    default = true,
) {
    compatibleWith(*TG_COMPATIBILITY)
    execute {
        replaceMethodBody(
            classType = TgSupport.desc("org/telegram/messenger/MessagesController"),
            name = "checkPromoInfoInternal",
            parameters = listOf("Z"),
            locals = 2,
            body = "return-void",
        )
    }
}

/** Patch 18 — Force isSponsoredDisabled to true (MessagesController). */
@Suppress("unused")
val sponsoredDisabledPatch = bytecodePatch(
    name = "Disable sponsored messages (client flag)",
    description = "Makes MessagesController.isSponsoredDisabled() always return true.",
    default = true,
) {
    compatibleWith(*TG_COMPATIBILITY)
    execute {
        replaceMethodBody(
            classType = TgSupport.desc("org/telegram/messenger/MessagesController"),
            name = "isSponsoredDisabled",
            locals = 2,
            body = """
                const/4 v0, 0x1
                return v0
            """.trimIndent(),
        )
    }
}
