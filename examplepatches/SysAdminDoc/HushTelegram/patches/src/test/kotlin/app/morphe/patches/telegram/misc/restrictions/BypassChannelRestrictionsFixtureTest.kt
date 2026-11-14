/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.restrictions

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.hostsOf
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origRef
import app.morphe.util.names.origReturnType
import app.morphe.util.names.tgMutableClassDefBy
import java.io.File
import java.util.concurrent.ConcurrentHashMap

private const val MESSAGES_CONTROLLER = "Lorg/telegram/messenger/MessagesController;"
private const val MESSAGE_OBJECT = "Lorg/telegram/messenger/MessageObject;"
private const val CHAT_HOOK = "Lapp/hushtelegram/extension/telegram/misc/ChannelRestrictions;->isChatNoForwards(I)I"
private const val PEER_HOOK = "Lapp/hushtelegram/extension/telegram/misc/ChannelRestrictions;->noForwards(I)I"
private const val REASON_HOOK = "Lapp/hushtelegram/extension/telegram/misc/ChannelRestrictions;->ignoreRestrictionReason(Ljava/util/ArrayList;)Z"

/** What the protected forward's stubs reach: the forward, the sends, the message and its file. */
internal val FORWARD_HOSTS = setOf(
    "Lorg/telegram/messenger/SendMessagesHelper;", "Lorg/telegram/messenger/AccountInstance;", "Lorg/telegram/messenger/MessageObject;",
    "Lorg/telegram/tgnet/TLRPC\$Message;", "Lorg/telegram/tgnet/TLRPC\$Document;", "Lorg/telegram/messenger/FileLoader;",
    "Lorg/telegram/messenger/DialogObject;", "Lorg/telegram/tgnet/TLObject;",
)

private val FORWARD_GATE_OWNERS = ConcurrentHashMap<String, List<ClassDef>>()

/**
 * Every class whose Forward, Copy, Save or share button branches on a message's or chat's own
 * no-forwarding flag (#73). A test that runs Bypass channel restrictions and expects nothing to
 * warn about adds these.
 */
internal fun forwardGateOwners(build: File): List<ClassDef> = FORWARD_GATE_OWNERS.hostsOf(build.path) {
    FixtureDex.classesWhere(build, { true }) { !it.definingClass.startsWith("Lorg/telegram/tgnet/") && it.noForwardsGates().isNotEmpty() }
}

private fun Method.signature() = "$name(${parameterTypes.joinToString("")})$returnType"

private fun Method.readsNoForwards() = implementation?.instructions?.any {
    it.opcode == Opcode.IGET_BOOLEAN && it.origRef() in NO_FORWARDS_FLAGS
} == true

private fun Opcode.kind() = if (this == Opcode.GOTO_16 || this == Opcode.GOTO_32) Opcode.GOTO else this

class BypassChannelRestrictionsFixtureTest {
    @Test
    fun `every restriction check asks the extension first in every declared build`() {
        for (build in Fixtures.declaredBuilds()) {
            val hosts = FixtureDex.classes(build, setOf(MESSAGES_CONTROLLER) + FORWARD_HOSTS).values
            val context = PatchContexts.of((ExtensionDex.classes() + hosts + storyOwners(build) + bannedAlertHosts(build) +
                forwardGateOwners(build)).distinctBy { it.type })
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
            for (flag in listOf("bypassChannelRestrictions", "openRestrictedChats", "bannedChannelWeb")) {
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
            val hosts = FixtureDex.classes(build, setOf(MESSAGES_CONTROLLER) + FORWARD_HOSTS).values
            val context = PatchContexts.of((ExtensionDex.classes() + hosts + owner + bannedAlertHosts(build) +
                forwardGateOwners(build)).distinctBy { it.type })
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

    @Test
    fun `Forward, Copy, Save and Share ask the extension at every check of the flag in every declared build`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val owners = forwardGateOwners(build)
            val hosts = FixtureDex.classes(build, setOf(MESSAGES_CONTROLLER) + FORWARD_HOSTS).values
            val stockPrivateChat = hosts.flatMap { it.methods }.single { it.isPrivateChatCheck() }.implementation!!.instructions.toList()
            // Each gate as Telegram ships it, keyed by class and signature.
            val stockGates = owners.flatMap { owner ->
                owner.methods.filter { it.noForwardsGates().isNotEmpty() }.map { m ->
                    (owner.type to m.signature()) to (m.noForwardsGates() to m.implementation!!.instructions.toList())
                }
            }.toMap()
            val gateMethods = owners.flatMap { o -> o.methods.filter { it.noForwardsGates().isNotEmpty() } }
            assertTrue("$name: the message's own forward check is a gate", gateMethods.any { it.isCanForwardMessage() })
            assertTrue("$name: so is the message's share button", gateMethods.any {
                it.origDefiningClass == MESSAGE_OBJECT && it.origName == "needDrawShareButton"
            })
            assertTrue("$name: the share button's tap reads the chat's own flag", gateMethods.any { m ->
                m.noForwardsGates().any { at -> m.implementation!!.instructions.elementAt(at).origRef() == CHAT_NO_FORWARDS }
            })
            assertTrue("$name: the chat screen, its cells, menus, shared media and the photo viewer, ${owners.map { it.type }}",
                owners.count { it.type.startsWith("Lorg/telegram/ui/") } >= 10)

            // Every other method outside the network layer that reads the flag, story check aside.
            val stories = storyOwners(build)
            val readers = FixtureDex.classesWhere(build, { true }) { m ->
                !m.definingClass.startsWith("Lorg/telegram/tgnet/") && m.readsNoForwards() && m.noForwardsGates().isEmpty()
            }.filter { r -> r.type !in hosts.map { it.type } && r.type !in stories.map { it.type } }
            val stockReaders = (owners + readers).flatMap { c ->
                c.methods.filter { it.readsNoForwards() && it.noForwardsGates().isEmpty() && !it.isStoryCheck() }
                    .map { (c.type to it.signature()) to it.implementation!!.instructions.toList() }
            }.toMap()

            val context = PatchContexts.of((ExtensionDex.classes() + hosts + stories + bannedAlertHosts(build) +
                owners + readers).distinctBy { it.type })
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { bypassChannelRestrictionsPatch.execute(context) })

            for ((site, stockSite) in stockGates) {
                val (type, signature) = site
                val (reads, stock) = stockSite
                val after = context.tgMutableClassDefBy(type).methods.single { it.signature() == signature }
                    .implementation!!.instructions.toList()
                assertEquals("$name: $type.$signature gains two lines per gate", stock.size + 2 * reads.size, after.size)
                reads.forEachIndexed { k, read ->
                    val at = read + 2 * k
                    val flag = (stock[read] as TwoRegisterInstruction).registerA
                    val hook = if (stock[read].origRef() == CHAT_NO_FORWARDS) CHAT_HOOK else PEER_HOOK
                    assertEquals("$name: $type.$signature reads the flag at $read", stock[read].origRef(), after[at].origRef())
                    assertEquals("$name: $type.$signature then asks the extension", listOf(Opcode.INVOKE_STATIC_RANGE, hook, listOf(flag)),
                        listOf(after[at + 1].opcode, after[at + 1].origRef(), after[at + 1].namedRegisters()))
                    assertEquals("$name: $type.$signature and branches on its answer",
                        listOf(Opcode.MOVE_RESULT, listOf(flag), stock[read + 1].opcode, listOf(flag)),
                        listOf(after[at + 2].opcode, after[at + 2].namedRegisters(), after[at + 3].opcode, after[at + 3].namedRegisters()))
                }
                val inserted = reads.flatMapIndexed { k, read -> listOf(read + 2 * k + 1, read + 2 * k + 2) }.toSet()
                assertEquals("$name: $type.$signature keeps the rest", stock.map { it.opcode.kind() },
                    after.filterIndexed { i, _ -> i !in inserted }.map { it.opcode.kind() })
            }
            // Every other read of the flag only passes it on, like the channel's own Restrict saving
            // content switch, and stays Telegram's.
            for ((site, stock) in stockReaders) {
                val (type, signature) = site
                val after = context.tgMutableClassDefBy(type).methods.single { it.signature() == signature }
                    .implementation!!.instructions.toList()
                assertEquals("$name: $type.$signature stays Telegram's", stock.map { it.opcode.kind() }, after.map { it.opcode.kind() })
            }
            assertTrue("$name: the chat's settings read the flag too", stockReaders.isNotEmpty())

            val privateChat = context.tgMutableClassDefBy(MESSAGES_CONTROLLER).methods.single { it.isPrivateChatCheck() }
            val body = privateChat.implementation!!.instructions.toList()
            assertEquals("$name: the private chat check sets v0", listOf(Opcode.CONST_4, listOf(0)), listOf(body[0].opcode, body[0].namedRegisters()))
            assertTrue("$name: v0 is a local, not the profile", privateChat.implementation!!.registerCount > 1)
            assertEquals(1, (body[0] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals("$name: asks the extension", CHAT_HOOK, body[1].origRef())
            assertEquals(listOf(Opcode.MOVE_RESULT, Opcode.IF_NEZ, Opcode.RETURN), body.subList(2, 5).map { it.opcode })
            assertEquals("$name: then Telegram's own check", stockPrivateChat.map { it.opcode.kind() }, body.drop(5).map { it.opcode.kind() })
        }
    }

    private fun storyOwners(build: java.io.File) = FixtureDex.classesWhere(build, { true }) { it.isStoryCheck() }

    private fun Method.isPrivateChatCheck() = AccessFlags.STATIC.isSet(accessFlags) && returnType == "Z" &&
        origParameterTypes == listOf("Lorg/telegram/tgnet/TLRPC\$UserFull;") &&
        implementation?.instructions?.any { it.origRef() == "Lorg/telegram/tgnet/TLRPC\$UserFull;->noforwards_peer_enabled:Z" } == true
}
