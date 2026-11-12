package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** Fixed native provider collections only; typed BbsPreference/dialog/menu import stay native. */
internal fun BytecodePatchContext.patchSiteNativeBoards(version: String) {
    patchSiteThreadMetadata(version)
    val old=version.contains("191");val middle=version.contains("226")
    val url=mutableClassDefBy("Ljp/syoboi/a2chMate/client/BBSUrlInfo;")
    val parse=url.methods.single{it.name==(if(old)"b" else if(middle)"c" else "d")&&it.parameterTypes==listOf("Ljava/lang/String;")&&it.returnType==url.type}
    check(parse.accessFlags and 0x8!=0)
    val original=MutableMethod(ImmutableMethod(url.type,"haiagaruNativeSiteParse",parse.parameters,parse.returnType,parse.accessFlags,parse.annotations,parse.hiddenApiRestrictions,parse.implementation))
    url.methods.remove(parse);url.methods.add(original)
    url.methods.add(MutableMethod(ImmutableMethod(url.type,parse.name,parse.parameters,parse.returnType,parse.accessFlags,parse.annotations,parse.hiddenApiRestrictions,ImmutableMethodImplementation(2,emptyList(),emptyList(),emptyList()))).apply{
        addInstructions(0,"""
            invoke-static {p0}, Lapp/morphe/extension/chmate/SiteNativeBoards;->parse(Ljava/lang/String;)Ljava/lang/Object;
            move-result-object v0
            if-eqz v0, :native
            check-cast v0, ${url.type}
            return-object v0
            :native
            invoke-static {p0}, $original
            move-result-object v0
            return-object v0
        """.trimIndent())
    })
    if(!old){
        // Tablet routing calls the Kotlin companion's URI overload directly.
        val companion=mutableClassDefBy(if(middle)"Ljp/syoboi/a2chMate/client/BBSUrlInfo\$write;" else "Ljp/syoboi/a2chMate/client/BBSUrlInfo\$ComponentActivity;")
        val uri=companion.methods.single{it.returnType==url.type&&it.parameterTypes.size==2&&it.parameterTypes[0]=="Landroid/net/Uri;"}
        check(uri.accessFlags and 0x8==0)
        val nativeUri=MutableMethod(ImmutableMethod(companion.type,"haiagaruNativeSiteUri",uri.parameters,uri.returnType,uri.accessFlags,uri.annotations,uri.hiddenApiRestrictions,uri.implementation))
        companion.methods.remove(uri);companion.methods.add(nativeUri)
        val invoke=if(uri.accessFlags and 0x2!=0)"invoke-direct/range" else "invoke-virtual/range"
        companion.methods.add(MutableMethod(ImmutableMethod(companion.type,uri.name,uri.parameters,uri.returnType,uri.accessFlags,uri.annotations,uri.hiddenApiRestrictions,ImmutableMethodImplementation(4,emptyList(),emptyList(),emptyList()))).apply{
            addInstructions(0,"""
                if-eqz p1, :native
                invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;
                move-result-object v0
                invoke-static {v0}, Lapp/morphe/extension/chmate/SiteNativeBoards;->parse(Ljava/lang/String;)Ljava/lang/Object;
                move-result-object v0
                if-eqz v0, :native
                check-cast v0, ${url.type}
                return-object v0
                :native
                $invoke {p0 .. p2}, $nativeUri
                move-result-object v0
                return-object v0
            """.trimIndent())
        })
        // R8 keeps a second, inlined parser in the companion's String entry point.
        val address=companion.methods.single{it.returnType==url.type&&it.parameterTypes.size==2&&
            (if(middle)it.parameterTypes[0]=="Ljava/lang/String;"&&it.parameterTypes[1].startsWith("Lo/")
            else it.parameterTypes==listOf(companion.type,"Ljava/lang/String;"))}
        val isStatic=address.accessFlags and 0x8!=0
        val nativeAddress=MutableMethod(ImmutableMethod(companion.type,"haiagaruNativeSiteAddress",address.parameters,address.returnType,address.accessFlags,address.annotations,address.hiddenApiRestrictions,address.implementation))
        companion.methods.remove(address);companion.methods.add(nativeAddress)
        val addressRegister=if(middle)"p1" else "p1"
        val last=if(isStatic)1 else 2
        val addressInvoke=if(isStatic)"invoke-static/range" else if(address.accessFlags and 0x2!=0)"invoke-direct/range" else "invoke-virtual/range"
        companion.methods.add(MutableMethod(ImmutableMethod(companion.type,address.name,address.parameters,address.returnType,address.accessFlags,address.annotations,address.hiddenApiRestrictions,ImmutableMethodImplementation(last+2,emptyList(),emptyList(),emptyList()))).apply{
            addInstructions(0,"""
                invoke-static {$addressRegister}, Lapp/morphe/extension/chmate/SiteNativeBoards;->parse(Ljava/lang/String;)Ljava/lang/Object;
                move-result-object v0
                if-eqz v0, :native
                check-cast v0, ${url.type}
                return-object v0
                :native
                $addressInvoke {p0 .. p$last}, $nativeAddress
                move-result-object v0
                return-object v0
            """.trimIndent())
        })
    }
    val registry=mutableClassDefBy(if(old) "Lo/getAndResetCustomPostBodyData;" else if(middle) "Lo/accessgetPlayProviderFactorycp;" else "Lo/FfYhp1;")
    val provider=mutableClassDefBy(if(old) "Lo/collectSignal;" else if(middle) "Lo/getAndroidLevel;" else "Lo/Ff7;")
    check(provider.methods.any{it.name=="<init>"&&it.parameterTypes.size==14&&it.parameterTypes[0]=="Landroid/content/SharedPreferences;"&&it.parameterTypes[6]=="Ljava/util/regex/Pattern;"&&it.parameterTypes[7]=="Ljava/util/regex/Pattern;"})
    val hook="Lapp/morphe/extension/chmate/SiteNativeBoards;->providers(Ljava/util/Iterator;)Ljava/util/Iterator;"
    if(old||middle){
        check(registry.superclass=="Ljava/util/ArrayList;")
        check(registry.methods.none{it.name=="iterator"&&it.parameterTypes.isEmpty()})
        registry.methods.add(MutableMethod(ImmutableMethod(registry.type,"iterator",emptyList(),"Ljava/util/Iterator;",0x1,emptySet(),emptySet(),ImmutableMethodImplementation(2,emptyList(),emptyList(),emptyList()))).apply{
            addInstructions(0,"""
                invoke-super {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;
                move-result-object v0
                invoke-static {v0}, $hook
                move-result-object v0
                return-object v0
            """.trimIndent())
        })
    }else{
        // Modern lookup methods iterate their backing List directly, so cover those and iterator().
        val methods=registry.methods.filter{it.name in setOf("c","e","iterator")&&it.implementation!=null}
        check(methods.size==3)
        methods.forEach{method->
            val code=method.implementation!!.instructions.toList()
            val index=code.withIndex().single{(_,i)->val ref=(i as? ReferenceInstruction)?.reference as? MethodReference;ref?.definingClass=="Ljava/util/List;"&&ref.name=="iterator"}.index
            check(code[index+1].opcode==Opcode.MOVE_RESULT_OBJECT)
            val r=(code[index+1] as OneRegisterInstruction).registerA
            method.addInstructions(index+2,"invoke-static/range {v$r .. v$r}, $hook\nmove-result-object v$r")
        }
    }
    val settings=mutableClassDefBy(if(old) "Lo/pja;" else "Ljp/syoboi/a2chMate/ui/setting/SettingPageFragment;")
    val refresh=if(old) settings.methods.single{it.name=="a"&&it.parameterTypes==listOf(settings.type)&&it.returnType=="V"}
        else settings.methods.single{it.name==(if(middle)"o" else "h")&&it.parameterTypes.isEmpty()&&it.returnType=="V"}
    val refreshCall=if(old)"invoke-static {p0}, $refresh" else "${if(refresh.accessFlags and 0x2!=0)"invoke-direct" else "invoke-virtual"} {p0}, $refresh"
    val resume=settings.methods.singleOrNull{it.name=="onResume"&&it.parameterTypes.isEmpty()}
    if(resume!=null){
        resume.implementation!!.instructions.withIndex().filter{it.value.opcode==Opcode.RETURN_VOID}.map{it.index}.asReversed().forEach{resume.addInstructions(it,refreshCall)}
    }else settings.methods.add(MutableMethod(ImmutableMethod(settings.type,"onResume",emptyList(),"V",0x1,emptySet(),emptySet(),ImmutableMethodImplementation(1,emptyList(),emptyList(),emptyList()))).apply{
        addInstructions(0,"invoke-super {p0}, ${settings.superclass}->onResume()V\n$refreshCall\nreturn-void")
    })
    println("Native additional boards: $version typed provider iteration + native settings refresh; no class scan")
}
