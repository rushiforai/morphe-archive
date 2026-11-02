/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.playlists
import app.morphe.patcher.patch.*
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/** Use the same tagged-renderer helper owner as the native OfflineVideo command. */
internal fun BytecodePatchContext.installNativeDownloadContext(offline:Method){
    val converter=offline.implementation!!.instructions.mapNotNull {i->((i as? ReferenceInstruction)?.reference as? MethodReference)}.filter {
        it.parameterTypes==listOf("Ljava/lang/Object;")&&it.returnType.startsWith("L")&&it.returnType!="Ljava/lang/Object;"&&it.returnType!="Ljava/lang/String;"&&!it.definingClass.startsWith("Ljava/")
    }.distinct().singleOrNull()?:throw PatchException("Downloads: native tagged offline entity converter is ambiguous")
    val helper=classDefBy(converter.definingClass)
    if(!AccessFlags.PUBLIC.isSet(helper.accessFlags))throw PatchException("Downloads: native identity helper class is not public")
    val getters=helper.methods.filter {it.parameterTypes==listOf("Ljava/lang/Object;")&&it.returnType=="Ljava/lang/String;"&&AccessFlags.PUBLIC.isSet(it.accessFlags)&&AccessFlags.STATIC.isSet(it.accessFlags)}
    fun Method.passesStringTag()=implementation?.instructions?.any {i->i.opcode==Opcode.INSTANCE_OF&&((i as? ReferenceInstruction)?.reference as? TypeReference)?.type=="Ljava/lang/String;"}==true
    val playlist=getters.singleOrNull {it.passesStringTag()}?:throw PatchException("Downloads: native playlist tag getter missing or ambiguous")
    val video=getters.singleOrNull {!it.passesStringTag()}?:throw PatchException("Downloads: native recording tag getter missing or ambiguous")
    if(getters.size!=2)throw PatchException("Downloads: native tag getter contract changed")
    val target=mutableClassDefBy("Lapp/bdcrusher/ytmusic/playlists/NativeDownloadContext;")
    for((name,ref)in listOf("bd_video" to video,"bd_playlist" to playlist)){
        val old=target.methods.single {it.name==name&&it.parameterTypes==listOf("Ljava/lang/Object;")}
        val replacement=MutableMethod(ImmutableMethod(old.definingClass,old.name,old.parameters,old.returnType,old.accessFlags,old.annotations,old.hiddenApiRestrictions,MutableMethodImplementation(2)))
        replacement.addInstructions(0,"""
            invoke-static/range { p0 .. p0 }, ${ref.definingClass}->${ref.name}(Ljava/lang/Object;)Ljava/lang/String;
            move-result-object v0
            return-object v0
        """)
        target.methods.remove(old);target.methods.add(replacement)
    }
}
