/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.folders

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.hostsOf
import app.morphe.FixtureDex
import app.morphe.PatchContexts
import app.morphe.patches.telegram.misc.chattypefolders.CHAT_TYPE_FOLDERS
import app.morphe.patches.telegram.misc.chattypefolders.LOCAL_FILTER
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.chattypefolders.MESSAGES_CONTROLLER
import app.morphe.patches.telegram.misc.chattypefolders.USER_CONFIG
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File
import java.util.concurrent.ConcurrentHashMap
import app.morphe.util.names.loadsInt
import app.morphe.util.names.origRef
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.origType
import app.morphe.util.names.tgMutableClassDefBy

private val PLACE_HOSTS = ConcurrentHashMap<String, List<ClassDef>>()

private fun Method.placeBody(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
private fun Instruction.placeRef() = origRef()

/**
 * Every class a place hook goes in, with the classes the stubs and the drag resets read. 13.2 loads
 * the drag id as a const and its merged drag callback casts the runners it was handed.
 */
internal fun allChatsPlaceHosts(build: File): List<ClassDef> = PLACE_HOSTS.hostsOf(build.path) {
    val sites = FixtureDex.classesWhere(build, { true }) { m ->
        m.placeBody().any { (it.opcode == Opcode.NEW_INSTANCE && it.placeRef() == PLACE_REQUEST) || (it.loadsInt() && it.placeRef() == PLACE_DRAGGING) } ||
            m.placeBody().let { body -> body.any { it.placeRef() == PLACE_SORT } && body.any { it.placeRef() == PLACE_FILTERS } }
    }
    val runners = sites.flatMap { cls ->
        cls.fields.map { it.type } + cls.methods.flatMap { m ->
            m.placeBody().filter { it.opcode == Opcode.NEW_INSTANCE || it.opcode == Opcode.CHECK_CAST }.mapNotNull { it.placeRef() }
        }
    }.filter { it.startsWith("Lorg/telegram/ui/") }
    val wanted = runners.toSet() + setOf(MESSAGES_CONTROLLER, LOCAL_FILTER, USER_CONFIG, PLACE_REQUEST,
        "Lorg/telegram/messenger/BaseController;", "Lorg/telegram/tgnet/ConnectionsManager;")
    (sites + FixtureDex.classes(build, wanted).values).distinctBy { it.type }
}

class AllChatsPlaceFixtureTest {
    private fun contextOf(build: File) = PatchContexts.of((ExtensionDex.classes() + allChatsPlaceHosts(build)).distinctBy { it.type })

    /** The method's code without the padding a switch payload may gain. */
    private fun Method.withoutNops() = placeBody().filter { it.opcode != Opcode.NOP }

    @Test fun `the server gets All Chats first from all three places that send the order`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = contextOf(build)
            val plan = context.resolveAllChatsPlace()
            assertNull(build.name, plan.missing)
            val orders = plan.sites.filter { it.smali.contains(PLACE_SERVER_ORDER) }
            assertEquals(build.name, 3, orders.size)
            for (site in orders) {
                val sent = site.method.placeBody()[site.at]
                assertEquals(build.name, PLACE_SEND, sent.placeRef())
                val request = sent.namedRegisters()[1]
                assertTrue(build.name, site.smali.contains("{v$request}"))
            }
            assertEquals(build.name, 1, orders.count { it.method.origName == "setIsEditing" })
            assertEquals(build.name, 1, orders.count { it.method.origDefiningClass == PLACE_SETUP })
        }
    }

    @Test fun `Folders by chat type's own order send doesn't count as one of Telegram's`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = contextOf(build)
            // What Folders by chat type leaves when it runs first: the extension builds the request too.
            context.writeStub(CHAT_TYPE_FOLDERS, "sendFolderOrder", 3, """
                new-instance v0, $PLACE_REQUEST
                invoke-direct {v0}, $PLACE_REQUEST-><init>()V
                invoke-static {v0}, $CHAT_TYPE_FOLDERS->outgoingOrder(Ljava/lang/Object;)V
                return-void
            """)
            val plan = context.resolveAllChatsPlace()
            assertNull(build.name, plan.missing)
            val orders = plan.sites.filter { it.smali.contains(PLACE_SERVER_ORDER) }
            assertEquals(build.name, 3, orders.size)
            assertTrue(build.name, orders.none { it.method.definingClass.startsWith("$EXTENSION_PACKAGE/") })
        }
    }

    @Test fun `every question in front of a move back to first asks the extension`() {
        for (build in Fixtures.declaredBuilds()) {
            val plan = contextOf(build).resolveAllChatsPlace()
            assertNull(build.name, plan.missing)
            val answers = plan.sites.filter { it.smali.contains(PLACE_KEEPS) }
            // The strip's two drag checks, its reset, the settings page's reset and the startup check.
            assertEquals(build.name, 5, answers.size)
            val runs = answers.filter { it.method.origName == "run" }
            assertEquals(build.name, 2, runs.size)
            assertEquals(build.name, 1, answers.count { it.method.origName == "updatePremium" })
            for (site in answers) {
                val body = site.method.placeBody()
                assertEquals(build.name, Opcode.MOVE_RESULT, body[site.at - 1].opcode)
                val answer = body[site.at - 1].namedRegisters().single()
                assertTrue(build.name, site.smali.contains("{v$answer}") && site.smali.contains("move-result v$answer"))
                // Telegram's own branch on that answer comes right after it.
                val next = body[site.at]
                assertTrue("${build.name}: ${next.opcode}", next.opcode == Opcode.IF_EQZ || next.opcode == Opcode.IF_NEZ)
                assertEquals(build.name, answer, next.namedRegisters().single())
            }
            for (run in runs) {
                val body = run.method.placeBody()
                val asked = body[run.at - 2].placeRef()
                assertEquals(build.name, PLACE_PREMIUM, asked)
            }
        }
    }

    @Test fun `a loaded list goes back in place before anyone hears of it and the locks skip All Chats`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = contextOf(build)
            val plan = context.resolveAllChatsPlace()
            assertNull(build.name, plan.missing)
            val load = plan.sites.single { it.smali.contains(PLACE_LOADED) }
            val body = load.method.placeBody()
            // 13.2 inlined the load's lambda into the run() of its Runnable, which holds the controller.
            assertTrue(build.name, load.method.origName.startsWith("lambda\$processLoadedDialogFilters\$") ||
                (load.method.origName == "run" && context.tgMutableClassDefBy(load.method.definingClass).fields.any { it.origType == MESSAGES_CONTROLLER }))
            assertEquals(build.name, Opcode.INVOKE_STATIC, body[load.at - 1].opcode)
            assertEquals(build.name, "Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V", body[load.at - 1].placeRef())
            val sorted = body[load.at - 1].namedRegisters().first()
            assertTrue(build.name, load.smali.contains(", v$sorted}"))
            assertTrue(build.name, body.drop(load.at).any { it.placeRef()?.endsWith("NotificationCenter;->dialogFiltersUpdated:I") == true })

            val lock = plan.sites.single { it.smali.contains(PLACE_LOCK_ORDER) }
            assertEquals(build.name, "lockFiltersInternal", lock.method.origName)
            val locks = lock.method.placeBody()
            assertEquals(build.name, "Ljava/util/Collections;->reverse(Ljava/util/List;)V", locks[lock.at - 1].placeRef())
            assertTrue(build.name, lock.smali.contains("{v${locks[lock.at - 1].namedRegisters().single()}}"))
        }
    }

    @Test fun `the hooks go in and Telegram's own code stays`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = contextOf(build)
            val plan = context.resolveAllChatsPlace()
            assertNull(build.name, plan.missing)
            val before = plan.sites.associate { it.method.toString() to it.method.withoutNops().map { op -> op.opcode to op.placeRef() } }
            context.writeAllChatsPlaceStubs()
            plan.apply()
            for (site in plan.sites) {
                val added = if (site.smali.contains(PLACE_KEEPS)) 2 else 1
                val now = site.method.withoutNops().map { it.opcode to it.placeRef() }
                val stock = before.getValue(site.method.toString())
                assertEquals("${build.name} ${site.method}", stock.size + added, now.size)
                val hook = site.method.placeBody()[site.at]
                assertEquals(build.name, Opcode.INVOKE_STATIC, hook.opcode)
                assertTrue(build.name, hook.placeRef()!!.startsWith(ALL_CHATS_PLACE))
            }
            val stubs = context.tgMutableClassDefBy(ALL_CHATS_PLACE).methods.associateBy { it.name }
            // Each one whole: smali drops what it can't build, and the count shows it.
            mapOf("selectedConfig" to 4, "config" to 4, "premium" to 4, "userId" to 4, "folderId" to 3, "order" to 3).forEach { (name, size) ->
                assertEquals("${build.name} $name", size, stubs.getValue(name).placeBody().size)
            }
        }
    }

    @Test fun `a build whose folder locking changed says so instead of hooking half of it`() {
        val build = Fixtures.declaredBuilds().first()
        val context = contextOf(build)
        context.tgMutableClassDefBy(MESSAGES_CONTROLLER).methods.removeIf { it.origName == "lockFiltersInternal" }
        val plan = context.resolveAllChatsPlace()
        assertTrue(plan.missing!!, plan.sites.isEmpty())
        assertTrue(plan.missing!!, "folder locking" in plan.missing!!)
    }
}
