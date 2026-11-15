package io.github.sabopura.morphe.patches.youtube.shared

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import java.lang.reflect.Proxy
import org.junit.Assert.assertEquals
import org.junit.Test

class ControlsOverlayFingerprintTest {
    private val wrapper =
        "Lcom/google/android/apps/youtube/app/player/overlay/SizeAdjustableOverlayWrapperLayout;"

    private val enclosing = Proxy.newProxyInstance(
        Method::class.java.classLoader,
        arrayOf(Method::class.java),
    ) { _, method, _ ->
        when (method.name) {
            "getDefiningClass" -> "Lopf;"
            "getName" -> "I"
            "getParameterTypes" -> emptyList<String>()
            "getReturnType" -> "V"
            else -> error("Unexpected ${method.name}")
        }
    } as Method

    private fun call(owner: String, name: String, vararg parameters: String) =
        ImmutableInstruction35c(
            Opcode.INVOKE_VIRTUAL, parameters.size + 1, 2, 5, 0, 0, 0,
            ImmutableMethodReference(owner, name, parameters.toList(), "V"),
        )

    private fun matchingFilters(instruction: Instruction) =
        StableControlsOverlayFingerprint.filters.orEmpty()
            .count { it.matches(enclosing, instruction) }

    @Test
    fun matchesTheWrapperSetupCallUnderEachObfuscatedName() {
        assertEquals(1, matchingFilters(call(wrapper, "i"))) // 21.44
        assertEquals(1, matchingFilters(call(wrapper, "k"))) // 21.45
    }

    @Test
    fun ignoresTheBooleanCallOnTheOtherWrapperInTheSameMethod() {
        assertEquals(0, matchingFilters(call(wrapper, "i", "Z")))
    }

    @Test
    fun ignoresNoArgumentCallsOnOtherClasses() {
        assertEquals(0, matchingFilters(call("Landroid/view/View;", "k")))
    }
}
