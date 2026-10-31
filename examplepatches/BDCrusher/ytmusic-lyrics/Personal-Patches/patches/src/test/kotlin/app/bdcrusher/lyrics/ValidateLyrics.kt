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
    require(hash == "9c38d63907362715f6172545bcb36f11ddbd45f014938626068016f06dcc3c56") { "Unexpected original APK: $hash" }
    val officialFirst=args.size==5&&args[3]=="official-first"
    val firstOfficial=if(officialFirst)loadPatchesFromJar(setOf(File(args[4])))else emptySet()
    val patches=loadPatchesFromJar(setOf(bundle))
    val isAddon=args.size==5
    val lyrics=patches.filter { it.name?.startsWith("Third-party lyrics")==true && it.compatibility?.any { c->c.packageName=="com.google.android.apps.youtube.music" }==true }
    require(lyrics.size==1) { "Expected one personal lyrics entry" }
    var officialHash=""
    val official=if(isAddon){officialHash=digest(File(args[4]));if(officialFirst)firstOfficial else loadPatchesFromJar(setOf(File(args[4])))}else emptySet()
    val officialSelected=official.filter { p->p.default&&p.compatibility?.any {it.packageName=="com.google.android.apps.youtube.music"}==true&&(p.name!="Third-party lyrics"||args[3]=="conflict")}
    val selected=when(args[3]){
        "lyrics","missing-official"->lyrics.toSet()
        "addon-first"->(lyrics+officialSelected).toSet()
        "official-first","conflict"->(officialSelected+lyrics).toSet()
        else->patches.filter { p->p.default&&p.compatibility?.any {it.packageName=="com.google.android.apps.youtube.music"}==true}.toSet()
    }
    val sdk=File(System.getenv("ANDROID_HOME") ?: error("ANDROID_HOME is required"))
    workspace.mkdirs()
    val catalog=lyrics.joinToString(",") { patch->
        val c=patch.compatibility!!.single {it.packageName=="com.google.android.apps.youtube.music"}
        val targets=c.targets.joinToString(",") {t->"""{"version":${quote(t.version?:"")},"minSdk":${t.minSdk},"experimental":${t.isExperimental},"versionCodes":${quote(t.versionCodes.toString())}}"""}
        """{"name":${quote(patch.name?:"")},"description":${quote(patch.description?:"")},"package":${quote(c.packageName?:"")},"targets":[$targets]}"""
    }
    workspace.resolve("lyrics-catalog.json").writeText("""{"bundleSha256":${quote(bundleHash)},"patches":[$catalog]}""")
    if(args[3]=="catalog"){println("PASS: compiled catalog exported");return}
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
        if(args[3]!="conflict"&&args[3]!="missing-official")throw ex
        val messages=generateSequence(ex as Throwable?){it.cause}.mapNotNull {it.message}.joinToString(" | ")
        require(if(args[3]=="conflict")messages.contains("Two lyrics patches selected")else messages.contains("Missing official Morphe runtime")){"Unexpected negative failure: "+messages}
        workspace.resolve("verification.json").writeText("""{"expectedFailure":true,"mode":${quote(args[3])},"bundleSha256":${quote(bundleHash)},"officialSha256":${quote(officialHash)},"reason":${quote(messages)}}""")
        println("PASS: expected actionable rejection: "+args[3]);return
    }
    require(args[3]!="conflict"&&args[3]!="missing-official"){"Invalid selection was accepted"}
    ZipFile(output).use { zip ->
        val required=listOf("index.html","renderer.js","lyrics.css","variables.css","host.css","Satoshi-Variable.woff2")
        ZipFile(bundle).use { packed ->
            required.forEach { name ->
                val asset=zip.getEntry("assets/bdcrusher-lyrics/$name") ?: error("Missing lyric asset $name")
                val source=packed.getEntry("bdcrusher-lyrics/$name") ?: error("Missing bundle asset $name")
                require(zip.getInputStream(asset).readBytes().contentEquals(packed.getInputStream(source).readBytes())) { "Changed asset $name" }
            }
        }
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
        require(metadataHooks>0&&playbackHooks>0) { "Missing playback hooks: $metadataHooks / $playbackHooks" }
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
