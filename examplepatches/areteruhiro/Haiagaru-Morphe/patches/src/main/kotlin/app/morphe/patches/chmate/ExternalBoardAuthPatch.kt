package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val AUTH = "Lapp/morphe/extension/chmate/ExternalBoardAuth;"

internal fun BytecodePatchContext.patchExternalBoardAuth(version: String) {
    val jar = mutableClassDefBy("Lcom/franmontiel/persistentcookiejar/PersistentCookieJar;")
    val load = jar.methods.single { it.parameterTypes.size == 1 && it.returnType == "Ljava/util/List;" }
    val url = load.parameterTypes.single().toString()
    val save = jar.methods.single { it.returnType == "V" && it.parameterTypes.map(CharSequence::toString)==listOf(url,"Ljava/util/List;") }
    val persistor = mutableClassDefBy("Lcom/franmontiel/persistentcookiejar/persistence/SharedPrefsCookiePersistor;")
    val cookie = persistor.methods.single {
        it.returnType == "Ljava/lang/String;" && it.parameterTypes.size == 1
            && it.parameterTypes.single().toString().startsWith("Lo/")
    }.parameterTypes.single().toString()
    val parse = mutableClassDefBy(cookie).methods.single {
        it.accessFlags and 0x8 != 0 && it.returnType == cookie
            && it.parameterTypes.map(CharSequence::toString) == listOf(url,"Ljava/lang/String;")
    }
    jar.methods.remove(load)
    val original = MutableMethod(ImmutableMethod(jar.type,"haiagaruNativeAuthCookies",load.parameters,
        load.returnType,load.accessFlags,load.annotations,load.hiddenApiRestrictions,load.implementation))
    jar.methods.add(original)
    jar.methods.remove(save)
    val nativeSave=MutableMethod(ImmutableMethod(jar.type,"haiagaruNativeSaveAuthCookies",save.parameters,
        save.returnType,save.accessFlags,save.annotations,save.hiddenApiRestrictions,save.implementation))
    jar.methods.add(nativeSave)
    jar.methods.add(MutableMethod(ImmutableMethod(jar.type,save.name,save.parameters,save.returnType,
        save.accessFlags,save.annotations,save.hiddenApiRestrictions,
        ImmutableMethodImplementation(3,emptyList(),emptyList(),emptyList()))).apply {
        addInstructions(0,"""
            invoke-virtual {p0, p1, p2}, $nativeSave
            invoke-static {p1, p2}, $AUTH->received(Ljava/lang/Object;Ljava/util/List;)V
            return-void
        """.trimIndent())
    })
    jar.methods.add(MutableMethod(ImmutableMethod(jar.type,load.name,load.parameters,load.returnType,
        load.accessFlags,load.annotations,load.hiddenApiRestrictions,
        ImmutableMethodImplementation(3,emptyList(),emptyList(),emptyList()))).apply {
        addInstructions(0,"""
            invoke-static {p0}, $AUTH->rememberJar(Ljava/lang/Object;)V
            invoke-virtual {p0, p1}, $original
            move-result-object v0
            invoke-static {v0, p1}, $AUTH->cookies(Ljava/util/List;Ljava/lang/Object;)Ljava/util/List;
            move-result-object v0
            return-object v0
        """.trimIndent())
    })
    val extension = mutableClassDefBy(AUTH)
    val urlParse=mutableClassDefBy(url).methods.single {
        it.accessFlags and 0x8 != 0 && it.returnType==url && it.parameterTypes.map(CharSequence::toString)==listOf("Ljava/lang/String;")
    }
    val urlStub=extension.methods.single{it.name=="parseUrl"}
    extension.methods.remove(urlStub)
    extension.methods.add(MutableMethod(ImmutableMethod(urlStub.definingClass,urlStub.name,urlStub.parameters,
        urlStub.returnType,urlStub.accessFlags,urlStub.annotations,urlStub.hiddenApiRestrictions,
        ImmutableMethodImplementation(1,emptyList(),emptyList(),emptyList()))).apply {
        addInstructions(0,"""
            invoke-static {p0}, $urlParse
            move-result-object p0
            return-object p0
        """.trimIndent())
    })
    val old = extension.methods.single { it.name == "parseCookie" }
    extension.methods.remove(old)
    extension.methods.add(MutableMethod(ImmutableMethod(old.definingClass,old.name,old.parameters,
        old.returnType,old.accessFlags,old.annotations,old.hiddenApiRestrictions,
        ImmutableMethodImplementation(2,emptyList(),emptyList(),emptyList()))).apply {
        addInstructions(0,"""
            check-cast p0, $url
            invoke-static {p0, p1}, $parse
            move-result-object p0
            return-object p0
        """.trimIndent())
    })
    var observed = 0
    classDefForEach { cls ->
        if (!(cls.type.startsWith("Lo/") || cls.type.startsWith("Ljp/syoboi/"))) return@classDefForEach
        val matches = cls.methods.flatMap { method ->
            method.implementation?.instructions?.withIndex()?.mapNotNull { (index,insn) ->
                val ref=(insn as? ReferenceInstruction)?.reference as? MethodReference ?: return@mapNotNull null
                val argument = when {
                    ref.name=="<init>" && ref.parameterTypes.firstOrNull()=="Ljava/lang/String;"
                        && ref.definingClass in setOf("Ljava/lang/Throwable;","Ljava/lang/Exception;",
                            "Ljava/lang/RuntimeException;","Ljava/io/IOException;") -> 1
                    ref.name=="setMessage" && ref.parameterTypes.map(CharSequence::toString)==listOf("Ljava/lang/CharSequence;")
                        && ref.definingClass.contains("AlertDialog") -> 1
                    ref.definingClass=="Landroid/webkit/WebView;" && ref.name=="loadDataWithBaseURL" -> 2
                    ref.definingClass=="Landroid/webkit/WebView;" && ref.name=="loadData" -> 1
                    else -> return@mapNotNull null
                }
                val register=when(insn){
                    is FiveRegisterInstruction -> listOf(insn.registerC,insn.registerD,insn.registerE,insn.registerF,insn.registerG)[argument]
                    is RegisterRangeInstruction -> insn.startRegister+argument
                    else -> error("Unknown auth error observer invocation")
                }
                Triple(method,index,register)
            }?.toList() ?: emptyList()
        }
        if(matches.isNotEmpty()) {
            val owner=mutableClassDefBy(cls)
            matches.groupBy{it.first}.forEach { (method,sites) ->
                val target=owner.methods.single{it.name==method.name && it.parameterTypes==method.parameterTypes && it.returnType==method.returnType}
                sites.sortedByDescending{it.second}.forEach { (_,index,register)->
                    target.addInstructions(index,"invoke-static/range {v$register .. v$register}, $AUTH->observe(Ljava/lang/CharSequence;)V")
                    observed++
                }
            }
        }
    }
    val editor = mutableClassDefBy(if(version=="0.8.10.191 dev")
        "Lo/p9ExternalSyntheticLambda6;" else "Ljp/syoboi/a2chMate/feature/resedit/ResEditFragment;")
    val pause = editor.methods.single { it.name=="onPause" && it.parameterTypes.isEmpty() }
    val saveDraft = pause.implementation!!.instructions.mapNotNull {
        (it as? ReferenceInstruction)?.reference as? MethodReference
    }.single { it.definingClass==editor.type && it.returnType=="V"
        && it.parameterTypes.map(CharSequence::toString)==listOf("Z") }
    editor.methods.add(MutableMethod(ImmutableMethod(editor.type,"haiagaruSaveExternalDraft",emptyList(),"V",
        0x1,emptySet(),emptySet(),ImmutableMethodImplementation(2,emptyList(),emptyList(),emptyList()))).apply {
        addInstructions(0,"""
            const/4 v0, 0x1
            invoke-direct {p0, v0}, $saveDraft
            return-void
        """.trimIndent())
    })
    patchPostingOverflowMenu(version,"ExternalBoardAuth","board_auth")
    check(observed>0){"External board authentication error UI not found"}
    println("External board auth: native cookie bridge + $observed error UI observers ($version)")
}
