package app.hushmessenger.patches.misc

import app.hushmessenger.patches.controls.ControlProfile
import app.hushmessenger.patches.controls.PROFILE_346816966
import app.hushmessenger.patches.controls.activeProfile
import app.hushmessenger.patches.controls.hookId
import app.hushmessenger.patches.controls.settingsExtension
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val OWN_VERSION = "Lapp/hushmessenger/extension/OwnVersion;"
private const val PACKAGE_INFO = "Landroid/content/pm/PackageInfo;"
internal const val VERSION_FIELD = "$PACKAGE_INFO->versionCode:I"
internal const val VERSION_GETTER = "$PACKAGE_INFO->getLongVersionCode()J"
private const val OWN_NAME = "Landroid/content/Context;->getPackageName()Ljava/lang/String;"
private const val OWN_APPLICATION_INFO = "Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;"
private const val ITEM_NAME = "Landroid/content/pm/PackageItemInfo;->packageName:Ljava/lang/String;"
private val PACKAGE_LOOKUPS = setOf(
    "Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)$PACKAGE_INFO",
    "Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;Landroid/content/pm/PackageManager\$PackageInfoFlags;)$PACKAGE_INFO",
)

/**
 * Messenger's reads of its own version code in the arm64 builds, 15 in 584.1: AppComponentManager's check (which logs
 * a mismatch with the APK's own code), its service, ACRA's crash-time data, Profilo's trace end, the int helper, Mapbox's
 * two identifiers, the Hatch bug report's app_version, ML Kit's Clearcut logger and six more. A different count means the
 * build changed, and nothing is rewritten.
 */
internal const val SELF_VERSION_READS = 15

/** 584.1's armv7 build keeps ACRA's pre-Android 9 branch, so its crash-time data reads both getLongVersionCode and versionCode. */
internal const val ARMV7_SELF_VERSION_READS = 16

internal fun selfVersionReadsFor(profile: ControlProfile) = if (profile === PROFILE_346816966) ARMV7_SELF_VERSION_READS else SELF_VERSION_READS

private fun Instruction.reference() = (this as? ReferenceInstruction)?.reference?.toString()

private fun Method.code(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

private fun Instruction.registers(): List<Int> = when (this) {
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    else -> emptyList()
}

/** The last instruction before [at], in code order, that sets [register]. Branches aren't followed. */
private fun List<Instruction>.writerOf(at: Int, register: Int): Int {
    for (index in at - 1 downTo 0) {
        val instruction = this[index]
        if (!instruction.opcode.setsRegister()) continue
        val written = (instruction as? OneRegisterInstruction)?.registerA ?: continue
        if (written == register || instruction.opcode.setsWideRegister() && written + 1 == register) return index
    }
    return -1
}

private fun List<Instruction>.isResultOf(index: Int, call: String) =
    index > 0 && this[index].opcode == Opcode.MOVE_RESULT_OBJECT && this[index - 1].reference() == call

/** Whether the package name in [register] at [at] is the app's own: Context.getPackageName(), or getApplicationInfo().packageName. */
private fun List<Instruction>.isOwnName(at: Int, register: Int): Boolean {
    val writer = writerOf(at, register)
    if (writer < 0) return false
    if (isResultOf(writer, OWN_NAME)) return true
    val read = this[writer]
    if (read.opcode != Opcode.IGET_OBJECT || read.reference() != ITEM_NAME) return false
    return isResultOf(writerOf(writer, (read as TwoRegisterInstruction).registerB), OWN_APPLICATION_INFO)
}

/**
 * True when every PackageInfo [method] can hold is the app's own: each one comes from getPackageInfo on the app's own
 * name, or from one of [wrappers], and none from a parameter, a field, a cast, an array or any other call.
 */
private fun ownInfoOnly(method: Method, code: List<Instruction>, wrappers: Set<String>): Boolean {
    if (method.parameterTypes.any { it.toString() == PACKAGE_INFO }) return false
    var lookups = 0
    for ((index, instruction) in code.withIndex()) {
        if (instruction.opcode == Opcode.AGET_OBJECT) return false
        if (instruction.opcode == Opcode.CHECK_CAST && instruction.reference() == PACKAGE_INFO) return false
        val reference = (instruction as? ReferenceInstruction)?.reference
        if (reference is FieldReference && reference.type == PACKAGE_INFO) return false
        if (reference !is MethodReference || reference.returnType != PACKAGE_INFO) continue
        val id = reference.toString()
        when {
            id in PACKAGE_LOOKUPS -> if (!code.isOwnName(index, instruction.registers()[1])) return false
            id in wrappers -> Unit
            else -> return false
        }
        lookups++
    }
    return lookups > 0
}

private fun Instruction.isVersionRead() = reference().let { it == VERSION_FIELD || it == VERSION_GETTER }

/**
 * The methods that read the version code only from the app's own PackageInfo, with how many reads each has. A
 * one-level wrapper that hands back the app's own PackageInfo counts as a source. HushMessenger's own classes are left
 * out: Copy setup reads the installed code on purpose.
 */
internal fun findSelfVersionReads(methods: Iterable<Method>): Map<Method, Int> {
    val readers = mutableListOf<Pair<Method, List<Instruction>>>()
    val wrappers = mutableSetOf<String>()
    for (method in methods) {
        if (method.definingClass.startsWith("Lapp/hushmessenger/")) continue
        val code = method.code()
        if (code.isEmpty()) continue
        if (code.any { it.isVersionRead() }) readers += method to code
        if (method.returnType == PACKAGE_INFO && ownInfoOnly(method, code, emptySet())) wrappers += method.hookId()
    }
    return readers.filter { (method, code) -> ownInfoOnly(method, code, wrappers) }
        .associate { (method, code) -> method to code.count { it.isVersionRead() } }
}

private fun refuse(reason: String): Nothing = throw PatchException("$SPOOF_VERSION_PATCH: $reason. Nothing was changed.")

/** Checks every read in [this] can be rewritten, before any of them is. */
internal fun Method.validateVersionReads() {
    for (instruction in code().filter { it.isVersionRead() }) when (instruction.opcode) {
        Opcode.IGET -> Unit
        Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE -> if (instruction.registers().size != 1) refuse("${hookId()} reads its version in an unknown way")
        else -> refuse("${hookId()} reads its version with ${instruction.opcode.name}")
    }
}

/** The ids of the methods to rewrite, once the count matches [expected] and every read has a shape this patch rewrites. */
internal fun planSelfVersionReads(methods: Iterable<Method>, expected: Int = SELF_VERSION_READS): Set<String> {
    val found = findSelfVersionReads(methods)
    val total = found.values.sum()
    if (total != expected) refuse("found $total reads of Messenger's own version code, expected $expected")
    found.keys.forEach { it.validateVersionReads() }
    return found.keys.mapTo(sortedSetOf()) { it.hookId() }
}

/**
 * Sends each version read in [this] through OwnVersion, which answers the original code for the app's own package and
 * what Android reported for any other. The field read becomes a call and a move-result into the same register.
 */
internal fun MutableMethod.answerOwnVersionReads() {
    validateVersionReads()
    val reads = code().withIndex().filter { it.value.isVersionRead() }.map { it.index }
    for (index in reads.reversed()) {
        val instruction = code()[index]
        if (instruction.opcode == Opcode.IGET) {
            val read = instruction as TwoRegisterInstruction
            replaceInstruction(index, "invoke-static/range {v${read.registerB} .. v${read.registerB}}, $OWN_VERSION->versionCode($PACKAGE_INFO)I")
            addInstruction(index + 1, "move-result v${read.registerA}")
        } else {
            val info = instruction.registers().single()
            replaceInstruction(index, "invoke-static/range {v$info .. v$info}, $OWN_VERSION->longVersionCode($PACKAGE_INFO)J")
        }
    }
}

/**
 * Keeps Messenger's reads of its own version code at the build it really is while Spoof package version raises what
 * Android reports. Runs only as part of that patch.
 */
internal val spoofSelfReadsPatch = bytecodePatch(description = "Answer Messenger's own version reads with its original code") {
    dependsOn(settingsExtension)
    execute {
        val methods = mutableListOf<Method>()
        classDefForEach { methods.addAll(it.methods) }
        // settingsExtension picked the build's profile before this runs.
        val targets = planSelfVersionReads(methods, selfVersionReadsFor(activeProfile)).map { id ->
            mutableClassDefBy(id.substringBefore("->")).methods.single { it.hookId() == id }
        }
        targets.forEach { it.answerOwnVersionReads() }
    }
}
