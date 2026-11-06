package dev.twitchpatches.patches.twitch.emotes

import dev.twitchpatches.patches.twitch.shared.assetSource
import dev.twitchpatches.patches.twitch.shared.hermes.HermesBundle
import dev.twitchpatches.patches.twitch.shared.hermes.MetroExports

internal fun renderEmoteInput(bundle: HermesBundle): String {
    val exports = MetroExports(bundle)
    val composer = exports.resolve("useChatComposer", setOf("channelID", "emoteSuggestions", "emoteTokenMap", "createEmoteProvider", "send"))
    exports.requireNestedContract("useChatComposer", setOf("cheermoteTokenImages", "appendToken", "onSend"))
    exports.requireFunctionContract("createEmoteProvider", 2, setOf("autocompleteType", "getMatches", "token", "replacement", "renderElement"))
    val provider = exports.resolve("createEmoteProvider", setOf("AutocompleteType", "Emote"))
    exports.requireFunctionContract("NativeEmoteInput", 2, setOf("emoteMap", "tokenImageMap", "onChangeText", "onSendTextChange", "sendText", "value"))
    val bar = exports.resolve("ChatComposerBar", setOf("emoteMap", "cheermoteTokenImages", "onSendTextChange"))
    return assetSource("emote-input.js")
        .replace("__TWITCH_CHAT_COMPOSER_MODULE__", composer.module.toString())
        .replace("__TWITCH_COMPOSER_BAR_MODULE__", bar.module.toString())
        .replace("__TWITCH_EMOTE_PROVIDER_MODULE__", provider.module.toString())
}
