package dev.local.mixplorer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertNotNull
import kotlin.test.assertNull
import kotlin.test.assertTrue

class SharingFixPatchTest {
    @Test
    fun `uses a recipient independent patch name`() {
        assertEquals("Fix scoped-storage file sharing", fixScopedStorageFileSharingPatch.name)
    }

    @Test
    fun `supports any stable and beta MiXplorer version on Android 11 or later`() {
        val compatibility = fixScopedStorageFileSharingPatch.compatibility.orEmpty()
        assertEquals(2, compatibility.size)
        val supported = compatibility.associateBy { it.packageName }
        assertEquals(setOf("com.mixplorer", "com.mixplorer.beta"), supported.keys)
        supported.values.forEach { compatibility ->
            val target = compatibility.targets.single()
            assertNull(target.version)
            assertNull(target.versionCodes)
            assertEquals(30, target.minSdk)
        }
    }

    private val queryTypes = listOf(
        "Landroid/net/Uri;", "[Ljava/lang/String;", "Ljava/lang/String;",
        "[Ljava/lang/String;", "Ljava/lang/String;",
    )

    private fun fixture(dataColumn: String = "_data", duplicate: Boolean = false): MutableClass {
        val method = ImmutableMethod(
            PROVIDER, "query", queryTypes.map { ImmutableMethodParameter(it, null, null) },
            "Landroid/database/Cursor;", AccessFlags.PUBLIC.value, null, null,
            MutableMethodImplementation(24),
        ).toMutable()
        method.addInstructionsWithLabels(
            0,
            """
                const-string v3, "document_id"
                invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v3
                if-eqz v3, :data_column
                add-int/lit8 v4, v20, 0x1
                iget v3, v11, Ltest/FileInfo;->id:I
                invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
                move-result-object v3
                aput-object v3, v13, v20
                goto :column_done
                :data_column
                const-string v3, "$dataColumn"
                invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v3
                if-nez v3, :original_path
                const-string v3, "path"
                invoke-virtual {v3, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
                move-result v3
                if-eqz v3, :other_column
                :original_path
                move v5, v2
                goto :write_path
                :write_path
                add-int/lit8 v4, v20, 0x1
                iget-object v3, v11, Ltest/FileInfo;->path:Ljava/lang/String;
                aput-object v3, v13, v20
                goto :column_done
                :other_column
                const/4 v3, 0x0
                :column_done
                return-object v0
            """.trimIndent(),
        )
        if (duplicate) {
            method.addInstructionsWithLabels(0, "const-string v7, \"_data\"")
        }
        return ImmutableClassDef(
            PROVIDER, AccessFlags.PUBLIC.value, "Landroid/content/ContentProvider;",
            null, null, null, null, listOf(method),
        ).toMutable()
    }

    @Test
    fun `adds UID guard and null store with original high register indexes`() {
        val provider = fixture()
        val originalQuery = provider.methods.single()
        val originalInstructions = originalQuery.implementation!!.instructions.toList()
        val originalPath = (originalInstructions[13] as BuilderOffsetInstruction).target.location.instruction
        val originalDone = (originalInstructions[9] as BuilderOffsetInstruction).target.location.instruction

        patchProvider(provider)

        val helper = provider.methods.single { it.name == CALLER_CHECK }
        val calls = helper.implementation!!.instructions.mapNotNull {
            (it as? ReferenceInstruction)?.reference as? MethodReference
        }.map { "${it.definingClass}->${it.name}" }
        assertEquals(listOf("Landroid/os/Binder;->getCallingUid", "Landroid/os/Process;->myUid"), calls)
        val instructions = originalQuery.implementation!!.instructions
        assertEquals(24, originalQuery.implementation!!.registerCount)
        assertTrue(instructions.any { instruction ->
            val store = instruction as? ThreeRegisterInstruction
            instruction.opcode == Opcode.APUT_OBJECT && store?.registerA == 3 &&
                store.registerB == 13 && store.registerC == 20
        })
        val branches = instructions.filterIsInstance<BuilderOffsetInstruction>()
        assertTrue(branches.any { it.target.location.instruction === originalPath })
        assertTrue(branches.any { it.target.location.instruction === originalDone })
        assertTrue(originalInstructions.filterIndexed { index, _ -> index != 13 }.all { original ->
            instructions.any { it === original }
        })
        assertNotNull(instructions.firstOrNull {
            val reference = (it as? ReferenceInstruction)?.reference as? MethodReference
            reference?.name == CALLER_CHECK
        })
    }

    @Test
    fun `rejects missing data column before mutating anything`() {
        val provider = fixture(dataColumn = "another_column")
        val before = provider.methods.single().implementation!!.instructions.toList()
        assertFailsWith<IllegalStateException> { patchProvider(provider) }
        assertEquals(1, provider.methods.size)
        assertEquals(before, provider.methods.single().implementation!!.instructions)
    }

    @Test
    fun `rejects ambiguous data column references`() {
        val provider = fixture(duplicate = true)
        assertFailsWith<IllegalStateException> { patchProvider(provider) }
        assertEquals(1, provider.methods.size)
    }

    @Test
    fun `rejects applying the patch twice`() {
        val provider = fixture()
        patchProvider(provider)
        val before = provider.methods.first { it.name == "query" }.implementation!!.instructions.toList()
        assertFailsWith<IllegalStateException> { patchProvider(provider) }
        assertEquals(before, provider.methods.first { it.name == "query" }.implementation!!.instructions)
    }
}