package dev.twitchpatches.patches.twitch.shared.hermes

internal data class HermesInstruction(val name: String, val args: List<Int>)

internal object HermesOpcodes {
    private data class Layout(val name: String, val operands: List<String>)
    private val layouts: List<Layout> = requireNotNull(javaClass.getResourceAsStream("/hermes/hbc98.csv"))
        .bufferedReader().useLines { lines -> lines.filter { !it.startsWith('#') }.map { line ->
            val parts = line.split(',')
            Layout(parts.first(), parts.drop(1).filter { it.isNotEmpty() })
        }.toList() }

    fun decode(bytes: ByteArray, start: Int, size: Int): List<HermesInstruction> {
        require(start >= 0 && size >= 0 && start.toLong() + size <= bytes.size)
        val end = start + size
        var cursor = start
        val result = mutableListOf<HermesInstruction>()
        while (cursor < end) {
            val layout = layouts.getOrNull(bytes[cursor++].toInt() and 255)
                ?: error("Hermes opcode is not in the inspected 98 schema.")
            val args = layout.operands.map { type ->
                val width = when (type) {
                    "Reg8", "UInt8", "Addr8" -> 1
                    "UInt16" -> 2
                    "Double" -> 8
                    "Reg32", "UInt32", "Addr32", "Imm32" -> 4
                    else -> error("Hermes operand schema is invalid.")
                }
                require(cursor + width <= end) { "Hermes instruction extends beyond its function." }
                var value = 0
                if (width <= 4) for (index in 0 until width) {
                    value = value or ((bytes[cursor + index].toInt() and 255) shl (8 * index))
                }
                cursor += width
                value
            }
            result.add(HermesInstruction(layout.name, args))
        }
        return result
    }
}
