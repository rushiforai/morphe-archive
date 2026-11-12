/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.restrictions

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import app.morphe.util.names.origName
import app.morphe.util.names.origRef
import app.morphe.util.names.origReturnType
import app.morphe.util.names.tgMutableClassDefBy

private const val MESSAGES_CONTROLLER = "Lorg/telegram/messenger/MessagesController;"
private const val CHAT_HOOK = "Lapp/hushtelegram/extension/telegram/misc/ChannelRestrictions;->isChatNoForwards(I)I"
private const val PEER_HOOK = "Lapp/hushtelegram/extension/telegram/misc/ChannelRestrictions;->noForwards(I)I"
private const val REASON_HOOK = "Lapp/hushtelegram/extension/telegram/misc/ChannelRestrictions;->ignoreRestrictionReason(Ljava/util/ArrayList;)Z"

class BypassChannelRestrictionsFixtureTest {
    @Test
    fun `every restriction check asks the extension first in every declared build`() {
        for (build in Fixtures.declaredBuilds()) {
            val hosts = FixtureDex.classes(build, setOf(MESSAGES_CONTROLLER)).values
            val context = PatchContexts.of(ExtensionDex.classes() + hosts + storyOwners(build))
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { bypassChannelRestrictionsPatch.execute(context) })
            val controller = context.tgMutableClassDefBy(MESSAGES_CONTROLLER)
            for ((methodName, hook) in listOf(
                "isChatNoForwards" to CHAT_HOOK,
                "isPeerNoForwards" to PEER_HOOK,
            )) {
                val method = controller.methods.single { m ->
                    m.origName == methodName && m.origReturnType == "Z"
                }
                val body = method.implementation!!.instructions.toList()
                assertTrue("${build.name}: $methodName starts with const/4", body[0].opcode == Opcode.CONST_4)
                assertEquals(1, (body[0] as NarrowLiteralInstruction).narrowLiteral)
                assertEquals("${build.name}: $methodName invoke-static", hook, body[1].origRef())
                assertEquals("${build.name}: $methodName move-result", Opcode.MOVE_RESULT, body[2].opcode)
                assertEquals("${build.name}: $methodName branch", Opcode.IF_NEZ, body[3].opcode)
            }
            val reasonCode = controller.methods.single { m ->
                m.origName == "getRestrictionReason" && m.origReturnType == "Ljava/lang/String;"
            }.implementation!!
            val reason = reasonCode.instructions.toList()
            assertEquals("${build.name}: getRestrictionReason invoke-static", REASON_HOOK, reason[0].origRef())
            assertEquals("${build.name}: getRestrictionReason hands over its list (p1)",
                reasonCode.registerCount - 1, (reason[0] as FiveRegisterInstruction).registerC)
            assertEquals("${build.name}: getRestrictionReason move-result", Opcode.MOVE_RESULT, reason[1].opcode)
            assertEquals("${build.name}: getRestrictionReason branch", Opcode.IF_EQZ, reason[2].opcode)
            assertEquals("${build.name}: getRestrictionReason answers null", Opcode.RETURN_OBJECT, reason[4].opcode)
            for (flag in listOf("bypassChannelRestrictions", "openRestrictedChats")) {
                val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods
                    .single { it.origName == flag }
                    .implementation!!.instructions.toList()
                assertEquals("${build.name}: $flag set", 1, (status[0] as NarrowLiteralInstruction).narrowLiteral)
                assertEquals(Opcode.RETURN, status[1].opcode)
            }
        }
    }

    @Test
    fun `every answer of the story viewer's check goes through the extension in every declared build`() {
        for (build in Fixtures.declaredBuilds()) {
            val owners = storyOwners(build)
            assertEquals("${build.name}: one class holds the story check", 1, owners.size)
            val owner = owners.single()
            val stockAnswers = owner.methods.single { it.isStoryCheck() }.returns().size
            assertTrue("${build.name}: the check answers more than once", stockAnswers > 1)
            val hosts = FixtureDex.classes(build, setOf(MESSAGES_CONTROLLER)).values
            val context = PatchContexts.of(ExtensionDex.classes() + hosts + owner)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { bypassChannelRestrictionsPatch.execute(context) })
            val check = context.tgMutableClassDefBy(owner.type).methods.single { it.isStoryCheck() }
            val body = check.implementation!!.instructions.toList()
            val answers = check.returns()
            assertEquals("${build.name}: every answer kept", stockAnswers, answers.size)
            for (at in answers) {
                val answer = (body[at] as OneRegisterInstruction).registerA
                assertEquals("${build.name}: the answer at $at asks the extension", STORY_HOOK, body[at - 2].origRef())
                assertEquals("${build.name}: with the answer it was about to give", answer,
                    (body[at - 2] as FiveRegisterInstruction).registerC)
                assertEquals(Opcode.MOVE_RESULT, body[at - 1].opcode)
                assertEquals("${build.name}: and gives the extension's back", answer, (body[at - 1] as OneRegisterInstruction).registerA)
            }
        }
    }

    private fun storyOwners(build: java.io.File) = FixtureDex.classesWhere(build, { true }) { it.isStoryCheck() }
}
