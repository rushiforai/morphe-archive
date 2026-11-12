package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.*

/** Fixed backup workers only. Keep canonical allowlist and map physical stores at I/O boundaries. */
internal fun BytecodePatchContext.patchCanonicalNativeBackup(version:String) {
    val export=when(version){"0.8.10.191 dev"->"Lo/setRevenueListener;";"0.8.10.226 dev"->"Lo/readControlFrame;";else->"Ljp/syoboi/a2chMate/feature/backupandrestore/BackupAndRestoreViewModel;"}
    val restore=when(version){"0.8.10.191 dev"->"Lo/setFormat\$2;";"0.8.10.226 dev"->"Lo/getUtf8;";else->"Ljp/syoboi/a2chMate/feature/backupandrestore/BackupPreviewViewModel;"}
    val helper="Lapp/morphe/extension/chmate/NativeBackupPreferences;"
    for((ownerName,writing) in listOf(export to true,restore to false)) {
        val owner=mutableClassDefBy(ownerName)
        val methods=owner.methods.filter{if(writing)it.returnType=="Ljava/io/File;"&&it.name==when(version){"0.8.10.191 dev"->"d";"0.8.10.226 dev"->"a";else->"d"} else if(version.contains("191"))it.name=="run" else it.parameterTypes==listOf(ownerName,"Ljava/io/File;")&&it.returnType=="V"}
        check(methods.size==1){"Native backup I/O worker changed: $ownerName"}
        val method=methods.single();val code=method.implementation!!.instructions.toList();var files=0;var preferences=0
        code.withIndex().toList().asReversed().forEach{(index,ins)->
            val ref=(ins as? ReferenceInstruction)?.reference as? MethodReference?:return@forEach
            if(ref.definingClass=="Ljava/io/File;"&&ref.name=="<init>"&&ref.parameterTypes==listOf("Ljava/io/File;","Ljava/lang/String;")) {
                val call=ins as FiveRegisterInstruction;check(call.registerCount==3&&call.registerD<16&&call.registerE<16)
                val target=call.registerC
                val allocation=(index-1 downTo 0).firstOrNull{n->code[n].opcode==Opcode.NEW_INSTANCE&&(code[n] as OneRegisterInstruction).registerA==target}?:error("Backup File allocation missing")
                check(((code[allocation] as ReferenceInstruction).reference as TypeReference).type=="Ljava/io/File;")
                method.replaceInstruction(allocation,"nop")
                method.replaceInstruction(index,"invoke-static {v${call.registerD}, v${call.registerE}}, $helper->${if(writing)"exportFile" else "restoreFile"}(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;")
                method.addInstructions(index+1,"move-result-object v$target");files++
            } else if(!writing&&ref.name=="getSharedPreferences"&&ref.parameterTypes==listOf("Ljava/lang/String;","I")&&ref.returnType=="Landroid/content/SharedPreferences;") {
                when(ins){
                    is FiveRegisterInstruction->method.replaceInstruction(index,"invoke-static {v${ins.registerC}, v${ins.registerD}, v${ins.registerE}}, $helper->preferences(Landroid/content/Context;Ljava/lang/String;I)Landroid/content/SharedPreferences;")
                    is RegisterRangeInstruction->method.replaceInstruction(index,"invoke-static/range {v${ins.startRegister} .. v${ins.startRegister+2}}, $helper->preferences(Landroid/content/Context;Ljava/lang/String;I)Landroid/content/SharedPreferences;")
                    else->error("Backup preference invocation changed")
                };preferences++
            }
        }
        check(files>0&&if(writing)preferences==0 else preferences==1){"Backup I/O bindings changed ($files/$preferences)"}
        println("Canonical native backup $version: $ownerName files=$files preferenceStores=$preferences")
    }
}
