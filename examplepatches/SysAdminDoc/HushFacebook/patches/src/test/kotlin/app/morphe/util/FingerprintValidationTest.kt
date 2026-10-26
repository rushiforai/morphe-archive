/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.util

import app.morphe.PatchContexts
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertThrows
import org.junit.Test

class FingerprintValidationTest {
    private fun type(name: String) = ImmutableClassDef(
        name, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null, emptyList(),
        listOf(MutableMethod(ImmutableMethod(name, "run", emptyList(), "V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
            ImmutableMethodImplementation(1, emptyList(), null, null))).apply {
            addInstructionsWithLabels(0, "const-string v0, \"validation needle\"\nreturn-void")
        }),
    )

    private fun fingerprint() = Fingerprint(returnType = "V", strings = listOf("validation needle"))
    private val classes = listOf(type("Lfixture/First;"), type("Lfixture/Second;"))

    @Test fun `validation refuses an ambiguous ordinary match`() {
        val context = PatchContexts.of(classes, validate = true)
        with(context) {
            assertThrows(PatchException::class.java) { fingerprint().match() }
        }
    }

    @Test fun `validation preserves an intentional matchAll`() {
        val context = PatchContexts.of(classes, validate = true)
        with(context) { assertEquals(2, fingerprint().matchAll().size) }
    }

    @Test fun `ordinary patching retains its first-match behavior`() {
        with(PatchContexts.of(classes)) { assertNotNull(fingerprint().match()) }
    }
}
