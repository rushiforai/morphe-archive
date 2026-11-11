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
import app.morphe.util.names.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Test
import app.morphe.util.names.origName
import app.morphe.util.names.tgMutableClassDefBy

/**
 * The classes whose run() a sliced download queue calls in place. Telegram 13.2 folded the queue's
 * count into that runnable, which R8 named; an older build's queue counts in a method of its own.
 */
internal fun queueRunnables(build: File, queue: ClassDef): Collection<ClassDef> {
    val runners = queue.methods.flatMap { it.implementation?.instructions?.toList() ?: emptyList() }
        .mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
        .filter { it.name == "run" && it.parameterTypes.isEmpty() && it.returnType == "V" && it.definingClass.startsWith("Lorg/telegram/messenger/") }
        .map { it.definingClass }.toSet() - queue.type
    return FixtureDex.classes(build, runners).values.map(ImmutableClassDef::of)
}

/** The download queues on both declared builds: FileLoader.loadFileInternal and where the queue counts its running files. */
class DownloadManagerFixtureTest {
    private val loader = "Lorg/telegram/messenger/FileLoader;"
    private val queue = "Lorg/telegram/messenger/FileLoaderPriorityQueue;"
    private val largeQueues = "Lorg/telegram/messenger/FileLoader;->largeFilesQueue:[Lorg/telegram/messenger/FileLoaderPriorityQueue;"

    private fun context(build: File): BytecodePatchContext {
        // The whole patch runs, so the uploader and the Data Saver hold's classes come too.
        val found = FixtureDex.classes(build, setOf(LOAD_OPERATION, DOWNLOAD_CONTROLLER, UPLOAD_OPERATION, loader, queue))
        val host = found.values.map(ImmutableClassDef::of)
        assertEquals("${build.name}: the download classes", 5, host.size)
        return PatchContexts.of(ExtensionDex.classes() + host + queueRunnables(build, found.getValue(queue)) + dataSaverClasses(build) +
            qualityClasses(build))
    }

    private fun Instruction.shape() = listOf(opcode, namedRegisters(), origRef())

    private fun List<Instruction>.code() = filter { it.opcode != Opcode.NOP }

    private fun BytecodePatchContext.flag(name: String) =
        (tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == name }.controlBody().first() as WideLiteralInstruction).wideLiteral

    private fun isGoto(instruction: Instruction) = instruction.opcode in setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)

    @Test fun `a new download picks the one queue and the queue runs one file, with every stock instruction kept`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            val plan = context.resolveDownloadManager()
            assertEquals("$name: nothing missing", null, plan.missing)
            val pick = plan.pick!!
            val count = plan.count!!
            val pickBefore = ImmutableMethod.of(pick).controlBody().code()
            val countBefore = ImmutableMethod.of(count).controlBody().code()
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { fasterDownloadsPatch.execute(context) })

            val pickAfter = pick.controlBody().code()
            assertEquals("$name: six instructions", pickBefore.size + 6, pickAfter.size)
            val at = pickAfter.indexOfFirst { it.controlRef() == "$DOWNLOAD_MANAGER->merge()I" }
            assertTrue("$name: the hook is there", at > 0)
            assertEquals(listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.IGET_OBJECT, Opcode.CONST_4, Opcode.AGET_OBJECT),
                pickAfter.subList(at, at + 6).map { it.opcode })
            assertEquals("$name: the large queues", largeQueues, pickAfter[at + 3].controlRef())
            // The way in from the large queue jumps to the hook, and a no goes on to the stock join.
            val all = pick.controlBody()
            val flow = ControlFlow.of(pick)
            val start = all.indexOf(pickAfter[at])
            val join = all.indexOf(pickAfter[at + 6])
            assertEquals("$name: a no skips to the label before the stock join", setOf(start + 3, join - 1), flow.normal[start + 2].toSet())
            assertEquals("$name: one jump lands on the hook", 1, all.indices.count { isGoto(all[it]) && start in flow.normal[it] })
            val kept = pickAfter.filterIndexed { i, _ -> i < at || i >= at + 6 }
            assertEquals("$name: stock kept", pickBefore.map { it.shape() }, kept.map { it.shape() })

            val countAfter = count.controlBody().code()
            assertEquals("$name: two instructions", countBefore.size + 2, countAfter.size)
            val limit = countAfter.indexOfFirst { it.controlRef() == "$DOWNLOAD_MANAGER->limit(I)I" }
            assertTrue("$name: the limit hook", limit > 0)
            assertEquals(Opcode.INVOKE_STATIC_RANGE, countAfter[limit].opcode)
            assertEquals(Opcode.MOVE_RESULT, countAfter[limit + 1].opcode)
            assertEquals(countAfter[limit].namedRegisters(), countAfter[limit + 1].namedRegisters())
            assertEquals("$name: stock kept", countBefore.map { it.shape() },
                countAfter.filterIndexed { i, _ -> i != limit && i != limit + 1 }.map { it.shape() })
            val body = count.controlBody()
            val countFlow = ControlFlow.of(count)
            val hook = body.indexOf(countAfter[limit])
            assertEquals("$name: the large way jumps to the limit hook", 1, body.indices.count { isGoto(body[it]) && hook in countFlow.normal[it] })
            assertEquals(1L, context.flag("downloadManager"))
        }
    }

    @Test fun `a changed queue pick or limit leaves the download manager out and faster downloads goes on`() {
        val build = Fixtures.declaredBuilds().first()
        val shapes = listOf<Pair<String, (BytecodePatchContext) -> Unit>>(
            "FileLoader.loadFileInternal no longer reads the small and the large queue once each" to { context ->
                val method = context.tgMutableClassDefBy(loader).methods.single { it.origName == "loadFileInternal" }
                val body = method.controlBody()
                method.replaceInstruction(body.indices.first { body[it].controlRef() == largeQueues }, "nop")
            },
            "the queue's limit is no longer read once for each queue" to { context ->
                val method = context.queueCounters(context.tgMutableClassDefBy(queue)).single()
                val body = method.controlBody()
                method.replaceInstruction(body.indices.first { body[it].controlRef()?.endsWith("->smallQueueMaxActiveOperations:I") == true }, "nop")
            },
        )
        for ((why, change) in shapes) {
            val context = context(build)
            change(context)
            val plan = context.resolveDownloadManager()
            assertNotNull(why, plan.missing)
            assertEquals(why, why, plan.missing)
            assertEquals(why, listOf("Faster downloads: $why. The patch goes on without the download manager."),
                PatchLogCapture.warnings { fasterDownloadsPatch.execute(context) })
            assertEquals(why, 0L, context.flag("downloadManager"))
            assertEquals(why, 1L, context.flag("fasterDownloads"))
        }
    }
}
