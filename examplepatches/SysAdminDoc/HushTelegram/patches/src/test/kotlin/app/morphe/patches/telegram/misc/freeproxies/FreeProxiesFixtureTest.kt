/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.freeproxies

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.patches.telegram.misc.proxymenu.BLOCKED_COUNTRY
import app.morphe.patches.telegram.misc.proxymenu.PROXY_LIST
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import app.morphe.util.names.origName
import app.morphe.util.names.origRef
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/** Telegram's proxy list, reached through TelegramProxies, and the phone number screen's proxy button. */
class FreeProxiesFixtureTest {
    private val editor = "Landroid/content/SharedPreferences\$Editor;"
    private val notifications = "Lorg/telegram/messenger/NotificationCenter;"

    @Test fun `the stubs reach Telegram's proxy list and the sign-in screen asks before the blocked country`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val manager = FixtureDex.classes(build, setOf(CONNECTIONS_MANAGER)).values.single()
            val data = manager.methods.single { it.name == "setProxySettings" && it.parameterTypes.size == 2 }
                .parameterTypes[1].toString()
            val kept = FixtureDex.classes(build, setOf(SHARED_CONFIG, PROXY_INFO, data,
                "Lorg/telegram/messenger/MessagesController;", notifications, PROXY_LIST_SCREEN)).values
            val screens = FixtureDex.classesWhere(build, { true }) { m ->
                m.controlBody().let { body ->
                    body.any { it.controlString() == "proxy_enabled" } && body.any { it.controlRef() == BLOCKED_COUNTRY } &&
                        body.any { it.controlRef() == CONNECTION_STATE }
                }
            }
            val context = PatchContexts.of(ExtensionDex.classes() +
                (listOf(manager) + kept + screens).distinctBy { it.type }.map(ImmutableClassDef::of))
            val site = context.resolveSignInProxy()
            val before = ImmutableMethod.of(site.method).controlBody()
            val order = context.resolveProxyOrder()
            val sortBefore = ImmutableMethod.of(order.method).controlBody()
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { freeProxiesPatch.execute(context) })

            val at = site.read
            val after = site.method.controlBody()
            assertEquals(name, listOf(Opcode.CONST_4, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_NEZ),
                after.subList(at, at + 4).map { it.opcode })
            val free = after[at].namedRegisters().single()
            assertEquals("$name: asks with 1", 1, (after[at] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals(name, SIGN_IN_BUTTON, after[at + 1].controlRef())
            assertTrue("$name: one register throughout", (at + 1..at + 3).all { after[it].namedRegisters() == listOf(free) })
            assertEquals("$name: then Telegram's own blocked country read", BLOCKED_COUNTRY, after[at + 4].controlRef())
            assertEquals("$name: a yes lands where the proxy-on path shows the button, a no reads the blocked country",
                setOf(at + 4, site.show), ControlFlow.of(site.method).normal[at + 3].toSet())
            assertEquals("$name: that path shows it and returns", Opcode.RETURN_VOID, after[site.show + 3].opcode)
            assertStock("$name head", before.take(at), after.take(at))
            assertStock("$name tail", before.drop(at), after.drop(at + 4))

            val sortAfter = order.method.controlBody()
            assertEquals("$name: the proxy screen's sort is Proxy order's", PROXY_ORDER_SORT, sortAfter[order.at].controlRef())
            assertEquals(name, Opcode.INVOKE_STATIC, sortAfter[order.at].opcode)
            assertEquals("$name: with the list and Telegram's comparator", sortBefore[order.at].namedRegisters(),
                sortAfter[order.at].namedRegisters())
            assertEquals(name, SORT, sortBefore[order.at].controlRef())
            assertStock("$name proxy screen", sortBefore.filterIndexed { i, _ -> i != order.at },
                sortAfter.filterIndexed { i, _ -> i != order.at })

            val stubs = context.tgMutableClassDefBy(TELEGRAM_PROXIES).methods.associate { method ->
                method.name to method.controlBody().mapNotNull { it.controlRef() }.filter { "->" in it }
            }
            assertTrue("$name: parse reads a link the way Telegram does", stubs.getValue("parse").single().let {
                it.startsWith("$data->") && it.endsWith("(Landroid/net/Uri;)$data")
            })
            assertEquals(name, listOf("$PROXY_INFO-><init>($data)V", "$SHARED_CONFIG->addProxy($PROXY_INFO)$PROXY_INFO"), stubs.getValue("add"))
            val use = stubs.getValue("use")
            assertEquals("$name: use", listOf(
                "Lorg/telegram/messenger/MessagesController;->getGlobalMainSettings()Landroid/content/SharedPreferences;",
                "Landroid/content/SharedPreferences;->edit()$editor",
                "$editor->putBoolean(Ljava/lang/String;Z)$editor",
            ), use.take(3))
            assertTrue("$name: use reads the entry's proxy", use[3].startsWith("$PROXY_INFO->") && use[3].endsWith(":$data"))
            assertTrue("$name: and writes it to the settings", use[4].startsWith("$data->") && use[4].endsWith("($editor)V"))
            assertEquals("$name: use", listOf(
                "$editor->commit()Z",
                "$SHARED_CONFIG->currentProxy:$PROXY_INFO",
                "$CONNECTIONS_MANAGER->setProxySettings(Z$data)V",
                "$notifications->getGlobalInstance()$notifications",
                "$notifications->proxySettingsChanged:I",
                "$notifications->postNotificationName(I[Ljava/lang/Object;)V",
            ), use.drop(5))
            assertEquals(name, listOf("$SHARED_CONFIG->currentProxy:$PROXY_INFO"), stubs.getValue("current"))
            assertEquals(name, listOf("$SHARED_CONFIG->loadProxyList()V", PROXY_LIST), stubs.getValue("proxies"))
            assertEquals(name, listOf(use[3]), stubs.getValue("proxy"))
            assertEquals("$name: describe writes the entry's proxy as use does", listOf(use[3], use[4]), stubs.getValue("describe"))
            assertEquals(name, listOf("$SHARED_CONFIG->deleteProxy($PROXY_INFO)V"), stubs.getValue("delete"))
            assertEquals(name, listOf("$SHARED_CONFIG->proxyRotationEnabled:Z", "$SHARED_CONFIG->saveConfig()V"), stubs.getValue("rotate"))

            for (flag in listOf("freeProxies", "proxyOrder")) {
                val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == flag }.controlBody()
                assertEquals("$name: $flag", 1L, (status.first() as WideLiteralInstruction).wideLiteral)
            }
        }
    }

    private fun assertStock(what: String, before: List<Instruction>, after: List<Instruction>) {
        assertEquals("$what: length", before.size, after.size)
        for (i in before.indices) {
            assertEquals("$what: stock $i", listOf(kind(before[i].opcode), before[i].namedRegisters(), before[i].origRef()),
                listOf(kind(after[i].opcode), after[i].namedRegisters(), after[i].origRef()))
        }
    }

    /** A hook can push a branch past a plain goto's reach, and dexlib2 widens it. */
    private fun kind(opcode: Opcode) = if (opcode == Opcode.GOTO_16 || opcode == Opcode.GOTO_32) Opcode.GOTO else opcode
}
