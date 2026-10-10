package dev.twitchpatches.patches.twitch.shared.hermes

import java.security.MessageDigest

internal object HermesFeedTheme {
    fun apply(bundle: HermesBundle): ByteArray {
        val function = bundle.functions.single { bundle.strings[it.name] == "DiscoveryFeedContent" && it.params == 2 }
        val code = bundle.instructions(function)
        val (index, replacement) = replacement(code, bundle.strings)
        val offset = function.offset + code.take(index).sumOf(HermesOpcodes::size)
        val bytes = bundle.bytes.copyOf()
        replacement.copyInto(bytes, offset)
        MessageDigest.getInstance("SHA-1").digest(bytes.copyOfRange(0, bytes.size - 20))
            .copyInto(bytes, bytes.size - 20)
        val updated = HermesBundle(bytes)
        require(updated.instructions(function).size == code.size + 1) { "Feed theme: replacement validation failed." }
        return bytes
    }

    internal fun replacement(code: List<HermesInstruction>, strings: List<String>): Pair<Int, ByteArray> {
        fun HermesInstruction.reads(symbol: String) = name.startsWith("GetById") && strings[args.last()] == symbol
        val theme = code.withIndex().single { it.value.reads("useTheme") }
        val call = code.getOrNull(theme.index + 1)
        require(call?.name == "Call1" && call.args[1] == theme.value.args[0]) {
            "Feed theme: parent theme hook changed."
        }
        val dark = code.withIndex().single { it.value.reads("darkTheme") }
        val parent = code.getOrNull(dark.index - 4)
        require(dark.value.name == "GetById" && parent?.name == "Mov" &&
            parent.args == listOf(dark.value.args[0], call.args[0]) &&
            code[dark.index - 3].name == "JmpFalse" && code[dark.index - 2].name == "GetByIndex" &&
            code[dark.index - 1].name == "Call2") { "Feed theme: forced-dark selection changed." }
        val destination = dark.value.args[0]
        // Equal-length moves preserve function, branch and exception offsets.
        val replacement = HermesOpcodes.move(destination, call.args[0]) + HermesOpcodes.move(destination, destination)
        require(replacement.size == HermesOpcodes.size(dark.value)) { "Feed theme: instruction width changed." }
        return dark.index to replacement
    }
}
