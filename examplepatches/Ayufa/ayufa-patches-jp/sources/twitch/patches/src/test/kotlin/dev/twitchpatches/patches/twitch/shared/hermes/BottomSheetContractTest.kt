package dev.twitchpatches.patches.twitch.shared.hermes

import java.io.ByteArrayOutputStream
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.security.MessageDigest
import org.junit.Assert.assertThrows
import org.junit.Test

class BottomSheetContractTest {
    private val properties = setOf("children", "onClose", "scrollable", "footer")
    private data class Function(val name: String, val params: Int, val symbols: List<String>)

    @Test fun acceptsDirectAndTwoValidatedImplementations() {
        check(listOf(Function("BottomSheet", 2, properties.toList())))
        check(delegates())
    }

    @Test fun rejectsAMissingOrChangedDelegate() {
        assertThrows(IllegalArgumentException::class.java) { check(delegates().dropLast(1)) }
        assertThrows(IllegalArgumentException::class.java) {
            check(delegates().dropLast(1) + Function("RNBottomSheet", 2, listOf("children")))
        }
        assertThrows(IllegalArgumentException::class.java) {
            check(delegates().dropLast(1) + Function("RNBottomSheet", 3, properties.toList()))
        }
    }

    @Test fun rejectsAmbiguousAndUnknownImplementations() {
        assertThrows(IllegalArgumentException::class.java) { check(delegates() + delegates()[1]) }
        assertThrows(IllegalArgumentException::class.java) {
            check(delegates().mapIndexed { index, function ->
                if (index == 0) function.copy(symbols = function.symbols + "OtherBottomSheet") else function
            })
        }
    }

    @Test fun cannotRelaxAnUnrelatedFunctionContract() {
        val functions = listOf(Function("Other", 2, listOf("NativeOther", "RNOther")),
            Function("NativeOther", 2, properties.toList()), Function("RNOther", 2, properties.toList()))
        assertThrows(IllegalArgumentException::class.java) {
            MetroExports(bundle(functions)).requireFunctionContract("Other", 2, properties)
        }
    }

    private fun check(functions: List<Function>) =
        MetroExports(bundle(functions)).requireFunctionContract("BottomSheet", 2, properties)

    private fun delegates() = listOf(Function("BottomSheet", 2, listOf("NativeBottomSheet", "RNBottomSheet")),
        Function("NativeBottomSheet", 2, properties.toList()), Function("RNBottomSheet", 2, properties.toList()))

    private fun bundle(implementations: List<Function>): HermesBundle {
        val functions = listOf(Function("global", 1, emptyList())) + implementations
        val strings = functions.flatMap { listOf(it.name) + it.symbols }.distinct()
        val schema = requireNotNull(javaClass.getResourceAsStream("/hermes/hbc98.csv")).bufferedReader()
            .useLines { lines -> lines.filter { !it.startsWith('#') }.map { it.split(',') }.toList() }
        fun instruction(name: String, args: List<Int>): ByteArray {
            val opcode = schema.indexOfFirst { it.first() == name }
            val output = ByteArrayOutputStream()
            output.write(opcode)
            schema[opcode].drop(1).filter { it.isNotEmpty() }.zip(args).forEach { (type, value) ->
                val width = when (type) { "UInt16" -> 2; "UInt32", "Imm32" -> 4; else -> 1 }
                repeat(width) { byte -> output.write(value ushr (byte * 8) and 255) }
            }
            return output.toByteArray()
        }
        val bodies = functions.map { function ->
            function.symbols.fold(byteArrayOf()) { code, symbol ->
                code + instruction("GetById", listOf(1, 0, 0, strings.indexOf(symbol)))
            } + instruction("Ret", listOf(0))
        }
        val table = 128 + functions.size * 12
        val storage = table + strings.size * 4
        val storageSize = strings.sumOf { it.length }
        val codeAt = (storage + storageSize + 3) and -4
        val bytes = ByteArray(codeAt + bodies.sumOf { it.size } + 20)
        val header = ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN)
        header.putLong(0, 0x1f1903c103bc1fc6L)
        header.putInt(8, 98); header.putInt(32, bytes.size)
        header.putInt(40, functions.size); header.putInt(52, strings.size); header.putInt(60, storageSize)
        var offset = codeAt
        functions.forEachIndexed { id, function ->
            header.putInt(128 + id * 12, offset or (function.params shl 25))
            header.putInt(132 + id * 12, bodies[id].size or (strings.indexOf(function.name) shl 14))
            bytes[136 + id * 12] = 8
            bodies[id].copyInto(bytes, offset); offset += bodies[id].size
        }
        offset = 0
        strings.forEachIndexed { id, string ->
            header.putInt(table + id * 4, (offset shl 1) or (string.length shl 24))
            string.toByteArray(Charsets.ISO_8859_1).copyInto(bytes, storage + offset); offset += string.length
        }
        MessageDigest.getInstance("SHA-1").digest(bytes.copyOfRange(0, bytes.size - 20)).copyInto(bytes, bytes.size - 20)
        return HermesBundle(bytes)
    }
}
