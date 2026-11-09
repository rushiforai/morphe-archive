/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.notifications

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import app.morphe.util.names.origRef
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.replaceInstruction
import app.morphe.util.names.tgMutableClassDefBy

/** The four mention swaps in NotificationsController, the stubs and the runtime. */
class IgnoreMutedMentionsFixtureTest {
    private val hostTypes = setOf(NOTIFICATIONS, MESSAGE_OBJECT, "Lorg/telegram/messenger/MessagesController;")

    @Test fun `every mention swap asks the extension with the same message`() {
        val ranged = mutableListOf<String>()
        val builds = Fixtures.declaredBuilds()
        for (build in builds) {
            val name = build.name
            val hosts = FixtureDex.classesWhere(build, { true }) { m -> m.origDefiningClass in hostTypes || m.runsNotificationsLambda() }.map(ImmutableClassDef::of)
            val context = PatchContexts.of(ExtensionDex.classes() + hosts)
            val sites = context.resolveIgnoreMutedMentions()
            // 13.2 makes every swap a plain call on both builds, so where no build had a range swap the
            // last one gets one, the same call in the form R8 picks when the message sits above v15.
            val stockRange = sites.any { (method, indices) -> indices.any { method.controlBody()[it].opcode == Opcode.INVOKE_VIRTUAL_RANGE } }
            if (build == builds.last() && ranged.isEmpty() && !stockRange) {
                val (method, indices) = sites.first()
                val message = method.controlBody()[indices.first()].namedRegisters().single()
                method.replaceInstruction(indices.first(), "invoke-virtual/range {v$message .. v$message}, $FROM_CHAT")
            }
            // 13.2's lambda bodies have no names of their own; each runs under the method making it.
            val paths = listOf("processLoadedUnreadMessages", "processNewMessages", "showOrUpdateNotification")
            val controller = context.tgMutableClassDefBy(NOTIFICATIONS)
            val runsUnder = context.runsUnder(controller)
            // 13.2 inlined processLoadedUnreadMessages into MessagesStorage, which makes that lambda, so its body is told
            // by what it takes: the controller and what lambda$processLoadedUnreadMessages$34 captured.
            fun Method.loaded() = AccessFlags.STATIC.isSet(accessFlags) && origParameterTypes.let { types -> types.size == 5 &&
                types[0] == NOTIFICATIONS && types[1] == "Ljava/util/ArrayList;" && types[3] == types[1] && types[4] == "Ljava/util/Collection;" }
            assertEquals("$name: one body takes what the loaded path's lambda captured", 1, controller.methods.count { it.loaded() })
            assertEquals("$name: new, loaded twice and shown", paths, sites.map { (method) ->
                runsUnder(method).map { it.removePrefix("lambda\$").substringBefore('$') }.filter { it in paths }.distinct()
                    .ifEmpty { listOfNotNull("processLoadedUnreadMessages".takeIf { method.loaded() }) }.single()
            }.sorted())
            assertEquals("$name: four swaps", 4, sites.sumOf { it.second.size })
            val old = sites.map { ImmutableMethod.of(it.first) }
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { ignoreMutedMentionsPatch.execute(context) })

            sites.forEachIndexed { s, (method, indices) ->
                val before = old[s].controlBody()
                val after = method.controlBody()
                assertEquals("$name: replaced in place", before.size, after.size)
                for (i in before.indices) {
                    if (i in indices) {
                        assertEquals(if (before[i].opcode == Opcode.INVOKE_VIRTUAL) Opcode.INVOKE_STATIC else Opcode.INVOKE_STATIC_RANGE, after[i].opcode)
                        assertEquals(NOTIFY_DIALOG, after[i].controlRef())
                        assertEquals("$name: the same message", before[i].namedRegisters(), after[i].namedRegisters())
                        assertEquals(FROM_CHAT, before[i].controlRef())
                        assertEquals(Opcode.MOVE_RESULT_WIDE, after[i + 1].opcode)
                    } else {
                        assertEquals("$name: stock $i", listOf(before[i].opcode, before[i].namedRegisters(), before[i].origRef()),
                            listOf(after[i].opcode, after[i].namedRegisters(), after[i].origRef()))
                    }
                }
            }
            if (old.withIndex().any { (s, m) -> sites[s].second.any { m.controlBody()[it].opcode == Opcode.INVOKE_VIRTUAL_RANGE } }) ranged += name

            val stub = { n: String -> context.tgMutableClassDefBy(MUTED_MENTIONS).methods.single { it.origName == n }.controlBody().map { it.controlRef() } }
            assertTrue(FROM_CHAT in stub("sender"))
            assertTrue("$MESSAGE_OBJECT->getDialogId()J" in stub("chat"))
            assertTrue(DIALOG_MUTED in stub("muted"))
            val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == "ignoreMutedMentions" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
        assertTrue("a range swap on some build, so both call forms are covered", ranged.isNotEmpty())
    }
}

/**
 * A lambda of NotificationsController's: 13.2 leaves its run() calling a static body on the
 * controller, which a fixture needs to tell what the body runs under.
 */
internal fun Method.runsNotificationsLambda() = origName == "run" &&
    controlBody().any { it.opcode in setOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE) && it.controlRef()?.startsWith("$NOTIFICATIONS->") == true }
