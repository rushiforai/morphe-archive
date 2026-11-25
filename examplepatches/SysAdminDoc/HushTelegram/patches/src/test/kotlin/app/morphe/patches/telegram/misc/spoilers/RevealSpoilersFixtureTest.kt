/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.spoilers

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.util.names.origRef
import app.morphe.util.names.origString
import app.morphe.util.names.addInstruction
import app.morphe.util.names.replaceInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction as rawReplaceInstruction
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
import app.morphe.util.names.origName
import app.morphe.util.names.origType
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy

private const val SEND_PARAMS = "Lorg/telegram/messenger/SendMessagesHelper\$SendMessageParams;"
private const val BLUR_CHECK = "$MESSAGE_OBJECT->needDrawBluredPreview()Z"
private const val BLURRED_HOOK = "$SPOILERS->blurred(Ljava/lang/Object;)Z"
private const val FORCE_PREVIEW = "Lorg/telegram/messenger/ImageReceiver;->setForcePreview(Z)V"
private const val CAN_DOWNLOAD = "Lorg/telegram/messenger/DownloadController;->canDownloadMedia($MESSAGE_OBJECT)Z"
private const val LOADS_PHOTO = "$SPOILERS->loadsPhoto(Ljava/lang/Object;Ljava/lang/Object;)Z"
private const val CORE = "(Landroid/view/View;Landroid/text/Layout;IILandroid/text/Spanned;Ljava/util/Stack;Ljava/util/List;Ljava/util/ArrayList;)V"

/** MessageObject, SpoilerEffect and its span, every class that checks media spoilers, and the runtime. */
class RevealSpoilersFixtureTest {
    @Test fun `the text cover asks first and every place that draws media asks the runtime`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            val site = context.resolveRevealSpoilers()
            val timed = context.resolveTimedBlur()
            assertEquals("$name: ${timed.missing}", null, timed.missing)
            assertEquals("$name: four blur checks and the photo check in one method", listOf(5, 1), listOf(timed.sites.size, timed.sites.map { it.method }.distinct().size))
            val changed = (site.media.map { key(it.method) } + timed.sites.map { key(it.method) } + key(site.textCovers)).toSet()
            val old = (site.media.map { it.method } + timed.sites.map { it.method } + site.textCovers).associate { key(it) to ImmutableMethod.of(it) }
            val untouched = hostState(build, context, changed)
            // These hosts leave out the text block class the chat's menu and search hits read, so
            // only those two step aside (ChatRevealFixtureTest covers them).
            val warned = PatchLogCapture.warnings { revealSpoilersPatch.execute(context) }
            assertEquals("$name: $warned", 1, warned.size)
            assertTrue("$name: $warned", warned.single().endsWith("goes on without Show all spoilers, Expand all quotes or quotes opening on search hits."))

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
            for (method in (site.media + timed.sites).map { it.method }.distinct()) {
                val stock = old.getValue(key(method))
                val indices = site.media.filter { it.method === method }.map { it.index }.toSet()
                val blurChecks = timed.sites.filter { it.method === method }.map { it.index }.toSet()
                val was = stock.controlBody()
                val now = method.controlBody()
                assertEquals("$name: same length", was.size, now.size)
                for (i in was.indices) {
                    if (i in indices) {
                        assertEquals(HAS_MEDIA_SPOILERS, was[i].controlRef())
                        assertEquals(if (was[i].opcode == Opcode.INVOKE_VIRTUAL_RANGE) Opcode.INVOKE_STATIC_RANGE else Opcode.INVOKE_STATIC, now[i].opcode)
                        assertEquals("$SPOILERS->mediaCovered(Ljava/lang/Object;)Z", now[i].controlRef())
                        assertEquals("$name: the message", was[i].namedRegisters(), now[i].namedRegisters())
                    } else if (i in blurChecks) {
                        val photo = was[i].controlRef() == CAN_DOWNLOAD
                        assertEquals(if (photo) CAN_DOWNLOAD else BLUR_CHECK, was[i].controlRef())
                        assertEquals(if (was[i].opcode == Opcode.INVOKE_VIRTUAL_RANGE) Opcode.INVOKE_STATIC_RANGE else Opcode.INVOKE_STATIC, now[i].opcode)
                        assertEquals(if (photo) LOADS_PHOTO else BLURRED_HOOK, now[i].controlRef())
                        assertEquals("$name: the message", was[i].namedRegisters(), now[i].namedRegisters())
                    } else {
                        assertEquals("$name: stock operand $i of ${method.name}", was[i].operand(), now[i].operand())
                    }
                }
                assertEquals("$name: same paths", ControlFlow.of(stock).normal.toList(), ControlFlow.of(method).normal.toList())
                assertEquals("$name: same handlers", ControlFlow.of(stock).exceptional.toList(), ControlFlow.of(method).exceptional.toList())
            }
            assertTrue("$name: no drawn media asks Telegram directly", hosts(build).filter { it.origType !in ASKS_TELEGRAM }
                .flatMap { context.tgMutableClassDefBy(it.type).methods }.none { m -> m.controlBody().any { it.controlRef() == HAS_MEDIA_SPOILERS } })
            val asking = ASKS_TELEGRAM.filter { type -> context.tgMutableClassDefBy(type).methods.any { m -> m.controlBody().any { it.controlRef() == HAS_MEDIA_SPOILERS } } }
            assertEquals("$name: sending, retrying and notifications still ask Telegram", ASKS_TELEGRAM, asking.toSet())
            assertEquals("$name: every other method", untouched, hostState(build, context, changed))

            val stubs = context.tgMutableClassDefBy(SPOILERS).methods
            fun stub(name: String) = stubs.single { it.origName == name }.controlBody()
            assertEquals(listOf(Opcode.INSTANCE_OF, Opcode.IF_EQZ, Opcode.CHECK_CAST, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.RETURN),
                stub("spoilerSpan").map { it.opcode })
            assertEquals(site.span.toString(), stub("spoilerSpan")[3].controlRef())
            assertEquals(listOf(Opcode.CHECK_CAST, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.RETURN), stub("stockMediaCovered").map { it.opcode })
            assertEquals(HAS_MEDIA_SPOILERS, stub("stockMediaCovered")[1].controlRef())
            assertEquals(listOf("$MESSAGE_OBJECT->needDrawBluredPreview()Z", "$MESSAGE_OBJECT->isHiddenSensitive()Z"),
                stub("keptCovered").filter { it.opcode == Opcode.INVOKE_VIRTUAL }.map { it.controlRef() })
            assertEquals(listOf(Opcode.CHECK_CAST, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.RETURN), stub("stockBlurred").map { it.opcode })
            assertEquals(BLUR_CHECK, stub("stockBlurred")[1].controlRef())
            assertEquals(listOf(Opcode.CHECK_CAST, Opcode.CHECK_CAST, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.RETURN), stub("stockLoadsPhoto").map { it.opcode })
            assertEquals(CAN_DOWNLOAD, stub("stockLoadsPhoto")[2].controlRef())
            assertEquals("$name: timed means blurred, and neither paid nor sensitive",
                listOf(BLUR_CHECK, "$MESSAGE_OBJECT->hasExtendedMediaPreview()Z", "$MESSAGE_OBJECT->isHiddenSensitive()Z"),
                stub("timedPreview").filter { it.opcode == Opcode.INVOKE_VIRTUAL }.map { it.controlRef() })
            fun flag(name: String) = (context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == name }.controlBody().first() as WideLiteralInstruction).wideLiteral
            assertEquals(1L, flag("revealSpoilers"))
            assertEquals("$name: timed media", 1L, flag("revealTimedMedia"))
            assertEquals("$name: no chat menu", 0L, flag("chatRevealMenu"))
            assertEquals("$name: no search hits", 0L, flag("searchHitQuotes"))
        }
    }

    @Test fun `only the bubble's blur checks change, so a tap still opens the timed viewer`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val blurMethod = context.resolveTimedBlur().sites.first().method
            val others = hosts(build).flatMap { context.tgMutableClassDefBy(it.type).methods }.filter { key(it) != key(blurMethod) }
                .map { m -> key(m) to m.controlBody().count { it.controlRef() == BLUR_CHECK } }.filter { it.second > 0 }
            PatchLogCapture.warnings { revealSpoilersPatch.execute(context) }
            assertEquals("${build.name}: every other check still asks Telegram", others,
                hosts(build).flatMap { context.tgMutableClassDefBy(it.type).methods }.filter { key(it) != key(blurMethod) }
                    .map { m -> key(m) to m.controlBody().count { it.controlRef() == BLUR_CHECK } }.filter { it.second > 0 })
        }
    }

    @Test fun `with the timed switch the bubble can load and draw the full photo`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            val method = context.resolveTimedBlur().sites.first().method
            val stock = method.controlBody().toList()
            val preview = stock.indices.single { stock[it].controlRef() == FORCE_PREVIEW && it >= 2 && stock[it - 2].controlRef() == BLUR_CHECK }
            PatchLogCapture.warnings { revealSpoilersPatch.execute(context) }
            val now = method.controlBody()
            assertEquals("$name: the photo view stops forcing the thumbnail", BLURRED_HOOK, now[preview - 2].controlRef())
            val load = now.indices.single { now[it].controlRef() == LOADS_PHOTO }
            assertEquals("$name: the download check of a photo", CAN_DOWNLOAD, stock[load].controlRef())
            assertTrue("$name: right after the file check", (load - 12 until load).any { stock[it].controlRef() == "$MESSAGE_OBJECT->mediaExists:Z" })
            assertTrue("$name: right before the loading check", (load + 2..load + 12).any { stock[it].controlRef() == "Lorg/telegram/messenger/FileLoader;->isLoadingFile(Ljava/lang/String;)Z" })
            assertEquals("$name: every other download check stays", stock.count { it.controlRef() == CAN_DOWNLOAD } - 1, now.count { it.controlRef() == CAN_DOWNLOAD })
        }
    }

    @Test fun `a moved photo check costs only the timed media switch`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val method = context.resolveTimedBlur().sites.first().method
            method.controlBody().withIndex().filter { it.value.controlRef() == "Lorg/telegram/messenger/FileLoader;->isLoadingFile(Ljava/lang/String;)Z" }
                .forEach { method.replaceInstruction(it.index, "nop") }
            val warned = PatchLogCapture.warnings { revealSpoilersPatch.execute(context) }
            assertTrue("${build.name}: $warned", warned.any { it.endsWith("goes on without showing view-once and timed media unblurred.") })
            assertEquals("${build.name}: nothing loads through the runtime", false, method.controlBody().any { it.controlRef() == LOADS_PHOTO })
        }
    }

    @Test fun `a moved blur check costs only the timed media switch`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val check = context.resolveTimedBlur().sites.last()
            check.method.replaceInstruction(check.index + 1, "nop")
            val warned = PatchLogCapture.warnings { revealSpoilersPatch.execute(context) }
            assertTrue("${build.name}: $warned", warned.any { it.endsWith("goes on without showing view-once and timed media unblurred.") })
            fun status(name: String) = (context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == name }.controlBody().first() as WideLiteralInstruction).wideLiteral
            assertEquals(build.name, 1L, status("revealSpoilers"))
            assertEquals(build.name, 0L, status("revealTimedMedia"))
            assertEquals("${build.name}: nothing asks the runtime about the blur", false, hosts(build).flatMap { context.tgMutableClassDefBy(it.type).methods }
                .any { m -> m.controlBody().any { it.controlRef() == "$SPOILERS->blurred(Ljava/lang/Object;)Z" } })
            val preview = context.tgMutableClassDefBy(SPOILERS).methods.single { it.origName == "timedPreview" }.controlBody()
            assertEquals("${build.name}: the switch stays without effect", listOf(Opcode.CONST_4, Opcode.RETURN), preview.map { it.opcode })
        }
    }

    @Test fun `the media checks and text covers are the reviewed ones`() {
        // Reviewed 2026-10-06: chat bubbles, the chat list, shared media, the reply and edit previews
        // and the photo strip draw media; sending, retrying and notifications ask Telegram. Text is
        // covered in messages, the chat list, replies, quotes, Instant View and the composer, which
        // keeps its cover. A new caller fails here so it gets the same review.
        // Reviewed 2026-11-07 for 13.2: two helpers built around a chat bubble (each takes the
        // ChatMessageCell it draws for) now draw part of its media, and the bubble keeps 13 of its 14.
        for (build in Fixtures.declaredBuilds()) {
            val methods = hosts(build).flatMap { it.methods }
            val checks = methods.filter { m -> m.controlBody().any { it.controlRef() == HAS_MEDIA_SPOILERS } }
            assertEquals("${build.name}: media checks ${checks.map { key(it) }}", 29, checks.size)
            val covers = FixtureDex.classesWhere(build, { true }) { m -> m.controlBody().any { it.controlRef()?.endsWith(CORE) == true } }
                .flatMap { it.methods }.count { m -> m.controlBody().any { it.controlRef()?.endsWith(CORE) == true } }
            assertEquals("${build.name}: text covers", 7, covers)
        }
    }

    @Test fun `a changed check or runtime refuses before any method changes`() {
        for (build in Fixtures.declaredBuilds()) {
            val mutations: List<Pair<String, (BytecodePatchContext, RevealSpoilersSite) -> Unit>> = listOf(
                // In the build's own names: 13.2's table refuses a member the class doesn't have, and this one is made up.
                "the media check reads something new" to { c, _ -> c.tgMutableClassDefBy(MESSAGE_OBJECT).methods.single { it.origString() == HAS_MEDIA_SPOILERS }
                    .let { m -> m.rawReplaceInstruction(0, "iget-boolean v0, v1, ${m.definingClass}->hushNew:Z") } },
                "a drawing class sends a spoiler" to { _, s -> s.media.first().method.addInstruction(0, "iput-boolean v0, v0, $SEND_PARAMS->hasMediaSpoilers:Z") },
                "the answer isn't read" to { _, s -> s.media.first().let { it.method.replaceInstruction(it.index + 1, "nop") } },
                "no reveal check" to { c, _ -> c.tgMutableClassDefBy(TEXT_BLOCKS).methods.forEach { m ->
                    m.controlBody().withIndex().filter { it.value.controlRef() == "$MESSAGE_OBJECT->isSpoilersRevealed:Z" }.forEach { m.replaceInstruction(it.index, "nop") } } },
                "text cover not static" to { _, s -> s.textCovers.accessFlags = s.textCovers.accessFlags and AccessFlags.STATIC.value.inv() },
                "span check private" to { c, s -> val m = c.tgMutableClassDefBy(s.span.definingClass).methods.single { it.origName == s.span.origName && it.parameterTypes.isEmpty() }
                    m.accessFlags = m.accessFlags and AccessFlags.PUBLIC.value.inv() or AccessFlags.PRIVATE.value },
                "view-once check private" to { c, _ -> val m = c.tgMutableClassDefBy(MESSAGE_OBJECT).methods.single { it.origString() == "$MESSAGE_OBJECT->needDrawBluredPreview()Z" }
                    m.accessFlags = m.accessFlags and AccessFlags.PUBLIC.value.inv() or AccessFlags.PRIVATE.value },
                "missing build flag" to { c, _ -> c.tgMutableClassDefBy(SETTINGS_STATUS).methods.removeAll { it.origName == "revealSpoilers" } },
                "private media hook" to { c, _ -> val h = c.tgMutableClassDefBy(SPOILERS).methods.single { it.origName == "mediaCovered" }
                    h.accessFlags = h.accessFlags and AccessFlags.PUBLIC.value.inv() or AccessFlags.PRIVATE.value },
                "missing kept stub" to { c, _ -> c.tgMutableClassDefBy(SPOILERS).methods.removeAll { it.origName == "keptCovered" } },
                "missing blur hook" to { c, _ -> c.tgMutableClassDefBy(SPOILERS).methods.removeAll { it.origName == "blurred" } },
                "missing timed stub" to { c, _ -> c.tgMutableClassDefBy(SPOILERS).methods.removeAll { it.origName == "timedPreview" } },
                "missing photo hook" to { c, _ -> c.tgMutableClassDefBy(SPOILERS).methods.removeAll { it.origName == "loadsPhoto" } },
                "missing photo stub" to { c, _ -> c.tgMutableClassDefBy(SPOILERS).methods.removeAll { it.origName == "stockLoadsPhoto" } },
                "missing timed build flag" to { c, _ -> c.tgMutableClassDefBy(SETTINGS_STATUS).methods.removeAll { it.origName == "revealTimedMedia" } },
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
        .filter { c.tgClassDefByOrNull(it) != null }.associateWith { type -> c.tgMutableClassDefBy(type).let { cls ->
            listOf(cls.accessFlags, cls.methods.map { key(it) to it.state() }) } }
    private fun hostState(build: File, c: BytecodePatchContext, except: Set<String>) = hosts(build)
        .flatMap { c.tgMutableClassDefBy(it.type).methods }.filter { key(it) !in except }.associate { key(it) to it.state() }

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
    private fun Instruction.operand() = listOf(opcode, namedRegisters(), origRef(),
        (this as? WideLiteralInstruction)?.wideLiteral)
    private fun key(m: Method) = "${m.definingClass}->${m.name}(${m.parameterTypes.joinToString("")})${m.returnType}"

    companion object {
        private val HOSTS = mutableMapOf<String, SoftReference<List<ClassDef>>>()
        @AfterClass @JvmStatic fun releaseFixtures() { HOSTS.clear() }
    }
}
