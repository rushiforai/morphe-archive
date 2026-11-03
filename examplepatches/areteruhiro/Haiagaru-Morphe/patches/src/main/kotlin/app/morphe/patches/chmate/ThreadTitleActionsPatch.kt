package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

internal fun BytecodePatchContext.patchThreadTitleActions(version: String){
    val type=when(version){
        "0.8.10.191 dev"->"Lo/q1aExternalSyntheticLambda2;"
        "0.8.10.226 dev"->"Lo/getDislikeManager;"
        "0.8.10.242 dev"->"Lo/zzbbk;"
        else->return
    }
    val owner=mutableClassDefBy(type)
    // Compose sheets use their own Dialog window. Add controls to that window
    // during onStart, before its ComposeView is attached to WindowManager.
    val dialogs=when(version){
        "0.8.10.226 dev"->listOf("Lo/setLogLevel;","Lo/r8lambda6d913dPkLkVGsfjlwMa6Wnm0so8;")
        "0.8.10.242 dev"->listOf("Lo/getFullPriceMicros;")
        else->emptyList()
    }
    for(dialogType in dialogs){
        val dialog=mutableClassDefBy(dialogType)
        check(dialog.methods.none { it.name=="onStart"&&it.parameterTypes.isEmpty() })
        val start=MutableMethod(ImmutableMethod(dialogType,"onStart",emptyList(),"V",4,
            emptySet(),emptySet(),ImmutableMethodImplementation(1,emptyList(),emptyList(),emptyList())))
        start.addInstructions(0,"""
            invoke-super {p0}, ${dialog.superclass}->onStart()V
            invoke-static {p0}, Lapp/morphe/extension/chmate/ThreadTitleActions;->decorateDialog(Landroid/app/Dialog;)V
            return-void
        """.trimIndent());dialog.methods.add(start)
    }
    val parameters=listOf("Landroid/view/LayoutInflater;","Landroid/view/ViewGroup;","Landroid/os/Bundle;")
    val original=owner.methods.singleOrNull { it.name=="onCreateView"&&it.parameterTypes.map(CharSequence::toString)==parameters }
    if(original!=null){
        original.implementation!!.instructions.withIndex().filter { it.value.opcode==Opcode.RETURN_OBJECT }.asReversed().forEach { (i,insn)->
            val r=(insn as OneRegisterInstruction).registerA
            // Save the result in now-dead parameters; p0 remains the exact dialog fragment.
            original.addInstructionsWithLabels(i,"""
                move-object/16 p1, v$r
                invoke-static/range {p0 .. p1}, Lapp/morphe/extension/chmate/ThreadTitleActions;->wrap(Ljava/lang/Object;Landroid/view/View;)Landroid/view/View;
                move-result-object v$r
            """.trimIndent())
        }
    }else{
        val wrapper=MutableMethod(ImmutableMethod(type,"onCreateView",parameters.map { ImmutableMethodParameter(it,emptySet(),null) },
            "Landroid/view/View;",1,emptySet(),emptySet(),ImmutableMethodImplementation(4,emptyList(),emptyList(),emptyList())))
        wrapper.addInstructions(0,"""
            invoke-super/range {p0 .. p3}, ${owner.superclass}->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
            move-result-object p1
            invoke-static/range {p0 .. p1}, Lapp/morphe/extension/chmate/ThreadTitleActions;->wrap(Ljava/lang/Object;Landroid/view/View;)Landroid/view/View;
            move-result-object p1
            return-object p1
        """.trimIndent());owner.methods.add(wrapper)
    }
}
