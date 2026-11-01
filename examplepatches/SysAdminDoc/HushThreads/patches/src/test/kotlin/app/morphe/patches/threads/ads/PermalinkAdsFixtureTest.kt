/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.ads

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.threads.misc.extension.EXTENSION_PACKAGE
import app.morphe.util.ControlFlow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * Hide ads' hook for the ads under an opened post, on each declared build: the fetcher builds its
 * success result once, from the list it added each ad to, and the patch hands that list to the
 * extension right before the result is made.
 */
class PermalinkAdsFixtureTest {
    private val feedAds = "$EXTENSION_PACKAGE/ads/FeedAds;"
    private val useCase = "Lcom/instagram/barcelona/permalink/adsusecase/PermalinkAdsUseCase;"
    /** The result type each 453 build makes, by version code. */
    private val adResults = mapOf(
        "512308671" to "LX/4y1;",
        "512308673" to "LX/4y1;",
        "512308675" to "LX/4y1;",
        "512308676" to "LX/05Br;",
        "512308685" to "LX/04ZY;",
        "512308686" to "LX/4Zv;",
        "512308688" to "LX/4Zv;",
        "512308695" to "LX/05Cv;",
        "512308696" to "LX/4y1;",
        "512308697" to "LX/05Br;",
        "512308698" to "LX/4y1;",
    )

    @Test
    fun `each declared build builds the opened post's ad result once and the patch filters its list`() {
        for (build in Fixtures.declaredBuilds()) {
            PermalinkAdFetchFingerprint.clearMatch()
            val where = build.name
            val fetcher = fetcher(build)
            val stock = fetcher.methods.filter { it.asksForAds() }
            assertEquals("$where: fetcher methods asking $PERMALINK_ADS_PATH", 1, stock.size)
            val body = stock.single().instructions()
            val at = stock.single().permalinkAdResult()

            // Read off each 453 build apart from the patch: the loop adds each ad it reads to v6, the
            // size of what the server sent is read at 115 and 116, and the result is made at 117 and 118.
            val expectedResult = adResults.entries.single { build.name.contains("-${it.key}.") }.value
            assertEquals(where, 117, at.index)
            assertEquals(where, 6, at.list)
            assertEquals(where, expectedResult, at.result)
            assertTrue("$where: the loop adds each ad to v${at.list}", body.any {
                it.opcode == Opcode.INVOKE_VIRTUAL && it.referenceText() == "Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z" &&
                    (it as FiveRegisterInstruction).registerC == at.list
            })
            // The post's ad use case is the result's one reader, and it reads the list.
            val readers = FixtureDex.methodsWhere(build, { dex -> dex.typeSection.any { it.toString() == at.result } }) { method ->
                method.definingClass != at.result && method.definingClass != PERMALINK_AD_FETCHER &&
                    method.instructions().any { it.typeText() == at.result }
            }
            assertEquals("$where: readers of ${at.result}", listOf(useCase), readers.map { it.definingClass }.distinct())
            assertTrue("$where: the use case reads the result's list", readers.any { method ->
                method.instructions().any {
                    it.opcode == Opcode.IGET_OBJECT && ((it as ReferenceInstruction).reference as FieldReference)
                        .let { field -> field.definingClass == at.result && field.type == "Ljava/util/List;" }
                }
            })

            val context = PatchContexts.of(ExtensionDex.classes() + fetcher)
            permalinkAdsPatch.execute(context)
            val patchedMethod = fetch(context)
            val patched = patchedMethod.instructions()
            assertEquals("$where: two instructions added", body.size + 2, patched.size)
            val hook = patched[at.index]
            assertEquals(Opcode.INVOKE_STATIC_RANGE, hook.opcode)
            assertEquals("$feedAds->permalinkAds(Ljava/util/List;)Ljava/util/List;", hook.referenceText())
            assertEquals(at.list, (hook as RegisterRangeInstruction).startRegister)
            assertEquals(1, hook.registerCount)
            assertEquals(Opcode.MOVE_RESULT_OBJECT, patched[at.index + 1].opcode)
            assertEquals(at.list, (patched[at.index + 1] as OneRegisterInstruction).registerA)
            assertEquals(at.result, patched[at.index + 2].typeText())
            assertEquals(body.take(at.index).map { it.opcode }, patched.take(at.index).map { it.opcode })
            assertEquals(body.drop(at.index).map { it.opcode }, patched.drop(at.index + 2).map { it.opcode })
            // The loop's exit still lands on the size read, so every way to the result goes through the hook.
            val flow = ControlFlow.of(patchedMethod)
            val into = patched.indices.filter { from -> at.index in flow.normal[from] + flow.exceptional[from] }
            assertEquals(where, listOf(at.index - 1), into)
        }
    }

    @Test
    fun `a jump into the result or a second result is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val fetcher = fetcher(build)
            val stock = fetcher.methods.single { it.asksForAds() }
            val at = stock.permalinkAdResult()
            val made = (stock.instructions()[at.index] as OneRegisterInstruction).registerA
            val count = (stock.instructions()[at.index + 1] as FiveRegisterInstruction).registerE

            // A jump from the top straight to the new-instance would pass a hook put in front of it.
            PermalinkAdFetchFingerprint.clearMatch()
            var context = PatchContexts.of(ExtensionDex.classes() + fetcher)
            var method = fetch(context)
            method.addInstructionsWithLabels(0, "goto/32 :result", ExternalLabel("result", method.getInstruction(at.index)))
            var error = assertThrows(PatchException::class.java) { permalinkAdsPatch.execute(context) }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("not only from the instruction before it"))

            // A second result made the same way leaves the patch no single place to hook.
            PermalinkAdFetchFingerprint.clearMatch()
            context = PatchContexts.of(ExtensionDex.classes() + fetcher)
            method = fetch(context)
            method.addInstructions(
                0,
                """
                    new-instance v$made, ${at.result}
                    invoke-direct { v$made, v${at.list}, v$count }, ${at.result}-><init>(Ljava/util/List;I)V
                    return-object v$made
                """,
            )
            error = assertThrows(PatchException::class.java) { permalinkAdsPatch.execute(context) }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("found 2"))
        }
    }

    private fun fetcher(build: File): ClassDef =
        FixtureDex.classes(build, setOf(PERMALINK_AD_FETCHER)).getValue(PERMALINK_AD_FETCHER)

    private fun fetch(context: BytecodePatchContext): MutableMethod =
        context.mutableClassDefBy(PERMALINK_AD_FETCHER).methods.single { it.asksForAds() }

    private fun Method.asksForAds(): Boolean = instructions().any {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == PERMALINK_ADS_PATH
    }

    private fun Instruction.referenceText(): String = (this as ReferenceInstruction).reference.toString()

    private fun Instruction.typeText(): String? = ((this as? ReferenceInstruction)?.reference as? TypeReference)?.type

    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
}
