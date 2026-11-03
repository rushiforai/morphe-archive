package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal fun BytecodePatchContext.patchBeAutoLogout(version: String) {
    val info="Ljp/syoboi/a2chMate/client/BBSUrlInfo;"
    var workers=0
    var hooks=0
    var sends=0
    val extension=mutableClassDefBy("Lapp/morphe/extension/chmate/BeAutoLogout;")
    val boardGetter=when(version){"0.8.10.191 dev"->"i";"0.8.10.226 dev"->"v";"0.8.10.242 dev"->"y";else->error("Unsupported BE version $version")}
    extension.methods.single{it.name=="nativeBoardUrl"}.let { getter ->
        val index=getter.implementation!!.instructions.indexOfFirst{it.opcode==Opcode.CONST_STRING}
        check(index>=0);getter.replaceInstruction(index,"const-string v0, \"$boardGetter\"")
    }
    boundClassForEach("BeAutoLogoutPatch:1") { cls ->
        if(!cls.type.startsWith("Lo/") && !cls.type.startsWith("Ljp/syoboi/"))return@boundClassForEach
        cls.methods.forEach { method ->
            val instructions=method.implementation?.instructions?.toList() ?: return@forEach
            val refs=instructions.mapNotNull{(it as? ReferenceInstruction)?.reference}
            val strings=refs.filterIsInstance<StringReference>().map{it.string}
            if("新規スレッド作成" in strings && "subject" in strings && method.parameterTypes.getOrNull(1)==info) {
                check(method.parameterTypes.size==5 && method.parameterTypes[3]=="Z" && method.accessFlags and 8==0){"Native thread-send signature changed"}
                val target=mutableClassDefBy(cls).methods.single{it.name==method.name && it.parameterTypes==method.parameterTypes && it.returnType==method.returnType}
                target.addInstructions(0,"invoke-static/range {p2 .. p2}, Lapp/morphe/extension/chmate/BeAutoLogout;->beforeSend(Ljava/lang/Object;)V")
                sends++
            }
            if(strings.any{it=="https://be.5ch.net/logout.php"||it=="https://be.5ch.io/logout.php"} && strings.any{it.contains("be.2ch.sc/test/logout.html")}
                && (method.parameterTypes==listOf("[Ljava/lang/Object;") || method.name=="invokeSuspend") && method.returnType=="Ljava/lang/Object;") {
                val ctorArgs=if(method.name=="invokeSuspend")3 else 1
                check(cls.methods.count{it.name=="<init>" && it.parameterTypes.size==ctorArgs}==1){"BE worker constructor changed"}
                for((name,value) in listOf("nativeWorker" to cls.type.removePrefix("L").removeSuffix(";").replace('/','.'),"nativeAction" to method.name)) {
                    val getter=extension.methods.single{it.name==name}
                    val index=getter.implementation!!.instructions.indexOfFirst{it.opcode==Opcode.CONST_STRING}
                    check(index>=0);getter.replaceInstruction(index,"const-string v0, \"$value\"")
                }
                workers++
            }
            if(!cls.type.startsWith("Ljp/syoboi/a2chMate/feature/resedit/") && !cls.type.startsWith("Lo/p9ExternalSyntheticLambda6\$"))return@forEach
            val sites=instructions.mapIndexedNotNull { index,ins ->
                val ref=(ins as? ReferenceInstruction)?.reference as? MethodReference
                if(ref?.name=="setResult" && ref.parameterTypes==listOf("I")) {
                    val regs=when(ins){is FiveRegisterInstruction->listOf(ins.registerC,ins.registerD);is RegisterRangeInstruction->listOf(ins.startRegister,ins.startRegister+1);else->error("Unknown result call")}
                    Triple(index,regs[0],regs[1])
                }else null
            }
            if(sites.isEmpty())return@forEach
            val owner=mutableClassDefBy(cls)
            val target=owner.methods.single{it.name==method.name && it.parameterTypes==method.parameterTypes && it.returnType==method.returnType}
            sites.asReversed().forEach{(index,activity,code)->
                check(activity<16&&code<16){"BE completion registers changed"}
                target.addInstructions(index,"invoke-static {v$activity, v$code}, Lapp/morphe/extension/chmate/BeAutoLogout;->completed(Ljava/lang/Object;I)V");hooks++
            }
        }
    }
    check(workers==1 && hooks>=1 && sends==1){"BE session binding changed ($version workers=$workers success=$hooks send=$sends)"}
    println("BE thread session: native login gate + success logout callback ($version)")
}
