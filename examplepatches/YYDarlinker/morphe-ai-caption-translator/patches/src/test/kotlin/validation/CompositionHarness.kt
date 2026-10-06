package validation
import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.apk.ApkUtils.applyTo
import app.morphe.patcher.patch.*
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import kotlinx.coroutines.runBlocking
import java.io.File
import java.nio.file.Files

/** Each invocation is a fresh JVM/session, loading both actual MPPs without parent source output. */
fun main(args:Array<String>){
    val values=args.toList().chunked(2).associate { it[0].removePrefix("--") to it[1] }
    fun file(key:String)=File(values.getValue(key)).canonicalFile
    fun load(key:String)=loadPatchesFromJar(setOf(file(key))).byPatchesFile.getValue(file(key))
    val official=load("official");val addon=load("addon")
    val names=values.getValue("selection").split("|").filter { it.isNotBlank() }
    val roots=names.map { name->addon.singleOrNull { it.name==name } ?:error("Unknown caption root: $name") }
    val output=file("output");check(!output.exists()){ "Use a new output directory" };output.mkdirs()
    val scratch=Files.createTempDirectory(output.toPath(),"session-").toFile()
    var failure:Throwable?=null
    Patcher(PatcherConfig(apkFile=file("input"),temporaryFilesPath=scratch.resolve("patcher"),fileWorkspacePath=scratch.resolve("workspace"))).use { patcher ->
        val ai=names.contains("AI caption translator")
        // Native-only addons are intentionally exercised without selecting any official patch.
        val selected=if(ai) official.filter { p->p.default && (p.compatibility?.any { pkg ->
            pkg.packageName==null || pkg.packageName==patcher.context.packageMetadata.packageName && pkg.targets.any { target ->
                !target.isExperimental && (target.version==null||target.version==patcher.context.packageMetadata.versionName)
            }
        }?:true) }.toMutableList() else mutableListOf()
        if(ai)check(selected.any { it.name=="Captions" }) { "Official Captions missing" }
        output.resolve("official-defaults.txt").writeText(selected.joinToString("\n") {it.name?:"internal"}+"\n")
        check(selected.none {it.name=="Spoof signature"}) {"A default=false Spoof signature must not be enabled"}
        selected.addAll(roots)
        val fault=values["fault"]
        if(fault in listOf("menu_unknown","menu_duplicate")) {
            val faultPatch=bytecodePatch(name="N29 controlled $fault",default=false) {
                dependsOn(*selected.toTypedArray())
                execute {
                    val cls=mutableClassDefBy("Lapp/morphe/extension/youtube/patches/components/PlayerFlyoutMenuComponentsFilter;")
                    val method=cls.methods.single { it.name=="isFiltered" }
                    val params=method.parameters.map { p -> com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter(
                        if(p.type=="Ljava/lang/CharSequence;")"Ljava/lang/Object;" else p.type,p.annotations,p.name) }
                    val bad=com.android.tools.smali.dexlib2.immutable.ImmutableMethod(cls.type,method.name,params,method.returnType,method.accessFlags,method.annotations,method.hiddenApiRestrictions,method.implementation)
                    if(fault=="menu_unknown")cls.methods.remove(method)
                    cls.methods.add(bad.toMutable())
                }
            }
            selected.add(faultPatch)
        }
        patcher+=selected.toCollection(linkedSetOf())
        runBlocking { patcher().collect { result->
            if(result.exception!=null) { failure=result.exception;println("PATCH_FAILURE ${result.patch.name}: ${result.exception}") }
            else println("PASS ${result.patch.name?:"internal dependency"}")
        } }
        val contextField=patcher.context.javaClass.getDeclaredField("bytecodeContext").apply { isAccessible=true }
        val bytecode=contextField.get(patcher.context) as BytecodePatchContext
        fun serializeDexSnapshot() {
            java.util.zip.ZipOutputStream(output.resolve("serialized-dex.zip").outputStream()).use { zip ->
                @Suppress("UNCHECKED_CAST")
                val dexes=bytecode.javaClass.getMethod("get").invoke(bytecode) as Set<app.morphe.patcher.PatcherResult.PatchedDexFile>
                for(dex in dexes) {
                    zip.putNextEntry(java.util.zip.ZipEntry(dex.name));dex.stream.use {it.copyTo(zip)};zip.closeEntry()
                }
            }
            println("REAL_PATCHER_DEX_SERIALIZED ${output.resolve("serialized-dex.zip").absolutePath}")
        }
        val flags=bytecode.classDefBy("Lapp/yydarlinker/deepseekcaptions/CaptionAddonSupport;")
        val expected=mapOf("aiInstalled" to ai,"simplifiedInstalled" to names.contains("Add Simplified Chinese to auto-translate"),"memoryInstalled" to names.contains("Remember caption selection"))
        for((name,on) in expected){
            val method=flags.methods.single { it.name==name }
            val literal=method.implementation!!.instructions.filterIsInstance<com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction>().single().wideLiteral
            if(failure==null)check(literal==(if(on)1L else 0L)){"Incorrect feature flag: $name"}
        }
        val hooks=mutableMapOf<String,Int>()
        bytecode.classDefForEach { initial ->
            if(!initial.type.startsWith("Lapp/yydarlinker/")){
                val cls=bytecode.classDefBy(initial.type)
                for(method in cls.methods)for(ins in method.implementation?.instructions?:emptyList()){
                    val ref=(ins as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference as? com.android.tools.smali.dexlib2.iface.reference.MethodReference ?:continue
                    if(ref.definingClass.startsWith("Lapp/yydarlinker/deepseekcaptions/"))hooks[ref.name]=(hooks[ref.name]?:0)+1
                }
            }
        }
        if(failure!=null) {
            val actual=flags.methods.filter { it.name.endsWith("Installed") }.associate { m -> m.name to m.implementation!!.instructions.filterIsInstance<com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction>().single().wideLiteral }
            output.resolve("failure-structure.txt").writeText("features=$actual\nhooks=$hooks\nexception=$failure\n")
            if(values["dex-only"]=="true")serializeDexSnapshot()
            if(values["compile-failed"]=="true") {
                val result=patcher.get();val apk=output.resolve("failed-partial-unsigned.apk");Files.copy(file("input").toPath(),apk.toPath());result.applyTo(apk)
                println("FAILED_PARTIAL_SERIALIZED ${apk.absolutePath}")
            }
            throw IllegalStateException("Patch failed; real partial state preserved",failure)
        }
        check(((hooks["augmentTranslations"]?:0)>0)==(ai || expected.getValue("simplifiedInstalled"))){"N30 AI root must include the generic language-menu seam"}
        check(((hooks["augmentMetadata"]?:0)>0)==(ai || expected.getValue("simplifiedInstalled"))){"N30 AI root must include generic translation metadata"}
        check(((hooks["resolveRemembered"]?:0)>0)==expected.getValue("memoryInstalled"))
        check(((hooks["suppressNativeDraw"]?:0)>0)==ai)
        check((hooks["initialize"]?:0)==1){"Duplicate shared initialization"}
        check((hooks["onNativeTrackApplied"]?:0)==1){"Shared automatic/manual caption dispatcher must be hooked"}
        check((hooks["onNativeSelectionWithReason"]?:0)==0 && (hooks["onNativeSelection"]?:0)==0){"Obsolete manual-only hooks must not duplicate capture"}

        if(ai){check((hooks["onMenu"]?:0)==1);check((hooks["observeMenuPath"]?:0)==1)}
        output.resolve("structure.txt").writeText("features=$expected\nhooks=$hooks\n")
        output.resolve("selection.txt").writeText(names.joinToString("\n"))
        if(values["dex-only"]=="true")serializeDexSnapshot()
        if(values["compile"]=="false"){println("STRUCTURE_PASS ${names.joinToString()}");return@use}
        val result=patcher.get();val apk=output.resolve("patched-unsigned.apk");Files.copy(file("input").toPath(),apk.toPath());result.applyTo(apk)
        output.resolve("selection.txt").writeText(names.joinToString("\n"))
        println("COMPOSITION_PASS ${names.joinToString()} APK=${apk.absolutePath}")
    }
}
