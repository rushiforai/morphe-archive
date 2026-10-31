package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

/** An animation end action can run after the native image Fragment was detached. */
internal fun BytecodePatchContext.patchNativeImageCloseLifecycle(version: String) {
    if (version != "0.8.10.242 dev") return
    val owner = mutableClassDefBy("Lo/VN10;")
    val close = owner.methods.single {
        it.name == "G" && it.parameterTypes == listOf(owner.type) && it.returnType == "V"
    }
    check(close.accessFlags and 0x8 != 0) { "242 native image close must be static" }
    val calls = close.implementation!!.instructions.filter {
        val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == "Landroidx/fragment/app/Fragment;" && ref.name == "getParentFragmentManager"
    }
    check(calls.size == 2 && calls.all { it.opcode == Opcode.INVOKE_VIRTUAL }) {
        "242 native image animation close changed"
    }
    val fragment = mutableClassDefBy("Landroidx/fragment/app/Fragment;")
    check(fragment.methods.any {
        it.name == "getFragmentManager" && it.parameterTypes.isEmpty() &&
            it.returnType == "Landroidx/fragment/app/FragmentManager;"
    }) { "242 nullable native FragmentManager accessor missing" }
    val delegate = MutableMethod(ImmutableMethod(owner.type, "haiagaruNativeImageClose", close.parameters,
        close.returnType, close.accessFlags, close.annotations, close.hiddenApiRestrictions, close.implementation))
    val wrapper = MutableMethod(ImmutableMethod(owner.type, close.name, close.parameters,
        close.returnType, close.accessFlags, close.annotations, close.hiddenApiRestrictions,
        ImmutableMethodImplementation(2, emptyList(), emptyList(), emptyList())))
    wrapper.addInstructionsWithLabels(0, """
        invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;
        move-result-object v0
        if-eqz v0, :detached
        invoke-static {p0}, $delegate
        :detached
        return-void
    """.trimIndent())
    owner.methods.remove(close)
    owner.methods.add(delegate)
    owner.methods.add(wrapper)
}
