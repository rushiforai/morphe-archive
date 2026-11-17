/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.drafts

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.telegram.misc.extension.parameterRegister
import app.morphe.patches.telegram.misc.extension.parameterRegisterNumber
import app.morphe.util.ControlFlow
import app.morphe.util.names.addInstructionsWithLabels
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origRef
import app.morphe.util.names.origSuperclass
import app.morphe.util.names.replaceInstruction
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Assert.fail
import org.junit.Test
import java.io.File
import java.util.concurrent.ConcurrentHashMap

/**
 * The classes Fix link previews reads on [build]: SendMessagesHelper, its send parameters, the
 * preview classes the stubs make and fill, and every Telegram superclass above them, so the stubs'
 * verifier check sees the real class chain. [leaveOut] drops some of them.
 */
internal fun linkPreviewRulesClasses(build: File, leaveOut: Set<String> = emptySet()): List<ClassDef> {
    val all = LinkPreviewRulesFixtureTest.SLICES.getOrPut(build.path) {
        val found = linkedMapOf<String, ClassDef>()
        var wanted = LinkPreviewRulesFixtureTest.SLICE
        while (wanted.isNotEmpty()) {
            val read = FixtureDex.classes(build, wanted)
            found.putAll(read)
            wanted = read.values.mapNotNull { it.origSuperclass }
                .filter { it.startsWith("Lorg/telegram/") && it !in found }.toSet()
        }
        found.entries.map { it.key to it.value }
    }
    return all.filter { it.first !in leaveOut }.map { it.second }
}

/** Fix link previews (#79) on the pinned builds: the send's start hands its parameters over, and nothing else moves. */
class LinkPreviewRulesFixtureTest {
    @Test
    fun `the send hands its parameters to the rules first and keeps every stock instruction`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = contextOf(build)
            val site = context.resolveLinkPreviewRules()
            val send = site.method
            assertEquals("$name: the send is SendMessagesHelper's", "sendMessage", send.origName)
            assertEquals("$name: the send takes its parameters only", listOf(RULES_SEND_PARAMS), send.origParameterTypes)
            val stock = shapeOf(send.body())
            val params = send.parameterRegisterNumber(0)
            assertEquals("$name: the parameters are the send's last register", send.implementation!!.registerCount - 1, params)

            context.applyLinkPreviewRules(site)

            val body = send.body()
            val hook = body[0]
            assertEquals("$name: the hook is a range call", Opcode.INVOKE_STATIC_RANGE, hook.opcode)
            assertEquals("$name: the hook calls the rules", LINK_PREVIEW_RULES_SEND, hook.origRef())
            hook as RegisterRangeInstruction
            assertEquals("$name: the hook hands over the send's parameters", params, hook.startRegister)
            assertEquals("$name: the hook hands over one register", 1, hook.registerCount)
            assertEquals("$name: every stock instruction follows the hook", stock, shapeOf(body.drop(1)))
            val flow = ControlFlow.of(send)
            assertEquals("$name: the hook runs on into the stock code", listOf(1), flow.normal[0])
            assertTrue("$name: nothing comes back to the hook", flow.normal.none { 0 in it } && flow.exceptional.none { 0 in it })
            assertStubsWritten(name, context)
        }
    }

    @Test
    fun `a send that changed shape is refused and nothing is written`() {
        for (build in Fixtures.declaredBuilds()) {
            val cases = linkedMapOf<String, Pair<Set<String>, (MutableMethod) -> Unit>>(
                "SendMessagesHelper is missing" to (setOf(RULES_SEND_HELPER) to { _: MutableMethod -> }),
                "a preview still to be made's class is missing" to (setOf(RULES_PENDING_PAGE) to { _: MutableMethod -> }),
                "the send no longer reads the picked link preview" to (emptySet<String>() to { send ->
                    send.body().indices.filter { send.body()[it].opcode == Opcode.IGET_OBJECT && send.body()[it].origRef() == CHOSEN }
                        .forEach { send.replaceInstruction(it, "nop") }
                }),
                "the send no longer sends the picked preview by its address" to (emptySet<String>() to { send ->
                    val at = send.body().indexOfFirst { it.opcode == Opcode.IPUT_OBJECT && it.origRef() == INPUT_URL }
                    assertTrue("${build.name}: the send fills the preview's address", at >= 0)
                    send.replaceInstruction(at, "nop")
                }),
                "the send branches back to its start" to (emptySet<String>() to { send ->
                    send.addInstructionsWithLabels(1, "if-eqz ${send.parameterRegister(0)}, :hush_top",
                        ExternalLabel("hush_top", send.getInstruction(0)))
                }),
            )
            for ((why, case) in cases) {
                val (leaveOut, change) = case
                val context = contextOf(build, leaveOut)
                val send = if (RULES_SEND_HELPER in leaveOut) null else sendOf(context).also(change)
                val before = send?.let { shapeOf(it.body()) }
                try {
                    context.resolveLinkPreviewRules()
                    fail("${build.name}: $why was accepted")
                } catch (refused: PatchException) {
                    assertEquals("${build.name}: says why", why, refused.message)
                }
                if (send != null) assertEquals("${build.name}: $why leaves the send alone", before, shapeOf(send.body()))
                val stub = context.tgMutableClassDefBy(LINK_PREVIEW_RULES).methods.single { it.origName == "text" }
                assertTrue("${build.name}: $why writes no stub", stub.body().any { it.origRef()?.startsWith(PARAMS_FACE) == true })
            }
        }
    }

    /** Every stub reads the send's own fields, and the pointed preview is a pending page that says its url is there. */
    private fun assertStubsWritten(name: String, context: BytecodePatchContext) {
        val rules = context.tgMutableClassDefBy(LINK_PREVIEW_RULES)
        val wanted = mapOf(
            "text" to setOf("$RULES_SEND_PARAMS->richMessage:Lorg/telegram/tgnet/tl/TL_iv\$RichMessage;",
                "$RULES_SEND_PARAMS->retryMessageObject:Lorg/telegram/messenger/MessageObject;",
                "$RULES_SEND_PARAMS->searchLinks:Z", "$RULES_SEND_PARAMS->message:Ljava/lang/String;"),
            "peer" to setOf("$RULES_SEND_PARAMS->peer:J"),
            "extras" to setOf("$RULES_SEND_PARAMS->params:Ljava/util/HashMap;"),
            "chosen" to setOf(CHOSEN, PAGE, URL),
            "point" to setOf(CHOSEN, PAGE, URL, "$RULES_WEB_PAGE->flags:I",
                "$RULES_MESSAGE_MEDIA->force_large_media:Z", "$RULES_MESSAGE_MEDIA->force_small_media:Z"),
        )
        for ((stub, fields) in wanted) {
            val body = rules.methods.single { it.origName == stub }.body()
            assertTrue("$name: $stub no longer asks the extension's own Params", body.none { it.origRef()?.startsWith(PARAMS_FACE) == true })
            val touched = body.filter { (it as? ReferenceInstruction)?.reference is FieldReference }.mapNotNull { it.origRef() }.toSet()
            assertEquals("$name: the fields $stub reads and writes", fields, touched)
        }
        val point = rules.methods.single { it.origName == "point" }.body()
        assertEquals("$name: point makes the new preview and its pending page", listOf(RULES_MEDIA_WEB_PAGE, RULES_PENDING_PAGE),
            point.filter { it.opcode == Opcode.NEW_INSTANCE }.map { it.origRef() })
        val flags = point.indexOfFirst { it.opcode == Opcode.IPUT && it.origRef() == "$RULES_WEB_PAGE->flags:I" }
        assertEquals("$name: the pending page's flags say its url is there", 1, (point[flags - 1] as NarrowLiteralInstruction).narrowLiteral)
    }

    private fun contextOf(build: File, leaveOut: Set<String> = emptySet()): BytecodePatchContext =
        PatchContexts.of((ExtensionDex.classes() + linkPreviewRulesClasses(build, leaveOut)).distinctBy(ClassDef::getType))

    private fun sendOf(context: BytecodePatchContext): MutableMethod = context.tgMutableClassDefBy(RULES_SEND_HELPER).methods.single {
        it.origName == "sendMessage" && it.origParameterTypes == listOf(RULES_SEND_PARAMS) && it.implementation != null }

    private fun Method.body(): List<Instruction> = implementation?.instructions?.toList() ?: emptyList()

    /** What each instruction does, nops left out and every goto read alike, since an insert can widen one. */
    private fun shapeOf(body: List<Instruction>): List<Pair<Opcode, String?>> = body.filter { it.opcode != Opcode.NOP }
        .map { (if (it.opcode in GOTOS) Opcode.GOTO else it.opcode) to it.origRef() }

    companion object {
        internal val SLICE = setOf(RULES_SEND_HELPER, RULES_SEND_PARAMS, RULES_INPUT_WEB_PAGE, RULES_MEDIA_WEB_PAGE,
            RULES_PENDING_PAGE, RULES_MESSAGE_MEDIA, RULES_WEB_PAGE)
        internal val SLICES = ConcurrentHashMap<String, List<Pair<String, ClassDef>>>()
        private const val CHOSEN = "$RULES_SEND_PARAMS->mediaWebPage:$RULES_MEDIA_WEB_PAGE"
        private const val PAGE = "$RULES_MESSAGE_MEDIA->webpage:$RULES_WEB_PAGE"
        private const val URL = "$RULES_WEB_PAGE->url:Ljava/lang/String;"
        private const val INPUT_URL = "$RULES_INPUT_WEB_PAGE->url:Ljava/lang/String;"
        private const val PARAMS_FACE = "Lapp/hushtelegram/extension/telegram/misc/LinkPreviewRules\$Params;"
        private val GOTOS = setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)
    }
}
