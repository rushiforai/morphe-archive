/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.lyrics

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.apk.ApkUtils.applyTo
import app.morphe.patcher.dex.SdkDexVerifier
import app.morphe.patcher.patch.loadPatchesFromJar
import kotlinx.coroutines.runBlocking
import java.io.File
import java.security.MessageDigest
import java.util.zip.ZipFile
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** Real APK application, compiled DEX verification and asset/settings contract audit. No signing. */
private fun digest(file: File)=file.inputStream().use { input ->
    val digest=MessageDigest.getInstance("SHA-256");val bytes=ByteArray(65536)
    while(true){val read=input.read(bytes);if(read<0)break;digest.update(bytes,0,read)}
    digest.digest().joinToString(""){"%02x".format(it)}
}
private fun quote(value: String)="\""+value.replace("\\","\\\\").replace("\"","\\\"").replace("\n","\\n").replace("\r","\\r").replace("\t","\\t")+"\""
fun main(args: Array<String>) {
    require(args.size in 4..5) { "input.apk bundle.mpp new-work-directory lyrics|defaults" }
    val input=File(args[0]).canonicalFile
    val bundle=File(args[1]).canonicalFile
    val workspace=File(args[2]).canonicalFile
    val permitted=File(System.getProperty("user.dir")).canonicalFile.parentFile
    require(workspace.toPath().startsWith(permitted.toPath())) { "Workspace outside YT-Music" }
    require(!workspace.exists()) { "Verification requires an unused directory" }
    val hash=digest(input)
    val bundleHash=digest(bundle)
    require(hash in setOf("9c38d63907362715f6172545bcb36f11ddbd45f014938626068016f06dcc3c56","da28424a01714090f392f963c2d822dff10eed9dc397b443e3e34e3691cf4dd9")) { "Unexpected original APK: $hash" }
    val featureMode=args[3].contains("features")||args[3].contains("shaders")||args[3].contains("playlists")
    val noPersonal=args[3].startsWith("standalone-")||args[3].startsWith("without-lyrics")
    val officialFirst=args.size==5&&args[3].contains("official-first")
    val firstOfficial=if(officialFirst)loadPatchesFromJar(setOf(File(args[4])))else emptySet()
    val patches=loadPatchesFromJar(setOf(bundle))
    val targetVersion=if(hash.startsWith("da28424"))"9.43.51" else "9.42.52"
    // Model Manager's version-specific selection instead of forcing incompatible patches.
    val available=patches.filter {p->p.compatibility?.any {c->c.packageName=="com.google.android.apps.youtube.music" && c.targets.any {it.version==null||it.version==targetVersion}}==true}.toSet()
    val isAddon=args.size==5
    val allLyrics=patches.filter { it.name?.startsWith("Third-party lyrics")==true && it.compatibility?.any { c->c.packageName=="com.google.android.apps.youtube.music" }==true }
    val combined=allLyrics.size==2
    val fullOnly=allLyrics.size==1&&allLyrics.single().category=="Full Collection"
    if(fullOnly)require(patches.filter {it.name!=null&&it.compatibility?.any {c->c.packageName=="com.google.android.apps.youtube.music"}==true}.all {it.category in setOf("Full Collection","Shaders","Playlist downloads")}){"Retired add-on category remains"}
    val addonMode=isAddon||args[3] in setOf("missing-official","editions-both","editions-reverse","addon-full-other")
    val lyrics=if(combined)allLyrics.filter { (it.category=="Lyrics-only Add-on")==addonMode }else allLyrics
    require(lyrics.size==1) { "Expected one personal lyrics entry" }
    if(combined){
        require(allLyrics.map {it.category}.toSet()==setOf("Full Collection","Lyrics-only Add-on"))
        require(!allLyrics.single {it.category=="Lyrics-only Add-on"}.default)
        val uncategorized=patches.filter {it.name!=null&&it.compatibility?.any {c->c.packageName=="com.google.android.apps.youtube.music"}==true&&it.category !in setOf("Full Collection","Lyrics-only Add-on","Shaders","Playlist downloads")}
        require(uncategorized.isEmpty()) { "Missing categories: "+uncategorized.joinToString {it.name.orEmpty()} }
    }
    var officialHash=""
    val official=if(isAddon){officialHash=digest(File(args[4]));if(officialFirst)firstOfficial else loadPatchesFromJar(setOf(File(args[4])))}else emptySet()
    val officialSelected=official.filter { p->(!args[3].contains("missing-downloads")||p.name!="Downloads")&&p.default&&p.compatibility?.any {it.packageName=="com.google.android.apps.youtube.music"}==true&&(p.name!="Third-party lyrics"||args[3]=="conflict"||noPersonal)}
    val selected=if(featureMode){
        val features=patches.filter {it.name=="Shaders"&& !args[3].contains("playlists-only")||it.name=="Download playlist"&&!args[3].contains("shaders-only")}
        val full=available.filter {p->p.default&&p.compatibility?.any {it.packageName=="com.google.android.apps.youtube.music"}==true&&(!args[3].contains("missing-downloads")||p.name!="Downloads")}
        val base=if(noPersonal&&fullOnly)full.filter {it.name!="Third-party lyrics"}else if(noPersonal)officialSelected else if(isAddon)officialSelected+lyrics else full
        if(officialFirst)(base+features).toSet()else(features+base).toSet()
    }else when(args[3]){
        "jam-unsupported"->(available.filter {it.default}+patches.single {it.name=="Jam queue sharing"}).toSet()
        "lyrics","missing-official"->lyrics.toSet()
        "addon-first"->(lyrics+officialSelected).toSet()
        "official-first","conflict"->(officialSelected+lyrics).toSet()
        "editions-both"->allLyrics.toSet()
        "editions-reverse"->allLyrics.reversed().toSet()
        "addon-full-other"->(lyrics+patches.single {it.name=="Hide ads"&&it.compatibility?.any {c->c.packageName=="com.google.android.apps.youtube.music"}==true}).toSet()
        else->available.filter { p->p.default&&p.compatibility?.any {it.packageName=="com.google.android.apps.youtube.music"}==true}.toSet()
    }
    val sdk=File(System.getenv("ANDROID_HOME") ?: error("ANDROID_HOME is required"))
    workspace.mkdirs()
    if(combined||fullOnly){
        val music=patches.filter {it.name!=null&&it.compatibility?.any {c->c.packageName=="com.google.android.apps.youtube.music"}==true}
        workspace.resolve("categories.json").writeText("""{"bundleSha256":${quote(bundleHash)},"patches":[${music.joinToString(",") {p->"""{"name":${quote(p.name!!)},"category":${quote(p.category?:"")},"default":${p.default}}"""}}]}""")
    }
    val catalog=lyrics.joinToString(",") { patch->
        val c=patch.compatibility!!.single {it.packageName=="com.google.android.apps.youtube.music"}
        val targets=c.targets.joinToString(",") {t->"""{"version":${quote(t.version?:"")},"minSdk":${t.minSdk},"experimental":${t.isExperimental},"versionCodes":${quote(t.versionCodes.toString())}}"""}
        """{"name":${quote(patch.name?:"")},"description":${quote(patch.description?:"")},"package":${quote(c.packageName?:"")},"targets":[$targets]}"""
    }
    workspace.resolve("lyrics-catalog.json").writeText("""{"bundleSha256":${quote(bundleHash)},"patches":[$catalog]}""")
    if(args[3]=="catalog"){
        val music=patches.filter {it.name!=null&&it.compatibility?.any {c->c.packageName=="com.google.android.apps.youtube.music"}==true}
        val metadata=music.joinToString(",") {p-> val c=p.compatibility!!.single {it.packageName=="com.google.android.apps.youtube.music"};val targets=c.targets.joinToString(",") {t->"""{"version":${quote(t.version?:"")},"experimental":${t.isExperimental},"versionCodes":${quote(t.versionCodes.toString())}}"""};"""{"name":${quote(p.name!!)},"targets":[$targets]}"""}
        require(music.single {it.name=="Jam queue sharing"}.compatibility!!.single().targets.map {it.version}==listOf("9.42.52"))
        for(name in listOf("Third-party lyrics","Shaders","Download playlist"))require(music.single {it.name==name}.compatibility!!.single().targets.map {it.version}.toSet()==setOf("9.42.52","9.43.51"))
        workspace.resolve("target-metadata.json").writeText("""{"passed":true,"bundleSha256":${quote(bundleHash)},"patches":[$metadata]}""")
        println("PASS: compiled catalog and exact per-patch targets exported");return
    }
    val output=workspace.resolve("verified-unsigned.apk")
    try {
    Patcher(PatcherConfig(input,workspace.resolve("patcher"),verifier=SdkDexVerifier(sdk))).use { patcher ->
        patcher += selected
        runBlocking { patcher().collect { result->
            result.exception?.let { throw it }
            println("APPLIED: ${result.patch.name ?: "dependency"}")
        } }
        patcher.get().applyTo(output)
    }
    }catch(ex:Exception){
        val editionConflict=args[3] in setOf("editions-both","editions-reverse","addon-full-other")
        if(args[3]!="conflict"&&args[3]!="missing-official"&&!editionConflict&&!args[3].contains("missing-downloads")&&args[3]!="jam-unsupported")throw ex
        val messages=generateSequence(ex as Throwable?){it.cause}.mapNotNull {it.message}.joinToString(" | ")
        require(if(args[3]=="jam-unsupported")messages.contains("Jam queue sharing currently supports 9.42.52 only")else if(args[3].contains("missing-downloads"))messages.contains("requires the Downloads patch")else if(editionConflict)messages.contains("Choose one personal edition")else if(args[3]=="conflict")messages.contains("Two lyrics patches selected")else messages.contains("Missing official Morphe runtime")||messages.contains("Select compatible Morphe Music settings")){"Unexpected negative failure: "+messages}
        workspace.resolve("verification.json").writeText("""{"expectedFailure":true,"mode":${quote(args[3])},"bundleSha256":${quote(bundleHash)},"officialSha256":${quote(officialHash)},"reason":${quote(messages)}}""")
        println("PASS: expected actionable rejection: "+args[3]);return
    }
    require(!args[3].contains("missing-downloads")&&args[3] !in setOf("conflict","missing-official","editions-both","editions-reverse","addon-full-other")){"Invalid selection was accepted"}
    ZipFile(output).use { zip ->
        val required=if(noPersonal)emptyList()else listOf("index.html","renderer.js","lyrics.css","variables.css","host.css","Satoshi-Variable.woff2")
        ZipFile(bundle).use { packed ->
            required.forEach { name ->
                val asset=zip.getEntry("assets/bdcrusher-lyrics/$name") ?: error("Missing lyric asset $name")
                val source=packed.getEntry("bdcrusher-lyrics/$name") ?: error("Missing bundle asset $name")
                require(zip.getInputStream(asset).readBytes().contentEquals(packed.getInputStream(source).readBytes())) { "Changed asset $name" }
            }
        }
        require(zip.getEntry("assets/bdcrusher-features/NOTICE.txt")!=null){"Missing shared personal feature notices"}
        for((feature,name) in listOf("shaders" to "Shaders","playlists" to "Download playlist")){
            require((zip.getEntry("assets/bdcrusher-features/$feature.enabled")!=null)==selected.any {it.name==name}){"Incorrect feature activation: $feature"}
        }
        if(selected.any {it.name=="Shaders"})for(name in listOf("index.html","shaders.js"))require(zip.getEntry("assets/bdcrusher-shaders/$name")!=null){"Missing Shaders asset $name"}
        val owned=mutableSetOf<String>()
        val personalCalls=mutableMapOf<String,MutableSet<String>>()
        val definitions=mutableSetOf<String>();var metadataHooks=0;var playbackHooks=0
        zip.entries().asSequence().filter { it.name.matches(Regex("classes[0-9]*\\.dex")) }.forEach { entry ->
            val dex=DexBackedDexFile.fromInputStream(null,zip.getInputStream(entry).buffered())
            for(definition in dex.classes){
                require(definitions.add(definition.type)){"Duplicate output class: "+definition.type}
                if(definition.type.startsWith("Lapp/bdcrusher/"))owned+=definition.type
                for(method in definition.methods)for(instruction in method.implementation?.instructions ?: emptyList()){
                    val reference=(instruction as? ReferenceInstruction)?.reference as? MethodReference ?: continue
                    if(definition.type.startsWith("Lapp/bdcrusher/")&&reference.definingClass.startsWith("Lapp/bdcrusher/")){
                        personalCalls.getOrPut(definition.type+"->"+method.name){mutableSetOf()}.add(reference.definingClass+"->"+reference.name)
                    }
                    if(reference.definingClass=="Lapp/morphe/extension/music/patches/lyrics/LyricsPatch;"){
                        if(reference.name=="onSetMetadata")metadataHooks++
                        if(reference.name=="onSetPlaybackState")playbackHooks++
                    }
                }
            }
        }
        require("Lapp/bdcrusher/ytmusic/lyrics/BetterLyricsPanelView;" in owned)
        require("Lapp/bdcrusher/ytmusic/lyrics/BetterLyricsPreference;" in owned)
        require(noPersonal||metadataHooks>0&&playbackHooks>0) { "Missing playback hooks: $metadataHooks / $playbackHooks" }
        val panel="Lapp/bdcrusher/ytmusic/lyrics/BetterLyricsPanelView;->"
        fun reachesSettings(method: String,seen: MutableSet<String> = mutableSetOf()): Boolean {
            if(method==panel+"applySettings")return true
            if(!seen.add(method))return false
            return personalCalls[method].orEmpty().any { reachesSettings(it,seen) }
        }
        for(callback in listOf("syncOverlay","onVisibilityChanged","onWindowVisibilityChanged")){
            require(!reachesSettings(panel+callback)) { "Visibility acknowledgement feeds renderer configuration: $callback" }
        }
        println("AUDIT: ${owned.size} personal class definitions; metadata=$metadataHooks playback=$playbackHooks; bundle assets identical")
        val report="""{
          "inputSha256":${quote(hash)}, "bundleSha256":${quote(bundleHash)},
          "mode":${quote(args[3])}, "officialSha256":${quote(officialHash)}, "duplicateClasses":0, "selectedPatches":[${selected.joinToString(","){quote(it.name ?: "dependency")}}],
          "sdkDexVerification":true, "assetIdentity":true, "visibilityDoesNotReconfigure":true, "personalClassDefinitions":${owned.size},
          "metadataHooks":$metadataHooks, "playbackHooks":$playbackHooks,
          "outputUnsignedApkSha256":${quote(digest(output))}, "outputUnsignedApk":${quote(output.absolutePath)}
        }"""
        workspace.resolve("verification.json").writeText(report)
    }
    println("PASS: ${selected.size} selected patches; actual APK patching, SDK DEX verification, local asset audit")
    println("Retained unsigned inspection APK: $output")
}
