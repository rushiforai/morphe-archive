package app.morphe.patches.all.security

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.util.findMutableMethodOf
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private val ROOT_RE = Regex(
    "^(is|has|check|detect|verify|test|find|look|scan)" +
        ".*(root|magisk|superuser|supersu|kernelsu)",
    RegexOption.IGNORE_CASE,
)

private val SU_RE = Regex(
    "^(is|has|check|detect|verify|test|find|look|scan).*Su(?![a-z])",
)

private val LIB_PREFIXES = listOf(
    "Landroidx/", "Landroid/", "Lkotlin/", "Lkotlinx/",
    "Lcom/google/android/", "Lokhttp3/", "Lokio/", "Lretrofit2/",
    "Lcom/bumptech/", "Lcom/squareup/", "Ljava/", "Ljavax/",
)

private fun isLibraryClass(type: String) = LIB_PREFIXES.any(type::startsWith)

private val SU_PATHS = setOf(
    "/system/bin/su", "/system/xbin/su", "/sbin/su", "/system/su",
    "/system/bin/.ext/.su", "/system/usr/we-need-root/su-backup",
    "/data/local/su", "/data/local/bin/su", "/data/local/xbin/su",
    "/su/bin/su", "/magisk/.core/bin/su", "/data/adb/magisk/su",
    "/system/app/Superuser.apk", "/system/app/SuperSU.apk",
    "/data/adb/ksud", "/data/adb/magisk",
)

private fun isSuPath(s: String): Boolean {
    if (s in SU_PATHS || s.endsWith("/su") || s == "su" || s == "which su") return true
    val lower = s.lowercase()
    return lower.contains("magisk") || lower.contains("superuser") || lower.contains("supersu")
}

private val BUILD_SPOOF = mapOf(
    "TAGS" to "test-keys",
    "USER" to "root",
    "HOST" to "buildbot",
)

private val FILE_CHECKS = setOf("exists", "canExecute", "isFile", "isDirectory")

private fun forceNamedRootMethod(mc: MutableClass, method: Method): Boolean {
    if (method.returnType != "Z") return false
    if (!ROOT_RE.matches(method.name) && !SU_RE.matches(method.name)) return false
    mc.findMutableMethodOf(method).returnEarly(true)
    return true
}

private fun spoofBuildReads(mc: MutableClass, method: Method) {
    val impl = method.implementation ?: return
    val targets = impl.instructions.withIndex().filter { (_, ins) ->
        ins.opcode == Opcode.SGET_OBJECT &&
            ins.getReference<FieldReference>()?.let { f ->
                f.definingClass == "Landroid/os/Build;" && f.name in BUILD_SPOOF
            } == true
    }.map { it.index }
    if (targets.isEmpty()) return

    val mm = mc.findMutableMethodOf(method)
    targets.forEach { i ->
        val ins = mm.getInstruction(i)
        val reg = (ins as OneRegisterInstruction).registerA
        val name = ins.getReference<FieldReference>()!!.name
        mm.replaceInstruction(i, "const-string v$reg, \"${BUILD_SPOOF.getValue(name)}\"")
    }
}

private fun spoofSuFileChecks(mc: MutableClass, method: Method) {
    val impl = method.implementation ?: return
    val insns = impl.instructions

    val mentionsSu = insns.any { ins ->
        (ins.opcode == Opcode.CONST_STRING || ins.opcode == Opcode.CONST_STRING_JUMBO) &&
            ins.getReference<StringReference>()?.string?.let(::isSuPath) == true
    }
    if (!mentionsSu) return

    val targets = insns.withIndex().filter { (_, ins) ->
        val m = ins.getReference<MethodReference>() ?: return@filter false
        m.definingClass == "Ljava/io/File;" && m.name in FILE_CHECKS && m.returnType == "Z"
    }.map { it.index }
    if (targets.isEmpty()) return

    val mm = mc.findMutableMethodOf(method)
    targets.forEach { i ->
        val ni = i + 1
        if (ni < mm.instructions.size && mm.getInstruction(ni).opcode == Opcode.MOVE_RESULT) {
            val reg = (mm.getInstruction(ni) as OneRegisterInstruction).registerA
            mm.replaceInstruction(ni, "const/4 v$reg, 0x1")
        }
    }
}

private fun processClass(classDef: ClassDef, spoofBuild: Boolean) {
    if (isLibraryClass(classDef.type)) return

    val mc by lazy { mutableClassDefBy(classDef) }
    classDef.methods.forEach { method ->
        if (method.implementation == null) return@forEach
        if (forceNamedRootMethod(mc, method)) return@forEach
        if (spoofBuild) spoofBuildReads(mc, method)
        spoofSuFileChecks(mc, method)
    }
}

@Suppress("unused")
val spoofRootedEnvironmentPatch = bytecodePatch(
    name = "Spoof rooted environment",
    description = "Makes Java-level root checks report rooted: forces named detection " +
        "methods true, spoofs Build.TAGS/USER/HOST at read sites, and forces su-path " +
        "file checks to succeed. String/field-based targeting survives obfuscation. " +
        "Native checks and Runtime.exec(\"su\") are not faked.",
    default = false,
) {
    val spoofBuild by booleanOption(
        key = "spoofBuild",
        default = true,
        title = "Spoof Build fields",
        description = "Replaces Build.TAGS/USER/HOST reads with test-keys/root/buildbot.",
    )

    execute {
        val spoof = spoofBuild == true
        classDefForEach { classDef -> processClass(classDef, spoof) }
    }
}
