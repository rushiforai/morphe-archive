/* Copyright 2026 BDCrusher. GPL-3.0. Native contracts verified against original 9.42.52. */
package app.bdcrusher.ytmusic.playlists
import app.bdcrusher.ytmusic.nativeentry.personalRuntimePatch
import app.morphe.patcher.*
import app.morphe.patcher.patch.*
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.music.misc.androidauto.*
import app.morphe.patches.music.interaction.downloads.CommandResolverFingerprint
import app.morphe.patches.music.interaction.jam.addBridge
import app.morphe.patches.music.interaction.jam.decode
import app.morphe.patches.music.interaction.jam.implementsType
import app.morphe.patches.music.interaction.jam.resolveProto
import app.morphe.util.cloneParameters
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.*

private const val RUNTIME="Lapp/bdcrusher/ytmusic/playlists/PlaylistRuntime;"
private const val CLIENT="Lapp/bdcrusher/ytmusic/playlists/PlaylistRuntime\$PhoneClient;"
private const val RESPONSE="Lapp/bdcrusher/ytmusic/playlists/PlaylistRuntime\$PhoneResponse;"
private const val COMMAND="Lapp/bdcrusher/ytmusic/playlists/PlaylistRuntime\$CommandBytes;"
private const val SNAPSHOT="Lapp/bdcrusher/ytmusic/playlists/PlaylistBrowse\$Snapshot;"
private const val PAGES="Lapp/bdcrusher/ytmusic/playlists/PlaylistBrowse;"
private const val REQUEST="Lapp/bdcrusher/ytmusic/playlists/PlaylistBrowse\$Request;"
private const val ARTWORK="Lapp/bdcrusher/ytmusic/playlists/PlaylistArtwork;"
private const val ROWS="Lapp/bdcrusher/ytmusic/playlists/PlaylistRows;"
private const val ROW_OWNER="Lapp/bdcrusher/ytmusic/playlists/PlaylistRows\$Owner;"
private object PlaylistHeader:Fingerprint(strings=listOf("com/google/android/apps/youtube/music/ui/presenter/MusicElementHeaderPresenter"))
private object PlaylistImageLoader:Fingerprint(strings=listOf("Unknown CustomImageSource extension: "))
private object PlaylistRowSchema:Fingerprint(name="<clinit>",filters=listOf(literal(161429595)))
private object PlaylistResources
private val playlistResources=resourcePatch {
    execute {
        val name="yt_outline_bdcrusher_download_playlist_vd_theme_24.xml"
        val target=this["res/drawable/$name"];target.parentFile.mkdirs()
        val input=PlaylistResources::class.java.classLoader!!.getResourceAsStream("bdcrusher-playlists/$name")?:throw PatchException("Playlist icon resource missing")
        input.use {i->target.outputStream().use {i.copyTo(it)}}
        this["assets/bdcrusher-features/playlists.enabled"].apply {parentFile.mkdirs();writeText("1\n")}
        document("AndroidManifest.xml").use { doc ->
            val activity=doc.createElement("activity")
            activity.setAttribute("android:name","app.bdcrusher.ytmusic.playlists.ExternalFolderActivity")
            activity.setAttribute("android:exported","false")
            doc.getElementsByTagName("application").item(0).appendChild(activity)
        }
        document("res/xml/file_provider_paths.xml").use {doc->
            val path=doc.createElement("files-path");path.setAttribute("name","bdcrusher_playlist_artwork");path.setAttribute("path","bdcrusher-playlist-artwork/");doc.documentElement.appendChild(path)
        }
    }
}
@Suppress("unused")
val playlistDownloadsPatch=bytecodePatch(name="Download playlist",description="Adds a native playlist-header action using your existing Downloads mode, with durable in-app batches and ordered offline playlists.",default=false){
    category("Playlist downloads")
    dependsOn(personalRuntimePatch,playlistResources)
    compatibleWith(Compatibility(packageName="com.google.android.apps.youtube.music",name="YouTube Music",apkFileType=ApkFileType.APK_REQUIRED,
        targets=listOf(AppTarget(version="9.42.52",versionCodes=mapOf(SupportedAbi.ARM64_V8A to 94252240),minSdk=26,isExperimental=true),AppTarget(version="9.43.51",versionCodes=mapOf(SupportedAbi.ARM64_V8A to 94351240),minSdk=26,isExperimental=true))))
    execute {
        PlaylistHeader.clearMatch();val presenter=PlaylistHeader.classDef
        // The header factory consumes an extensible generated element and returns a byte-backed render model.
        val candidates=presenter.methods.flatMap {m->m.implementation?.instructions?.withIndex()?.mapNotNull { (index,i)->
            val ref=i.getReference<MethodReference>()?:return@mapNotNull null
            if(i.opcode!=Opcode.INVOKE_INTERFACE||ref.parameterTypes.size!=1||!ref.returnType.startsWith("L"))return@mapNotNull null
            val result=classDefByOrNull(ref.returnType)?:return@mapNotNull null
            if(result.fields.count {it.type=="[B"}!=1||!implementsType(ref.parameterTypes[0].toString(),"Lcom/google/protobuf/MessageLite;"))return@mapNotNull null
            Triple(m,index,ref)
        }?:emptyList()}
        val (original,index,factory)=candidates.singleOrNull()?:throw PatchException("Native playlist header factory missing or ambiguous")
        val proto=resolveProto(factory.parameterTypes.single().toString(),"playlist header element")
        val bridge=mutableClassDefBy(RUNTIME)
        bridge.addBridge("bd_rewriteHeader",listOf(proto.type),proto.type,4,AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,"""
            invoke-virtual { p0 }, ${proto.type}->toByteArray()[B
            move-result-object p0
            invoke-static { p0 }, Lapp/bdcrusher/ytmusic/playlists/PlaylistHeaderModel;->rewrite([B)[B
            move-result-object p0
            ${proto.decode("p0","v0")}
            return-object v0
        """)
        val method=mutableClassDefBy(original.definingClass).methods.single {it.name==original.name&&it.parameterTypes==original.parameterTypes&&it.returnType==original.returnType}
        val call=method.implementation!!.instructions.elementAt(index) as FiveRegisterInstruction
        val register=call.registerD
        method.addInstruction(index,"invoke-static/range { v$register .. v$register }, $RUNTIME->bd_rewriteHeader(${proto.type})${proto.type}")
        method.addInstruction(index+1,"move-result-object v$register")

        PhoneBrowseRequestCallsFingerprint.clearMatch()
        val (create,setBrowse,tracking,send)=PhoneBrowseRequestCallsFingerprint.instructionMatches.mapNotNull {it.instruction.getReference<MethodReference>()}
        val nativeClient=mutableClassDefBy(create.definingClass);nativeClient.interfaces.add(CLIENT)
        nativeClient.addInterfaceMethod(findInterfaceMethod(CLIENT,"bd_playlistBrowse"),4,"""
            invoke-virtual { p0 }, $create
            move-result-object v0
            invoke-virtual { v0, p1 }, $setBrowse
            invoke-virtual { v0 }, $tracking
            invoke-virtual { p0, v0, p2 }, $send
            move-result-object v0
            return-object v0
        """)
        val continuation=phoneBrowseContinuationFingerprint(create.returnType).instructionMatches.last().instruction.getReference<FieldReference>()?:throw PatchException("Native playlist continuation field missing")
        nativeClient.addInterfaceMethod(findInterfaceMethod(CLIENT,"bd_playlistContinue"),4,"""
            invoke-virtual { p0 }, $create
            move-result-object v0
            iput-object p1, v0, $continuation
            invoke-virtual { v0 }, $tracking
            invoke-virtual { p0, v0, p2 }, $send
            move-result-object v0
            return-object v0
        """)
        for(ctor in nativeClient.methods.filter {it.name=="<init>"}){
            val exits=ctor.implementation!!.instructions.withIndex().filter {it.value.opcode==Opcode.RETURN_VOID}.map {it.index}
            for(exit in exits.reversed())ctor.addInstruction(exit,"invoke-static/range { p0 .. p0 }, $RUNTIME->capture($CLIENT)V")
        }
        PhoneBrowseResponseTabsFingerprint.clearMatch();val tabs=PhoneBrowseResponseTabsFingerprint.originalMethod
        val response=mutableClassDefBy(tabs.definingClass);response.interfaces.add(RESPONSE)
        val protoField=tabs.implementation!!.instructions.mapNotNull {it.getReference<FieldReference>()}.filter {it.definingClass==response.type&&implementsType(it.type,"Lcom/google/protobuf/MessageLite;")}.distinct().singleOrNull()
            ?:throw PatchException("Native authenticated playlist response bytes missing")
        response.addInterfaceMethod(findInterfaceMethod(RESPONSE,"bd_playlistBytes"),1,"""
            iget-object p0, p0, $protoField
            invoke-virtual { p0 }, ${protoField.type}->toByteArray()[B
            move-result-object p0
            return-object p0
        """)
        // Resolve request inputs from the native diagnostic's named fields, never obfuscated names.
        val request=mutableClassDefBy(create.returnType)
        val description=phoneBrowseContinuationFingerprint(create.returnType).originalMethod.implementation!!.instructions.toList()
        request.interfaces.add(REQUEST)
        for((label,getter) in listOf("browseId" to "bd_playlistId","continuation" to "bd_playlistToken","params" to "bd_playlistParams","language" to "bd_playlistLanguage","query" to "bd_playlistQuery")){
            val at=description.indexOfFirst { it.getReference<StringReference>()?.string==label }
            val field=description.getOrNull(at+1)?.getReference<FieldReference>()
            if(at<0||field==null||field.type!="Ljava/lang/String;"||field.definingClass!=request.type)throw PatchException("Native playlist request $label field is missing or ambiguous")
            request.addInterfaceMethod(findInterfaceMethod(REQUEST,getter),1,"iget-object p0, p0, $field\nreturn-object p0")
        }
        for((label,getter) in listOf("formData" to "bd_playlistForm","genericFormData" to "bd_playlistGenericForm")){
            val at=description.indexOfFirst {it.getReference<StringReference>()?.string==label}
            val field=description.take(at.coerceAtLeast(0)).lastOrNull {it.opcode==Opcode.IGET_OBJECT&&it.getReference<FieldReference>()?.let {f->f.definingClass==request.type&&implementsType(f.type,"Lcom/google/protobuf/MessageLite;")}==true}?.getReference<FieldReference>()?:throw PatchException("Native playlist $label serialization contract missing")
            request.addInterfaceMethod(findInterfaceMethod(REQUEST,getter),2,"""
                iget-object v0, p0, $field
                if-eqz v0, :empty
                invoke-virtual { v0 }, ${field.type}->toByteArray()[B
                move-result-object v0
                return-object v0
                :empty
                const/4 v0, 0x0
                return-object v0
            """)
        }
        val nativeProto=resolveProto(protoField.type,"native playlist browse response")
        val constructor=response.methods.singleOrNull {it.name=="<init>"&&it.parameterTypes==listOf(nativeProto.type)}?:throw PatchException("Native playlist response constructor changed")
        constructor.accessFlags=(constructor.accessFlags and (AccessFlags.PRIVATE.value or AccessFlags.PROTECTED.value).inv()) or AccessFlags.PUBLIC.value
        response.accessFlags=response.accessFlags or AccessFlags.PUBLIC.value
        val pages=mutableClassDefBy(PAGES)
        pages.methods.removeAll {it.name=="decode"&&it.parameterTypes==listOf("[B")}
        pages.addBridge("decode",listOf("[B"),"Ljava/lang/Object;",4,AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,"""
            ${nativeProto.decode("p0","v0")}
            new-instance v2, ${response.type}
            invoke-direct { v2, v0 }, $constructor
            return-object v2
        """)
        val sendMethod=nativeClient.methods.single {it.name==send.name&&it.parameterTypes==send.parameterTypes&&it.returnType==send.returnType}
        val normalized=sendMethod.implementation!!.instructions.withIndex().mapNotNull {(index,i)->
            val ref=i.getReference<MethodReference>()?:return@mapNotNull null
            if(i.opcode==Opcode.INVOKE_DIRECT&&ref.definingClass==nativeClient.type&&ref.parameterTypes==listOf(request.type)&&ref.returnType=="V")index to ref else null
        }.singleOrNull()?:throw PatchException("Native playlist request interceptor contract changed")
        val delegateName="bdcrusher_nativePlaylistBrowse"
        if(nativeClient.methods.any {it.name==delegateName})throw PatchException("Duplicate native playlist transport integration")
        val delegate=MutableMethod(ImmutableMethod(nativeClient.type,delegateName,sendMethod.parameters,sendMethod.returnType,
            AccessFlags.PRIVATE.value or AccessFlags.FINAL.value or AccessFlags.SYNTHETIC.value,sendMethod.annotations,sendMethod.hiddenApiRestrictions,MutableMethodImplementation(sendMethod.implementation!!)))
        delegate.removeInstruction(normalized.first)
        nativeClient.methods.add(delegate)
        nativeClient.methods.remove(sendMethod)
        // Run interceptors exactly once before cache identity, outside the transport's own trace scope.
        // Hold one immutable snapshot for BOTH lookup and observation even if transport mutates builders.
        nativeClient.addBridge(send.name,send.parameterTypes.map {it.toString()},send.returnType,6,sendMethod.accessFlags,"""
            invoke-direct/range { p0 .. p1 }, ${normalized.second}
            invoke-static/range { p1 .. p1 }, $PAGES->snapshot($REQUEST)$SNAPSHOT
            move-result-object v1
            invoke-static { v1 }, $PAGES->cached($SNAPSHOT)Lcom/google/common/util/concurrent/ListenableFuture;
            move-result-object v0
            if-nez v0, :result
            invoke-direct/range { p0 .. p2 }, $delegate
            move-result-object v0
            invoke-static { v0, v1 }, $PAGES->observe(Lcom/google/common/util/concurrent/ListenableFuture;$SNAPSHOT)Lcom/google/common/util/concurrent/ListenableFuture;
            move-result-object v0
            :result
            return-object v0
        """)
        // The verified Elements image source goes through the native Uri loader, including local URIs.
        PlaylistImageLoader.clearMatch();val image=PlaylistImageLoader.method
        val loads=image.implementation!!.instructions.withIndex().filter {(_,i)->i.opcode==Opcode.INVOKE_VIRTUAL&&i.getReference<MethodReference>()?.parameterTypes==listOf("Landroid/net/Uri;")}
        val load=loads.singleOrNull()?:throw PatchException("Native playlist artwork Uri loader changed")
        val uri=(load.value as FiveRegisterInstruction).registerD
        image.addInstruction(load.index,"invoke-static/range { v$uri .. v$uri }, $ARTWORK->local(Landroid/net/Uri;)Landroid/net/Uri;")
        image.addInstruction(load.index+1,"move-result-object v$uri")
        var provider=classDefBy("Lcom/google/android/apps/youtube/music/util/MusicFileProviderCompat;")
        val adapters=mutableListOf<MethodReference>()
        while(true){
            adapters+=provider.methods.filter {AccessFlags.STATIC.isSet(it.accessFlags)&&it.parameterTypes==listOf("Landroid/content/Context;","Ljava/lang/String;","Ljava/io/File;")&&it.returnType=="Landroid/net/Uri;"}
            provider=provider.superclass?.let {classDefByOrNull(it)}?:break
        }
        val adapter=adapters.singleOrNull()?:throw PatchException("Native playlist FileProvider adapter changed")
        val owner=mutableClassDefBy(adapter.definingClass);owner.accessFlags=owner.accessFlags or AccessFlags.PUBLIC.value
        val nativeAdapter=owner.methods.single {it.name==adapter.name&&it.parameterTypes==adapter.parameterTypes};nativeAdapter.accessFlags=(nativeAdapter.accessFlags and (AccessFlags.PRIVATE.value or AccessFlags.PROTECTED.value).inv()) or AccessFlags.PUBLIC.value
        val art=mutableClassDefBy(ARTWORK);art.methods.removeAll {it.name=="fileUri"&&it.parameterTypes==adapter.parameterTypes}
        art.addBridge("fileUri",adapter.parameterTypes.map {it.toString()},adapter.returnType,3,AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,"""
            invoke-static/range { p0 .. p2 }, $adapter
            move-result-object p0
            return-object p0
        """)
        PlaylistRowSchema.clearMatch()
        val rowDefaults=PlaylistRowSchema.originalMethod.implementation!!.instructions.mapNotNull {it.getReference<FieldReference>()}.filter {it.type==it.definingClass&&implementsType(it.type,"Lcom/google/protobuf/MessageLite;")}.distinct()
        if(rowDefaults.size!=2)throw PatchException("Native playlist row extension schema changed")
        val rowProto=resolveProto(rowDefaults.last().type,"native playlist row")
        val rowBinders=mutableListOf<com.android.tools.smali.dexlib2.iface.Method>()
        classDefForEach {c->rowBinders+=c.methods.filter {it.implementation!=null&&it.returnType=="V"&&it.parameterTypes.size==3&&it.parameterTypes[1]==rowProto.type&&it.parameterTypes[2]=="I"&&it.parameterTypes[0].startsWith("L")&&!AccessFlags.STATIC.isSet(it.accessFlags)}}
        if(rowBinders.size!=2)throw PatchException("Native playlist row presenter contracts changed")
        val rows=mutableClassDefBy(ROWS)
        for((number,binder) in rowBinders.withIndex()){
            val presenterRow=mutableClassDefBy(binder.definingClass)
            val view=presenterRow.methods.singleOrNull {it.parameterTypes.isEmpty()&&it.returnType=="Landroid/view/View;"}?:throw PatchException("Native playlist row view ownership changed")
            presenterRow.interfaces.add(ROW_OWNER)
            presenterRow.addInterfaceMethod(findInterfaceMethod(ROW_OWNER,"bd_playlistRowView"),1,"invoke-virtual { p0 }, $view\nmove-result-object p0\nreturn-object p0")
            presenterRow.addInterfaceMethod(findInterfaceMethod(ROW_OWNER,"bd_playlistRow"),4,"""
                check-cast p1, ${binder.parameterTypes[0]}
                check-cast p2, ${rowProto.type}
                invoke-virtual/range { p0 .. p3 }, $binder
                return-void
            """)
            val rewrite="bd_playlistRow$number"
            rows.addBridge(rewrite,listOf(ROW_OWNER,"Ljava/lang/Object;",rowProto.type,"I"),rowProto.type,9,AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,"""
                invoke-virtual { p2 }, ${rowProto.type}->toByteArray()[B
                move-result-object v0
                invoke-static { p0, p1, p2, p3, v0 }, $ROWS->capture(${ROW_OWNER}Ljava/lang/Object;Ljava/lang/Object;I[B)[B
                move-result-object v0
                ${rowProto.decode("v0","v1")}
                return-object v1
            """)
            val bind=presenterRow.methods.single {it.name==binder.name&&it.parameterTypes==binder.parameterTypes}
            bind.addInstructions(0,"invoke-static/range { p0 .. p3 }, $ROWS->$rewrite(${ROW_OWNER}Ljava/lang/Object;${rowProto.type}I)${rowProto.type}\nmove-result-object p2")
        }
    }
    finalize {
        CommandResolverFingerprint.clearMatch()
        if(CommandResolverFingerprint.method.implementation!!.instructions.none {i->i.getReference<MethodReference>()?.let {it.definingClass=="Lapp/morphe/extension/music/patches/DownloadsPatch;"&&it.name=="commandResolverOnClick"}==true})throw PatchException("Download playlist requires the Downloads patch to be selected in Full or official Morphe 1.48.0.")
        val manager=mutableClassDefByOrNull("Lapp/morphe/extension/music/patches/downloads/LocalDownloadManager;")?:throw PatchException("Download playlist requires the compatible Morphe Downloads patch. Select Downloads in Full or official 1.48.0.")
        if(manager.methods.none {it.name=="enqueue"&&it.parameterTypes==listOf("Ljava/lang/String;")})throw PatchException("Unsupported Downloads enqueue contract; select compatible Morphe 1.48.0 Downloads")
        val download=manager.methods.singleOrNull {it.name=="downloadBlocking"&&it.parameterTypes.firstOrNull()=="Ljava/lang/String;"}?:throw PatchException("Unsupported typed download completion contract")
        val release=download.implementation!!.instructions.withIndex().filter {(_,i)->i.getReference<MethodReference>()?.let {it.definingClass=="Ljava/util/Set;"&&it.name=="remove"}==true}.map {it.index}
        if(release.isEmpty())throw PatchException("Native download completion/release contract missing")
        for(index in release.reversed())download.addInstruction(index+1,"invoke-static/range { p0 .. p0 }, $RUNTIME->finished(Ljava/lang/String;)V")
        val library=mutableClassDefByOrNull("Lapp/morphe/extension/music/patches/downloads/LocalDownloadsFragment;")?:throw PatchException("Compatible Morphe offline library is required")
        val view=library.methods.singleOrNull {it.name=="onCreateView"&&it.returnType=="Landroid/view/View;"}?:throw PatchException("Native offline library view contract missing")
        for(index in view.implementation!!.instructions.withIndex().filter {it.value.opcode==Opcode.RETURN_OBJECT}.map {it.index}.reversed()){
            val reg=(view.implementation!!.instructions.elementAt(index) as OneRegisterInstruction).registerA
            view.addInstruction(index,"invoke-static/range { v$reg .. v$reg }, Lapp/bdcrusher/ytmusic/playlists/PlaylistSettingsPage;->addLibraryAction(Landroid/view/View;)V")
        }
        CommandResolverFingerprint.method.cloneParameters().apply {
            mutableClassDefBy(parameterTypes[1].toString()).interfaces.add(COMMAND)
            addInstructionsWithLabels(0,"""
                invoke-static { p1 }, $RUNTIME->command($COMMAND)Z
                move-result v0
                if-eqz v0, :native_resolution
                return v0
                :native_resolution
                nop
            """)
        }
    }
}
