package gtade.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction3rc
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

val GTASA_DE = Compatibility(
    name = "GTA: SA",
    packageName = "com.rockstargames.gtasa.de",
    apkFileType = ApkFileType.APK,
    appIconColor = 0x1B1B1B,
    // The mods find the game's code by symbol names of this build.
    targets = listOf(AppTarget(version = "1.87.0")),
)

private const val ACTIVITY = "Lcom/epicgames/ue4/GameActivity;"
private const val BOOT_START = "Lgtade/boot/Boot;->start()V"

/** Bytes of a file bundled in this patches file under src/main/resources/gtade/. */
internal fun bundled(name: String): ByteArray =
    object {}.javaClass.getResourceAsStream("/gtade/$name")?.use { it.readBytes() }
        ?: throw PatchException("$name is missing from the patches file")

private val amlLibraryPatch = rawResourcePatch {
    execute { get("lib/arm64-v8a/libAML.so", false).writeBytes(bundled("libAML.so")) }
}

/**
 * Not listed on its own: every mod patch depends on it. GameActivity's static init loads UE4; right after that
 * gtade.boot.Boot.start() copies the bundled mods to Android/data/<game> and loads AML (Android Mod Loader).
 */
internal val modLoaderPatch = bytecodePatch {
    compatibleWith(GTASA_DE)
    dependsOn(amlLibraryPatch)
    extendWith("extensions/extension.mpe")

    execute {
        refreshExtensionClasses()
        val clinit = mutableClassDefBy(ACTIVITY).methods.first { it.name == "<clinit>" }
        val insns = clinit.instructions
        // A loadLibrary("AML") from the PC patcher (loader/patch_apk_aml.sh) would load AML before the mods sync, and an
        // already patched APK has the Boot.start() call this patch adds.
        for (i in insns.indices.reversed()) if (loadLibraryArg(insns, i) == "AML" || isBootStart(insns[i])) clinit.removeInstruction(i)
        val ue4 = insns.indices.filter { loadLibraryArg(insns, it) == "UE4" }
        if (ue4.size != 1) throw PatchException("expected one loadLibrary(\"UE4\") in GameActivity.<clinit>, found ${ue4.size}")
        clinit.addInstruction(ue4[0] + 1, "invoke-static {}, $BOOT_START")
    }
}

private fun isBootStart(ins: BuilderInstruction): Boolean {
    val ref = (ins as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    return ins.opcode == Opcode.INVOKE_STATIC && ref.definingClass == "Lgtade/boot/Boot;" && ref.name == "start"
}

/**
 * Re-patching an APK these patches already patched (Morphe Manager's installed-app source): the patcher merges the
 * extension into the app's existing gtade.boot classes and keeps their old method bodies, so the previous release's
 * Boot would run (seen on device: v1.1.1's Boot under v1.2.0, which deleted the Rubbish-DE pak). Replace those classes'
 * fields and methods with this patches file's extension.
 */
private fun BytecodePatchContext.refreshExtensionClasses() {
    val dex = object {}.javaClass.getResourceAsStream("/extensions/extension.mpe")?.use { it.readBytes() }
        ?: throw PatchException("extensions/extension.mpe is missing from the patches file")
    val classes: Set<ClassDef> =
        DexBackedDexFile.fromInputStream(Opcodes.getDefault(), java.io.BufferedInputStream(dex.inputStream())).classes
    for (ext in classes) {
        if (!ext.type.startsWith("Lgtade/")) continue
        val cls: MutableClass = mutableClassDefByOrNull(ext.type) ?: continue
        cls.directMethods.clear()
        cls.virtualMethods.clear()
        for (m in ext.methods) {
            val direct = m.name == "<init>" || m.name == "<clinit>" ||
                (m.accessFlags and (AccessFlags.STATIC.value or AccessFlags.PRIVATE.value)) != 0
            (if (direct) cls.directMethods else cls.virtualMethods).add(m.toMutable())
        }
        cls.staticFields.clear()
        cls.instanceFields.clear()
        for (f in ext.fields)
            (if ((f.accessFlags and AccessFlags.STATIC.value) != 0) cls.staticFields else cls.instanceFields).add(f.toMutable())
    }
}

/** The literal passed to System.loadLibrary at [i] (the last const-string into its register), or null. */
private fun loadLibraryArg(insns: List<BuilderInstruction>, i: Int): String? {
    val ins = insns[i]
    val reg = when {
        ins.opcode == Opcode.INVOKE_STATIC && ins is Instruction35c -> ins.registerC
        ins.opcode == Opcode.INVOKE_STATIC_RANGE && ins is Instruction3rc -> ins.startRegister
        else -> return null
    }
    val ref = (ins as ReferenceInstruction).reference as MethodReference
    if (ref.definingClass != "Ljava/lang/System;" || ref.name != "loadLibrary") return null
    // shortcut: straight-line scan back, fine for this static initializer (no branches before the call).
    for (j in i - 1 downTo 0) {
        val prev = insns[j]
        if (prev !is OneRegisterInstruction || !prev.opcode.setsRegister() || prev.registerA != reg) continue
        if (prev.opcode != Opcode.CONST_STRING && prev.opcode != Opcode.CONST_STRING_JUMBO) return null
        return ((prev as ReferenceInstruction).reference as StringReference).string
    }
    return null
}

/** Adds a mod's library (loaded by AML) and its config/data files; Boot copies them at the next game start. */
internal fun ResourcePatchContext.addMod(library: String, vararg configs: String) {
    get("assets/gtade/mods/$library", false).apply { parentFile.mkdirs() }.writeBytes(bundled(library))
    for (c in configs) get("assets/gtade/configs/$c", false).apply { parentFile.mkdirs() }.writeBytes(bundled(c))
}
