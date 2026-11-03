/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.playlists
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.*
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patches.music.interaction.jam.addBridge
import app.morphe.util.cloneParameters
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.*
private const val HOST="Lapp/bdcrusher/ytmusic/playlists/DownloadsHost;"
private const val HOST_OWNER="Lapp/bdcrusher/ytmusic/playlists/DownloadsHost\$Owner;"
private object DownloadsDestination:Fingerprint(name="<clinit>",strings=listOf("com/google/android/apps/youtube/music/browse/LibraryBrowseFragment"))
internal fun BytecodePatchContext.installDownloadsHost(){
    DownloadsDestination.clearMatch();val type=mutableClassDefBy(DownloadsDestination.classDef.type)
    val create=type.methods.single {it.name=="onCreateView"};val code=create.implementation!!.instructions.toList()
    val root=type.fields.singleOrNull {it.type=="Landroid/view/View;"}?:throw PatchException("Downloads: native library root changed")
    val loading=code.withIndex().singleOrNull {it.value.opcode==Opcode.CHECK_CAST&&it.value.getReference<TypeReference>()?.type=="Lcom/google/android/apps/youtube/music/ui/components/loading/LoadingFrameLayout;"}?.index?:throw PatchException("Downloads: native content frame changed")
    val container=(code.getOrNull(loading-3) as? WideLiteralInstruction)?.wideLiteral?.toInt()?:throw PatchException("Downloads: native content resource changed")
    val state=type.fields.filter {field->classDefByOrNull(field.type)?.let {c->c.superclass=="Ljava/lang/Enum;"&&c.methods.any {m->m.name=="<clinit>"&&m.implementation?.instructions?.any {it.getReference<StringReference>()?.string=="DOWNLOADS"}==true}}==true}.singleOrNull()?:throw PatchException("Downloads: native library destination state changed")
    type.interfaces.add(HOST_OWNER)
    type.addBridge("bd_downloadContent",emptyList(),"Landroid/view/ViewGroup;",3,body="""
        iget-object v0, p0, $root
        if-eqz v0, :absent
        const v1, $container
        invoke-virtual { v0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
        move-result-object v0
        instance-of v1, v0, Landroid/view/ViewGroup;
        if-eqz v1, :absent
        check-cast v0, Landroid/view/ViewGroup;
        return-object v0
        :absent
        const/4 v0, 0x0
        return-object v0
    """)
    type.addBridge("bd_downloadDestination",emptyList(),"Z",3,body="""
        iget-object v0, p0, $state
        if-eqz v0, :absent
        invoke-virtual { v0 }, Ljava/lang/Enum;->name()Ljava/lang/String;
        move-result-object v0
        const-string v1, "DOWNLOADS"
        invoke-virtual { v1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v0
        return v0
        :absent
        const/4 v0, 0x0
        return v0
    """)
    val stateSetter=type.methods.singleOrNull {it.returnType=="V"&&it.parameterTypes.size==1&&it.implementation?.instructions?.any {i->i.opcode==Opcode.IPUT_OBJECT&&i.getReference<FieldReference>()?.let {f->f.definingClass==state.definingClass&&f.name==state.name}==true}==true}?:throw PatchException("Downloads: native destination binding changed")
    val model=stateSetter.parameterTypes.single()
    val lifecycle=type.methods.filter {it.name in listOf("onViewCreated","onResume")||it.returnType=="V"&&it.parameterTypes==listOf(model)}
    if(lifecycle.size<4)throw PatchException("Downloads: native content binding lifecycle changed")
    for(original in lifecycle){val method=original.cloneParameters();for(index in method.implementation!!.instructions.withIndex().filter {it.value.opcode==Opcode.RETURN_VOID}.map {it.index}.reversed())method.addInstruction(index,"invoke-static/range { p0 .. p0 }, $HOST->changed(Ljava/lang/Object;)V")}
    val destroy=type.methods.single {it.name=="onDestroyView"};destroy.addInstruction(0,"invoke-static/range { p0 .. p0 }, $HOST->release(Ljava/lang/Object;)V")
}
