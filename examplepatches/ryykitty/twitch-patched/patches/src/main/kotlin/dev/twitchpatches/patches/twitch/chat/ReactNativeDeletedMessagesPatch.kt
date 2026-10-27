package dev.twitchpatches.patches.twitch.chat

import app.morphe.patcher.patch.resourcePatch
import dev.twitchpatches.patches.twitch.shared.*
import dev.twitchpatches.patches.twitch.shared.hermes.HermesBundle
import dev.twitchpatches.patches.twitch.shared.hermes.MetroExports

internal val reactNativeDeletedMessagesPatch = resourcePatch {
    dependsOn(reactNativeBridgePatch)
    execute {
        get(RN_ASSET).appendText("\n" + renderDeletedMessages(HermesBundle(get("assets/index.android.bundle").readBytes())))
    }
}

internal fun renderDeletedMessages(bundle: HermesBundle): String {
    val exports = MetroExports(bundle)
    val row = exports.resolveMemo("ChatMessageRow", "ChatMessageRowComponent",
        setOf("message", "channelID", "deleted", "modActionType", "modLogin", "MessageBody", "Pressable"))
    exports.requireNestedContract("ChatMessageRowComponent",
        setOf("chat-message-row", "message deleted by a moderator.", "strikethrough", "onPress", "accessibilityLabel"))
    exports.requireFunctionContract("overlayDeleted", 3, setOf("type", "id", "deleted", "has"))
    exports.requireFunctionContract("markDeleted", 2, setOf("deletedIds", "Set", "add"))
    return assetSource("deleted-messages.js").replace("__TWITCH_DELETED_ROW_MODULE__", row.module.toString())
}
