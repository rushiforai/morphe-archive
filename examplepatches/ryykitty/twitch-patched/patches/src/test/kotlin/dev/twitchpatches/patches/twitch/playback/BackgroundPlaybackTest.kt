package dev.twitchpatches.patches.twitch.playback

import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.*
import com.android.tools.smali.dexlib2.immutable.reference.*
import org.junit.Assert.assertSame
import org.junit.Assert.assertThrows
import org.junit.Test

class BackgroundPlaybackTest {
    private val vertical = "Ltv/twitch/android/feature/theatre/vertical/VerticalTheatreFragment;"

    @Test fun selectsOnlyTheEligibilityUsedByTheStopLifecycle() {
        val target = eligibility("La;")
        assertSame(target, nativeBackgroundEligibility(listOf(lifecycle("La;"), eligibility("Lb;"), target)))
    }

    @Test fun missingLifecycleLinkFailsInsteadOfChangingAnUnrelatedDjCheck() {
        assertThrows(PatchException::class.java) {
            nativeBackgroundEligibility(listOf(lifecycle("La;"), eligibility("Lb;")))
        }
    }

    private fun lifecycle(target: String) = method(vertical, "onStop", emptyList(), "V", false, listOf(
        ImmutableInstruction35c(Opcode.INVOKE_STATIC, 1, 1, 0, 0, 0, 0,
            ImmutableMethodReference(target, "allowed", listOf(vertical), "Z")),
        ImmutableInstruction10x(Opcode.RETURN_VOID)))

    private fun eligibility(owner: String) = method(owner, "allowed", listOf(vertical), "Z", true, listOf(
        ImmutableInstruction21c(Opcode.CONST_STRING, 0, ImmutableStringReference("audioDeviceManager")),
        ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 1, 1, 0, 0, 0, 0,
            ImmutableMethodReference("Ltv/twitch/android/models/channel/ChannelModel;", "isParticipatingDJ", emptyList(), "Z")),
        ImmutableInstruction11x(Opcode.MOVE_RESULT, 0), ImmutableInstruction11x(Opcode.RETURN, 0)))

    private fun method(owner: String, name: String, params: List<String>, result: String, static: Boolean,
        code: List<Instruction>) = ImmutableMethod(owner, name, params.map { ImmutableMethodParameter(it, null, null) },
        result, AccessFlags.PUBLIC.value or (if (static) AccessFlags.STATIC.value else 0), null, null,
        ImmutableMethodImplementation(2, code, null, null))
}
