/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.patches.pinedrama.misc.translation

import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import org.junit.Assert.assertThrows
import org.junit.Test

private const val DNT_EXTENSION = "Lapp/morphe/extension/pinedrama/translation/DoNotAutoTranslate;"

/**
 * What Don't auto translate hooks (#121), held to each declared build: the translation service
 * reads PineDrama's Don't translate list at exactly seven places, each as a no-argument call
 * returning String[] with its result moved into a register a plain invoke can name, and the hook
 * lands right after that move and leaves everything else as PineDrama wrote it.
 */
class DoNotAutoTranslateAnchorsTest {

    @Test
    fun `a read of the list with no move after it is refused`() {
        val getter = ImmutableMethodReference(
            "Lfixture/Controller;", "getSelectedDoNotTranslateLanguageCodes", emptyList(), "[Ljava/lang/String;",
        )
        val broken = ImmutableMethod(
            "Lfixture/Service;", "read", emptyList(), "V", 1, null, null,
            ImmutableMethodImplementation(
                1,
                listOf(
                    ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 1, 0, 0, 0, 0, 0, getter),
                    ImmutableInstruction10x(Opcode.RETURN_VOID),
                ),
                null, null,
            ),
        )
        assertThrows(PatchException::class.java) { broken.doNotTranslateReads() }
    }
}
