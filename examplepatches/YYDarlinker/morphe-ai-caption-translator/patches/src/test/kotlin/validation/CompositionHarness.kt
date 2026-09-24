package validation
import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.apk.ApkUtils.applyTo
import app.morphe.patcher.patch.*
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
    val roots=names.map { name->addon.single { it.name==name } }
    val output=file("output");check(!output.exists()){ "Use a new output directory" };output.mkdirs()
    val scratch=Files.createTempDirectory(output.toPath(),"session-").toFile()
    Patcher(PatcherConfig(apkFile=file("input"),temporaryFilesPath=scratch.resolve("patcher"),fileWorkspacePath=scratch.resolve("workspace"))).use { patcher ->
        val ai=names.contains("AI caption translator")
        // Native-only addons are intentionally exercised without selecting any official patch.
        val selected=if(ai) official.filter { p->p.default && (p.compatibility?.any { pkg ->
            pkg.packageName==null || pkg.packageName==patcher.context.packageMetadata.packageName && pkg.targets.any { target ->
                !target.isExperimental && (target.version==null||target.version==patcher.context.packageMetadata.versionName)
            }
        }?:true) }.toMutableList() else mutableListOf()
        if(ai)check(selected.any { it.name=="Captions" }) { "Official Captions missing" }
        selected.addAll(roots);patcher+=selected.toCollection(linkedSetOf())
        runBlocking { patcher().collect { result->
            if(result.exception!=null)throw IllegalStateException("Patch failed: ${result.patch.name}",result.exception)
            println("PASS ${result.patch.name?:"internal dependency"}")
        } }
        val contextField=patcher.context.javaClass.getDeclaredField("bytecodeContext").apply { isAccessible=true }
        val bytecode=contextField.get(patcher.context) as BytecodePatchContext
        val flags=bytecode.classDefBy("Lapp/yydarlinker/deepseekcaptions/CaptionAddonSupport;")
        val expected=mapOf("aiInstalled" to ai,"simplifiedInstalled" to names.contains("Add Simplified Chinese to auto-translate"),"memoryInstalled" to names.contains("Remember caption selection"))
        for((name,on) in expected){
            val method=flags.methods.single { it.name==name }
            val literal=method.implementation!!.instructions.filterIsInstance<com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction>().single().wideLiteral
            check(literal==(if(on)1L else 0L)){"Incorrect feature flag: $name"}
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
        check(((hooks["augmentTranslations"]?:0)>0)==expected.getValue("simplifiedInstalled"))
        check(((hooks["augmentMetadata"]?:0)>0)==expected.getValue("simplifiedInstalled"))
        check(((hooks["resolveRemembered"]?:0)>0)==expected.getValue("memoryInstalled"))
        check(((hooks["suppressNativeDraw"]?:0)>0)==ai)
        check((hooks["initialize"]?:0)==1){"Duplicate shared initialization"}
        check((hooks["onNativeTrackApplied"]?:0)==1){"Shared automatic/manual caption dispatcher must be hooked"}
        check((hooks["onNativeSelectionWithReason"]?:0)==0 && (hooks["onNativeSelection"]?:0)==0){"Obsolete manual-only hooks must not duplicate capture"}

        if(ai){check((hooks["onMenu"]?:0)==1);check((hooks["observeMenuPath"]?:0)==1)}
        output.resolve("structure.txt").writeText("features=$expected\nhooks=$hooks\n")
        output.resolve("selection.txt").writeText(names.joinToString("\n"))
        if(values["compile"]=="false"){println("STRUCTURE_PASS ${names.joinToString()}");return@use}
        val result=patcher.get();val apk=output.resolve("patched-unsigned.apk");Files.copy(file("input").toPath(),apk.toPath());result.applyTo(apk)
        output.resolve("selection.txt").writeText(names.joinToString("\n"))
        println("COMPOSITION_PASS ${names.joinToString()} APK=${apk.absolutePath}")
    }
}
