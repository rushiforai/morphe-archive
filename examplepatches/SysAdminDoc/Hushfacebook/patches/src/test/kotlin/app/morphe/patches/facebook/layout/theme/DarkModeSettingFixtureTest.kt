/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.layout.theme

import app.morphe.Fixtures
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * Why `DarkMode` can keep one answer for the whole app, on each declared build.
 *
 * Facebook makes its dark mode controller per user session (580 `LX/1QV`, 577 `LX/1L7`, built with
 * the session by the session-scoped injector), so another session, a Page's or another account's,
 * has a controller of its own, and each activity asks the one of its own session. But a signed-in
 * controller takes its setting from one app-level preference, "app_level_dark_mode_setting". The
 * per-user "dark_mode_v3" key is only read to fill the app-level one in when it's missing, and the
 * setter writes both. So the controllers of two signed-in sessions give the same answer. The
 * logged-out session (user id "0") is the one that doesn't read the setting: it follows the phone's
 * night mode, which is what Facebook's screens show while nobody is signed in.
 *
 * If a build starts reading the per-user key for the state, the themes can switch modes on another
 * session's answer, and `DarkMode` has to take answers from the session on screen only.
 */
class DarkModeSettingFixtureTest {
    private val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()

    private fun bundles(version: String) = Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }

    private fun Method.body(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private fun Instruction.method(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference

    private fun Instruction.field(): String? = ((this as? ReferenceInstruction)?.reference as? FieldReference)?.toString()

    private fun MethodReference.parameters() = parameterTypes.map(CharSequence::toString)

    /** Where the value in [register] at [at] was last written, reading the method in order. */
    private fun List<Instruction>.source(at: Int, register: Int): Int =
        subList(0, at).indexOfLast { it.opcode.setsRegister() && (it as? OneRegisterInstruction)?.registerA == register }

    /** The key an invoke of FbSharedPreferences or its editor passes, after the receiver. */
    private fun List<Instruction>.keyOf(at: Int): Int = source(at, (this[at] as FiveRegisterInstruction).registerD)

    private fun Instruction.onPreferences(returns: String, parameters: Int) = opcode == Opcode.INVOKE_INTERFACE &&
        method()?.let { it.definingClass == PREFERENCES && it.returnType == returns && it.parameters().size == parameters } == true

    private fun Instruction.readsInt() = onPreferences("I", 2) && method()!!.parameters()[1] == "I"

    private fun Instruction.putsInt(editor: String) = opcode == Opcode.INVOKE_INTERFACE &&
        method()?.let { it.definingClass == editor && it.returnType == "V" && it.parameters().getOrNull(1) == "I" } == true

    /** The field the keys class's static initializer keeps the key named [name] in. */
    private fun keyField(initializer: List<Instruction>, name: String): String {
        val at = initializer.indexOfFirst { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == name }
        assertTrue("no preference key $name", at >= 0)
        return initializer.drop(at).first { it.opcode == Opcode.SPUT_OBJECT }.field()!!
    }

    /** The controller and the class that names Facebook's preference keys, in one pass over the bundle. */
    private fun controllerAndKeys(bundle: File): Pair<ClassDef, ClassDef> {
        val found = mutableMapOf<String, MutableList<ClassDef>>()
        FixtureDex.forEach(bundle) { dex ->
            val here = dex.stringSection.filter { it == E2E_DARK_MODE || it == APP_LEVEL_SETTING }.toSet()
            if (here.isEmpty()) return@forEach
            for (classDef in dex.classes) {
                for (string in here) {
                    if (classDef.methods.any { holdsString(it, string) }) found.getOrPut(string) { mutableListOf() } += ImmutableClassDef.of(classDef)
                }
            }
        }
        return found.getValue(E2E_DARK_MODE).single() to found.getValue(APP_LEVEL_SETTING).single()
    }

    @Test
    fun `every signed-in session's dark mode controller answers from the one app-level setting, on each declared build`() {
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in bundles(version)) {
                val name = bundle.name
                val (controller, keys) = controllerAndKeys(bundle)
                val initializer = keys.methods.single { it.name == "<clinit>" }.body()
                val appLevel = keyField(initializer, APP_LEVEL_SETTING)
                val perUser = keyField(initializer, PER_USER_SETTING)
                val isPerUserKey = { method: List<Instruction>, key: Int ->
                    // "dark_mode_v3" with the session's user id added: a call's result, made from the prefix.
                    method[key].opcode == Opcode.MOVE_RESULT_OBJECT &&
                        method.getOrNull(method.source(key - 1, (method[key - 1] as FiveRegisterInstruction).registerC))?.field() == perUser
                }

                val constructors = controller.methods.filter { it.name == "<init>" }
                assertEquals("$name: one controller per session, made with the session",
                    listOf(listOf(USER_SESSION)), constructors.map { it.parameterTypes.map(CharSequence::toString) })
                val made = constructors.single().body()
                val storesState = { instruction: Instruction ->
                    instruction.opcode == Opcode.IPUT_OBJECT && (instruction as ReferenceInstruction).reference.let {
                        it is FieldReference && it.definingClass == controller.type && it.type == THEME_PREFERENCES_STATE
                    }
                }

                val reads = made.indices.filter { made[it].readsInt() }
                assertEquals("$name: the controller reads two settings as it's made", 2, reads.size)
                val (userRead, settingRead) = reads
                assertTrue("$name: the first is the session's per-user key", isPerUserKey(made, made.keyOf(userRead)))
                assertEquals("$name: the second is the app-level setting", appLevel, made[made.keyOf(settingRead)].field())
                val firstState = made.indexOfFirst(storesState)
                assertTrue("$name: the state it answers from comes from the app-level setting",
                    firstState > settingRead && made.indices.none { it in settingRead + 1 until firstState && made[it].readsInt() })

                // The per-user value only fills the app-level setting in, when that isn't there yet.
                val setter = controller.methods.single {
                    it.returnType == "V" && it.parameterTypes.map(CharSequence::toString) == listOf(THEME_PREFERENCES_STATE)
                }.body()
                val editor = setter.firstNotNullOf { instruction ->
                    instruction.method()?.takeIf { it.definingClass == PREFERENCES && it.name == "edit" }?.returnType
                }
                val fills = made.indices.filter { made[it].putsInt(editor) }
                assertEquals("$name: the constructor writes one setting", 1, fills.size)
                val fill = fills.single()
                assertEquals("$name: the app-level one", appLevel, made[made.keyOf(fill)].field())
                assertEquals("$name: with the per-user value", userRead + 1,
                    made.source(fill, (made[fill] as FiveRegisterInstruction).registerE))
                assertTrue("$name: only when the app-level setting is missing", made.indices.any {
                    it in userRead until fill && made[it].onPreferences("Z", 1) && made[made.keyOf(it)].field() == appLevel
                })

                val writes = setter.indices.filter { setter[it].putsInt(editor) }
                assertEquals("$name: the Dark mode setting is written to the per-user key and the app-level one",
                    listOf(true, false), writes.map { isPerUserKey(setter, setter.keyOf(it)) })
                assertEquals(appLevel, setter[setter.keyOf(writes[1])].field())

                // Logged out, the session's user id is "0": the state is set without reading the setting.
                val loggedOut = made.indexOfFirst { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "0" }
                assertTrue("$name: the logged-out session is told apart after the setting is read", loggedOut > firstState)
                assertTrue("$name: and gets a state of its own", made.drop(loggedOut).any(storesState))
                assertTrue("$name: without reading the setting", made.drop(loggedOut).none { it.readsInt() })
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    private companion object {
        const val E2E_DARK_MODE = "fb.e2e.enable_dark_mode"
        const val APP_LEVEL_SETTING = "app_level_dark_mode_setting"
        const val PER_USER_SETTING = "dark_mode_v3"
        const val PREFERENCES = "Lcom/facebook/prefs/shared/FbSharedPreferences;"
        const val USER_SESSION = "Lcom/facebook/auth/usersession/FbUserSession;"
    }
}
