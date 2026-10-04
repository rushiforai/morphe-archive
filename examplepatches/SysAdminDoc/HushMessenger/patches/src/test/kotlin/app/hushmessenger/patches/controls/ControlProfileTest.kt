package app.hushmessenger.patches.controls

import app.hushmessenger.patches.MessengerTarget
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertContains
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertSame

class ControlProfileTest {
    @AfterTest fun reset() {
        activeProfile = BASE_PROFILE
    }

    @Test fun eachBuildListsTheSameControlsWithTheSameNumberOfHooks() {
        for (profile in controlProfiles.values) {
            assertEquals(BASE_PROFILE.hooks.keys, profile.hooks.keys)
            for (key in BASE_PROFILE.hooks.keys) {
                assertEquals(BASE_PROFILE.hooks.getValue(key).size, profile.hooks.getValue(key).size, key)
            }
        }
        assertEquals(100, PROFILE_346013370.hooks.values.sumOf { it.size })
        assertEquals(100, PROFILE_346013423.hooks.values.sumOf { it.size })
    }

    @Test fun theVersionCodePicksTheProfile() {
        assertEquals(MessengerTarget.VERSION_CODES.toSet(), controlProfiles.keys)
        assertSame(PROFILE_346013370, controlProfileFor("346013370"))
        assertSame(PROFILE_346013423, controlProfileFor("346013423"))
        for (code in listOf("346013387", "346013440", "346013442", "346013354", "346013394", null)) {
            assertSame(BASE_PROFILE, controlProfileFor(code))
        }
    }

    @Test fun aSecondVersionNameUsesItsOwnBuildsProfile() {
        val versions = MessengerTarget.VERSIONS + ("582.0.0.1.91" to listOf(347000001))
        val profiles = controlProfiles + (347000001 to PROFILE_346013370)
        assertSame(PROFILE_346013370, controlProfileFor("347000001", profiles))
        assertSame(BASE_PROFILE, controlProfileFor("346013387", profiles))
        val found = mapOf("people" to PROFILE_346013370.hooks.getValue("people").map { id ->
            fixtureMethod(id, "const/4 v0, 0x0\nreturn v0")
        })
        activeProfile = controlProfileFor("347000001", profiles)
        validateControls(found, setOf("people"), versions)
        activeProfile = controlProfileFor("346013387", profiles)
        val failure = assertFailsWith<PatchException> { validateControls(found, setOf("people"), versions) }
        assertContains(failure.message.orEmpty(),
            "Use an unmodified arm64 Messenger ${MessengerTarget.supportedApks()} or 582.0.0.1.91 APK (version code 347000001).")
    }

    @Test fun validationFollowsTheActiveBuild() {
        fun found(ids: Set<String>) = mapOf("people" to ids.map { id ->
            fixtureMethod(id, "const/4 v0, 0x0\nreturn v0")
        })
        val base = found(BASE_PROFILE.hooks.getValue("people"))
        val other = found(PROFILE_346013370.hooks.getValue("people"))
        validateControls(base, setOf("people"))
        assertFailsWith<PatchException> { validateControls(other, setOf("people")) }
        activeProfile = PROFILE_346013370
        validateControls(other, setOf("people"))
        assertFailsWith<PatchException> { validateControls(base, setOf("people")) }
    }

    private val builder = "Lcom/google/common/collect/ImmutableList${'$'}Builder;"
    private val copy = "LX/CS3;->A0j($builder Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableList;".replace(" ", "")

    private fun inlineTabs(
        extraCopy: Boolean = false,
        branchIntoCopy: Boolean = false,
        switchIntoCopy: Boolean = false,
        catchIntoCopy: Boolean = false,
    ) = fixtureMethod("$COMPOSER_FACTORY->A6U(LX/5n3;)V", """
            new-instance v12, Ljava/util/ArrayList;
            invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V
            invoke-static {}, Lcom/google/common/collect/ImmutableList;->builder()$builder
            move-result-object v2
            ${if (branchIntoCopy) "if-eqz v2, :copy" else "nop"}
            const/4 v4, 0x0
            ${if (switchIntoCopy) "packed-switch v4, :cases" else "nop"}
            :copy
            invoke-static {v2, v12}, $copy
            move-result-object v3
            ${if (extraCopy) "invoke-static {v2, v12}, $copy" else "nop"}
            return-void
            ${if (switchIntoCopy) ":cases\n.packed-switch 0x1\n:copy\n.end packed-switch" else ""}
        """.trimIndent(), registers = 16).apply {
            // Instruction snippets carry no try blocks, so the handler is added directly.
            if (catchIntoCopy) implementation!!.run {
                val copyIndex = instructions.indexOfFirst { (it as? ReferenceInstruction)?.reference.toString() == copy }
                addCatch(newLabelForIndex(2), newLabelForIndex(4), newLabelForIndex(copyIndex))
            }
        }

    @Test fun anInlineTabListIsFilteredJustBeforeItIsCopied() {
        val method = inlineTabs()
        val copyIndex = method.implementation!!.instructions.indexOfFirst {
            (it as? ReferenceInstruction)?.reference.toString() == copy
        }
        method.injectKeyboardTabsInline()
        val call = method.getInstruction(copyIndex)
        assertEquals(Opcode.INVOKE_STATIC_RANGE, call.opcode)
        assertEquals("$SETTINGS->removeAvatarTabs(Ljava/lang/Iterable;)V", (call as ReferenceInstruction).reference.toString())
        // The hook gets the Iterable (v12), not the Builder (v2).
        val range = call as com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
        assertEquals(12, range.startRegister)
        assertEquals(1, range.registerCount)
        assertEquals(copy, (method.getInstruction(copyIndex + 1) as ReferenceInstruction).reference.toString())
    }

    @Test fun anInlineTabListWithTwoCopiesOrABranchIntoTheCopyIsRefused() {
        assertFailsWith<PatchException> { inlineTabs(extraCopy = true).injectKeyboardTabsInline() }
        assertFailsWith<PatchException> { inlineTabs(branchIntoCopy = true).injectKeyboardTabsInline() }
        assertFailsWith<PatchException> { inlineTabs(switchIntoCopy = true).injectKeyboardTabsInline() }
        assertFailsWith<PatchException> { inlineTabs(catchIntoCopy = true).injectKeyboardTabsInline() }
    }
}
