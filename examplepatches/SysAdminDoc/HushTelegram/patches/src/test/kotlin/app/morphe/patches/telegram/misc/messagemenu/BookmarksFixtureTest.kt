/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.messagemenu

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.PlusPending
import app.morphe.patches.telegram.misc.blocked.MESSAGE_OBJECT
import app.morphe.patches.telegram.misc.blocked.TL_MESSAGE
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.names.origDescriptor
import app.morphe.util.names.origName
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/** Bookmark in the message menu: the stubs that read a message's place and Telegram's stars, or a clean refusal. */
@PlusPending
class BookmarksFixtureTest {
    @Test fun `the stubs read Telegram's own topic and stars and the build flag goes on`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(ExtensionDex.classes() + MessageMenuFixtureTest().hosts(build))
            assertEquals("$name: ${context.resolveBookmarks().missing}", null, context.resolveBookmarks().missing)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { messageMenuPatch.execute(context) })

            val stub = { n: String -> context.tgMutableClassDefBy(BOOKMARKS).methods.single { it.origName == n }.controlBody().mapNotNull { it.controlRef() } }
            assertEquals("$name: scheduled, then a quick reply", listOf("$MESSAGE_OBJECT->scheduled:Z", "$MESSAGE_OBJECT->isQuickReply()Z"),
                stub("apart").filter { it.startsWith("$MESSAGE_OBJECT->") })
            assertEquals("$name: the account and message Telegram's topic answer reads", listOf(MESSAGE_OBJECT, "$MESSAGE_OBJECT->currentAccount:I",
                "$MESSAGE_OBJECT->messageOwner:$TL_MESSAGE", BOOKMARK_TOPIC), stub("topic"))
            assertEquals("Lorg/telegram/messenger/R\$drawable;->msg_fave:I", stub("markIcon").first())
            assertEquals("Lorg/telegram/messenger/R\$drawable;->msg_unfave:I", stub("unmarkIcon").first())
            for (flag in listOf("bookmarks", "messageMenuRepeat")) {
                val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == flag }.controlBody()
                assertEquals("$name: $flag", 1L, (status.first() as WideLiteralInstruction).wideLiteral)
            }
        }
    }

    @Test fun `a build without Telegram's topic answer leaves Bookmark out and the menu goes on`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val hosts = MessageMenuFixtureTest().hosts(build)
            val message = PatchContexts.of(ExtensionDex.classes() + hosts).tgMutableClassDefBy(MESSAGE_OBJECT)
            val topic = message.methods.single { it.origName == "getTopicId" && it.origDescriptor == "(I${TL_MESSAGE}Z)J" }
            val context = PatchContexts.of(ExtensionDex.classes() + hosts.map { if (it.type == message.type) withoutMethod(it, topic.name, topic.parameterTypes.map { p -> p.toString() }) else it })
            assertTrue("$name: ${context.resolveBookmarks().missing}", context.resolveBookmarks().missing != null)
            val warnings = PatchLogCapture.warnings { messageMenuPatch.execute(context) }
            assertEquals("$name: $warnings", 1, warnings.size)
            assertTrue(warnings.single(), "goes on without Bookmark" in warnings.single())
            val flag = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == "bookmarks" }.controlBody()
            assertTrue("$name: the build flag stays off", (flag.first() as? WideLiteralInstruction)?.wideLiteral != 1L)
            val menu = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == "messageMenuRepeat" }.controlBody()
            assertEquals(1L, (menu.first() as WideLiteralInstruction).wideLiteral)
        }
    }

    /** [owner] without its method [name] taking [params], still read through its build's name table. */
    private fun withoutMethod(owner: ClassDef, name: String, params: List<String>): ClassDef {
        val copy = ImmutableClassDef(owner.type, owner.accessFlags, owner.superclass, owner.interfaces, owner.sourceFile, owner.annotations,
            owner.fields, owner.methods.filter { it.name != name || it.parameterTypes.map { p -> p.toString() } != params })
        return if (owner is FixtureDex.FixtureClassDef) FixtureDex.FixtureClassDef(owner.versionCode, copy) else copy
    }
}
