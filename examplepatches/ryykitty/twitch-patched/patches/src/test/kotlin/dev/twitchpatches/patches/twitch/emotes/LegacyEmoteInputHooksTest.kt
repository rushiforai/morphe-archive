package dev.twitchpatches.patches.twitch.emotes

import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import org.junit.Assert.assertSame
import org.junit.Test

class LegacyEmoteInputHooksTest {
    @Test fun extensionTokenizerDelegateDoesNotMatchTheNativeBinding() {
        val native = method("Lsample/NativeBinding;", true)
        val delegate = method("Ldev/twitchpatches/extension/emotes/EmoteDraftRuntime;", false)
        assertSame(native, legacyEmoteInputBinding(listOf(delegate, native)))
    }

    private fun method(owner: String, adapter: Boolean): ImmutableMethod {
        val instructions = mutableListOf<com.android.tools.smali.dexlib2.iface.instruction.Instruction>(
            ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 2, 1, 2, 0, 0, 0,
                ImmutableMethodReference("Landroid/widget/MultiAutoCompleteTextView;", "setTokenizer",
                    listOf("Landroid/widget/MultiAutoCompleteTextView\$Tokenizer;"), "V")))
        if (adapter) instructions.add(ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 2, 1, 3, 0, 0, 0,
            ImmutableMethodReference("Landroid/widget/AutoCompleteTextView;", "setAdapter", listOf("Landroid/widget/ListAdapter;"), "V")))
        instructions.add(ImmutableInstruction10x(Opcode.RETURN_VOID))
        return ImmutableMethod(owner, "bind", emptyList(), "V", AccessFlags.PUBLIC.value, null, null,
            ImmutableMethodImplementation(4, instructions, null, null))
    }
}
