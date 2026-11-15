package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/** Remove only native row-1 exceptions at transparent-NG list projection boundaries. */
internal fun BytecodePatchContext.patchFirstResponseNg() {
    val version=packageMetadata.versionName
    val response=when(version){
        "0.8.10.191 dev"->"Lo/processAdDisplayErrorPostbackForUserError;->o:I"
        "0.8.10.226 dev"->"Lo/BouncyCastleSocketAdapterCompanion;->l:I"
        "0.8.10.242 dev"->"Lo/KeJ11;->o:I"
        else->return
    }
    val targets=when(version){
        "0.8.10.191 dev"->listOf(Triple("Lo/m9ExternalSyntheticLambda1;","c",1),Triple("Lo/mb;","SO_",1))
        "0.8.10.226 dev"->listOf(Triple("Lo/listener;","b",2),Triple("Lo/setPushObserverokhttp;","b",1))
        else->listOf(Triple("Lo/emptyToNull;","c",1),Triple("Lo/zzaX;","e",1))
    }
    for((owner,name,count) in targets){
        var changed=0
        for(method in mutableClassDefBy(owner).methods.filter{it.name==name&&it.implementation!=null}){
            val body=method.implementation!!.instructions.toList()
            for(i in 0 until body.size-2){
                val ref=(body[i] as? ReferenceInstruction)?.reference as? FieldReference
                if(version=="0.8.10.226 dev"&&owner=="Lo/setPushObserverokhttp;"&&
                    body[i].opcode==Opcode.IGET&&ref.toString()==response&&body[i+1].opcode==Opcode.IF_EQ){
                    check(body[i-1].opcode==Opcode.IF_EQZ&&body[i-2].opcode==Opcode.MOVE_RESULT)
                    method.replaceInstruction(i+1,"nop")
                    changed++
                    continue
                }
                val constant=body[i+1] as? NarrowLiteralInstruction
                val branch=body[i+2]
                if(body[i].opcode==Opcode.IGET&&ref.toString()==response&&constant?.narrowLiteral==1&&
                    (branch.opcode==Opcode.IF_NE||branch.opcode==Opcode.IF_EQ)){
                    val number=(body[i] as TwoRegisterInstruction).registerA
                    val comparison=branch as TwoRegisterInstruction
                    val register=(constant as OneRegisterInstruction).registerA
                    check(setOf(comparison.registerA,comparison.registerB)==setOf(number,register))
                    // Response numbers start at 1. Zero disables the exception without
                    // changing registers, branch targets, flag maps, or source records.
                    method.replaceInstruction(i+1,"const/4 v$register, 0x0")
                    changed++
                }
            }
        }
        check(changed==count){"First-response NG projection changed: $version $owner $changed/$count"}
    }
}
