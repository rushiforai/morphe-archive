/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.spoilers

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.AfterClass
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File
import java.lang.ref.SoftReference

private const val TEXT_BLOCKS = "Lorg/telegram/messenger/MessageObject\$TextLayoutBlocks;"
private const val SEND_PARAMS = "Lorg/telegram/messenger/SendMessagesHelper\$SendMessageParams;"
private const val CORE = "(Landroid/view/View;Landroid/text/Layout;IILandroid/text/Spanned;Ljava/util/Stack;Ljava/util/List;Ljava/util/ArrayList;)V"

/** MessageObject, SpoilerEffect and its span, every class that checks media spoilers, and the runtime. */
class RevealSpoilersFixtureTest {
    @Test fun `the text cover asks first and every place that draws media asks the runtime`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            val site = context.resolveRevealSpoilers()
            val changed = (site.media.map { key(it.method) } + key(site.textCovers)).toSet()
            val old = (site.media.map { it.method } + site.textCovers).associate { key(it) to ImmutableMethod.of(it) }
            val untouched = hostState(build, context, changed)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { revealSpoilersPatch.execute(context) })

            // Text: six instructions in front, and Telegram's own path after them.
            val before = old.getValue(key(site.textCovers)).controlBody()
            val after = site.textCovers.controlBody()
            val parameters = site.textCovers.implementation!!.registerCount - 8
            assertEquals("$name: six instructions", before.size + 6, after.size)
            assertEquals(listOf(Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_FROM16, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ,
                Opcode.RETURN_VOID), after.take(6).map { it.opcode })
            assertEquals("$name: the view and the text", listOf(0, parameters, 1, parameters + 4), after[0].namedRegisters() + after[1].namedRegisters())
            assertEquals("$SPOILERS->skipTextCovers(Landroid/view/View;Landroid/text/Spanned;)Z", after[2].controlRef())
            val a = ControlFlow.of(old.getValue(key(site.textCovers)))
            val b = ControlFlow.of(site.textCovers)
            assertEquals("$name: no answer falls through to Telegram's cover", listOf(5, 6), b.normal[4].sorted())
            for (i in before.indices) {
                assertEquals("$name: stock operand $i", before[i].operand(), after[i + 6].operand())
                assertEquals("$name: stock normal path $i", a.normal[i].map { it + 6 }, b.normal[i + 6])
                assertEquals("$name: stock exceptional path $i", a.exceptional[i].map { it + 6 }, b.exceptional[i + 6])
            }
            assertTrue("$name: nothing jumps into the hook", (6 until b.normal.size).none { from -> b.normal[from].any { it in 1..5 } })

            // Media: one instruction each, same registers, same paths.
            for (method in site.media.map { it.method }.distinct()) {
                val stock = old.getValue(key(method))
                val indices = site.media.filter { it.method === method }.map { it.index }.toSet()
                val was = stock.controlBody()
                val now = method.controlBody()
                assertEquals("$name: same length", was.size, now.size)
                for (i in was.indices) {
                    if (i in indices) {
                        assertEquals(HAS_MEDIA_SPOILERS, was[i].controlRef())
                        assertEquals(if (was[i].opcode == Opcode.INVOKE_VIRTUAL_RANGE) Opcode.INVOKE_STATIC_RANGE else Opcode.INVOKE_STATIC, now[i].opcode)
                        assertEquals("$SPOILERS->mediaCovered(Ljava/lang/Object;)Z", now[i].controlRef())
                        assertEquals("$name: the message", was[i].namedRegisters(), now[i].namedRegisters())
                    } else {
                        assertEquals("$name: stock operand $i of ${method.name}", was[i].operand(), now[i].operand())
                    }
                }
                assertEquals("$name: same paths", ControlFlow.of(stock).normal.toList(), ControlFlow.of(method).normal.toList())
                assertEquals("$name: same handlers", ControlFlow.of(stock).exceptional.toList(), ControlFlow.of(method).exceptional.toList())
            }
            assertTrue("$name: no drawn media asks Telegram directly", hosts(build).filter { it.type !in ASKS_TELEGRAM }
                .flatMap { context.mutableClassDefBy(it.type).methods }.none { m -> m.controlBody().any { it.controlRef() == HAS_MEDIA_SPOILERS } })
            val asking = ASKS_TELEGRAM.filter { type -> context.mutableClassDefBy(type).methods.any { m -> m.controlBody().any { it.controlRef() == HAS_MEDIA_SPOILERS } } }
            assertEquals("$name: sending, retrying and notifications still ask Telegram", ASKS_TELEGRAM, asking.toSet())
            assertEquals("$name: every other method", untouched, hostState(build, context, changed))

            val stubs = context.mutableClassDefBy(SPOILERS).methods
            fun stub(name: String) = stubs.single { it.name == name }.controlBody()
            assertEquals(listOf(Opcode.INSTANCE_OF, Opcode.IF_EQZ, Opcode.CHECK_CAST, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.RETURN),
                stub("spoilerSpan").map { it.opcode })
            assertEquals(site.span.toString(), stub("spoilerSpan")[3].controlRef())
            assertEquals(listOf(Opcode.CHECK_CAST, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.RETURN), stub("stockMediaCovered").map { it.opcode })
            assertEquals(HAS_MEDIA_SPOILERS, stub("stockMediaCovered")[1].controlRef())
            assertEquals(listOf("$MESSAGE_OBJECT->needDrawBluredPreview()Z", "$MESSAGE_OBJECT->isHiddenSensitive()Z"),
                stub("keptCovered").filter { it.opcode == Opcode.INVOKE_VIRTUAL }.map { it.controlRef() })
            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "revealSpoilers" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }

    @Test fun `the media checks and text covers are the reviewed ones`() {
        // Reviewed 2026-10-06: chat bubbles, the chat list, shared media, the reply and edit previews
        // and the photo strip draw media; sending, retrying and notifications ask Telegram. Text is
        // covered in messages, the chat list, replies, quotes, Instant View and the composer, which
        // keeps its cover. A new caller fails here so it gets the same review.
        for (build in Fixtures.declaredBuilds()) {
            val methods = hosts(build).flatMap { it.methods }
            val checks = methods.filter { m -> m.controlBody().any { it.controlRef() == HAS_MEDIA_SPOILERS } }
            assertEquals("${build.name}: media checks ${checks.map { key(it) }}", 28, checks.size)
            val covers = FixtureDex.classesWhere(build, { true }) { m -> m.controlBody().any { it.controlRef()?.endsWith(CORE) == true } }
                .flatMap { it.methods }.count { m -> m.controlBody().any { it.controlRef()?.endsWith(CORE) == true } }
            assertEquals("${build.name}: text covers", 7, covers)
        }
    }

    @Test fun `a changed check or runtime refuses before any method changes`() {
        for (build in Fixtures.declaredBuilds()) {
            val mutations: List<Pair<String, (BytecodePatchContext, RevealSpoilersSite) -> Unit>> = listOf(
                "the media check reads something new" to { c, _ -> c.mutableClassDefBy(MESSAGE_OBJECT).methods.single { it.toString() == HAS_MEDIA_SPOILERS }
                    .replaceInstruction(0, "iget-boolean v0, v1, $MESSAGE_OBJECT->hushNew:Z") },
                "a drawing class sends a spoiler" to { _, s -> s.media.first().method.addInstruction(0, "iput-boolean v0, v0, $SEND_PARAMS->hasMediaSpoilers:Z") },
                "the answer isn't read" to { _, s -> s.media.first().let { it.method.replaceInstruction(it.index + 1, "nop") } },
                "no reveal check" to { c, _ -> c.mutableClassDefBy(TEXT_BLOCKS).methods.forEach { m ->
                    m.controlBody().withIndex().filter { it.value.controlRef() == "$MESSAGE_OBJECT->isSpoilersRevealed:Z" }.forEach { m.replaceInstruction(it.index, "nop") } } },
                "text cover not static" to { _, s -> s.textCovers.accessFlags = s.textCovers.accessFlags and AccessFlags.STATIC.value.inv() },
                "span check private" to { c, s -> val m = c.mutableClassDefBy(s.span.definingClass).methods.single { it.name == s.span.name && it.parameterTypes.isEmpty() }
                    m.accessFlags = m.accessFlags and AccessFlags.PUBLIC.value.inv() or AccessFlags.PRIVATE.value },
                "view-once check private" to { c, _ -> val m = c.mutableClassDefBy(MESSAGE_OBJECT).methods.single { it.toString() == "$MESSAGE_OBJECT->needDrawBluredPreview()Z" }
                    m.accessFlags = m.accessFlags and AccessFlags.PUBLIC.value.inv() or AccessFlags.PRIVATE.value },
                "missing build flag" to { c, _ -> c.mutableClassDefBy(SETTINGS_STATUS).methods.removeAll { it.name == "revealSpoilers" } },
                "private media hook" to { c, _ -> val h = c.mutableClassDefBy(SPOILERS).methods.single { it.name == "mediaCovered" }
                    h.accessFlags = h.accessFlags and AccessFlags.PUBLIC.value.inv() or AccessFlags.PRIVATE.value },
                "missing kept stub" to { c, _ -> c.mutableClassDefBy(SPOILERS).methods.removeAll { it.name == "keptCovered" } },
            )
            for ((case, change) in mutations) {
                val c = context(build)
                change(c, c.resolveRevealSpoilers())
                val before = completeState(build, c)
                assertThrows("${build.name}: $case", PatchException::class.java) { revealSpoilersPatch.execute(c) }
                assertEquals("${build.name}: $case preserves every method, path and build fact", before, completeState(build, c))
            }
        }
    }

    private fun context(build: File) = PatchContexts.of(ExtensionDex.classes() + hosts(build))
    private fun completeState(build: File, c: BytecodePatchContext) = (hosts(build).map { it.type } + listOf(SPOILERS, SETTINGS_STATUS))
        .filter { c.classDefByOrNull(it) != null }.associateWith { type -> c.mutableClassDefBy(type).let { cls ->
            listOf(cls.accessFlags, cls.methods.map { key(it) to it.state() }) } }
    private fun hostState(build: File, c: BytecodePatchContext, except: Set<String>) = hosts(build)
        .flatMap { c.mutableClassDefBy(it.type).methods }.filter { key(it) !in except }.associate { key(it) to it.state() }

    private fun hosts(build: File): List<ClassDef> {
        val identity = FixtureDex.inputIdentity(build)
        return HOSTS[identity]?.get() ?: loadHosts(build).also {
            if (HOSTS.size >= 2) HOSTS.clear()
            HOSTS[identity] = SoftReference(it)
        }
    }

    /** MessageObject and its text layout, SpoilerEffect and its span, and every class that checks or sends media spoilers. */
    private fun loadHosts(build: File): List<ClassDef> {
        val found = FixtureDex.classesWhere(build, { true }) { method ->
            (AccessFlags.STATIC.isSet(method.accessFlags) && method.toString().endsWith(CORE)) ||
                method.controlBody().any { it.controlRef() == HAS_MEDIA_SPOILERS || it.controlRef() == "$SEND_PARAMS->hasMediaSpoilers:Z" }
        }
        val effect = found.single { cls -> cls.methods.any { AccessFlags.STATIC.isSet(it.accessFlags) && it.toString().endsWith(CORE) } }
        val span = effect.methods.single { it.toString().endsWith(CORE) }.controlBody()
            .mapNotNull { (it as? ReferenceInstruction)?.takeIf { i -> i.opcode == Opcode.CONST_CLASS }?.reference as? TypeReference }.single().type
        return (found + FixtureDex.classes(build, setOf(MESSAGE_OBJECT, TEXT_BLOCKS, SEND_PARAMS, span)).values)
            .associateBy { it.type }.values.map(ImmutableClassDef::of)
    }

    private fun Method.state(): List<Any?> {
        val body = controlBody(); val flow = if (body.isEmpty()) null else ControlFlow.of(this)
        return listOf(accessFlags, implementation?.registerCount, body.map { it.operand() }, body.map { listOf(it.codeUnits, (it as? OffsetInstruction)?.codeOffset) },
            flow?.normal?.toList(), flow?.exceptional?.toList())
    }
    private fun Instruction.operand() = listOf(opcode, namedRegisters(), (this as? ReferenceInstruction)?.reference?.toString(),
        (this as? WideLiteralInstruction)?.wideLiteral)
    private fun key(m: Method) = "${m.definingClass}->${m.name}(${m.parameterTypes.joinToString("")})${m.returnType}"

    companion object {
        private val HOSTS = mutableMapOf<String, SoftReference<List<ClassDef>>>()
        @AfterClass @JvmStatic fun releaseFixtures() { HOSTS.clear() }
    }
}
