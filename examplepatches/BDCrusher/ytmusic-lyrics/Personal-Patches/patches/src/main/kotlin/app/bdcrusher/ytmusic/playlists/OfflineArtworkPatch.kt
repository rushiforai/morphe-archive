/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.playlists
import app.morphe.patcher.*
import app.morphe.patcher.patch.*
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patches.music.interaction.jam.addBridge
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val ART="Lapp/bdcrusher/ytmusic/playlists/PlaylistArtwork;"
private object ArtworkLoader:Fingerprint(strings=listOf("Unknown CustomImageSource extension: "))
val offlineArtworkResources=resourcePatch {
    execute {document("res/xml/file_provider_paths.xml").use {doc->val path=doc.createElement("files-path");path.setAttribute("name","bdcrusher_playlist_artwork");path.setAttribute("path","bdcrusher-playlist-artwork/");doc.documentElement.appendChild(path)}}
}
internal fun BytecodePatchContext.installOfflineArtwork(){
    ArtworkLoader.clearMatch()
    val ref=ArtworkLoader.method.implementation!!.instructions.filter {it.opcode==Opcode.INVOKE_VIRTUAL}.mapNotNull {it.getReference<MethodReference>()}.singleOrNull {it.parameterTypes==listOf("Landroid/net/Uri;")}
        ?:throw PatchException("Downloads: native artwork Uri loader missing or ambiguous")
    val loader=mutableClassDefBy(ref.definingClass).methods.singleOrNull {it.name==ref.name&&it.parameterTypes==ref.parameterTypes&&it.returnType==ref.returnType&&it.implementation!=null&&!AccessFlags.STATIC.isSet(it.accessFlags)}
        ?:throw PatchException("Downloads: shared native image loader implementation changed")
    // Use the shared request builder, not just its Elements caller: native player
    // thumbnails and playlist images keep their original loader and lifecycle.
    loader.addInstructions(0,"invoke-static/range { p1 .. p1 }, $ART->local(Landroid/net/Uri;)Landroid/net/Uri;\nmove-result-object p1")
    var provider=classDefBy("Lcom/google/android/apps/youtube/music/util/MusicFileProviderCompat;")
    val adapters=mutableListOf<MethodReference>()
    while(true){adapters+=provider.methods.filter {AccessFlags.STATIC.isSet(it.accessFlags)&&it.parameterTypes==listOf("Landroid/content/Context;","Ljava/lang/String;","Ljava/io/File;")&&it.returnType=="Landroid/net/Uri;"};provider=provider.superclass?.let {classDefByOrNull(it)}?:break}
    val adapter=adapters.singleOrNull()?:throw PatchException("Downloads: native artwork FileProvider adapter changed")
    val owner=mutableClassDefBy(adapter.definingClass);owner.accessFlags=owner.accessFlags or AccessFlags.PUBLIC.value
    val method=owner.methods.single {it.name==adapter.name&&it.parameterTypes==adapter.parameterTypes};method.accessFlags=(method.accessFlags and (AccessFlags.PRIVATE.value or AccessFlags.PROTECTED.value).inv()) or AccessFlags.PUBLIC.value
    val art=mutableClassDefBy(ART);art.methods.removeAll {it.name=="fileUri"&&it.parameterTypes==adapter.parameterTypes}
    art.addBridge("fileUri",adapter.parameterTypes.map {it.toString()},adapter.returnType,3,AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,"invoke-static/range { p0 .. p2 }, $adapter\nmove-result-object p0\nreturn-object p0")
}
