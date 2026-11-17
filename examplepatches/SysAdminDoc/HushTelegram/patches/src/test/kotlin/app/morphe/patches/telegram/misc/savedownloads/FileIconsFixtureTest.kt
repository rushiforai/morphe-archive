/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.savedownloads

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.telegram.misc.downloadspeed.LOAD_OPERATION
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.util.namedRegisters
import app.morphe.util.names.addInstructionsWithLabels
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origType
import app.morphe.util.names.replaceInstruction
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Assert.fail
import org.junit.Test

private val fileIconExtras = HashMap<String, Set<String>>()

/**
 * The classes the file icon resolvers read on [build]: Shared media's file cell (the one class
 * that loads its thumbnail's blurred filter), every class with a getRadialProgress, the chat
 * message cell among them, RadialProgress2 with the classes of its fields, and each one's
 * Telegram superclasses.
 */
internal fun fileIconHosts(build: File): Set<String> = synchronized(fileIconExtras) {
    fileIconExtras.getOrPut(build.path) {
        val cells = FixtureDex.classesWhere(build, { dex -> dex.stringSection.any { it == ICONS_SHARED_FILTER || it == "getRadialProgress" } }) { m ->
            m.name == "getRadialProgress" || m.implementation?.instructions?.any { it.controlString() == ICONS_SHARED_FILTER } == true
        }
        val radial = FixtureDex.classes(build, setOf(ICONS_RADIAL)).values
        val types = mutableSetOf(ICONS_RADIAL)
        types += cells.map { it.type }
        var next = (cells + radial).mapNotNull { it.superclass }.toSet() + radial.flatMap { c -> c.fields.map { it.type } }
        while (true) {
            val wanted = next.filter { it.startsWith("Lorg/telegram/") && it !in types }.toSet()
            if (wanted.isEmpty()) break
            types += wanted
            next = FixtureDex.classes(build, wanted).values.mapNotNull { it.superclass }.toSet()
        }
        types
    }
}

/** Where Shared media and the chat bubble show a file's icon, on both declared builds. */
class FileIconsFixtureTest {
    private val hosts = setOf(IMAGE_LOADER, FILE_LOADER, MESSAGE_OBJECT, TL_MESSAGE, DOCUMENT, DIALOG_OBJECT, MESSAGES_CONTROLLER,
        MESSAGES_STORAGE, GALLERY_MEDIA_CONTROLLER, ANDROID_UTILITIES, LOAD_OPERATION)

    /** A build's slice with the two cells' dex names. */
    private class Slice(val context: BytecodePatchContext, val shared: String, val chat: String)

    private fun slice(build: File): Slice {
        val host = FixtureDex.classes(build, hosts + downloadHosts(build)).values.map(ImmutableClassDef::of)
        assertTrue("${build.name}: Telegram's download classes", host.map { it.origType }.containsAll(hosts))
        val shared = host.single { c -> c.methods.any { m -> m.controlBody().any { it.controlString() == ICONS_SHARED_FILTER } } }.type
        val chat = host.single { c -> c.methods.any { it.name == "getRadialProgress" && it.parameterTypes.isEmpty() && it.returnType == ICONS_RADIAL } }.type
        return Slice(PatchContexts.of(ExtensionDex.classes() + host), shared, chat)
    }

    private fun kind(opcode: Opcode) = if (opcode == Opcode.GOTO_16 || opcode == Opcode.GOTO_32) Opcode.GOTO else opcode
    private fun Instruction.shape() = listOf(kind(opcode), namedRegisters(), controlRef())
    private fun List<Instruction>.shapes() = filter { it.opcode != Opcode.NOP }.map { it.shape() }

    private fun BytecodePatchContext.flag(name: String) = (tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == name }
        .controlBody().first() as WideLiteralInstruction).wideLiteral

    private fun BytecodePatchContext.stub(name: String) = tgMutableClassDefBy(FILE_ICONS).methods.single { it.origName == name }.controlBody()

    private fun MutableMethod.key() = "$name(${parameterTypes.joinToString("")})$returnType"

    /** Every method of [cell] that has code, by its dex signature. */
    private fun BytecodePatchContext.methodsOf(cell: String) = tgMutableClassDefBy(cell).methods.filter { it.implementation != null }
        .associateBy { it.key() }

    private fun BytecodePatchContext.bodies(cell: String) = methodsOf(cell).mapValues { (_, m) -> ImmutableMethod.of(m).controlBody() }

    /** Shared media's bind method, public (MessageObject, boolean). */
    private fun BytecodePatchContext.bind(cell: String) = methodsOf(cell).values.single {
        !AccessFlags.STATIC.isSet(it.accessFlags) && it.origParameterTypes == listOf(MESSAGE_OBJECT, "Z") && it.returnType == "V"
    }

    /** The chat cell's (Canvas) method that starts by reading its message and draws the file circle. */
    private fun BytecodePatchContext.drawing(cell: String) = methodsOf(cell).values.single { m ->
        val body = m.controlBody()
        m.origParameterTypes == listOf("Landroid/graphics/Canvas;") && body.firstOrNull()?.controlField()?.origType == MESSAGE_OBJECT &&
            body.any { it.controlRef() == ICONS_RADIAL_DRAW }
    }

    @Test fun `a file's icon in Shared media and in chats goes past the extension, and nothing else in either cell changes`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val slice = slice(build)
            val context = slice.context
            assertEquals("$name: Shared media", null, context.resolveSharedFileIcons().missing)
            assertEquals("$name: chats", null, context.resolveChatFileIcons().missing)
            val stock = context.bodies(slice.shared) + context.bodies(slice.chat).mapKeys { "chat ${it.key}" }
            val bind = context.bind(slice.shared)
            val drawing = context.drawing(slice.chat)

            assertEquals(emptyList<String>(), PatchLogCapture.warnings { saveDownloadsPatch.execute(context) })

            val after = context.methodsOf(slice.shared).mapValues { it.value.controlBody() } +
                context.methodsOf(slice.chat).map { (key, m) -> "chat $key" to m.controlBody() }
            val hooks = setOf(FILE_ICONS_SHARED_HOOK, FILE_ICONS_BUBBLE_HOOK)
            val hooked = after.filterValues { body -> body.any { it.controlRef() in hooks } }
            assertEquals(name, setOf(bind.key(), "chat ${drawing.key()}"), hooked.keys)
            for ((key, body) in after) if (key !in hooked) assertEquals("$name: $key", stock.getValue(key).shapes(), body.shapes())

            // Shared media: the icon Telegram picks from the file's name goes to the extension with the same registers.
            val before = stock.getValue(bind.key())
            val shared = after.getValue(bind.key())
            val site = shared.indices.single { shared[it].controlRef() == FILE_ICONS_SHARED_HOOK }
            assertEquals(name, before.size, shared.size)
            assertEquals(name, ICONS_SET_IMAGE, before[site].controlRef())
            assertEquals(name, Opcode.MOVE_RESULT, before[site - 1].opcode)
            assertEquals(name, Opcode.INVOKE_STATIC, before[site - 2].opcode)
            assertTrue(name, shared[site].opcode == Opcode.INVOKE_STATIC || shared[site].opcode == Opcode.INVOKE_STATIC_RANGE)
            assertEquals(name, before[site].namedRegisters(), shared[site].namedRegisters())
            assertEquals(name, before.filterIndexed { i, _ -> i != site }.shapes(), shared.filterIndexed { i, _ -> i != site }.shapes())

            // Chats: the extension draws right after the cell's own file circle, handed the circle and the canvas.
            val stockDrawing = stock.getValue("chat ${drawing.key()}")
            val drawn = after.getValue("chat ${drawing.key()}")
            val hook = drawn.indices.single { drawn[it].controlRef() == FILE_ICONS_BUBBLE_HOOK }
            val draw = stockDrawing.indexOfFirst { it.controlRef() == ICONS_RADIAL_DRAW }
            assertEquals(name, ICONS_RADIAL_DRAW, drawn[hook - 1].controlRef())
            assertEquals(name, stockDrawing[draw].namedRegisters(), drawn[hook].namedRegisters())
            assertEquals(name, listOf(Opcode.INVOKE_STATIC), listOf(drawn[hook].opcode))
            assertEquals(name, stockDrawing.take(draw + 1).shapes(), drawn.take(hook).shapes())
            assertEquals(name, stockDrawing.shapes(), drawn.filterIndexed { i, _ -> i != hook }.shapes())

            // The stubs read Telegram's own fields and checks, and none of the extension's stand-ins.
            for (stub in listOf("sharedMessage", "sharedLabel", "cellMessage", "progressIcon", "progressParent", "progressRect",
                "document", "attachPath", "cachePath", "documentId", "hasThumb", "fileName", "mime")) {
                val refs = context.stub(stub).mapNotNull { it.controlRef() }
                assertTrue("$name: $stub $refs", refs.none { it.startsWith("Lapp/hushtelegram/") })
            }
            fun reads(stub: String) = context.stub(stub).filter { it.opcode == Opcode.IGET_OBJECT || it.opcode == Opcode.IGET }
                .map { it.controlField()!! }
            assertEquals(name, listOf(slice.shared to MESSAGE_OBJECT), reads("sharedMessage").map { it.definingClass to it.origType })
            assertEquals(name, listOf(slice.shared to "Landroid/widget/TextView;"), reads("sharedLabel").map { it.definingClass to it.type })
            assertEquals(name, listOf(slice.chat to MESSAGE_OBJECT), reads("cellMessage").map { it.definingClass to it.origType })
            assertEquals(name, listOf(ICONS_RADIAL to "Landroid/view/View;"), reads("progressParent").map { it.definingClass to it.type })
            assertEquals(name, listOf(ICONS_RADIAL to "Landroid/graphics/RectF;"), reads("progressRect").map { it.definingClass to it.type })
            val icon = reads("progressIcon")
            assertEquals(name, listOf(ICONS_RADIAL, icon[0].type), icon.map { it.definingClass })
            assertEquals(name, "I", icon[1].type)
            assertTrue(name, context.stub("progressIcon").any { (it as? NarrowLiteralInstruction)?.narrowLiteral == -1 })
            assertTrue(name, GET_DOCUMENT in context.stub("document").mapNotNull { it.controlRef() })
            assertEquals(name, listOf(MESSAGE_OWNER, ICONS_ATTACH_PATH), context.stub("attachPath").mapNotNull { it.controlRef() }.filter { "->" in it })
            assertEquals(name, listOf(MESSAGE_OWNER, ICONS_PATH_TO_MESSAGE), context.stub("cachePath").mapNotNull { it.controlRef() }.filter { "->" in it })
            assertEquals(name, listOf(ICONS_DOCUMENT_ID), context.stub("documentId").mapNotNull { it.controlRef() }.filter { "->" in it })
            assertEquals(name, listOf(ICONS_HAS_THUMB), context.stub("hasThumb").mapNotNull { it.controlRef() }.filter { "->" in it })
            assertEquals(name, listOf(DOCUMENT_NAME), context.stub("fileName").mapNotNull { it.controlRef() }.filter { "->" in it })
            assertEquals(name, listOf(ICONS_MIME), context.stub("mime").mapNotNull { it.controlRef() }.filter { "->" in it })
            assertEquals(name, 1L, context.flag("fileIconsChat"))
            assertEquals(name, 1L, context.flag("fileIconsShared"))
            assertEquals(name, 1L, context.flag("saveDownloads"))
        }
    }

    @Test fun `changed file cells keep Telegram's icons and Save downloaded files goes on`() {
        val build = Fixtures.declaredBuilds().first()
        val shared = "fileIconsShared" to "The patch goes on without file icons in Shared media."
        val chats = "fileIconsChat" to "The patch goes on without file icons in chats."
        val shapes = listOf<Triple<Pair<String, String>, String, (Slice) -> Unit>>(
            Triple(shared, "Shared media's file icon is missing or ambiguous") { s: Slice ->
                val bind = s.context.bind(s.shared)
                bind.replaceInstruction(bind.controlBody().indexOfFirst { it.controlRef() == ICONS_SET_IMAGE }, "nop")
            },
            // A path to the icon that skips storing the message would show the last file's picture.
            Triple(shared, "the file cell's message is stored after its icon") { s: Slice ->
                val bind = s.context.bind(s.shared)
                val site = bind.controlBody().indexOfFirst { it.controlRef() == ICONS_SET_IMAGE }
                bind.addInstructionsWithLabels(0, "if-eqz p1, :hush_skip", ExternalLabel("hush_skip", bind.getInstruction(site - 2)))
            },
            Triple(chats, "the chat cell no longer draws its own file circle first") { s: Slice ->
                val drawing = s.context.drawing(s.chat)
                drawing.replaceInstruction(drawing.controlBody().indexOfFirst { it.controlRef() == ICONS_RADIAL_DRAW }, "nop")
            },
            Triple(chats, "something jumps right past the chat cell's file circle") { s: Slice ->
                val drawing = s.context.drawing(s.chat)
                val draw = drawing.controlBody().indexOfFirst { it.controlRef() == ICONS_RADIAL_DRAW }
                drawing.addInstructionsWithLabels(1, "if-eqz p1, :hush_skip", ExternalLabel("hush_skip", drawing.getInstruction(draw + 1)))
            },
            Triple(chats, "RadialProgress2's setIcon is missing or ambiguous") { s: Slice ->
                s.context.tgMutableClassDefBy(ICONS_RADIAL).methods.removeIf { it.origName == "setIcon" }
            },
        )
        for ((part, why, change) in shapes) {
            val (flag, goesOn) = part
            val slice = slice(build)
            val context = slice.context
            change(slice)
            val cell = if (flag == "fileIconsShared") slice.shared else slice.chat
            val untouched = context.bodies(cell).mapValues { it.value.shapes() }
            val warnings = PatchLogCapture.warnings { saveDownloadsPatch.execute(context) }
            assertEquals(why, listOf("Save downloaded files: Local controls: $why (before editing). $goesOn"), warnings)
            assertEquals(why, untouched, context.methodsOf(cell).mapValues { it.value.controlBody().shapes() })
            assertEquals(why, 0L, context.flag(flag))
            assertEquals(why, 1L, context.flag(if (flag == "fileIconsShared") "fileIconsChat" else "fileIconsShared"))
            assertEquals(why, 1L, context.flag("saveDownloads"))
        }
    }

    @Test fun `an extension without one of the file icon entries stops the patch before anything changes`() {
        val build = Fixtures.declaredBuilds().first()
        for (entry in listOf("sharedIcon", "bubble", "progressIcon", "cachePath")) {
            val context = slice(build).context
            context.tgMutableClassDefBy(FILE_ICONS).methods.removeIf { it.origName == entry }
            try {
                context.requireFileIconsRuntime()
                fail("$entry: no refusal")
            } catch (refused: PatchException) {
                assertEquals(entry, "Local controls: $entry runtime hook is missing or ambiguous (before editing)", refused.message)
            }
        }
    }
}
