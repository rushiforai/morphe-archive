package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

/** Reuse native type-4 pages, stable IDs, selection and serialization rather than adding a second tab bar. */
internal fun BytecodePatchContext.patchNativeToolTabs(version: String) {
    val config=when(version){
        "0.8.10.191 dev"->listOf("Lo/r8lambdaBjbaKVYCk6JekZq3TlN9Kg2pYOk;","Sw_","Lo/MediationServiceImpldExternalSyntheticLambda0;","Lo/onAppOpenAdLoaded;","Lo/r8lambdahIGIGCNpKpFqE0lgDli724UCuDM;")
        "0.8.10.226 dev"->listOf("Lo/Yy;","instantiateItem","Lo/Kjv;","Lo/setFallbackResource;","Lo/redirect;")
        "0.8.10.242 dev"->listOf("Lo/zzfm;","a","Lo/zzeq;","Ljp/syoboi/a2chMate/fragment/WebViewFragment;","Lo/CustomEventAdapter;")
        else->return
    }
    val (owner,name,page,web,base)=config
    val factory=mutableClassDefBy(owner).methods.single{it.name==name&&it.parameterTypes.map(CharSequence::toString)==listOf("Landroid/view/ViewGroup;","I")&&it.returnType=="Ljava/lang/Object;"}
    val code=factory.implementation!!.instructions.toList()
    val create=code.withIndex().single{(_,i)->i.opcode==Opcode.NEW_INSTANCE&&((i as? ReferenceInstruction)?.reference as? TypeReference)?.type==web}
    val dest=(create.value as OneRegisterInstruction).registerA
    val ctor=(code[create.index+1] as ReferenceInstruction).reference as MethodReference
    check(ctor.definingClass==web&&ctor.name=="<init>"&&ctor.parameterTypes.isEmpty())
    val row=code.first{it.opcode==Opcode.CHECK_CAST&&((it as? ReferenceInstruction)?.reference as? TypeReference)?.type==page}
    val pageRegister=(row as OneRegisterInstruction).registerA
    check(dest!=pageRegister)
    val fragment=mutableClassDefBy("Lapp/morphe/extension/chmate/NativeToolFragment;")
    check(fragment.superclass=="Landroid/app/Fragment;")
    check(mutableClassDefBy(base).methods.any{it.name=="<init>"&&it.parameterTypes.isEmpty()})
    fragment.setSuperClass(base)
    var changed=0
    fragment.methods.forEach{method->
        method.implementation?.instructions?.toList()?.forEachIndexed{index,i->
            val ref=(i as? ReferenceInstruction)?.reference as? MethodReference
            if(ref?.definingClass=="Landroid/app/Fragment;"){
                val op=when(i.opcode){
                    Opcode.INVOKE_SUPER->"invoke-super"
                    Opcode.INVOKE_DIRECT->"invoke-direct"
                    Opcode.INVOKE_VIRTUAL->"invoke-virtual"
                    Opcode.INVOKE_SUPER_RANGE->"invoke-super/range"
                    Opcode.INVOKE_DIRECT_RANGE->"invoke-direct/range"
                    Opcode.INVOKE_VIRTUAL_RANGE->"invoke-virtual/range"
                    else->error("Unexpected Fragment reference: ${i.opcode} $ref")
                }
                val registers=if(i is RegisterRangeInstruction)"v${i.startRegister} .. v${i.startRegister+i.registerCount-1}" else{
                    val r=i as FiveRegisterInstruction
                    listOf(r.registerC,r.registerD,r.registerE,r.registerF,r.registerG).take(r.registerCount).joinToString(", "){"v$it"}
                }
                val owner=if(method.name=="onViewCreated")"Landroidx/fragment/app/Fragment;" else base
                method.replaceInstruction(index,"$op {$registers}, ${ref.toString().replace("Landroid/app/Fragment;",owner)}")
                changed++
            }
        }
    }
    check(changed>=5){"Native tool Fragment lifecycle anchors missing"}
    factory.replaceInstruction(create.index,"invoke-static/range {v$pageRegister .. v$pageRegister}, Lapp/morphe/extension/chmate/NativeToolTabs;->createFragment(Ljava/lang/Object;)Ljava/lang/Object;")
    factory.replaceInstruction(create.index+1,"move-result-object v$dest")
    factory.addInstructions(create.index+2,"check-cast v$dest, $base")
    val tools=mutableClassDefBy("Lapp/morphe/extension/chmate/NativeToolTabs;")
    val stock=tools.methods.single{it.name=="stockFragment"&&it.parameterTypes.isEmpty()}
    tools.methods.remove(stock)
    tools.methods.add(MutableMethod(ImmutableMethod(tools.type,stock.name,stock.parameters,stock.returnType,stock.accessFlags,stock.annotations,stock.hiddenApiRestrictions,
        ImmutableMethodImplementation(1,emptyList(),emptyList(),emptyList()))).apply{
        addInstructions(0,"""
            new-instance v0, $web
            invoke-direct {v0}, $web-><init>()V
            return-object v0
        """.trimIndent())
    })
    val ready=tools.methods.single{it.name=="supported"&&it.parameterTypes.isEmpty()}
    val readyCode=ready.implementation!!.instructions.toList()
    check(readyCode.size==2&&readyCode.last().opcode==Opcode.RETURN)
    ready.replaceInstruction(0,"const/4 v${(readyCode.last() as OneRegisterInstruction).registerA}, 0x1")
    // Leave ChMate's blank/new-tab screen completely untouched. The chooser lives
    // in Haiagaru's existing settings instead of an independent button above it.
    println("Native tool tabs: $version -> $owner, optional/default off, native Fragment base $base")
}
