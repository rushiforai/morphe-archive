/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe

import app.morphe.patcher.patch.PatchException
import app.morphe.patches.threads.misc.resignedtrust.FbnsPackageCheckFingerprint
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Field
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test

/**
 * Patching is checked with fingerprint validation on, so a fingerprint matched with `match()` has to
 * fit one method of the build. A second copy of Threads' code that fits it stops the patch rather
 * than leaving the hook on whichever method the patcher met first.
 */
class FingerprintValidationFixtureTest {
    private val marker = "Failed to create SHA-256 hash"

    @Test
    fun `a second method that fits a single-match fingerprint stops the patch`() {
        val build = Fixtures.declaredBuilds().first()
        val classes = FixtureDex.classesWhere(build, { marker in it.stringSection }) { method ->
            method.implementation?.instructions?.any {
                ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == marker
            } == true
        }
        try {
            FbnsPackageCheckFingerprint.clearMatch()
            val stock = with(PatchContexts.of(ExtensionDex.classes() + classes)) { FbnsPackageCheckFingerprint.method }
            val owner = classes.single { it.type == stock.definingClass }

            FbnsPackageCheckFingerprint.clearMatch()
            val twice = PatchContexts.of(ExtensionDex.classes() + classes + copy(owner, DECOY))
            assertThrows(build.name, PatchException::class.java) { with(twice) { FbnsPackageCheckFingerprint.method } }

            FbnsPackageCheckFingerprint.clearMatch()
            val once = with(PatchContexts.of(ExtensionDex.classes() + classes)) { FbnsPackageCheckFingerprint.method }
            assertEquals(build.name, stock.definingClass, once.definingClass)
        } finally {
            FbnsPackageCheckFingerprint.clearMatch()
        }
    }

    /** The same class under another name, as a second copy of Threads' code would look. */
    private fun copy(stock: ClassDef, type: String): ClassDef = ImmutableClassDef(
        type, stock.accessFlags, stock.superclass, stock.interfaces, stock.sourceFile, stock.annotations,
        emptyList<Field>(),
        stock.methods.map {
            ImmutableMethod(type, it.name, it.parameters, it.returnType, it.accessFlags, it.annotations,
                it.hiddenApiRestrictions, it.implementation)
        },
    )

    private companion object {
        const val DECOY = "Lapp/morphe/fixture/DecoyFbnsCheck;"
    }
}
