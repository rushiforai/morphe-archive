package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.findFreeRegister
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private fun patchPopularityThreshold(method: MutableMethod, owner:String, name:String) {
    val sites=method.implementation!!.instructions.withIndex().filter {
        val ref=(it.value as? ReferenceInstruction)?.reference as? FieldReference
        ref?.definingClass==owner&&ref.name==name&&ref.type=="I"&&it.value.opcode==Opcode.IGET
    }
    check(sites.isNotEmpty())
    for((index,insn) in sites.asReversed()) {
        val r=(insn as TwoRegisterInstruction).registerA
        method.addInstructions(index+1,"""
            invoke-static {v$r}, Lapp/morphe/extension/chmate/PopularReplies;->selectThreshold(I)I
            move-result v$r
        """.trimIndent())
    }
}

internal fun BytecodePatchContext.patchPopularReplies(version: String) {
    val extension = "Lapp/morphe/extension/chmate/PopularReplies;"
    val capture="Lapp/morphe/extension/chmate/PopularNativeRows;"
    if(version=="0.8.10.191 dev"||version=="0.8.10.226 dev") {
        val old=version=="0.8.10.191 dev"
        val rebuild=mutableClassDefBy(if(old)"Lo/m9ExternalSyntheticLambda1;" else "Lo/listener;").methods.single {
            it.name==(if(old)"c" else "b")&&it.parameterTypes==listOf("Z")&&it.returnType=="V"
        }
        val sites=rebuild.implementation!!.instructions.withIndex().filter {
            val field=(it.value as? ReferenceInstruction)?.reference as? FieldReference
            field?.definingClass==(if(old)"Lo/maExternalSyntheticLambda0;" else "Lo/getSinkokhttp;")&&field.name==(if(old)"c" else "b")
        }
        check(sites.size>=2)
        // Native full tree is complete here, before the native popularity predicate.
        // Both registers are read-only; do not add locals or overwrite native operands.
        rebuild.addInstructionsWithLabels(sites.last().index,
            if(old)"invoke-static {v1, v4}, $capture->captureLegacy(Ljava/lang/Object;Ljava/util/List;)V"
            else "invoke-static {v0, v2}, $capture->captureLegacy(Ljava/lang/Object;Ljava/util/List;)V")
        patchPopularityThreshold(rebuild,if(old)"Lo/m9ExternalSyntheticLambda1;" else "Lo/listener;",if(old)"I" else "D")
    } else if(version=="0.8.10.242 dev") {
        val render=mutableClassDefBy("Ljp/syoboi/a2chMate/ui/reslist/ResListFragmentViewModel\$onBackPressedInput_delegatelambda0\$3;").methods.single {it.name=="invokeSuspend"}
        val instructions=render.implementation!!.instructions.toList()
        val site=instructions.withIndex().single {
            val ref=(it.value as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass=="Lo/emptyToNull;"&&ref.name=="c"&&ref.parameterTypes.size==14
        }.index
        val rows=(instructions[site+1] as OneRegisterInstruction).registerA
        val scope=instructions.drop(site+2).first {
            val ref=(it as? ReferenceInstruction)?.reference as? FieldReference
            ref?.definingClass=="Lo/ScopeUtil;"&&ref.name=="a"
        } as TwoRegisterInstruction
        check(rows<16&&scope.registerB<16)
        render.addInstructionsWithLabels(site+2,"invoke-static {v$rows, v${scope.registerB}}, $capture->captureModern(Ljava/util/List;Ljava/lang/Object;)V")
        patchPopularityThreshold(render,"Lo/IObjectWrapperStub;","b")
    }
    if(version == "0.8.10.191 dev") {
        val method=mutableClassDefBy("Lo/pa\$21;").methods.single {
            it.name=="e" && it.parameterTypes.isEmpty() && it.returnType=="V"
        }
        val original=method.implementation!!.instructions.first()
        val reg=method.findFreeRegister(0)
        method.addInstructionsWithLabels(0,"""
            iget-object v$reg, p0, Lo/pa${'$'}21;->d:Lo/pa;
            invoke-static/range {v$reg .. v$reg}, $extension->interceptLegacy(Ljava/lang/Object;)Z
            move-result v$reg
            if-eqz v$reg, :original_popular
            return-void
        """.trimIndent(), ExternalLabel("original_popular",original))
    } else if(version == "0.8.10.226 dev") {
        val method=mutableClassDefBy("Lo/listener\$setContentView\$ComponentActivity;").methods.single {
            it.name=="invoke" && it.parameterTypes==listOf("Ljava/lang/Object;") && it.returnType=="Ljava/lang/Object;"
        }
        val original=method.implementation!!.instructions.first()
        val reg=method.findFreeRegister(0)
        method.addInstructionsWithLabels(0,"""
            invoke-static/range {p0 .. p1}, $extension->interceptCallback(Ljava/lang/Object;Ljava/lang/Object;)Z
            move-result v$reg
            if-eqz v$reg, :original_popular
            sget-object v$reg, Lo/Ff11;->c:Lo/Ff11;
            return-object v$reg
        """.trimIndent(),ExternalLabel("original_popular",original))
    } else if(version == "0.8.10.242 dev") {
        val method=mutableClassDefBy("Ljp/syoboi/a2chMate/ui/reslist/ResListFragmentViewModel;").methods.single {
            it.name=="b" && it.parameterTypes==listOf("Lo/isAtLeastLollipop;") && it.returnType=="V"
        }
        val original=method.implementation!!.instructions.first()
        val reg=method.findFreeRegister(0)
        method.addInstructionsWithLabels(0,"""
            invoke-static/range {p0 .. p1}, $extension->interceptModel(Ljava/lang/Object;Ljava/lang/Object;)Z
            move-result v$reg
            if-eqz v$reg, :original_popular
            return-void
        """.trimIndent(),ExternalLabel("original_popular",original))
    }
    println("Popular direct-reply popup: $version")
}
