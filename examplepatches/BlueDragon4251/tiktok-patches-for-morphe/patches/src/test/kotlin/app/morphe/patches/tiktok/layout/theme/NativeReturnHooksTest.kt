package app.morphe.patches.tiktok.layout.theme

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MethodImplementationBuilder
import com.android.tools.smali.dexlib2.builder.instruction.*
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test

class NativeReturnHooksTest {
    // Null represents a catch handler that enters the return without a normal branch.
    private val paths = listOf(Opcode.GOTO, Opcode.IF_EQZ, Opcode.PACKED_SWITCH, null)

    private fun fixture(branch: Opcode?): MutableMethod {
        val builder = MethodImplementationBuilder(4)
        builder.addInstruction(BuilderInstruction11n(Opcode.CONST_4, 0, 0))
        builder.addInstruction(BuilderInstruction11n(Opcode.CONST_4, 1, 0))
        val start = builder.addLabel("try_start")
        val returned = builder.getLabel("returned")
        when (branch) {
            Opcode.GOTO -> builder.addInstruction(BuilderInstruction10t(branch, returned))
            Opcode.IF_EQZ -> builder.addInstruction(BuilderInstruction21t(branch, 0, returned))
            Opcode.PACKED_SWITCH -> builder.addInstruction(BuilderInstruction31t(branch, 0, builder.getLabel("switch")))
            else -> builder.addInstruction(BuilderInstruction10x(Opcode.NOP))
        }
        val end = builder.addLabel("try_end")
        builder.addInstruction(BuilderInstruction11x(Opcode.RETURN_OBJECT, 0))
        builder.addLabel("returned")
        builder.addInstruction(BuilderInstruction11x(Opcode.RETURN_OBJECT, 1))
        if (branch == Opcode.PACKED_SWITCH) {
            builder.addLabel("switch")
            builder.addInstruction(BuilderPackedSwitchPayload(0, listOf(returned)))
        }
        if (branch == null) builder.addCatch("Ljava/lang/Throwable;", start, end, returned)
        return MutableMethod(ImmutableMethod(
            "Ltest/NativeRoot;", "create", emptyList(), "Landroid/view/View;",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            emptySet(), emptySet(), builder.methodImplementation,
        ))
    }

    @Test fun rejectsOldInsertionEvenWhenEveryReturnHasAnAdjacentHook() {
        paths.forEach { path ->
            val method = fixture(path)
            method.implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_OBJECT }
                .map { it.index to (it.value as OneRegisterInstruction).registerA }.toList()
                .asReversed().forEach { (index, register) ->
                    method.addInstruction(index, "invoke-static/range {v$register .. v$register}, Lapp/morphe/extension/tiktok/theme/ThemeNativeTargets;->sidebar(Landroid/view/View;)V")
                }
            assertThrows("Old hook insertion must reject $path", PatchException::class.java) {
                verifyNativeReturnHooks(method, "sidebar")
            }
        }
    }

    @Test fun replacementProtectsBranchSwitchAndHandlerEntriesAndPreservesReturns() {
        paths.forEach { path ->
            val method = fixture(path)
            method.hookNativeReturns("sidebar")
            verifyNativeReturnHooks(method, "sidebar")
            val returns = method.implementation!!.instructions
                .filter { it.opcode == Opcode.RETURN_OBJECT }
                .map { (it as OneRegisterInstruction).registerA }
            assertEquals(listOf(0, 1), returns)
            assertEquals(2, method.implementation!!.instructions.count { it.opcode == Opcode.INVOKE_STATIC_RANGE })
        }
    }
}
