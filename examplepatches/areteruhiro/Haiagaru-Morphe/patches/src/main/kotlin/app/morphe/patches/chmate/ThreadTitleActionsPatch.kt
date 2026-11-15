package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
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
    if(version!="0.8.10.191 dev"){
        val modern=version=="0.8.10.242 dev"
        val renderer=mutableClassDefBy(if(modern)"Lo/zzbbs;" else "Lo/getTtAdContainer;")
        val sites=renderer.methods.flatMap { method ->
            method.implementation?.instructions?.mapIndexedNotNull { i,insn ->
                val ref=(insn as? ReferenceInstruction)?.reference as? MethodReference
                val register=when{
                    modern&&insn.opcode==Opcode.INVOKE_STATIC_RANGE&&ref?.definingClass=="Lo/zaco;"&&ref.name=="c"&&
                        ref.parameterTypes.firstOrNull()=="Ljava/util/List;" -> (insn as RegisterRangeInstruction).startRegister
                    !modern&&insn.opcode==Opcode.INVOKE_DIRECT&&ref?.definingClass=="Lo/TTCeilingLandingPageActivity3;"&&
                        ref.name=="<init>"&&ref.parameterTypes.lastOrNull()=="Ljava/util/List;" -> (insn as FiveRegisterInstruction).registerG
                    else->null
                }
                register?.let { Triple(method,i,it) }
            }.orEmpty()
        }
        check(sites.size==1) { "$version thread title menu list anchor changed" }
        val (method,index,list)=sites.single()
        method.addInstructionsWithLabels(index,"""
            invoke-static/range {v$list .. v$list}, Lapp/morphe/extension/chmate/ThreadTitleActions;->appendNativeGroups(Ljava/util/List;)Ljava/util/List;
            move-result-object v$list
        """.trimIndent())
        val labelOwner=mutableClassDefBy(if(modern)"Lo/ImageManagerImageReceiver;" else "Lo/TTFullScreenVideoActivity;")
        val render=labelOwner.methods.single { it.name=="invoke"&&it.parameterTypes.size==(if(modern)2 else 3) }
        val (at,call)=render.implementation!!.instructions.withIndex().single {
            val ref=(it.value as? ReferenceInstruction)?.reference as? MethodReference
            it.value.opcode==Opcode.INVOKE_STATIC_RANGE&&ref?.definingClass==(if(modern)"Lo/enableThreadsBoost;" else "Lo/DtbSharedPreferences;")&&
                ref.name==(if(modern)"a" else "d")&&ref.parameterTypes.take(3)==listOf("Ljava/lang/String;",if(modern)"Lo/jExternalSyntheticLambda0;" else "Lo/setAdVideoPlaybackListener;","J")
        }
        val label=(call as RegisterRangeInstruction).startRegister
        check(label==3&&call.registerCount==(if(modern)26 else 25))
        // Both wrappers take color first. 242 inserts a style argument before fontSize.
        val size=label+(if(modern)5 else 4)
        val sizeMask=if(modern)-17 else -9
        val defaults=label+call.registerCount-1
        // Only 226 uses the narrow three-column title grid. Its explicit maxLines
        // operand is v20; soft wrapping is already enabled by the default mask.
        val lineLimit=if(modern) "" else "const/16 v20, 2"
        // Clear only the fontSize default bit for an explicit SP value.
        // The two size registers originally carry zero; the ordinary call remains unchanged on the zero path.
        render.addInstructionsWithLabels(at,"""
            $lineLimit
            invoke-static {v$label}, Lapp/morphe/extension/chmate/ThreadTitleActions;->liveLabel(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v$label
            invoke-static {v$label}, Lapp/morphe/extension/chmate/ThreadTitleActions;->compactLabelSize(Ljava/lang/String;)J
            move-result-wide v$size
            const-wide/16 v0, 0
            cmp-long v0, v$size, v0
            if-eqz v0, :native_size
            and-int/lit8 v$defaults, v$defaults, $sizeMask
        """.trimIndent(), app.morphe.patcher.util.smali.ExternalLabel("native_size",call))
    }
    if(version=="0.8.10.242 dev"){
        // The disabled branch shares its style between board and thread menus.
        // Its TextStyle color can be Unspecified. Resolve the same theme color
        // as the enabled branch before dimming; keep native enabled/click flags.
        val style=mutableClassDefBy("Lo/getPrimaryDataMarkerColumn;").methods.single{
            it.name=="b"&&it.parameterTypes==listOf("Z","Z","Lo/zzcch;","Lo/Y;","I")
        }
        val body=style.implementation!!.instructions.toList()
        val at=body.indices.single { i ->
            ((body[i] as? ReferenceInstruction)?.reference as? MethodReference)?.toString() ==
                "Lo/mExternalSyntheticLambda37;->e()J" &&
            (body.getOrNull(i+2) as? com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction)?.narrowLiteral==1053609165
        }
        val composer=((body[at-1] as FiveRegisterInstruction).registerC)
        val color=(body[at+1] as OneRegisterInstruction).registerA
        val alpha=(body[at+2] as OneRegisterInstruction).registerA
        check(composer==4&&color==5&&alpha==7)
        style.replaceInstruction(at+2,"const v$alpha, 0x3f1eb852") // 0.62f
        style.replaceInstruction(at,"invoke-static {v$composer}, Lo/InAppMessageResultInAppMessageResponseCode;->d(Lo/Y;)Lo/onAlternativeBillingOnlyAvailabilityResponse;")
        style.addInstructions(at+1,"""
            move-result-object v$color
            invoke-virtual {v$color}, Lo/onAlternativeBillingOnlyAvailabilityResponse;->P()J
        """.trimIndent())
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
