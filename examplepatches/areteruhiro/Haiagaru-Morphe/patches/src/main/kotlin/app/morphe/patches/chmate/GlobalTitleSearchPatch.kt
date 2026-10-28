package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/** Preserve the native provider/parser; append registered-board TSV on its IO worker. */
internal fun BytecodePatchContext.patchGlobalTitleSearch(version:String){
    val type=when(version){
        "0.8.10.191 dev"->"Lo/getSdkVersion;"
        "0.8.10.226 dev"->"Lo/afterHandshake;"
        "0.8.10.242 dev"->"Lo/AXE3;"
        else->return
    }
    val owner=mutableClassDefBy(type)
    val builder=owner.methods.single { method ->
        method.parameterTypes==listOf("Ljava/lang/String;") && method.returnType=="Ljava/lang/String;" &&
            method.implementation?.instructions?.any { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string=="https://ff5ch.syoboi.jp/?alt=tsv&q=" }==true
    }
    val parser=owner.methods.single { method ->
        method.parameterTypes==(if(version=="0.8.10.191 dev")listOf("Ljava/lang/String;","Ljp/syoboi/a2chMate/data/BBSThreadList;") else listOf("Ljava/lang/String;")) &&
            method.returnType==(if(version=="0.8.10.191 dev")"I" else if(version=="0.8.10.226 dev")"Ljp/syoboi/a2chMate/data/BBSThreadList;" else "Ljava/util/List;")
    }
    check(builder.accessFlags and 8==0 && parser.accessFlags and 8==0){"Global search provider became static"}
    builder.addInstructions(0,"invoke-static/range {p0 .. p1}, Lapp/morphe/extension/chmate/GlobalTitleSearch;->capture(Ljava/lang/Object;Ljava/lang/String;)V")
    parser.addInstructions(0,"""
        invoke-static/range {p0 .. p1}, Lapp/morphe/extension/chmate/GlobalTitleSearch;->extend(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
        move-result-object p1
    """.trimIndent())
    println("Native HOME global title search: $version -> $type, original query/parser retained")
}
