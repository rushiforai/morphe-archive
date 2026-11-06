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
    @Test fun `packaged About status and reports still read the injected identity`() {
        val callers = mutableMapOf<String, MutableSet<String>>()
        val summaryClass = "Lapp/morphe/extension/hushthreads/settings/HushThreadsPreferenceFragment;"
        val navigation = "Lapp/morphe/extension/hushthreads/settings/SettingsNavigation;"
        var navigationUsesBuildLine = false
        for (payload in listOf("shared", "threads")) {
            val bytes = javaClass.classLoader.getResourceAsStream("extensions/$payload.mpe")!!.use { it.readBytes() }
            for (clazz in DexBackedDexFile(Opcodes.getDefault(), ByteBuffer.wrap(bytes)).classes) {
                for (method in clazz.methods) {
                    for (instruction in method.implementation?.instructions?.toList().orEmpty()) {
                        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: continue
                        if (ref.definingClass == EXTENSION_CLASS_DESCRIPTOR && ref.name == "getPatchesBuildIdentity") {
                            callers.getOrPut(clazz.type) { mutableSetOf() } += method.name
                        }
                        if (clazz.type == navigation && ref.definingClass == summaryClass && ref.name == "overviewBuildDetails") {
                            navigationUsesBuildLine = true
                        }
                    }
                }
            }
        }
        for (reader in listOf(summaryClass,
                "Lapp/morphe/extension/shared/settings/preference/LogBufferManager;")) {
            assertTrue("Packaged identity reader is missing in $reader: $callers", reader in callers)
        }
        val settingsMethods = callers[summaryClass].orEmpty()
        assertTrue("About must read the complete identity", "initialize" in settingsMethods)
        // The build line under the main list shows in every state, paused included, through
        // overviewBuildDetails (Hushfacebook 837bac40e). R8 may keep that method or inline it.
        assertTrue("The build line lost its path to the injected identity: $callers", navigation in callers
                || (navigationUsesBuildLine && "overviewBuildDetails" in settingsMethods))
    }

}
