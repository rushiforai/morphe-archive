package dev.jibon.notes.patches.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import dev.jibon.notes.patches.compat.frameworkCompatPatch
import dev.jibon.notes.patches.shared.Constants.COMPATIBILITY_NOTES

private const val MY_FILES = "com.sec.android.app.myfiles"
private val MY_FILES_ACTIONS = listOf("$MY_FILES.PICK_DATA", "$MY_FILES.PICK_DATA_MULTIPLE", "$MY_FILES.PICK_SELECT_PATH")
private const val PICKER = "Lsamsungcompat/FilePicker;"
private const val INTENT = "Landroid/content/Intent;"
private const val COMMON_UTILS = "Lcom/samsung/android/support/senl/nt/base/common/util/CommonUtils;"
private const val CONTENT_PICKER = "Lcom/samsung/android/support/senl/nt/base/common/util/ContentPickerUtils;"
private const val URI_FILE_UTILS = "Lcom/samsung/android/support/senl/nt/base/common/util/UriFileUtils;"

/** The folder picked for Save as file and export, as a path. */
private object GetPathFromResultFingerprint : Fingerprint(
    definingClass = CONTENT_PICKER,
    name = "getPathFromResult",
    returnType = "Ljava/lang/String;",
    parameters = listOf("Landroid/content/Context;", INTENT),
)

/** The files picked for Import notes, as paths. */
private object GetPathListFromResultFingerprint : Fingerprint(
    definingClass = CONTENT_PICKER,
    name = "getPathListFromResult",
    returnType = "Ljava/util/ArrayList;",
    parameters = listOf("Landroid/content/Context;", INTENT),
)

private val Instruction.methodReference get() = (this as? ReferenceInstruction)?.reference as? MethodReference

private fun Instruction.isConstString(value: String, register: Int) =
    (opcode == Opcode.CONST_STRING || opcode == Opcode.CONST_STRING_JUMBO) &&
        (this as OneRegisterInstruction).registerA == register &&
        ((this as ReferenceInstruction).reference as StringReference).string == value

/** The registers an invoke passes, in order (receiver first). */
private fun Instruction.invokeRegisters(): List<Int> = when (this) {
    is RegisterRangeInstruction -> List(registerCount) { startRegister + it }
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    else -> emptyList()
}

private fun MethodReference.descriptor() =
    "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

/** `CommonUtils.isPackageInstalledAndEnabled(context, "com.sec.android.app.myfiles")` reads true. */
private fun MutableMethod.forceMyFilesInstalled(): Int {
    val instructions = implementation?.instructions ?: return 0
    var count = 0
    for (index in instructions.size - 2 downTo 0) {
        val instruction = instructions[index]
        val reference = instruction.methodReference ?: continue
        if (reference.definingClass != COMMON_UTILS || reference.name != "isPackageInstalledAndEnabled") continue
        val packageRegister = instruction.invokeRegisters().getOrNull(1) ?: continue
        // The package name is set right before the call (constants are inlined).
        val writer = (index - 1 downTo maxOf(0, index - 8)).map { instructions[it] }.firstOrNull {
            (it as? OneRegisterInstruction)?.registerA == packageRegister && it !is FiveRegisterInstruction
        } ?: continue
        if (!writer.isConstString(MY_FILES, packageRegister)) continue
        val next = getInstruction(index + 1)
        if (next.opcode != Opcode.MOVE_RESULT) continue
        addInstruction(index + 2, "const/16 v${(next as OneRegisterInstruction).registerA}, 0x1")
        count++
    }
    return count
}

/**
 * Every startActivityForResult(…Intent…) first hands its Intent to FilePicker.toSystemPicker. The call is
 * replaced in place (so branches and try ranges that point at it now reach the rewrite) and re-added after it.
 */
private fun MutableMethod.rewriteLaunches(): Int {
    val instructions = implementation?.instructions ?: return 0
    var count = 0
    for (index in instructions.size - 1 downTo 0) {
        val instruction = instructions[index]
        val reference = instruction.methodReference ?: continue
        if (reference.name != "startActivityForResult") continue
        val parameters = reference.parameterTypes.map(CharSequence::toString)
        val intentParameter = parameters.indexOf(INTENT)
        if (intentParameter < 0 || parameters.any { it == "J" || it == "D" }) continue
        val receiver = if (instruction.opcode == Opcode.INVOKE_STATIC || instruction.opcode == Opcode.INVOKE_STATIC_RANGE) 0 else 1
        val registers = instruction.invokeRegisters()
        val intent = registers[receiver + intentParameter]
        val original = if (instruction is RegisterRangeInstruction) {
            "${instruction.opcode.name} {v${registers.first()} .. v${registers.last()}}, ${reference.descriptor()}"
        } else {
            "${instruction.opcode.name} {${registers.joinToString { "v$it" }}}, ${reference.descriptor()}"
        }
        replaceInstruction(index, "invoke-static/range {v$intent .. v$intent}, $PICKER->toSystemPicker($INTENT)V")
        addInstruction(index + 1, original)
        count++
    }
    return count
}

@Suppress("unused")
val systemFilePickerPatch = bytecodePatch(
    name = "System file picker",
    description = "Opens the system file picker, which also lists the other file managers, wherever Notes needs " +
        "Samsung My Files: Insert PDF, audio and text files, Import notes, Save as file and export.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_NOTES)
    dependsOn(frameworkCompatPatch)

    execute {
        val classes = (listOf(MY_FILES) + MY_FILES_ACTIONS)
            .flatMap { classDefByStrings(it).toList() }
            .map { it.type }
            .distinct()

        var checks = 0
        var launches = 0
        classes.forEach { type ->
            mutableClassDefBy(type).methods.forEach { method ->
                checks += method.forceMyFilesInstalled()
                val usesMyFiles = method.implementation?.instructions?.any { insn ->
                    MY_FILES_ACTIONS.any { action ->
                        insn.opcode in setOf(Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO) &&
                            ((insn as ReferenceInstruction).reference as StringReference).string == action
                    }
                } == true
                if (usesMyFiles) launches += method.rewriteLaunches()
            }
        }
        // 4.4.48.15: 7 checks (PDF, export, PDF picker, import x2, text, audio x2) and 7 launches.
        if (checks < 5) throw PatchException("Only $checks My Files checks found")
        if (launches < 5) throw PatchException("Only $launches My Files requests found")

        // A picked folder becomes a path; other results keep the app's own lookup.
        GetPathFromResultFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { p0, p1 }, $PICKER->folderPath(Landroid/content/Context;$INTENT)Ljava/lang/String;
                    move-result-object v0
                    if-eqz v0, :app_lookup
                    return-object v0
                """,
                ExternalLabel("app_lookup", getInstruction(0)),
            )
        }

        // Picked files to import are copied into the cache, since the importer opens them as files.
        GetPathListFromResultFingerprint.method.apply {
            val instructions = implementation!!.instructions
            val index = instructions.indexOfFirst {
                it.methodReference?.let { r -> r.definingClass == URI_FILE_UTILS && r.name == "getPath" } == true
            }
            if (index < 0) throw PatchException("Import path lookup not found")
            val registers = instructions[index].invokeRegisters()
            replaceInstruction(
                index,
                "invoke-static { v${registers[0]}, v${registers[1]} }, " +
                    "$PICKER->importPath(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;",
            )
        }
    }
}
