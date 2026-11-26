package app.morphe.patches.all.version

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.packageMetadata
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.all.shared.isControlFlow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import org.w3c.dom.Element

private fun overrideConstInClinit(
    mc: MutableClass,
    fieldName: String,
    newSmali: String,
) {
    val mm = mc.methods
        .filterIsInstance<MutableMethod>()
        .firstOrNull { it.name == "<clinit>" }
        ?: return

    val sputIdx = mm.instructions.withIndex().firstOrNull { (_, ins) ->
        (ins.opcode == Opcode.SPUT_OBJECT || ins.opcode == Opcode.SPUT) &&
            ins.getReference<FieldReference>()?.name == fieldName
    }?.index ?: return

    val srcReg = (mm.getInstruction(sputIdx) as OneRegisterInstruction).registerA

    for (j in sputIdx - 1 downTo 0) {
        val ins = mm.getInstruction(j)

        if (isControlFlow(ins.opcode)) return

        if (ins is OneRegisterInstruction && ins.registerA == srcReg) {
            mm.replaceInstruction(j, newSmali.replace("%REG", "v$srcReg"))
            return
        }
    }
}

@Suppress("unused")
val changeVersionPatch = patch(
    name = "Change version name / code",
    description = "Changes the manifest and BuildConfig version values. Current keeps the current one, duh, or just disable this patch.",
    default = false,
) {
    val nameOption = stringOption(
        key = "versionName",
        default = "Current",
        values = mapOf("Current" to "Current"),
        title = "Version name",
        description = "New android:versionName (e.g. 9.9.9), or 'Current'.",
        required = true,
    )
    val codeOption = stringOption(
        key = "versionCode",
        default = "Current",
        values = mapOf("Current" to "Current"),
        title = "Version code",
        description = "New android:versionCode (digits), or 'Current'.",
        required = true,
    ) { it == "Current" || (it != null && it.matches(Regex("^\\d+$"))) }

    execute {
        val newName = if (nameOption.value == "Current") packageMetadata.versionName else nameOption.value!!
        val newCode = if (codeOption.value == "Current") packageMetadata.versionCode else codeOption.value!!

        document("AndroidManifest.xml").use { doc ->
            val manifest = doc.getElementsByTagName("manifest").item(0) as Element
            manifest.setAttribute("android:versionName", newName)
            manifest.setAttribute("android:versionCode", newCode)
        }

        val codeInt = newCode.toIntOrNull()
        classDefForEach { classDef ->
            if (!classDef.type.endsWith("/BuildConfig;")) return@classDefForEach
            val mc = mutableClassDefBy(classDef)
            if (nameOption.value != "Current") overrideConstInClinit(mc, "VERSION_NAME", "const-string %REG, \"$newName\"")
            if (codeOption.value != "Current" && codeInt != null) overrideConstInClinit(mc, "VERSION_CODE", "const %REG, $codeInt")
        }
    }
}
