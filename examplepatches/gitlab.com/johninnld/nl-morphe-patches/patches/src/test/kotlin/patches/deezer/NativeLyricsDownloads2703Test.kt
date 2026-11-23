package patches.deezer

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import java.io.File
import org.junit.Assert.*
import org.junit.Assume.assumeNotNull
import org.junit.Test

class NativeLyricsDownloads2703Test {
    private fun original(owner: String, name: String, parameters: List<String>): MutableMethod {
        val path = System.getenv("DEEZER_ORIGINAL_2703_APK")
        assumeNotNull(path)
        val dex = DexFileFactory.loadDexContainer(File(path!!), Opcodes.getDefault())
        val cls = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }.single { it.type == owner }
        return MutableMethod(cls.methods.single { it.name == name && it.parameterTypes.map(CharSequence::toString) == parameters })
    }

    @Test fun bothNativeLyricsClicksKeepEveryOtherInstructionAndGuard() {
        for (target in lyricsClicks2703) {
            val method = original(target.owner, target.name, target.parameters)
            val before = method.instructions.toList()
            val index = openNativeLyrics2703(method)
            val after = method.instructions.toList()
            assertEquals(before.size, after.size)
            assertEquals(Opcode.GOTO_16, after[index].opcode)
            for (i in before.indices.filter { it != index }) assertSame(before[i], after[i])
            assertBranchBoundaries(method)
            assertTrue(runCatching { openNativeLyrics2703(method) }.exceptionOrNull() is IllegalStateException)
        }
    }

    @Test fun changedLyricsMarkerFailsBeforeMutation() {
        val target = lyricsClicks2703.first()
        val method = original(target.owner, target.name, target.parameters)
        method.replaceInstruction(target.featureIndex, "const-string v0, \"changed\"")
        val before = method.instructions.toList()
        assertTrue(runCatching { openNativeLyrics2703(method) }.exceptionOrNull() is IllegalStateException)
        method.instructions.forEachIndexed { i, instruction -> assertSame(before[i], instruction) }
    }

    @Test fun offerWrapperPreservesTheZeroLocalNativeGetterAndItsReceiver() {
        val method = original(OFFER_ENTRIES, "IllIlIlIIlIllIll", listOf("Ljava/lang/String;"))
        assertEquals(2, method.implementation!!.registerCount)
        val (wrapper, native) = wrapNativeOfferLookup(method)
        assertEquals(2, native.implementation!!.registerCount)
        assertEquals(method.instructions.map { it.opcode }, native.instructions.map { it.opcode })
        assertEquals(method.instructions.map { (it as? ReferenceInstruction)?.reference?.toString() },
            native.instructions.map { (it as? ReferenceInstruction)?.reference?.toString() })
        assertEquals(3, wrapper.implementation!!.registerCount)
        val fallback = wrapper.instructions.single { it.opcode == Opcode.INVOKE_DIRECT } as FiveRegisterInstruction
        assertEquals(1, fallback.registerC)
        assertEquals(2, fallback.registerD)
        assertEquals("$OFFER_ENTRIES->$NATIVE_OFFER_LOOKUP(Ljava/lang/String;)$OFFER_RESULT",
            (fallback as ReferenceInstruction).reference.toString())
        assertBranchBoundaries(wrapper)
        assertBranchBoundaries(native)
    }

    @Test fun downloadedMusicRemovesOnlyTheOfferAndUsesTheExistingNoBannerEdge() {
        val method = original("LlIIlIIllIIIllI;", "invokeSuspend", listOf("Ljava/lang/Object;"))
        val before = method.instructions.toList()
        val nativeTarget = (before[317] as BuilderOffsetInstruction).target
        hideDownloadedMusicOffer(method)
        val after = method.instructions.toList()
        assertEquals(before.size, after.size)
        before.indices.filter { it != 317 }.forEach { assertSame(before[it], after[it]) }
        assertSame(nativeTarget, (after[317] as BuilderOffsetInstruction).target)
        assertEquals(Opcode.GOTO_16, after[317].opcode)
        assertBranchBoundaries(method)
    }

    @Test fun changedDownloadedMusicOfferFailsBeforeMutation() {
        val method = original("LlIIlIIllIIIllI;", "invokeSuspend", listOf("Ljava/lang/Object;"))
        method.replaceInstruction(327, "const v4, 0x12345678")
        val before = method.instructions.toList()
        assertTrue(runCatching { hideDownloadedMusicOffer(method) }.exceptionOrNull() is IllegalStateException)
        method.instructions.forEachIndexed { i, instruction -> assertSame(before[i], instruction) }
    }

}
