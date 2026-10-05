package dev.twitchpatches.patches.twitch.shared.hermes

import java.io.ByteArrayOutputStream
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.security.MessageDigest
import org.junit.Assert.*
import org.junit.Test


class HermesContractsTest {
    @Test fun derivesExportFromFactoryAndDefinitionInsteadOfFixedId() {
        val bundle = HermesBundle(fixture(93))
        assertEquals(MetroExport(93, "FixtureComponent"), MetroExports(bundle).resolve("FixtureComponent", setOf("fixtureProp")))
        assertEquals(147, MetroExports(HermesBundle(fixture(147))).resolve("FixtureComponent", setOf("fixtureProp")).module)
    }

    @Test fun changedPropertiesAndMalformedInstructionsFailClosed() {
        val bundle = HermesBundle(fixture(12))
        assertThrows(IllegalArgumentException::class.java) { MetroExports(bundle).resolve("FixtureComponent", setOf("missingProp")) }
        val opcode = schema.indexOfFirst { it[0] == "CreateClosure" }
        assertThrows(IllegalArgumentException::class.java) { HermesOpcodes.decode(byteArrayOf(opcode.toByte(), 0), 0, 2) }
    }

    @Test fun alternativeBackingContractsRequireOneInspectedProperty() {
        val exports = MetroExports(HermesBundle(fixture(93)))
        assertEquals(93, exports.resolveAny("FixtureComponent", setOf("fixtureProp", "otherBacking")).module)
        assertThrows(IllegalStateException::class.java) {
            exports.resolveAny("FixtureComponent", setOf("missingBacking", "otherBacking"))
        }
        assertThrows(IllegalArgumentException::class.java) {
            exports.resolveAny("FixtureComponent", emptySet())
        }
    }

    @Test fun memoExportRequiresProvenWrapperAndTracksModuleDefinitions() {
        assertEquals(91, MetroExports(HermesBundle(fixture(91, true)))
            .resolveMemo("FixtureComponent", "FixtureComponent", setOf("fixtureProp")).module)
        assertEquals(131, MetroExports(HermesBundle(fixture(131, true)))
            .resolveMemo("FixtureComponent", "FixtureComponent", setOf("fixtureProp")).module)
        assertThrows(NoSuchElementException::class.java) {
            MetroExports(HermesBundle(fixture(91))).resolveMemo("FixtureComponent", "FixtureComponent", setOf("fixtureProp"))
        }
        assertThrows(IllegalArgumentException::class.java) {
            MetroExports(HermesBundle(fixture(91, true))).resolveMemo("FixtureComponent", "FixtureComponent", setOf("missingProp"))
        }
    }

    @Test fun modifiedBundleAndUnsupportedFormatFailClosed() {
        val changed = fixture(12); changed[changed.size - 1] = (changed.last().toInt() xor 1).toByte()
        assertThrows(IllegalArgumentException::class.java) { HermesBundle(changed) }
        val unsupported = fixture(12); unsupported[8] = 99
        assertThrows(IllegalArgumentException::class.java) { HermesBundle(unsupported) }
    }

    @Test fun deferredExportTracksClosureAcrossUnrelatedInstructionsAndRejectsClobber() {
        assertEquals(153, MetroExports(HermesBundle(fixture(153, deferred = true)))
            .resolveDeferred("FixtureComponent", setOf("fixtureProp")).module)
        assertThrows(IllegalStateException::class.java) {
            MetroExports(HermesBundle(fixture(153, deferred = true, clobber = true)))
                .resolveDeferred("FixtureComponent", setOf("fixtureProp"))
        }
    }

    @Test fun deferredAliasesRequireTheFinalExportToRetainTheProvenClosure() {
        assertEquals(153, MetroExports(HermesBundle(fixture(153, deferred = true, component = "FixtureImplementation")))
            .resolveDeferred("FixtureComponent", setOf("fixtureProp"), "FixtureImplementation").module)
        assertThrows(IllegalStateException::class.java) {
            MetroExports(HermesBundle(fixture(153, deferred = true, overwrittenExport = true)))
                .resolveDeferred("FixtureComponent", setOf("fixtureProp"))
        }
    }

    private val schema = requireNotNull(javaClass.getResourceAsStream("/hermes/hbc98.csv")).bufferedReader()
        .useLines { lines -> lines.filter { !it.startsWith('#') }.map { it.split(',') }.toList() }

    private fun code(vararg instructions: Pair<String, List<Int>>): ByteArray {
        val bytes = ByteArrayOutputStream()
        instructions.forEach { (name, args) ->
            val index = schema.indexOfFirst { it.first() == name }; require(index >= 0)
            val operands = schema[index].drop(1).filter { it.isNotEmpty() }
            require(operands.size == args.size)
            bytes.write(index)
            operands.zip(args).forEach { (type, value) ->
                val width = when (type) { "UInt16" -> 2; "UInt32", "Imm32" -> 4; else -> 1 }
                repeat(width) { byte -> bytes.write(value ushr (byte * 8) and 255) }
            }
        }
        return bytes.toByteArray()
    }

    @Test fun directExportsRequireTheInspectedHookArity() {
        for (arity in listOf(1, 3, 4)) {
            val exports = MetroExports(HermesBundle(fixture(91, arity = arity)))
            assertEquals(91, exports.resolve("FixtureComponent", setOf("fixtureProp"), arity).module)
            assertThrows(IllegalStateException::class.java) { exports.resolve("FixtureComponent", setOf("fixtureProp")) }
        }
    }

    @Test fun objectExportsRequireTheShapeAndSurvivingExportValue() {
        val keys = setOf("fixtureProp", "memo")
        for (id in listOf(93, 147)) {
            val exports = MetroExports(HermesBundle(fixture(id, objectExport = true)))
            assertEquals(id, exports.resolveObjectExport("FixtureComponent", keys).module)
            assertThrows(IllegalStateException::class.java) { exports.resolveObjectExport("FixtureComponent", setOf("missing")) }
        }
        for (overwritten in listOf(false, true)) {
            val bundle = HermesBundle(fixture(93, objectExport = true, clobber = !overwritten, overwrittenExport = overwritten))
            assertThrows(IllegalStateException::class.java) { MetroExports(bundle).resolveObjectExport("FixtureComponent", keys) }
        }
    }

    private fun fixture(module: Int, memo: Boolean = false, deferred: Boolean = false, clobber: Boolean = false,
        component: String = "FixtureComponent", overwrittenExport: Boolean = false, arity: Int = 2,
        objectExport: Boolean = false): ByteArray {
        val strings = listOf("global", "", "FixtureComponent", "__d", "fixtureProp", "memo", component)
        val bodies = listOf(
            code("TryGetById" to listOf(1, 0, 0, 3), "LoadConstInt" to listOf(4, module),
                "CreateClosure" to listOf(2, 0, 1), "NewArray" to listOf(3, 0),
                "Call4" to listOf(0, 1, 0, 2, 4, 3), "Ret" to listOf(0)),
            if (objectExport) code("LoadParam" to listOf(1, 6), "NewObjectWithBuffer" to listOf(2, 0, 0),
                "LoadConstUndefined" to listOf(if (clobber) 2 else 3), "PutByIdLoose" to listOf(1, 2, 0, 2)) +
                (if (overwrittenExport) code("LoadConstUndefined" to listOf(2), "PutByIdLoose" to listOf(1, 2, 0, 2)) else byteArrayOf()) +
                code("Ret" to listOf(0))
            else if (deferred) code("LoadParam" to listOf(1, 6), "CreateClosure" to listOf(2, 0, 2),
                "LoadConstUndefined" to listOf(if (clobber) 2 else 3),
                "PutByIdLoose" to listOf(1, 2, 0, 2)) +
                (if (overwrittenExport) code("LoadConstUndefined" to listOf(2), "PutByIdLoose" to listOf(1, 2, 0, 2)) else byteArrayOf()) +
                code("Ret" to listOf(0))
            else if (memo) code("LoadParam" to listOf(1, 6), "GetById" to listOf(3, 0, 0, 5),
                "CreateClosure" to listOf(2, 0, 2), "Call2" to listOf(2, 3, 0, 2),
                "PutByIdLoose" to listOf(1, 2, 0, 2), "Ret" to listOf(0))
            else code("LoadParam" to listOf(1, 6), "CreateClosure" to listOf(2, 0, 2),
                "PutByIdLoose" to listOf(1, 2, 0, 2), "Ret" to listOf(0)),
            code("LoadParam" to listOf(1, 1), "GetById" to listOf(2, 1, 0, 4), "Ret" to listOf(2)))
        val table = 128 + bodies.size * 12
        val storage = table + strings.size * 4
        val storageSize = strings.sumOf { it.length }
        val literalAt = (storage + storageSize + 3) and -4
        val codeAt = literalAt + if (objectExport) 20 else 0
        val result = ByteArray(codeAt + bodies.sumOf { it.size } + 20)
        val header = ByteBuffer.wrap(result).order(ByteOrder.LITTLE_ENDIAN)
        header.putLong(0, 0x1f1903c103bc1fc6L); header.putInt(8, 98); header.putInt(32, result.size)
        header.putInt(40, bodies.size); header.putInt(52, strings.size); header.putInt(60, storageSize)
        if (objectExport) {
            header.putInt(80, 1); header.putInt(84, 5); header.putInt(88, 1)
            result[literalAt] = 2
            result[literalAt + 4] = 0x52; header.putShort(literalAt + 5, 4); header.putShort(literalAt + 7, 5)
            header.putInt(literalAt + 12, 0); header.putInt(literalAt + 16, 2)
        }
        var cursor = codeAt
        bodies.forEachIndexed { id, body ->
            val params = listOf(1, 8, arity)[id]
            header.putInt(128 + id * 12, cursor or (params shl 25))
            header.putInt(132 + id * 12, body.size or ((if (id == 2) 6 else id) shl 14))
            result[136 + id * 12] = 8
            body.copyInto(result, cursor); cursor += body.size
        }
        var offset = 0
        strings.forEachIndexed { id, value ->
            header.putInt(table + id * 4, (offset shl 1) or (value.length shl 24))
            value.toByteArray(Charsets.ISO_8859_1).copyInto(result, storage + offset); offset += value.length
        }
        MessageDigest.getInstance("SHA-1").digest(result.copyOfRange(0, result.size - 20)).copyInto(result, result.size - 20)
        return result
    }
}
