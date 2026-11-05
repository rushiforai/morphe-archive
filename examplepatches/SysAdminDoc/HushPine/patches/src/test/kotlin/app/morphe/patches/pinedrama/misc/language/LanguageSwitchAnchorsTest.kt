/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.patches.pinedrama.misc.language

import app.morphe.Fixtures
import app.morphe.takes
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The switch the App language page's Done goes through, held to each declared build (#296): one
 * static method takes the shape, it can hand the language to the language-pack installer, and the
 * language service still calls it, so turning its fetch argument off changes the page's Done.
 */
class LanguageSwitchAnchorsTest {
    @Test
    fun `the App language switch resolves on each build`() {
        Fixtures.forEachDeclared { apk ->
            val classes = LinkedHashMap<String, ClassDef>()
            val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
            for (entry in container.dexEntryNames) {
                for (classDef in container.getEntry(entry)!!.dexFile.classes) classes.putIfAbsent(classDef.type, classDef)
            }
            val version = Fixtures.versionOf(apk)

            val taken = classes.values.flatMap { classDef ->
                classDef.methods.filter { LanguageSwitchFingerprint.takes(it, classDef) }
            }
            assertEquals("$version: the switch takes ${taken.map { "${it.definingClass}->${it.name}" }}", 1, taken.size)
            val switch = taken.single()
            assertEquals("$version: the fetch argument isn't p3", "Z", switch.parameterTypes[3].toString())

            val service = checkNotNull(classes[I18N_MANAGER_SERVICE]) { "$version: no $I18N_MANAGER_SERVICE" }
            val callers = service.methods.filter { it.callsLanguageSwitch(switch) }
            assertTrue("$version: $I18N_MANAGER_SERVICE doesn't call ${switch.definingClass}->${switch.name}",
                callers.isNotEmpty())
        }
    }
}
