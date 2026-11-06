package app.hushmessenger.patches.misc

import app.hushmessenger.patches.controls.ControlProfile
import app.hushmessenger.patches.controls.PROFILE_347215341
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
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

internal const val OWN_VERSION = "Lapp/hushmessenger/extension/OwnVersion;"
private const val PACKAGE_INFO = "Landroid/content/pm/PackageInfo;"
internal const val VERSION_FIELD = "$PACKAGE_INFO->versionCode:I"
internal const val VERSION_GETTER = "$PACKAGE_INFO->getLongVersionCode()J"

/**
 * Every PackageInfo version read in 586's arm64 build, 66 in 61 methods. Most read another app (Google Play services,
 * the Play Store, Facebook, WebView, ART) and keep what Android reports. The rest are Messenger's own: AppComponentManager's
 * check, the job scheduler's "Version Codes do not match" check, ACRA's crash data, Profilo's trace end, Mapbox, the
 * Hatch bug report and Play Billing among them. A different count means the build changed, and nothing is rewritten.
 */
internal const val SELF_VERSION_READS = 66

/** The armv7 build keeps pre-Android 9 branches (ACRA, Play services, WebView and a few more read the code both ways). */
internal const val ARMV7_SELF_VERSION_READS = 75

internal fun selfVersionReadsFor(profile: ControlProfile) =
    if (profile === PROFILE_347215341) ARMV7_SELF_VERSION_READS else SELF_VERSION_READS

private fun Instruction.reference() = (this as? ReferenceInstruction)?.reference?.toString()

private fun Method.code(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

private fun Instruction.registers(): List<Int> = when (this) {
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    else -> emptyList()
}

private fun Instruction.isVersionRead() = reference().let { it == VERSION_FIELD || it == VERSION_GETTER }

/**
 * Every method that reads a PackageInfo version code, with how many reads each has. Where a PackageInfo came from
 * isn't traced: a parameter, a field, a cached wrapper or a loop over services can all hold Messenger's own (#120 found
 * the job scheduler's check and ACRA's constant fields that way), and OwnVersion checks the package name when the read
 * runs, so another app's PackageInfo keeps what Android reported. HushMessenger's own classes are left out: Copy setup
 * reads the installed code on purpose.
 */
internal fun findSelfVersionReads(methods: Iterable<Method>): Map<Method, Int> = methods
    .filterNot { it.definingClass.startsWith("Lapp/hushmessenger/") }
    .mapNotNull { method -> method.code().count { it.isVersionRead() }.takeIf { it > 0 }?.let { method to it } }
    .toMap()

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
    if (total != expected) refuse("found $total version code reads, expected $expected")
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
 * Android reports. Every version read goes through OwnVersion, which leaves other apps' codes alone. Runs only as part
 * of that patch.
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
