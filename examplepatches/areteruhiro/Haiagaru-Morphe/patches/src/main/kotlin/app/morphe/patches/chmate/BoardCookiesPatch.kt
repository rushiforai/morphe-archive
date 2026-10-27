package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.util.findMutableMethodOf
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

private const val BOARD_COOKIES="Lapp/morphe/extension/chmate/BoardCookies;"

/** Guard the cookie interceptor itself: request context remains thread-local until response cookies are saved. */
internal fun BytecodePatchContext.patchBoardCookies(version:String){
    if(version !in setOf("0.8.10.191 dev","0.8.10.226 dev","0.8.10.242 dev"))return
    val jar=mutableClassDefBy("Lcom/franmontiel/persistentcookiejar/PersistentCookieJar;")
    val load=jar.methods.single{it.name=="haiagaruNativeAuthCookies"}
    val url=load.parameterTypes.single().toString()
    val save=jar.methods.single{it.name!="haiagaruNativeSaveAuthCookies"&&it.returnType=="V"&&it.parameterTypes.map(CharSequence::toString)==listOf(url,"Ljava/util/List;")}
    val saveDelegate=jar.methods.single{it.name=="haiagaruNativeSaveAuthCookies"}
    val saveWrapper=MutableMethod(ImmutableMethod(jar.type,save.name,save.parameters,save.returnType,save.accessFlags,save.annotations,save.hiddenApiRestrictions,
        ImmutableMethodImplementation(4,emptyList(),emptyList(),emptyList()))).apply{
        addInstructions(0,"""
            invoke-static {p1, p2}, $BOARD_COOKIES->save(Ljava/lang/Object;Ljava/util/List;)Z
            move-result v0
            if-nez v0, :partition_saved
            invoke-virtual {p0, p1, p2}, $saveDelegate
            :partition_saved
            invoke-static {p1, p2}, Lapp/morphe/extension/chmate/ExternalBoardAuth;->received(Ljava/lang/Object;Ljava/util/List;)V
            return-void
        """.trimIndent())
    }
    jar.methods.remove(save);jar.methods.add(saveWrapper)
    data class Candidate(val owner:ClassDef,val method:com.android.tools.smali.dexlib2.iface.Method,
        val requestMethod:MethodReference)
    val candidates=mutableListOf<Candidate>()
    classDefForEach{cls->
        for(method in cls.methods){
            if(method.parameterTypes.size!=1||method.returnType=="V"||!method.returnType.startsWith("Lo/"))continue
            val chainType=method.parameterTypes.single().toString()
            val refs=method.implementation?.instructions?.mapNotNull{(it as? ReferenceInstruction)?.reference as? MethodReference}?:continue
            val loadCall=refs.any{it.parameterTypes.map(CharSequence::toString)==listOf(url)&&it.returnType=="Ljava/util/List;"}
            if(!loadCall)continue
            val requestMethod=refs.singleOrNull{request->request.definingClass==chainType&&request.parameterTypes.isEmpty()
                &&request.returnType.startsWith("Lo/")&&refs.any{proceed->proceed.definingClass==chainType
                    &&proceed.parameterTypes.map(CharSequence::toString)==listOf(request.returnType)
                    &&proceed.returnType==method.returnType}}
            if(requestMethod!=null)candidates.add(Candidate(cls,method,requestMethod))
        }
    }
    check(candidates.size==1){"$version board cookie interceptor changed (${candidates.size})"}
    val candidate=candidates.single()
    val owner=mutableClassDefBy(candidate.owner)
    val original=owner.methods.single{it.name==candidate.method.name&&it.parameterTypes==candidate.method.parameterTypes&&it.returnType==candidate.method.returnType}
    val request=candidate.requestMethod
    val delegate=MutableMethod(ImmutableMethod(owner.type,"haiagaruBoardCookieIntercept",original.parameters,original.returnType,
        original.accessFlags,original.annotations,original.hiddenApiRestrictions,original.implementation))
    val wrapper=MutableMethod(ImmutableMethod(owner.type,original.name,original.parameters,original.returnType,original.accessFlags,original.annotations,original.hiddenApiRestrictions,
        ImmutableMethodImplementation(3,emptyList(),emptyList(),emptyList()))).apply{
        addInstructions(0,"""
            invoke-static {}, $BOARD_COOKIES->enabled()Z
            move-result v0
            if-eqz v0, :native
            invoke-static {p0, p1}, $BOARD_COOKIES->intercept(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v0
            check-cast v0, ${original.returnType}
            return-object v0
            :native
            invoke-virtual {p0, p1}, $delegate
            move-result-object v0
            return-object v0
        """.trimIndent())
    }
    owner.methods.remove(original);owner.methods.add(delegate);owner.methods.add(wrapper)
    val extension=mutableClassDefBy(BOARD_COOKIES)
    val chainStub=extension.methods.single{it.name=="requestFromChain"}
    extension.methods.remove(chainStub)
    extension.methods.add(MutableMethod(ImmutableMethod(extension.type,chainStub.name,chainStub.parameters,chainStub.returnType,chainStub.accessFlags,chainStub.annotations,chainStub.hiddenApiRestrictions,
        ImmutableMethodImplementation(1,emptyList(),emptyList(),emptyList()))).apply{
        addInstructions(0,"""
            check-cast p0, ${original.parameterTypes.single()}
            invoke-interface {p0}, $request
            move-result-object p0
            return-object p0
        """.trimIndent())
    })
    val nativeStub=extension.methods.single{it.name=="nativeIntercept"}
    extension.methods.remove(nativeStub)
    extension.methods.add(MutableMethod(ImmutableMethod(extension.type,nativeStub.name,nativeStub.parameters,nativeStub.returnType,nativeStub.accessFlags,nativeStub.annotations,nativeStub.hiddenApiRestrictions,
        ImmutableMethodImplementation(3,emptyList(),emptyList(),emptyList()))).apply{
        addInstructions(0,"""
            check-cast p0, ${owner.type}
            check-cast p1, ${original.parameterTypes.single()}
            invoke-virtual {p0, p1}, $delegate
            move-result-object v0
            return-object v0
        """.trimIndent())
    })
    val persistor=mutableClassDefBy("Lcom/franmontiel/persistentcookiejar/persistence/SharedPrefsCookiePersistor;")
    val cookieType=persistor.methods.single{it.returnType=="Ljava/lang/String;"&&it.parameterTypes.size==1&&it.parameterTypes.single().toString().startsWith("Lo/")}.parameterTypes.single().toString()
    val cookie=mutableClassDefBy(cookieType)
    // R8 inlines Cookie.matches/expiresAt in newer ChMate builds.
    // Parsing still uses the native parser; path/secure/domain checks are shared Java policy.
    val expires=cookie.fields.single{it.type=="J"&&it.accessFlags and 8==0}
    check(expires.accessFlags and 1!=0){"$version native cookie expiry is not public"}
    val expiryStub=extension.methods.single{it.name=="expires"};extension.methods.remove(expiryStub)
    extension.methods.add(MutableMethod(ImmutableMethod(extension.type,expiryStub.name,expiryStub.parameters,expiryStub.returnType,expiryStub.accessFlags,expiryStub.annotations,expiryStub.hiddenApiRestrictions,
        ImmutableMethodImplementation(3,emptyList(),emptyList(),emptyList()))).apply{
        addInstructions(0,"""
            check-cast p0, $cookieType
            iget-wide v0, p0, $expires
            return-wide v0
        """.trimIndent())
    })
    println("Board cookie partition: $version -> ${owner.type}, native cookie match/expiry retained")
}
