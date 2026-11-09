package app.hushmessenger.patches.controls

import java.io.DataInputStream
import java.nio.file.Files
import java.nio.file.Paths
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

/**
 * The finders run their checks on every method in Messenger. HotSpot never compiles a method over 8000 bytes of
 * bytecode and ART's optimizing compiler skips huge methods too, so a finder that size stays in the interpreter for
 * the whole scan, which took many minutes on a phone (#148, #150).
 */
class FinderMethodSizeTest {
    private val limit = 8000

    @Test
    fun `every patch method is small enough to compile`() {
        val root = Paths.get(CommunityInboxContract::class.java.protectionDomain.codeSource.location.toURI())
        assertTrue(Files.isDirectory(root), "patch classes at $root")
        val methods = Files.walk(root).use { paths -> paths.filter { it.toString().endsWith(".class") }.toList() }
            .flatMap { file -> codeLengths(Files.readAllBytes(file)).map { (name, size) -> Triple(root.relativize(file), name, size) } }
        // The scan reads the finders it guards, at a size that matches javap's.
        val finders = methods.filter { it.second in setOf("findControls", "findCommunityInbox", "resolveMarkReadRecipe") }
        assertEquals(3, finders.size, finders.toString())
        assertTrue(finders.all { it.third > 500 }, finders.toString())
        val tooBig = methods.filter { (_, name, size) -> name != "<clinit>" && size >= limit }.map { (file, name, size) -> "$file $name $size" }
        assertEquals(emptyList(), tooBig)
    }

    /** Each method's name and bytecode length, read from a class file's Code attributes. */
    private fun codeLengths(bytes: ByteArray): List<Pair<String, Int>> {
        val input = DataInputStream(bytes.inputStream())
        assertEquals(0xCAFEBABE.toInt(), input.readInt())
        input.skipFully(4)
        val count = input.readUnsignedShort()
        val utf8 = arrayOfNulls<String>(count)
        var i = 1
        while (i < count) {
            when (val tag = input.readUnsignedByte()) {
                1 -> utf8[i] = input.readUTF()
                3, 4, 9, 10, 11, 12, 17, 18 -> input.skipFully(4)
                5, 6 -> { input.skipFully(8); i++ }
                7, 8, 16, 19, 20 -> input.skipFully(2)
                15 -> input.skipFully(3)
                else -> error("constant pool tag $tag")
            }
            i++
        }
        input.skipFully(6)
        input.skipFully(2 * input.readUnsignedShort())
        repeat(input.readUnsignedShort()) { input.skipFully(6); input.skipAttributes() }
        return List(input.readUnsignedShort()) {
            input.skipFully(2)
            val name = utf8[input.readUnsignedShort()] ?: error("method name")
            input.skipFully(2)
            var code = 0
            repeat(input.readUnsignedShort()) {
                val attribute = utf8[input.readUnsignedShort()]
                val length = input.readInt()
                if (attribute == "Code") {
                    input.skipFully(4)
                    code = input.readInt()
                    input.skipFully(length - 8)
                } else input.skipFully(length)
            }
            name to code
        }
    }

    private fun DataInputStream.skipFully(n: Int) = readNBytes(n).also { check(it.size == n) }
    private fun DataInputStream.skipAttributes() = repeat(readUnsignedShort()) { skipFully(2); skipFully(readInt()) }
}
