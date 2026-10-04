/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotSame
import org.junit.Assert.assertThrows
import org.junit.Test
import org.junit.rules.TemporaryFolder
import org.junit.Rule
import java.io.File
import java.util.zip.CRC32
import java.util.zip.ZipEntry
import java.util.zip.ZipOutputStream

class FixtureDexCensusTest {
    @get:Rule val temporary = TemporaryFolder()

    @Test
    fun `repeated census retains every dex collision and rematerializes isolated classes`() {
        val file = temporary.newFile("collision.apk")
        apk(file, listOf(listOf(owner("Lfixture/Owner;")), listOf(owner("Lfixture/Owner;"), owner("Lfixture/Other;"))))
        val census = FixtureDex.ClassCensus()
        var inspected = 0
        fun read() = FixtureDex.classesWhere(file, census, { true }) { inspected++; it.name == "probe" }
        val first = read()
        assertEquals(3, inspected)
        assertEquals(listOf("Lfixture/Owner;", "Lfixture/Other;", "Lfixture/Owner;"), first.map { it.type })
        val context = PatchContexts.of(listOf(first.first()))
        context.mutableClassDefBy(first.first().type).methods.single().replaceInstruction(0, "nop")
        val second = read()
        assertEquals("the warm inspection does not repeat the full method census", 3, inspected)
        assertEquals(first.map { it.type }, second.map { it.type })
        first.zip(second).forEach { (before, after) ->
            assertNotSame(before, after)
            assertEquals(listOf(Opcode.RETURN_VOID), after.methods.single().implementation!!.instructions.map { it.opcode })
        }
    }

    @Test
    fun `same path size and timestamp cannot retain facts from altered apk bytes`() {
        val file = temporary.newFile("changed.apk")
        apk(file, listOf(listOf(owner("Lfixture/Before;"))))
        val census = FixtureDex.ClassCensus()
        var inspected = 0
        fun read() = FixtureDex.classesWhere(file, census, { true }) { inspected++; true }
        assertEquals("Lfixture/Before;", read().single().type)
        val size = file.length()
        val time = file.lastModified()
        apk(file, listOf(listOf(owner("Lfixture/AfterX;"))))
        assertEquals("the changed fixture keeps its old size", size, file.length())
        check(file.setLastModified(time))
        assertEquals("Lfixture/AfterX;", read().single().type)
        assertEquals(2, inspected)
        assertEquals("Lfixture/AfterX;", read().single().type)
        assertEquals(2, inspected)
    }

    @Test
    fun `query identities and filtered dex files stay independent`() {
        val file = temporary.newFile("queries.apk")
        apk(file, listOf(listOf(owner("Lfixture/First;")), listOf(owner("Lfixture/Later;"))))
        val first = FixtureDex.ClassCensus()
        val later = FixtureDex.ClassCensus()
        var inspected = 0
        repeat(2) {
            assertEquals("Lfixture/First;", FixtureDex.classesWhere(file, first,
                { dex -> dex.typeReferences.any { it.type == "Lfixture/First;" } }) { inspected++; true }.single().type)
            assertEquals("Lfixture/Later;", FixtureDex.classesWhere(file, later, { true }) {
                inspected++; it.definingClass == "Lfixture/Later;"
            }.single().type)
        }
        assertEquals(3, inspected)
    }

    @Test
    fun `bundle censuses read only base dex entries and retain each container independently`() {
        val base = temporary.newFile("base.apk")
        apk(base, listOf(listOf(owner("Lfixture/Base;")), listOf(owner("Lfixture/Later;"))))
        val census = FixtureDex.ClassCensus()
        var inspected = 0
        for (extension in listOf("apkm", "xapk")) {
            val file = temporary.newFile("bundle.$extension")
            ZipOutputStream(file.outputStream()).use { zip ->
                zip.putNextEntry(ZipEntry("base.apk"))
                zip.write(base.readBytes())
                zip.closeEntry()
                zip.putNextEntry(ZipEntry("assets/classes.dex"))
                zip.write(byteArrayOf(1, 2, 3))
                zip.closeEntry()
            }
            repeat(2) {
                val classes = FixtureDex.classesWhere(file, census, { true }) { inspected++; true }
                assertEquals(listOf("Lfixture/Base;", "Lfixture/Later;"), classes.map { it.type })
            }
        }
        assertEquals(4, inspected)
    }

    @Test
    fun `empty census is retained and a third content identity evicts the oldest`() {
        val files = listOf("First", "Later", "Third").map { name ->
            temporary.newFile("$name.apk").also { apk(it, listOf(listOf(owner("Lfixture/$name;")))) }
        }
        val census = FixtureDex.ClassCensus()
        var inspected = 0
        fun read(file: File) = FixtureDex.classesWhere(file, census, { true }) { inspected++; false }
        assertEquals(emptyList<ClassDef>(), read(files[0]))
        read(files[0])
        assertEquals(1, inspected)
        read(files[1])
        read(files[2])
        read(files[0])
        assertEquals(4, inspected)
    }

    @Test
    fun `a broad query streams again instead of retaining an unbounded census`() {
        val file = temporary.newFile("broad.apk")
        apk(file, listOf((0..128).map { owner("Lfixture/Owner$it;") }))
        val census = FixtureDex.ClassCensus()
        var inspected = 0
        repeat(2) {
            assertEquals(129, FixtureDex.classesWhere(file, census, { true }) { inspected++; true }.size)
        }
        assertEquals(258, inspected)
    }

    @Test
    fun `a fixture changed during its census is refused and cannot publish retained facts`() {
        val file = temporary.newFile("during.apk")
        apk(file, listOf(listOf(owner("Lfixture/Before;"))))
        val census = FixtureDex.ClassCensus()
        assertThrows(IllegalStateException::class.java) {
            FixtureDex.classesWhere(file, census, { true }) {
                apk(file, listOf(listOf(owner("Lfixture/AfterX;"))))
                true
            }
        }
        assertEquals("Lfixture/AfterX;", FixtureDex.classesWhere(file, census, { true }) { true }.single().type)
    }

    private fun owner(type: String) = ImmutableClassDef(type, AccessFlags.PUBLIC.value, "Ljava/lang/Object;",
        emptyList(), null, emptyList(), emptyList(), listOf(ImmutableMethod(type, "probe", emptyList(), "V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
            ImmutableMethodImplementation(0, listOf(ImmutableInstruction10x(Opcode.RETURN_VOID)), null, null))))

    private fun apk(file: File, dexFiles: List<List<ClassDef>>) = ZipOutputStream(file.outputStream()).use { zip ->
        dexFiles.forEachIndexed { index, classes ->
            val pool = DexPool(Opcodes.getDefault())
            classes.forEach(pool::internClass)
            val store = MemoryDataStore()
            val bytes = try { pool.writeTo(store); store.data } finally { store.close() }
            val entry = ZipEntry(if (index == 0) "classes.dex" else "classes${index + 1}.dex").apply {
                method = ZipEntry.STORED
                size = bytes.size.toLong()
                compressedSize = size
                crc = CRC32().apply { update(bytes) }.value
                time = 0
            }
            zip.putNextEntry(entry)
            zip.write(bytes)
            zip.closeEntry()
        }
    }
}
