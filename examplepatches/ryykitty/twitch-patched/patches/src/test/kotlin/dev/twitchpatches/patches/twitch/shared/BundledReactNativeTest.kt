package dev.twitchpatches.patches.twitch.shared

import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import org.junit.Assert.*
import org.junit.Test

class BundledReactNativeTest {
    @Test fun pinsTheSourceConsumedByTheHostWithoutChangingOtherPathReaders() {
        val host = reader(RN_HOST_FACTORY, "create")
        val hook = bundledReactNativeHook(listOf(reader("Lother;", "create"), host))
        assertSame(host, hook.method)
        assertEquals(1, hook.resultIndex)
        assertEquals(2, hook.register)
    }

    @Test fun missingAndAmbiguousHostReadsFail() {
        assertThrows(PatchException::class.java) { bundledReactNativeHook(emptyList()) }
        assertThrows(PatchException::class.java) {
            bundledReactNativeHook(listOf(reader(RN_HOST_FACTORY, "a"), reader(RN_HOST_FACTORY, "b")))
        }
    }

    @Test fun incompatibleResultFailsBeforeReplacingAnInstruction() {
        assertThrows(IllegalArgumentException::class.java) {
            bundledReactNativeHook(listOf(reader(RN_HOST_FACTORY, "create", Opcode.MOVE_RESULT)))
        }
    }

    private fun reader(owner: String, name: String, result: Opcode = Opcode.MOVE_RESULT_OBJECT) =
        ImmutableMethod(owner, name, emptyList(), "Ljava/lang/Object;", AccessFlags.PUBLIC.value, null, null,
            ImmutableMethodImplementation(4, listOf(
                ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 1, 1, 0, 0, 0, 0,
                    ImmutableMethodReference("Ltv/twitch/android/feature/discovery/feed/rn/runtime/RNSourceSelection;",
                        "getBundleFile", emptyList(), "Ljava/lang/String;")),
                ImmutableInstruction11x(result, 2),
                ImmutableInstruction11x(Opcode.RETURN_OBJECT, 2)), null, null))
}
