/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.patches.tiktok.interaction.publishdate

import app.morphe.Fixtures
import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.takes
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import kotlinx.coroutines.runBlocking
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder

/**
 * What the grid sort (#180) hooks, held to each declared build: the profile grid adapter's
 * `setData(List)` and `setDataAfterLoadMore(List)` are each found once, in one class, and the
 * hooks assemble in front of TikTok's code with the list register handed back.
 */
class GridSortAnchorsTest {
    @get:Rule val temporary = TemporaryFolder()

    @Test
    fun `each declared build has one grid adapter with both list methods`() {
        Fixtures.forEachDeclared { apk ->
            val version = Fixtures.versionOf(apk)
            val data = mutableListOf<Method>()
            val page = mutableListOf<Method>()
            val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
            for (entry in container.dexEntryNames) {
                for (classDef in container.getEntry(entry)!!.dexFile.classes) {
                    for (method in classDef.methods) {
                        if (GridAdapterSetDataFingerprint.takes(method, classDef)) data += method
                        if (GridAdapterPageFingerprint.takes(method, classDef)) page += method
                    }
                }
            }
            assertEquals("$version: setData ${data.map { it.definingClass }}", 1, data.size)
            assertEquals("$version: setDataAfterLoadMore ${page.map { it.definingClass }}", 1, page.size)
            assertEquals("$version: one class", data.single().definingClass, page.single().definingClass)
        }
    }

    @Test
    fun `the hooks assemble on each declared build and hand the sorted list on`() {
        Fixtures.forEachDeclared { apk ->
            val version = Fixtures.versionOf(apk)
            var checked = false
            val probe = bytecodePatch(name = "grid sort probe") {
                execute {
                    fun ops(m: Method) = m.implementation!!.instructions.filter { it.opcode != Opcode.NOP }.toList()
                    val setBefore = ops(GridAdapterSetDataFingerprint.method).map { it.opcode }
                    val pageBefore = ops(GridAdapterPageFingerprint.method).map { it.opcode }
                    GridAdapterSetDataFingerprint.clearMatch()
                    GridAdapterPageFingerprint.clearMatch()
                    assertTrue("$version: the hooks went in", hookGridSort(version))
                    GridAdapterSetDataFingerprint.clearMatch()
                    GridAdapterPageFingerprint.clearMatch()
                    val setAfter = ops(GridAdapterSetDataFingerprint.method)
                    val pageAfter = ops(GridAdapterPageFingerprint.method)

                    val ask = setAfter.first().getReference<MethodReference>()!!
                    assertEquals(
                        "Lapp/morphe/extension/tiktok/feed/GridSort;->data(Ljava/lang/Object;Ljava/util/List;)Ljava/util/List;",
                        "${ask.definingClass}->${ask.name}(${ask.parameterTypes.joinToString("")})${ask.returnType}",
                    )
                    assertEquals(
                        listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT_OBJECT) + setBefore,
                        setAfter.map { it.opcode },
                    )
                    val more = pageAfter.first().getReference<MethodReference>()!!
                    assertEquals(
                        "Lapp/morphe/extension/tiktok/feed/GridSort;->page(Ljava/lang/Object;Ljava/util/List;)Ljava/util/List;",
                        "${more.definingClass}->${more.name}(${more.parameterTypes.joinToString("")})${more.returnType}",
                    )
                    assertEquals(
                        listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT_OBJECT) + pageBefore,
                        pageAfter.map { it.opcode },
                    )
                    checked = true
                }
            }
            GridAdapterSetDataFingerprint.clearMatch()
            GridAdapterPageFingerprint.clearMatch()
            Patcher(PatcherConfig(apk, temporary.newFolder())).use { patcher ->
                patcher += setOf(probe)
                runBlocking { patcher().collect { result -> result.exception?.let { throw it } } }
            }
            GridAdapterSetDataFingerprint.clearMatch()
            GridAdapterPageFingerprint.clearMatch()
            assertTrue("$version: the probe never ran", checked)
        }
    }

    @Test
    fun `only a list method of the class that logs the grid adapter tag is taken`() {
        assertTrue(GridAdapterSetDataFingerprint.takes(method("setData"), adapter(tagged = true)))
        assertTrue(GridAdapterPageFingerprint.takes(method("setDataAfterLoadMore"), adapter(tagged = true)))
        assertFalse("another name", GridAdapterSetDataFingerprint.takes(method("addData"), adapter(tagged = true)))
        assertFalse("static", GridAdapterSetDataFingerprint.takes(method("setData", static = true), adapter(tagged = true)))
        assertFalse("another adapter", GridAdapterSetDataFingerprint.takes(method("setData"), adapter(tagged = false)))
    }

    private fun method(name: String, static: Boolean = false): Method =
        ImmutableMethod(
            "LX/0Grid;", name, listOf(ImmutableMethodParameter("Ljava/util/List;", null, null)), "V",
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value or (if (static) AccessFlags.STATIC.value else 0),
            null, null, null,
        )

    /** The class with the cell builder that logs under the tag, or one that doesn't. */
    private fun adapter(tagged: Boolean): ImmutableClassDef {
        val tag = if (tagged) "Profile_AwemeAdapter" else "SomethingElse"
        val builder = ImmutableMethod(
            "LX/0Grid;", "onCreateBasicViewHolder", listOf(), "V", AccessFlags.PUBLIC.value, null, null,
            ImmutableMethodImplementation(
                1,
                listOf(
                    ImmutableInstruction21c(Opcode.CONST_STRING, 0, ImmutableStringReference(tag)),
                    ImmutableInstruction10x(Opcode.RETURN_VOID),
                ),
                null,
                null,
            ),
        )
        return ImmutableClassDef(
            "LX/0Grid;", AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, "Ljava/lang/Object;",
            null, null, null, null, listOf(builder),
        )
    }
}
