package io.github.sabopura.morphe.patches.twitch.chat

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import io.github.sabopura.morphe.patches.twitch.support.classesMatching
import io.github.sabopura.morphe.patches.twitch.support.classesWithStrings
import io.github.sabopura.morphe.patches.twitch.support.uniqueContract

private object LandscapeConfig : Fingerprint(strings = listOf("LandscapeChatConfiguration(chatOverlayingPlayerOff=false)"))
internal val landscapeChatHook = bytecodePatch {
    extendWith("extensions/twitch.mpe")
    execute {
        val config=LandscapeConfig.originalClassDef.type
        val layout=classesMatching { c ->
            c.instanceFields.any { it.type==config } &&
                c.instanceFields.any { it.type=="Landroid/widget/RelativeLayout\$LayoutParams;" }
        }.uniqueContract("landscape chat layout controller")
        val refs=layout.methods.flatMap { it.implementation?.instructions?.toList().orEmpty() }
            .filter { it.opcode==Opcode.INVOKE_STATIC || it.opcode==Opcode.INVOKE_STATIC_RANGE }
            .mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
            .filter { it.parameterTypes.map { p->p.toString() }.let { p ->
                p==listOf("Landroid/view/View;","I") || p==listOf("I","Landroid/view/View;")
            } && it.returnType=="V" }.distinct()
        val ref=refs.singleOrNull() ?: throw PatchException("Layout: native percentage-width helper is not unique")
        val helper=mutableClassDefBy(ref.definingClass).methods.single { it.name==ref.name && it.parameterTypes==ref.parameterTypes && it.returnType==ref.returnType }
        helper.addInstructions(0,widthHook(helper))
        // The live theatre sizes its landscape chat with a guideline that ConstraintSet sets.
        val constraintSet=classesWithStrings("All children of ConstraintLayout must have ids to use ConstraintSet")
            .uniqueContract("ConstraintSet")
        fun puts(m:com.android.tools.smali.dexlib2.iface.Method,type:String)=m.implementation?.instructions?.count {
            it.opcode==Opcode.IPUT && ((it as? ReferenceInstruction)?.reference as? com.android.tools.smali.dexlib2.iface.reference.FieldReference)?.type==type
        } ?: 0
        val percent=constraintSet.methods.filter { m -> m.returnType=="V" &&
            m.parameterTypes.map { it.toString() }.sorted()==listOf("F","I") && puts(m,"F")==1 && puts(m,"I")==2
        }.uniqueContract("ConstraintSet guideline percent setter")
        val setter=mutableClassDefBy(constraintSet).methods.single { it.name==percent.name && it.parameterTypes==percent.parameterTypes && it.returnType=="V" }
        val floatFirst=setter.parameterTypes[0].toString()=="F"
        setter.addInstructions(0,"""
            invoke-static/range {p1 .. p2}, Lio/github/sabopura/morphe/extension/twitch/player/LayoutTools;->guidePercent(${if(floatFirst) "FI" else "IF"})F
            move-result ${if(floatFirst) "p1" else "p2"}
        """)
    }
}

internal val miniPlayerHook = bytecodePatch {
    extendWith("extensions/twitch.mpe")
    execute {
        val mini=mutableClassDefBy("Ltv/twitch/android/shared/ui/elements/draggable/ConstraintTheatreContainerView;")
            .methods.singleOrNull { it.parameterTypes.size==2 && it.parameterTypes.first()=="Ltv/twitch/android/util/Size;" && it.returnType=="V" }
            ?:throw PatchException("Layout: mini-player size entry point missing")
        mini.addInstructions(0,"""
            invoke-static/range {p0 .. p1}, Lio/github/sabopura/morphe/extension/twitch/player/LayoutTools;->miniNativeSize(Landroid/view/View;Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object p1
            check-cast p1, Ltv/twitch/android/util/Size;
        """)
    }
}
