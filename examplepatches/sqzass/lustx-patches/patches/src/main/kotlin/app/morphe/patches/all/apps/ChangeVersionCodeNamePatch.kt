package app.morphe.patches.all.version

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.packageMetadata
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.w3c.dom.Element

private fun overrideConstInClinit(mc: app.morphe.patcher.util.proxy.mutableTypes.MutableClass, fieldName: String, newSmali: String) {
    val clinit = mc.methods.firstOrNull { it.name == "<clinit>" } ?: return
    val mm = mc.methods.filterIsInstance<app.morphe.patcher.util.proxy.mutableTypes.MutableMethod>()
        .firstOrNull { it.name == "<clinit>" } ?: return
    val sputIdx = mm.instructions.withIndex().firstOrNull { (_, ins) ->
        (ins.opcode == Opcode.SPUT_OBJECT || ins.opcode == Opcode.SPUT) &&
            ins.getReference<FieldReference>()?.name == fieldName
    }?.index ?: return
    val sput = mm.getInstruction(sputIdx) as OneRegisterInstruction
    val srcReg = sput.registerA
    for (j in sputIdx - 1 downTo 0) {
        val ins = mm.getInstruction(j)
        if (ins is OneRegisterInstruction && ins.registerA == srcReg) {
            mm.replaceInstruction(j, newSmali.replace("%REG", "v$srcReg"))
            return
        }
        val op = ins.opcode
        if (op == Opcode.GOTO || op.name.startsWith("if-") || op.name.startsWith("return")) return
    }
}

@Suppress("unused")
val changeVersionPatch = patch(
    name = "Change version name / code",
    description = "Rewrites the manifest versionName/versionCode and the baked-in BuildConfig values. " +
        "'Current' keeps the existing value.",
    default = false,
) {
    val nameOption = stringOption(
        key = "versionName", default = "Current",
        values = mapOf("Current" to "Current"),
        title = "Version name", description = "New android:versionName (e.g. 9.9.9), or 'Current'.",
        required = true,
    )
    val codeOption = stringOption(
        key = "versionCode", default = "Current",
        values = mapOf("Current" to "Current"),
        title = "Version code", description = "New android:versionCode (digits), or 'Current'.",
        required = true,
    ) { it == "Current" || (it != null && it.matches(Regex("^\\d+$"))) }

    execute {
        val newName = if (nameOption.value == "Current") packageMetadata.versionName else nameOption.value!!
        val newCode = if (codeOption.value == "Current") packageMetadata.versionCode else codeOption.value!!

        // Manifest.
        document("AndroidManifest.xml").use { doc ->
            val manifest = doc.getElementsByTagName("manifest").item(0) as Element
            manifest.setAttribute("android:versionName", newName)
            manifest.setAttribute("android:versionCode", newCode)
        }

        // BuildConfig (baked into dex).
        val codeInt = newCode.toIntOrNull()
        classDefForEach { classDef ->
            if (!classDef.type.endsWith("/BuildConfig;")) return@forEach
            val mc = mutableClassDefBy(classDef)
            if (nameOption.value != "Current") overrideConstInClinit(mc, "VERSION_NAME", "const-string %REG, \"$newName\"")
            if (codeOption.value != "Current" && codeInt != null) overrideConstInClinit(mc, "VERSION_CODE", "const %REG, $codeInt")
        }
    }
}