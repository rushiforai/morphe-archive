package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal fun BytecodePatchContext.patchSelectionMenuPriority() {
    if(packageMetadata.versionName !in setOf("0.8.10.191 dev","0.8.10.226 dev","0.8.10.242 dev"))return
    var count=0
    boundClassForEach("SelectionMenuPriority") { cls ->
        if(!cls.type.startsWith("Lo/")&&!cls.type.startsWith("Ljp/syoboi/"))return@boundClassForEach
        cls.methods.forEach { method ->
            val hits=method.implementation?.instructions?.mapIndexedNotNull { index,insn ->
                val ref=(insn as? ReferenceInstruction)?.reference as? MethodReference
                if(ref?.name!="inflate"||ref.parameterTypes.map(CharSequence::toString)!=listOf("I","Landroid/view/Menu;")||!ref.definingClass.endsWith("MenuInflater;"))null
                else {
                    val register=when(insn){is FiveRegisterInstruction->insn.registerE;is RegisterRangeInstruction->insn.startRegister+2;else->return@mapIndexedNotNull null}
                    index to register
                }
            }.orEmpty()
            if(hits.isNotEmpty()){
                val mutable=mutableClassDefBy(cls).methods.single{it.name==method.name&&it.parameterTypes==method.parameterTypes&&it.returnType==method.returnType}
                hits.asReversed().forEach { (index,register) ->
                    mutable.addInstructions(index+1,"invoke-static/range {v$register .. v$register}, Lapp/morphe/extension/chmate/SelectionMenuPriority;->apply(Landroid/view/Menu;)V")
                    count++
                }
            }
        }
    }
    check(count>0){"Native menu inflater bindings missing"}
}
