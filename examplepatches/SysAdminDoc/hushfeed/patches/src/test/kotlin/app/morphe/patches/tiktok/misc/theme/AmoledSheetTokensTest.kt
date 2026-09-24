package app.morphe.patches.tiktok.misc.theme

import app.morphe.Fixtures
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.ArrayPayload
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.value.IntEncodedValue
import java.io.File
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.util.zip.ZipFile
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Where TikTok 47.0.3's two sheets take their dark fill, read off the fixture, so the name the
 * AMOLED patch rewrites for them is held to the build it is declared for.
 *
 * <p>The comment panel's shapes and the Tux sheet behind the share sheet fill with one theme
 * attribute: the comment page sets drawable af4 or af9 on its container, whose solid is
 * ?attr/a24, and the Tux sheet reads TuxSheet's tux_sheetBackgroundColor, which its style points
 * at ?attr/a24 as well. The dark themes send a24 to the palette token aia, a dark literal
 * (#1E1E1E on the S22, 2026-09-23), and the light ones to axi, white. The names are the build's
 * own: 46.x reached the same sheets through agk and c3, which 47.0.3 keeps as unrelated tokens.
 * a24 is what TikTok's own token table calls UISheetFlat1, the fill of its sheets, panels, modals
 * and text cells as well, so all of those go black with it.
 */
class AmoledSheetTokensTest {
    @Test
    fun `47_0_3 fills both sheets through a24, which the dark themes send to aia`() {
        val apk = Fixtures.apks().single { it.name.contains("47.0.3") }
        val table = ResourceTable(apk)

        val sheetAttr = tuxSheetBackgroundAttr(apk)
        assertEquals("the Tux sheet background attribute", "b79", table.attrNames[sheetAttr])
        val sheetValues = table.styleValues("b79").toSet()
        assertTrue("b79 reaches a24 in a Tux sheet style: $sheetValues", "?attr/a24" in sheetValues)

        listOf("af4", "af9").forEach { drawable ->
            assertTrue("drawable/$drawable fills with ?attr/a24", table.drawableReferencesAttr(drawable, "a24"))
        }

        val a24 = table.styleValues("a24")
        assertEquals("what the themes point a24 at: $a24", setOf("?attr/aia", "?attr/axi"), a24.toSet())
        val dark = table.styleValues("aia")
        val light = table.styleValues("axi")
        assertTrue("aia is a dark opaque literal wherever it is set: $dark", dark.isNotEmpty() && dark.all(::isDarkOpaqueLiteral))
        assertTrue("axi is light wherever it is set: $light", light.isNotEmpty() && light.none(::isDarkOpaqueLiteral))
        assertTrue("the patch rewrites aia on 47.0.3", "aia" in sheetStyleItems("47.0.3", declaredVersions()))
    }

    /** R$styleable.TuxSheet[TuxSheet__tux_sheetBackgroundColor]: the int field and the array <clinit> fills. */
    private fun tuxSheetBackgroundAttr(apk: File): Int {
        val styleable = "Lcom/ss/android/ugc/aweme/app/R\$styleable;"
        val container = DexFileFactory.loadDexContainer(apk, Opcodes.getDefault())
        val classDef = container.dexEntryNames.asSequence().mapNotNull { entry ->
            container.getEntry(entry)!!.dexFile.classes.firstOrNull { it.type == styleable }
        }.first()
        val index = (classDef.staticFields.single { it.name == "TuxSheet__tux_sheetBackgroundColor" }
            .initialValue as IntEncodedValue).value
        val instructions = classDef.methods.single { it.name == "<clinit>" }.implementation!!.instructions.toList()
        val address = IntArray(instructions.size + 1)
        for (i in instructions.indices) address[i + 1] = address[i] + instructions[i].codeUnits
        val filled = HashMap<Int, List<Number>>()
        for (i in instructions.indices) {
            val instruction = instructions[i]
            if (instruction.opcode == Opcode.FILL_ARRAY_DATA) {
                val payload = instructions[address.indexOf(address[i] + (instruction as OffsetInstruction).codeOffset)] as ArrayPayload
                filled[(instruction as OneRegisterInstruction).registerA] = payload.arrayElements
            } else if (instruction.opcode == Opcode.SPUT_OBJECT) {
                val field = (instruction as ReferenceInstruction).reference as FieldReference
                if (field.definingClass == styleable && field.name == "TuxSheet") {
                    return filled.getValue((instruction as OneRegisterInstruction).registerA)[index].toInt()
                }
            }
        }
        error("no TuxSheet array in $styleable")
    }

    /** Just enough of resources.arsc for the checks above: attr and drawable names, and style items. */
    private class ResourceTable(private val apk: File) {
        private val table: ByteBuffer = ZipFile(apk).use { zip ->
            ByteBuffer.wrap(zip.getInputStream(zip.getEntry("resources.arsc")).use { it.readBytes() })
                .order(ByteOrder.LITTLE_ENDIAN)
        }
        val attrNames = HashMap<Int, String>()
        private val attrIds = HashMap<String, Int>()
        private val drawableFiles = HashMap<String, String>()
        /**
         * attr id to every value a style gives it, each config of a style counted on its own: a
         * colour literal or ?attr/name.
         */
        private val styleItems = HashMap<Int, MutableList<String>>()
        private var values: StringPool? = null

        init {
            forEachChunk(u16(2), table.limit()) { chunk, type ->
                when (type) {
                    STRING_POOL -> if (values == null) values = StringPool(table, chunk)
                    PACKAGE -> readPackage(chunk)
                }
            }
        }

        fun styleValues(attr: String): List<String> = styleItems[attrIds.getValue(attr)].orEmpty()

        /** Whether the drawable's compiled XML carries a ?attr/[attr] value anywhere. */
        fun drawableReferencesAttr(drawable: String, attr: String): Boolean {
            val path = drawableFiles.getValue(drawable)
            val xml = ZipFile(apk).use { zip -> zip.getInputStream(zip.getEntry(path)).use { it.readBytes() } }
            // A Res_value of size 8, type TYPE_ATTRIBUTE, holding the attr id.
            val pattern = ByteBuffer.allocate(8).order(ByteOrder.LITTLE_ENDIAN)
                .putShort(8).put(0).put(TYPE_ATTRIBUTE.toByte()).putInt(attrIds.getValue(attr)).array()
            return (0..xml.size - pattern.size).any { at -> pattern.indices.all { xml[at + it] == pattern[it] } }
        }

        private fun readPackage(start: Int) {
            val headerSize = u16(start + 2)
            val end = start + table.getInt(start + 4)
            val packageId = table.getInt(start + 8)
            if (packageId != 0x7f) return
            val typeNames = StringPool(table, start + table.getInt(start + 268))
            val keys = StringPool(table, start + table.getInt(start + 276))
            val typeIdOffset = if (headerSize >= 288) table.getInt(start + 284) else 0
            fun typeId(name: String) = (0 until typeNames.count).first { typeNames[it] == name } + 1 + typeIdOffset
            val attrType = typeId("attr")
            val styleType = typeId("style")
            val drawableType = typeId("drawable")
            val chunks = ArrayList<Int>()
            forEachChunk(start + headerSize, end) { chunk, type -> if (type == TYPE) chunks += chunk }
            // Names first: a style's items name their attrs by id.
            for (chunk in chunks) {
                val typeId = u8(chunk + 8)
                if (typeId != attrType && typeId != drawableType) continue
                forEachEntry(chunk) { index, entry ->
                    val name = keys[keyOf(entry)]
                    if (typeId == attrType) {
                        val id = (packageId shl 24) or (attrType shl 16) or index
                        attrNames[id] = name
                        attrIds[name] = id
                    } else if (u16(entry + 2) and COMPLEX == 0) {
                        // A compact entry keeps the value's type in its flags' high byte and the data inline.
                        val flags = u16(entry + 2)
                        val value = entry + u16(entry)
                        val type = if (flags and COMPACT != 0) flags ushr 8 else u8(value + 3)
                        val data = table.getInt(if (flags and COMPACT != 0) entry + 4 else value + 4)
                        if (type == TYPE_STRING) drawableFiles.putIfAbsent(name, values!![data])
                    }
                }
            }
            for (chunk in chunks) {
                if (u8(chunk + 8) != styleType) continue
                forEachEntry(chunk) { _, entry ->
                    val flags = u16(entry + 2)
                    if (flags and COMPLEX == 0 || flags and COMPACT != 0) return@forEachEntry
                    var item = entry + u16(entry)
                    repeat(table.getInt(entry + 12)) {
                        val attr = table.getInt(item)
                        val type = u8(item + 7)
                        val data = table.getInt(item + 8)
                        val shown = when (type) {
                            TYPE_ATTRIBUTE -> "?attr/" + (attrNames[data] ?: Integer.toHexString(data))
                            in 0x1c..0x1f -> "#" + String.format("%08x", data)
                            else -> "0x" + Integer.toHexString(type) + ":" + Integer.toHexString(data)
                        }
                        styleItems.getOrPut(attr) { ArrayList() } += shown
                        item += 12
                    }
                }
            }
        }

        private fun keyOf(entry: Int) = if (u16(entry + 2) and COMPACT != 0) u16(entry) else table.getInt(entry + 4)

        private fun forEachEntry(chunk: Int, each: (index: Int, entry: Int) -> Unit) {
            val flags = u8(chunk + 9)
            val count = table.getInt(chunk + 12)
            val entries = chunk + table.getInt(chunk + 16)
            val offsets = chunk + u16(chunk + 2)
            for (i in 0 until count) {
                val index: Int
                val offset: Int
                when {
                    flags and SPARSE != 0 -> { index = u16(offsets + 4 * i); offset = u16(offsets + 4 * i + 2) * 4 }
                    flags and OFFSET16 != 0 -> { index = i; offset = u16(offsets + 2 * i).let { if (it == 0xffff) -1 else it * 4 } }
                    else -> { index = i; offset = table.getInt(offsets + 4 * i) }
                }
                if (offset == -1) continue
                each(index, entries + offset)
            }
        }

        private fun forEachChunk(from: Int, until: Int, each: (start: Int, type: Int) -> Unit) {
            var at = from
            while (at + 8 <= until) {
                val size = table.getInt(at + 4)
                check(size >= 8 && at + size <= until) { "a chunk at $at runs past its parent" }
                each(at, u16(at))
                at += size
            }
        }

        private fun u8(at: Int) = table.get(at).toInt() and 0xff
        private fun u16(at: Int) = table.getShort(at).toInt() and 0xffff
    }

    private class StringPool(private val table: ByteBuffer, start: Int) {
        val count = table.getInt(start + 8)
        private val utf8 = table.getInt(start + 16) and 0x100 != 0
        private val strings = start + table.getInt(start + 20)
        private val offsets = start + (table.getShort(start + 2).toInt() and 0xffff)

        operator fun get(index: Int): String {
            check(index in 0 until count) { "string $index of $count" }
            fun u8(p: Int) = table.get(p).toInt() and 0xff
            fun u16(p: Int) = table.getShort(p).toInt() and 0xffff
            var at = strings + table.getInt(offsets + 4 * index)
            if (utf8) {
                at += if (u8(at) and 0x80 != 0) 2 else 1
                var length = u8(at++)
                if (length and 0x80 != 0) length = ((length and 0x7f) shl 8) or u8(at++)
                val bytes = ByteArray(length)
                table.get(at, bytes)
                return String(bytes, Charsets.UTF_8)
            }
            var length = u16(at)
            at += 2
            if (length and 0x8000 != 0) {
                length = ((length and 0x7fff) shl 16) or u16(at)
                at += 2
            }
            return buildString { for (i in 0 until length) append(table.getChar(at + 2 * i)) }
        }
    }

    private companion object {
        const val STRING_POOL = 0x0001
        const val PACKAGE = 0x0200
        const val TYPE = 0x0201
        const val SPARSE = 0x01
        const val OFFSET16 = 0x02
        const val COMPLEX = 0x0001
        const val COMPACT = 0x0008
        const val TYPE_ATTRIBUTE = 0x02
        const val TYPE_STRING = 0x03
    }
}
