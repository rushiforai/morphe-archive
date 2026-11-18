package app.afterglow.patches.menus

import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.addMethod
import app.afterglow.patches.shared.invokeRegisters
import app.afterglow.patches.shared.smali
import app.afterglow.patches.shared.writtenRegisters
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val POST="$EXTENSION_PACKAGE/menus/LongPressPostTools;"
private const val COMPONENT="$EXTENSION_PACKAGE/menus/LongPressPostComponent;"
private const val CAPTURE="$EXTENSION_PACKAGE/menus/LongPressCaptureTools;"

internal fun longPressPostBodyFingerprint()=Fingerprint(definingClass="Lutn;",name="u",
    parameters=listOf("Lwds;","Z"),returnType="Lwhb;",filters=listOf(
        methodCall(smali="Lwds;->k()Lvzm;"),
        fieldAccess(smali="Lbqph;->c:Lbqkt;",opcode=Opcode.IPUT_OBJECT),
        methodCall(smali="Lwqm;->aR([B)Lwqm;")))

internal fun MutableClass.installLongPressPostObserver():Int {
    var observed=0
    for(method in methods.toList()){
        val code=method.implementation?.instructions?.toList()?:continue
        val sites=code.withIndex().filter{(_,instruction)->
            val ref=(instruction as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass==CAPTURE&&ref.name=="afterglow_onLithoCapture"
        }
        for(site in sites.reversed()){
            val arguments=site.value.invokeRegisters
            require(arguments.size==2&&code[site.index+1].opcode==Opcode.MOVE_RESULT_OBJECT)
            val context=arguments[0]
            val text=arguments[1]
            require((code[site.index+1] as OneRegisterInstruction).registerA==text)
            val insert=site.index+2
            require(context!=text&&context<=15&&text<=15)
            val lastContextWrite=code.take(site.index).last{context in it.writtenRegisters}
            require(lastContextWrite.opcode==Opcode.IGET_OBJECT
                &&(lastContextWrite as? ReferenceInstruction)?.reference?.toString()=="$type->c:Lwuw;") {
                "Original text observer no longer reads this component's exact context"
            }
            val nativeThis=method.implementation!!.registerCount-1-method.parameterTypes.sumOf{if(it=="J"||it=="D")2 else 1}
            require(code.take(insert).none{nativeThis in it.writtenRegisters}) {
                "Original parameter cloning no longer preserves the native text component"
            }
            // Original text hooks load this exact field from preserved p0. Borrow
            // their context register for the owner, then restore it from that field.
            // Modern cached text has no spare low register at this point.
            method.addInstructions(insert,"""
                move-object/from16 v$context, p0
                invoke-static { v$context, v$text }, $POST->onNativeText(Ljava/lang/Object;Ljava/lang/CharSequence;)V
                iget-object v$context, v$context, $type->c:Lwuw;
            """)
            observed++
        }
    }
    return observed
}

/** Reuses original text-hook locations; no dependency on the optional translation UI. */
internal val longPressPostHookPatch=bytecodePatch {
    dependsOn(longPressCaptureHookPatch)
    execute {
        val body=longPressPostBodyFingerprint().method
        val returned=body.implementation!!.instructions.withIndex().single{it.value.opcode==Opcode.RETURN_OBJECT}
        val result=(returned.value as OneRegisterInstruction).registerA
        require(body.implementation!!.registerCount==6&&result==4)
        body.addInstructionsAtControlFlowLabel(returned.index,
            "invoke-static/range { v$result .. v$result }, $POST->bodyInput(Ljava/lang/Object;)V")

        for((type,input) in listOf("Lvuw;" to "z","Lvuz;" to "A")){
            val component=mutableClassDefBy(type)
            require(component.fields.any{it.name==input&&it.type=="Lwhb;"})
            require(component.fields.any{it.name=="c"&&it.type=="Lwuw;"})
            component.interfaces.add(COMPONENT)
            component.addMethod("afterglow_postTextInput","Ljava/lang/Object;",2,"""
                iget-object v0, p0, $type->$input:Lwhb;
                return-object v0
            """)
            component.addMethod("afterglow_postTextContext","Ljava/lang/Object;",2,"""
                iget-object v0, p0, $type->c:Lwuw;
                return-object v0
            """)
        }
    }
    finalize {
        // All users of the shared text hook must finish before inserting inside
        // their recorded sites; its execute-time insertion counters are positional.
        val observed=listOf("Lvuw;","Lvuz;").sumOf{mutableClassDefBy(it).installLongPressPostObserver()}
        require(observed==3){"Expected legacy, cached and fresh native text sites, found $observed"}
        println("Afterglow post capture: exact expandable body models, native post_text path, all three text sites")
    }
}
