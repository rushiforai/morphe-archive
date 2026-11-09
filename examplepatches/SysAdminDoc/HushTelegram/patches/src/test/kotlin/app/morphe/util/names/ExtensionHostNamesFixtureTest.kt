/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.util.names

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

private const val MESSAGES_CONTROLLER = "Lorg/telegram/messenger/MessagesController;"
private const val USER_CONFIG = "Lorg/telegram/messenger/UserConfig;"

/** What the extension reaches by reflection, answered with each declared build's own names. */
class ExtensionHostNamesFixtureTest {
    /** Per build: the row lines the extension needs for MessagesController, UserConfig and one inlined string. */
    private val expected = mapOf(
        "72809" to listOf(
            "m org.telegram.messenger.lp getInstance (I) r1",
            "f org.telegram.messenger.w10 selectedAccount r0",
            "r string PushReactText 7f0fdee2",
        ),
        "72911" to listOf(
            "m org.telegram.messenger.vp getInstance (I) s1",
            "f org.telegram.messenger.c20 selectedAccount t0",
            "r string PushReactText 7f0fded5",
        ),
    )

    @Test
    fun `the extension asks each build for its own names`() {
        for (build in Fixtures.declaredBuilds()) {
            val hosts = FixtureDex.classes(build, setOf(MESSAGES_CONTROLLER, USER_CONFIG)).values
            val context = PatchContexts.of((ExtensionDex.classes() + hosts).distinctBy { it.type })
            val table = TelegramNames.of(context)
            val name = "${build.name} (${table.build})"
            val rows = context.giveExtensionHostNames()
            val lines = rows.lines().filter(String::isNotEmpty)

            if (table.isIdentity) {
                assertEquals("$name: a build that kept its names gets no rows", "", rows)
                continue
            }
            for (line in expected.getValue(table.build)) {
                assertTrue("$name: rows hold \"$line\"", line in lines)
            }
            assertTrue("$name: every row is a member, field or resource", lines.all { it[0] in "mfr" && it[1] == ' ' })
            assertEquals("$name: no row repeats", lines.size, lines.toSet().size)

            assertEquals("$name: HostNames.table() answers the rows", rows, answer(context))

            val strings = extensionStrings(context)
            val stale = strings.filter { text ->
                text.startsWith("org.telegram.messenger.") &&
                    table.type("L" + text.replace('.', '/') + ";") != "L" + text.replace('.', '/') + ";"
            }
            assertEquals("$name: no class name the build renamed is left in the extension", emptyList<String>(), stale)
            assertTrue("$name: the extension names MessagesController by the build's name",
                "org.telegram.messenger.${if (table.build == "72809") "lp" else "vp"}" in strings)
        }
    }

    private fun answer(context: BytecodePatchContext): String? {
        val host = context.tgMutableClassDefBy(HOST_NAMES)
        val table = host.methods.single { it.name == "table" && it.parameterTypes.isEmpty() }
        return table.implementation!!.instructions.firstNotNullOfOrNull { instruction ->
            if (instruction.opcode == Opcode.CONST_STRING || instruction.opcode == Opcode.CONST_STRING_JUMBO) {
                ((instruction as ReferenceInstruction).reference as StringReference).string
            } else {
                null
            }
        }
    }

    private fun extensionStrings(context: BytecodePatchContext): Set<String> {
        val types = ArrayList<String>()
        context.classDefForEach { if (it.type.startsWith("Lapp/hushtelegram/extension/")) types += it.type }
        val strings = HashSet<String>()
        for (type in types) {
            for (method in context.tgMutableClassDefBy(type).methods) {
                for (instruction in method.implementation?.instructions?.toList() ?: emptyList()) {
                    if (instruction.opcode == Opcode.CONST_STRING || instruction.opcode == Opcode.CONST_STRING_JUMBO) {
                        strings += ((instruction as ReferenceInstruction).reference as StringReference).string
                    }
                }
            }
        }
        return strings
    }
}
