/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at a788c516 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.shared.misc.extension

import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.Assert.assertTrue
import org.junit.Test
import java.nio.ByteBuffer

class BuildIdentityFixtureTest {
    @Test fun `packaged runtime readers still call the injected stub`() {
        val callers = mutableSetOf<String>()
        val summaryCallers = mutableSetOf<String>()
        val summaryClass = "Lapp/morphe/extension/hushthreads/settings/HushThreadsPreferenceFragment;"
        var summaryReadsIdentity = false
        for (payload in listOf("shared", "threads")) {
            val bytes = javaClass.classLoader.getResourceAsStream("extensions/$payload.mpe")!!.use { it.readBytes() }
            for (clazz in DexBackedDexFile(Opcodes.getDefault(), ByteBuffer.wrap(bytes)).classes) {
                for (method in clazz.methods) {
                    if (method.implementation?.instructions?.any {
                        val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
                        ref?.definingClass == EXTENSION_CLASS_DESCRIPTOR && ref.name == "getPatchesBuildIdentity"
                    } == true) {
                        callers += clazz.type
                        if (clazz.type == summaryClass && method.name == "buildIdentitySummary") summaryReadsIdentity = true
                    }
                    if (method.implementation?.instructions?.any {
                        val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
                        ref?.definingClass == summaryClass && ref.name == "buildIdentitySummary"
                                && ref.parameterTypes.isEmpty() && ref.returnType == "Ljava/lang/String;"
                    } == true) summaryCallers += clazz.type
                }
            }
        }
        if (summaryReadsIdentity) callers += summaryCallers
        for (reader in listOf("Lapp/morphe/extension/hushthreads/settings/HushThreadsPreferenceFragment;",
                "Lapp/morphe/extension/hushthreads/settings/SettingsNavigation;",
                "Lapp/morphe/extension/shared/settings/preference/LogBufferManager;")) {
            assertTrue("Identity call was optimized away in $reader: $callers", reader in callers)
        }
    }

}
