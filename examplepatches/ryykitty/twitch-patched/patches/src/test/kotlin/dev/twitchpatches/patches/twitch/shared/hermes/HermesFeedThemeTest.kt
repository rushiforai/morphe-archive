package dev.twitchpatches.patches.twitch.shared.hermes

import org.junit.Assert.*
import org.junit.Test

class HermesFeedThemeTest {
    private val strings = listOf("useTheme", "darkTheme")
    private fun code(parent: Int = 47) = listOf(
        HermesInstruction("GetByIdShort", listOf(12, 12, 0, 0)),
        HermesInstruction("Call1", listOf(47, 12, 5)),
        HermesInstruction("Mov", listOf(17, parent)),
        HermesInstruction("JmpFalse", listOf(18, 57)),
        HermesInstruction("GetByIndex", listOf(27, 13, 37)),
        HermesInstruction("Call2", listOf(27, 18, 5, 27)),
        HermesInstruction("GetById", listOf(17, 27, 111, 1))
    )

    @Test fun retainsInstructionWidthAndUsesDerivedParentThemeRegister() {
        val (index, bytes) = HermesFeedTheme.replacement(code(), strings)
        assertEquals(6, index)
        assertEquals(HermesOpcodes.size(code()[index]), bytes.size)
        assertEquals(listOf(HermesInstruction("Mov", listOf(17, 47)),
            HermesInstruction("Mov", listOf(17, 17))), HermesOpcodes.decode(bytes, 0, bytes.size))
    }

    @Test fun rejectsUnrelatedSourceRegister() {
        assertThrows(IllegalArgumentException::class.java) { HermesFeedTheme.replacement(code(45), strings) }
    }

    @Test fun rejectsAmbiguousDarkThemeReads() {
        assertThrows(IllegalArgumentException::class.java) { HermesFeedTheme.replacement(code() + code().last(), strings) }
    }

    @Test fun rejectsChangedThemeHookFlow() {
        val changed = code().toMutableList()
        changed[1] = HermesInstruction("Call1", listOf(47, 11, 5))
        assertThrows(IllegalArgumentException::class.java) { HermesFeedTheme.replacement(changed, strings) }
    }

    @Test fun supportsTheParentRegisterRetainedByTheNewCompiler() {
        val changed = code().toMutableList()
        changed[2] = HermesInstruction("StoreToEnvironment", listOf(9, 3, 57))
        changed[6] = HermesInstruction("GetById", listOf(47, 27, 111, 1))
        val (index, bytes) = HermesFeedTheme.replacement(changed, strings)
        assertEquals(6, index)
        assertEquals(listOf(HermesInstruction("Mov", listOf(47, 47)),
            HermesInstruction("Mov", listOf(47, 47))), HermesOpcodes.decode(bytes, 0, bytes.size))
        changed.add(2, HermesInstruction("LoadConstNull", listOf(47)))
        assertThrows(IllegalArgumentException::class.java) { HermesFeedTheme.replacement(changed, strings) }
    }
}
