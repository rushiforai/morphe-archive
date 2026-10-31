package dev.twitchpatches.patches.twitch.emotes

import dev.twitchpatches.patches.twitch.shared.assetSource
import dev.twitchpatches.patches.twitch.shared.hermes.HermesBundle
import dev.twitchpatches.patches.twitch.shared.hermes.MetroExports

internal fun renderEmoteInput(bundle: HermesBundle): String {
    val exports = MetroExports(bundle)
    val composer = exports.resolve("useChatComposer", setOf("channelID", "emoteSuggestions", "emoteTokenMap", "createEmoteProvider", "send"))
    exports.requireNestedContract("useChatComposer", setOf("cheermoteTokenImages", "appendToken", "onSend"))
    exports.requireFunctionContract("createEmoteProvider", 2, setOf("autocompleteType", "getMatches", "token", "renderElement"))
    exports.requireFunctionContract("NativeEmoteInput", 2, setOf("emoteMap", "tokenImageMap", "onChangeText", "value"))
    return assetSource("emote-input.js").replace("__TWITCH_CHAT_COMPOSER_MODULE__", composer.module.toString())
}
