/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.downloadspeed

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.util.names.origRef
import app.morphe.util.names.addInstruction
import app.morphe.util.names.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Assert.fail
import org.junit.Test
import app.morphe.util.names.TelegramNames
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origReturnType
import app.morphe.util.names.tgMutableClassDefBy

private val queueStarters = FixtureDex.ClassCensus()

/**
 * The classes beyond DownloadController that the Data Saver hold edits: MediaController, whose next
 * song preload 13.2 folded canDownloadNextTrack into, and the class outside DownloadController that
 * reads the download queue's keys and pairs, the storage runnable 13.2 folded processDownloadObjects into.
 */
internal fun dataSaverClasses(build: File): Collection<ClassDef> {
    val player = FixtureDex.classes(build, setOf("Lorg/telegram/messenger/MediaController;")).values
    assertEquals("${build.name}: MediaController", 1, player.size)
    val starters = FixtureDex.classesWhere(build, queueStarters, { true }) { method ->
        val table = TelegramNames.tableOf(method)
        val keys = table.field(DOWNLOAD_CONTROLLER, "downloadQueueKeys", "Ljava/util/HashMap;")
        val pairs = table.field(DOWNLOAD_CONTROLLER, "downloadQueuePairs", "Ljava/util/HashMap;")
        val read = method.implementation?.instructions?.mapNotNull { instruction ->
            ((instruction as? ReferenceInstruction)?.reference as? FieldReference)?.let { it.definingClass to it.name }
        }?.toSet() ?: emptySet()
        method.definingClass != keys.owner && (keys.owner to keys.name) in read && (pairs.owner to pairs.name) in read
    }
    return (player + starters).map(ImmutableClassDef::of)
}

/** FileLoadOperation.updateParams on both declared builds, where Telegram picks a download's piece size. */
class FasterDownloadsFixtureTest {
    private fun context(build: File): BytecodePatchContext {
        val queue = "Lorg/telegram/messenger/FileLoaderPriorityQueue;"
        val found = FixtureDex.classes(build, setOf(LOAD_OPERATION, DOWNLOAD_CONTROLLER, UPLOAD_OPERATION, "Lorg/telegram/messenger/FileLoader;", queue))
        val host = found.values.map(ImmutableClassDef::of)
        assertEquals("${build.name}: FileLoadOperation, DownloadController, FileUploadOperation and the download queues", 5, host.size)
        return PatchContexts.of(ExtensionDex.classes() + host + queueRunnables(build, found.getValue(queue)) + dataSaverClasses(build))
    }

    private fun ClassDef.status(name: String) = methods.single { it.origName == name }.controlBody()

    private fun BytecodePatchContext.flag(name: String) =
        (tgMutableClassDefBy(SETTINGS_STATUS).status(name).first() as WideLiteralInstruction).wideLiteral

    private fun literal(after: List<Instruction>, size: Long) =
        after.indices.single { (after[it] as? WideLiteralInstruction)?.wideLiteral == size }

    private fun Instruction.shape() = listOf(opcode, namedRegisters(), origRef())

    @Test fun `the upload piece limit goes through the extension once and the rest of the uploader is untouched`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            val plan = context.resolveFasterUploads()
            val before = plan.method.controlBody().filter { it.opcode != Opcode.NOP }.map { it.shape() }
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { fasterDownloadsPatch.execute(context) })
            val after = plan.method.controlBody().filter { it.opcode != Opcode.NOP }
            assertEquals("$name: two instructions", before.size + 2, after.size)
            assertEquals(Opcode.INVOKE_STATIC_RANGE, after[plan.index].opcode)
            assertEquals(UPLOAD_HOOK, after[plan.index].controlRef())
            assertEquals(Opcode.MOVE_RESULT, after[plan.index + 1].opcode)
            assertEquals(UPLOAD_REQUESTS, after[plan.index + 2].controlRef())
            assertEquals("$name: stock code kept in order", before, (after.take(plan.index) + after.drop(plan.index + 2)).map { it.shape() })
            assertEquals(1L, context.flag("fasterUploads"))
            assertEquals(1, plan.method.controlBody().count { it.controlRef() == UPLOAD_HOOK })
        }
    }

    @Test fun `a changed upload sizing is refused for its own reason and downloads still patch`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val plan = context.resolveFasterUploads()
            val at = plan.method.controlBody().indexOfFirst { it.controlRef() == "Ljava/lang/Math;->max(II)I" }
            plan.method.replaceInstruction(at, "invoke-static {v2, v0}, Ljava/lang/Math;->min(II)I")
            val warnings = PatchLogCapture.warnings { fasterDownloadsPatch.execute(context) }
            assertTrue("${build.name}: $warnings", warnings.single().contains("upload piece limit is no longer sized from the piece size"))
            assertEquals(0L, context.flag("fasterUploads"))
            assertEquals(1L, context.flag("fasterDownloads"))
            assertEquals(0, plan.method.controlBody().count { it.controlRef() == UPLOAD_HOOK })
        }
    }

    @Test fun `the extension answers for the server's flag and the small-piece fallback still has the last word`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            val plan = context.resolveFasterDownloads()
            val old = ImmutableMethod.of(plan.method)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { fasterDownloadsPatch.execute(context) })

            val before = old.controlBody()
            val after = plan.method.controlBody()
            assertEquals("$name: two instructions", before.size + 2, after.size)
            val read = plan.read
            assertEquals(EXPERIMENTAL_PARAMS, after[read].controlRef())
            assertEquals(listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT, Opcode.IF_EQZ), after.subList(read + 1, read + 4).map { it.opcode })
            assertEquals("$DOWNLOAD_SPEED->fast(Z)Z", after[read + 1].controlRef())
            for (i in read + 1..read + 3) assertEquals("$name: $i", listOf(plan.register), after[i].namedRegisters())

            // A no still goes to the 128 KB tier, and forceSmallChunk still sends a yes there too.
            val flow = ControlFlow.of(plan.method)
            // 13.2 loads the 128 KB size once at the top and the tier only stores it.
            val small = flow.normal[read + 3].single { it != read + 4 }
            val big = literal(after, BIG_PIECE)
            assertEquals("$name: the stock branch", setOf(read + 4, small), flow.normal[read + 3].toSet())
            assertEquals(FORCE_SMALL_CHUNK, after[read + 4].controlRef())
            assertEquals("$name: the fallback", setOf(read + 6, small), flow.normal[read + 5].toSet())
            assertEquals("$name: a yes reaches the 512 KB tier", read + 6, big)
            assertEquals(CHUNK_SIZE, after[big + 1].controlRef())
            val store = if (after[small].opcode == Opcode.IPUT) small else small + 1
            assertEquals(CHUNK_SIZE, after[store].controlRef())
            val size = (after[store] as TwoRegisterInstruction).registerA
            val load = after.indices.single { after[it].opcode.setsRegister() && after[it].namedRegisters().firstOrNull() == size &&
                (after[it] as? WideLiteralInstruction)?.wideLiteral == SMALL_PIECE }
            assertTrue("$name: the size is loaded before the store", load < store)
            assertTrue("$name: the tier keeps its size", smallTier(after, flow, small))

            for (i in before.indices) {
                val j = if (i <= read) i else i + 2
                assertEquals("$name: stock $i", before[i].shape(), after[j].shape())
            }
            assertEquals(1L, context.flag("fasterDownloads"))
        }
    }

    @Test fun `a changed piece size choice or Data Saver runtime refuses before anything is edited`() {
        val build = Fixtures.declaredBuilds().first()
        val shapes = listOf<Pair<String, (BytecodePatchContext) -> Unit>>(
            "the server's flag no longer picks the piece size" to { context ->
                val plan = context.resolveFasterDownloads()
                plan.method.replaceInstruction(plan.read + 1, "nop")
            },
            "the server's big-piece flag is missing or ambiguous" to { context ->
                val plan = context.resolveFasterDownloads()
                plan.method.addInstruction(0, "iget-boolean v${plan.register}, v${plan.register}, $EXPERIMENTAL_PARAMS")
            },
            "Telegram's small-piece fallback no longer follows the server's flag" to { context ->
                val plan = context.resolveFasterDownloads()
                plan.method.replaceInstruction(plan.read + 3, "nop")
            },
            // The extension's own runtime refuses, since it ships with the patch.
            "holdMask runtime hook is missing or ambiguous" to { context ->
                context.tgMutableClassDefBy(DATA_SAVER).methods.removeAll { it.origName == "holdMask" }
            },
            "checkAgain runtime hook is missing or ambiguous" to { context ->
                context.tgMutableClassDefBy(DATA_SAVER).methods.removeAll { it.origName == "checkAgain" }
            },
        )
        for ((why, change) in shapes) {
            val context = context(build)
            change(context)
            val untouched = snapshot(context)
            try {
                fasterDownloadsPatch.execute(context)
                fail("$why: the patch went ahead")
            } catch (refused: PatchException) {
                assertTrue("$why: ${refused.message}", refused.message!!.contains(why))
            }
            assertEquals(why, untouched, snapshot(context))
            assertEquals(why, 0L, context.flag("fasterDownloads"))
            assertEquals(why, 0L, context.flag("dataSaverDownloads"))
        }
    }

    @Test fun `a changed Data Saver answer leaves the hold out and faster downloads goes on`() {
        val build = Fixtures.declaredBuilds().first()
        val shapes = listOf<Pair<String, (BytecodePatchContext) -> Unit>>(
            "DownloadController.canPreloadStories()Z no longer reads the network's download settings" to { context ->
                val method = context.tgMutableClassDefBy(DOWNLOAD_CONTROLLER).methods.single { it.origName == "canPreloadStories" }
                val body = method.controlBody()
                method.replaceInstruction(body.indices.single { body[it].controlRef() == NETWORK_TYPE_READ },
                    "invoke-static {}, Lorg/telegram/messenger/ApplicationLoader;->isNetworkOnline()Z")
            },
            "MediaController.checkIsNextMusicFileDownloaded(I)V no longer reads the network's download settings and loads the next song" to { context ->
                val method = context.tgMutableClassDefBy("Lorg/telegram/messenger/MediaController;").methods
                    .single { it.origName == "checkIsNextMusicFileDownloaded" }
                val body = method.controlBody()
                method.replaceInstruction(body.indices.single { body[it].controlRef() == NETWORK_TYPE_READ },
                    "invoke-static {}, Lorg/telegram/messenger/ApplicationLoader;->isNetworkOnline()Z")
            },
            // An answer the hold doesn't know would let automatic downloads around it.
            "DownloadController has answers the hold doesn't know (canPreloadChannelStories()Z)" to { context ->
                val controller = context.tgMutableClassDefBy(DOWNLOAD_CONTROLLER)
                val stories = controller.methods.single { it.origName == "canPreloadStories" }
                controller.methods.add(ImmutableMethod(stories.definingClass, "canPreloadChannelStories", stories.parameters,
                    stories.returnType, stories.accessFlags, stories.annotations, stories.hiddenApiRestrictions,
                    ImmutableMethod.of(stories).implementation).toMutable())
            },
            "DownloadController.checkAutodownloadSettings()V no longer reads the download mask" to { context ->
                val method = context.tgMutableClassDefBy(DOWNLOAD_CONTROLLER).methods.single { it.origName == "checkAutodownloadSettings" }
                val body = method.controlBody()
                val at = body.indices.single { body[it].controlRef() == CURRENT_MASK }
                method.replaceInstruction(at, "invoke-virtual {v${body[at].namedRegisters().single()}}, $DOWNLOAD_CONTROLLER->getAutodownloadMaskAll()I")
            },
        )
        for ((why, change) in shapes) {
            val context = context(build)
            change(context)
            val controller = controllerSnapshot(context)
            val plan = context.resolveFasterDownloads()
            assertEquals(why, listOf("Faster downloads: $why. The patch goes on without holding automatic downloads on Data Saver."),
                PatchLogCapture.warnings { fasterDownloadsPatch.execute(context) })
            assertEquals(why, controller, controllerSnapshot(context))
            assertEquals(why, "$DOWNLOAD_SPEED->fast(Z)Z", plan.method.controlBody()[plan.read + 1].controlRef())
            assertEquals(why, listOf(Opcode.RETURN_VOID), checkAgain(context).map { it.opcode })
            assertEquals(why, 1L, context.flag("fasterDownloads"))
            assertEquals(why, 0L, context.flag("dataSaverDownloads"))
        }
    }

    /** Every method body the patch may edit, as opcodes and registers. */
    private fun snapshot(context: BytecodePatchContext) = listOf(LOAD_OPERATION, DOWNLOAD_CONTROLLER, DATA_SAVER)
        .flatMap { type -> context.tgMutableClassDefBy(type).methods.filter { it.implementation != null }
            .map { m -> "$type->${m.name}" to m.controlBody().map { it.opcode to it.namedRegisters() } } }

    /** Each DownloadController method by its source signature, as opcodes, registers and references. */
    private fun controllerSnapshot(context: BytecodePatchContext) = context.tgMutableClassDefBy(DOWNLOAD_CONTROLLER).methods
        .filter { it.implementation != null }
        .associate { m -> "${m.origName}(${m.origParameterTypes.joinToString("")})${m.origReturnType}" to m.controlBody().map { it.shape() } }

    private fun checkAgain(context: BytecodePatchContext) = context.tgMutableClassDefBy(DATA_SAVER).methods.single { it.origName == "checkAgain" }.controlBody()

    @Test fun `automatic downloads and the download mask ask the Data Saver hold first, and its check is Telegram's own`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            val saver = context.resolveDataSaverDownloads()
            assertEquals("$name: nothing missing", null, saver.missing)
            assertEquals("$name: every answer", AutoDownloadAnswer.entries.toSet(), saver.holds.keys)
            val stock = saver.holds.mapValues { ImmutableMethod.of(it.value.method).controlBody() }
            val signatures = AutoDownloadAnswer.entries.filter { it.owner == DOWNLOAD_CONTROLLER }.map { it.signature }.toSet()
            val others = controllerSnapshot(context).filterKeys { it !in signatures }
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { fasterDownloadsPatch.execute(context) })

            for ((answer, site) in saver.holds) {
                val where = "$name: ${answer.label}"
                val method = site.method
                val at = site.at
                val before = stock.getValue(answer)
                val after = method.controlBody()
                val gate = if (answer.void) 4 else 5
                // Counted past the alignment nop a switch payload may gain or lose when code goes in.
                assertEquals(where, before.count { it.opcode != Opcode.NOP } + gate, after.count { it.opcode != Opcode.NOP })
                val call = if (answer == AutoDownloadAnswer.MASK) Opcode.INVOKE_STATIC_RANGE else Opcode.INVOKE_STATIC
                assertEquals(where, listOf(call, Opcode.MOVE_RESULT, Opcode.IF_EQZ), after.subList(at, at + 3).map { it.opcode })
                if (answer == AutoDownloadAnswer.MASK) {
                    // The mask hands over its controller, so the runtime can run Telegram's check on it later.
                    // A range call, so p0 is reached past v15 too.
                    assertEquals(where, "$DATA_SAVER->holdMask(Ljava/lang/Object;)Z", after[at].controlRef())
                    assertEquals(where, listOf(method.implementation!!.registerCount - 1), after[at].namedRegisters())
                } else {
                    assertEquals(where, "$DATA_SAVER->hold()Z", after[at].controlRef())
                }
                val held = after[at + 1].namedRegisters()
                assertEquals(where, held, after[at + 2].namedRegisters())
                if (answer.void) {
                    assertEquals(where, Opcode.RETURN_VOID, after[at + 3].opcode)
                } else {
                    assertEquals(where, Opcode.CONST_4, after[at + 3].opcode)
                    assertEquals(where, 0, (after[at + 3] as NarrowLiteralInstruction).narrowLiteral)
                    assertEquals(where, Opcode.RETURN, after[at + 4].opcode)
                    assertEquals(where, held, after[at + 4].namedRegisters())
                }
                val flow = ControlFlow.of(method)
                // A no carries on into Telegram's own answer, untouched.
                assertEquals(where, setOf(at + 3, at + gate), flow.normal[at + 2].toSet())
                assertEquals("$where: the stock code", before.filter { it.opcode != Opcode.NOP }.map { it.shape() },
                    after.filterIndexed { i, _ -> i !in at until at + gate }.filter { it.opcode != Opcode.NOP }.map { it.shape() })
                if (at > 0) {
                    // The queue's case: its switch now lands on the hold, and the hold's register is
                    // written by the case before anything reads it.
                    assertTrue(where, (0 until at).any { at in flow.normal[it] && after[it].opcode in setOf(Opcode.PACKED_SWITCH, Opcode.SPARSE_SWITCH) })
                    assertTrue(where, (0 until at + gate).none { at + gate in flow.normal[it] && it != at + 2 })
                    assertEquals(where, QUEUE_KEYS, after.drop(at + gate).first { it.controlRef()?.startsWith(DOWNLOAD_CONTROLLER) == true &&
                        it.opcode == Opcode.IGET_OBJECT }.controlRef())
                    val stretch = after.subList(at + gate, after.size)
                    val write = stretch.indexOfFirst { it.opcode.setsRegister() && it.namedRegisters().firstOrNull() == held.single() }
                    val read = stretch.indexOfFirst { held.single() in it.namedRegisters() }
                    assertEquals(where, write, read)
                }
            }
            // The rest of DownloadController, its network change check among it, stays Telegram's.
            assertEquals(name, others, controllerSnapshot(context).filterKeys { it !in signatures })

            val stub = checkAgain(context)
            assertEquals(name, listOf(Opcode.CHECK_CAST, Opcode.INVOKE_VIRTUAL, Opcode.RETURN_VOID), stub.map { it.opcode })
            assertEquals(name, DOWNLOAD_CONTROLLER, stub[0].controlRef())
            assertEquals(name, CHECK_SETTINGS, stub[1].controlRef())
            assertEquals(name, stub[0].namedRegisters(), stub[1].namedRegisters())
            assertEquals(1L, context.flag("dataSaverDownloads"))
        }
    }
}

private const val NETWORK_TYPE_READ = "Lorg/telegram/messenger/ApplicationLoader;->getAutodownloadNetworkType()I"
