package app.zonghome.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.ResourcePatchContext
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private val themeTarget=Compatibility(
    name="My Zong",packageName="com.zong.customercare",apkFileType=ApkFileType.APK,
    appIconColor=0x80c342,targets=listOf(AppTarget(version="5.19.19.112"))
)

// Public get(res/*) resolves decoded XML; raw entries use Morphe's path-map aliases.
internal fun ResourcePatchContext.compiledFile(path: String): java.io.File {
    if (!path.startsWith("res/") && path != "AndroidManifest.xml") return get(path)
    if (path == "AndroidManifest.xml") {
        val decoded = get(path)
        if (decoded.isFile) return decoded
    }
    require(path.split('/').none { it == ".." }) { "Invalid resource path: $path" }
    val field=javaClass.getDeclaredField("resourceCoder").apply { isAccessible=true }
    val coder=field.get(this)
    val mapField=coder.javaClass.getDeclaredField("pathMap").apply { isAccessible=true }
    val pathMap=mapField.get(coder)
    val alias=(pathMap.javaClass.getMethod("getAlias",String::class.java)
        .invoke(pathMap,path) as? String) ?: path
    require((alias.startsWith("res/") || alias == "AndroidManifest.xml") && alias.split('/').none { it == ".." }) {
        "Unexpected resource alias: $path -> $alias"
    }
    val target=java.io.File(get("resources.arsc").parentFile,alias)
    if(!target.isFile) {
        val extract=coder.javaClass.getDeclaredMethod("extractRootEntries",String::class.java)
            .apply { isAccessible=true }
        // Keep the coder's original-entry tracking; never replace decoded XML with binary.
        extract.invoke(coder,if (path == "AndroidManifest.xml") path else "res")
    }
    check(target.isFile) { "Missing raw entry: $path (mapped to $alias)" }
    return target
}
internal val dialogWindowThemePatch=bytecodePatch {
    dependsOn(sharedExtensionPatch)
    execute {
        val dialogTypes=mutableMapOf<String,Boolean>()
        fun isDialog(type:String):Boolean {
            dialogTypes[type]?.let { return it }
            var current:String?=type;val seen=mutableSetOf<String>()
            while(current!=null && seen.add(current)) {
                if(current=="Landroid/app/Dialog;"){dialogTypes[type]=true;return true}
                current=classDefByOrNull(current)?.superclass
            }
            dialogTypes[type]=false;return false
        }
        data class Site(val type:String,val name:String,val parameters:List<String>,val result:String,val calls:List<Pair<Int,Int>>)
        val sites=mutableListOf<Site>()
        classDefForEach { cls ->
            if(!cls.type.startsWith("Lapp/zonghome/extension/")) for(method in cls.methods) {
                val calls=method.implementation?.instructions?.withIndex()?.mapNotNull { (index,ins) ->
                    val ref=(ins as? ReferenceInstruction)?.reference as? MethodReference
                    if(ref?.name!="show" || ref.returnType!="V" || ref.parameterTypes.isNotEmpty() ||
                       ins.opcode.name.contains("STATIC") || !isDialog(ref.definingClass)) null
                    else {
                        val receiver=when(ins) {
                            is FiveRegisterInstruction -> ins.registerC
                            is RegisterRangeInstruction -> ins.startRegister
                            else -> error("Unsupported dialog-show instruction")
                        }
                        index to receiver
                    }
                }?.toList().orEmpty()
                if(calls.isNotEmpty())sites+=Site(cls.type,method.name,method.parameterTypes.map { it.toString() },method.returnType,calls)
            }
        }
        check(sites.isNotEmpty()) { "No dialog window show sites found" }
        for(site in sites) {
            val method=mutableClassDefBy(site.type).methods.single {
                it.name==site.name && it.returnType==site.result && it.parameterTypes.map { p -> p.toString() }==site.parameters
            }
            for((index,register) in site.calls.asReversed())method.addInstruction(index+1,
                "invoke-static/range {v$register .. v$register}, Lapp/zonghome/extension/CharcoalTheme;->onDialogShown(Ljava/lang/Object;)V")
        }
    }
}
private val charcoalResourcesPatch=rawResourcePatch {
    execute {
        val editor=CharcoalResources()
        val table=compiledFile("resources.arsc")
        table.writeBytes(editor.table(table.readBytes()))
        var changed=0
        for(path in listApkEntries("res/").filter { it.endsWith(".xml") }) {
            val file=compiledFile(path)
            val before=file.readBytes();val after=editor.xml(before,path)
            if(!before.contentEquals(after)){file.writeBytes(after);changed++}
        }
        check(changed>0) { "No compiled XML theme changes found; refusing incomplete dark mode" }
    }
}

@Suppress("unused")
val charcoalDarkModePatch=bytecodePatch(
    name="Material You theme",
    description="Dark Material You colors on Android 12+, with automatic charcoal fallback on older or unsupported devices.",
    default=true
) {
    category("Appearance")
    compatibleWith(themeTarget)
    dependsOn(sharedExtensionPatch,charcoalResourcesPatch,dialogWindowThemePatch,rowStylingPatch,bundleUiThemePatch,onboardingUiHookPatch)
    val materialAccent by booleanOption(
        key="systemMaterialColors",title="Use wallpaper colors",
        description="Use Android 12+ system colors for surfaces, text, tracks and accents. Turn off to use charcoal. Missing system colors fall back automatically.",
        default=true,required=true
    )
    execute {
        val config=Fingerprint(
            definingClass="Lapp/zonghome/extension/CharcoalTheme;",name="useSystemAccent",
            returnType="Z",parameters=emptyList()
        ).method
        check(config.implementation!!.registerCount>=1)
        config.addInstructions(0,"const/4 v0, ${if(materialAccent==true) "0x1" else "0x0"}\nreturn v0")
        val create=Fingerprint(
            definingClass="Lcom/zong/customercare/base/BaseClass;",name="onCreate",
            returnType="V",parameters=emptyList()
        ).method
        val exits=create.implementation!!.instructions.withIndex().filter { it.value.opcode==Opcode.RETURN_VOID }.map { it.index }
        check(exits.isNotEmpty()) { "No application lifecycle exit for theme installation" }
        for(index in exits.reversed())create.addInstruction(index,
            "invoke-static/range {p0 .. p0}, Lapp/zonghome/extension/CharcoalTheme;->install(Landroid/app/Application;)V"
        )
    }
}

private val staticIntroImagePatch=rawResourcePatch {
    execute {
        if (!CustomizationSettings.enabled("skipIntro")) return@execute
        val path="res/layout/frag_splash.xml"
        val file=compiledFile(path);val editor=CharcoalResources()
        file.writeBytes(editor.xml(file.readBytes(),path,staticSplash=true))
    }
}

@Suppress("unused")
val skipAnimatedSplashPatch=bytecodePatch(
    name=null,
    description="Replace the full-screen GIF with a static logo and call its existing completion route without waiting for animation. Startup/session checks remain in place.",
    default=true
) {
    compatibleWith(themeTarget)
    dependsOn(staticIntroImagePatch)
    execute {
        if (!CustomizationSettings.enabled("skipIntro")) return@execute
        val cls="Lcom/zong/customercare/view/ui/FragSplash;"
        // Verify the exact .112 callback whose guarded body calls the normal e1 routing method.
        Fingerprint(definingClass=cls,name="accessartificialFrame",returnType="V",parameters=listOf(cls)).method
        Fingerprint(definingClass=cls,name="e1",returnType="V",parameters=emptyList()).method
        val animate=Fingerprint(definingClass=cls,name="coroutineBoundary",returnType="V",parameters=emptyList()).method
        val calls=animate.implementation!!.instructions.withIndex().mapNotNull { (index,instruction) ->
            val reference=(instruction as? ReferenceInstruction)?.reference as? MethodReference
            reference?.let { index to it }
        }
        val starts=calls.filter { (_,ref) -> ref.name=="start" && ref.parameterTypes.isEmpty() && ref.returnType=="V" }
        val saves=calls.filter { (_,ref) -> ref.name.startsWith("saveUserDetails") && ref.returnType=="V" }
        check(starts.size==1 && saves.size==1 && saves.single().first>starts.single().first) {
            "Unexpected .112 animation/session-save sequence; refusing to bypass startup"
        }
        // Keep the original splash-viewed/session-state writes in their original order.
        // Only stop GIF playback, then take the same guarded completion callback after saving.
        animate.addInstruction(saves.single().first+1,
            "invoke-static/range {p0 .. p0}, $cls->accessartificialFrame($cls)V"
        )
        animate.replaceInstruction(starts.single().first,"nop")
    }
}
