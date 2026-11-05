package app.template.patches.zalo

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

@Suppress("unused")
val hideDiscoveryTabPatch = bytecodePatch(
    name = "Hide Discovery tab",
    description = "Remove the Discovery tab from Zalo's main navigation.",
    default = false,
) {
    compatibleWith(Compatibility(
        name = "Zalo",
        packageName = "com.zing.zalo",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0068FF,
        targets = listOf(AppTarget(version = "26.10.02")),
    ))

    extendWith("extensions/extension.mpe")

    execute {
        val matches = mutableListOf<Pair<app.morphe.patcher.util.proxy.mutableTypes.MutableMethod, Int>>()
        classDefForEach { classDef ->
            classDef.methods.filter { it.implementation != null }.forEach { original ->
                val instructions = original.implementation!!.instructions.toList()
                val strings = instructions.mapNotNull { instruction ->
                    val reference = (instruction as? ReferenceInstruction)?.reference
                    (reference as? com.android.tools.smali.dexlib2.iface.reference.StringReference)?.string
                }
                if (!strings.containsAll(listOf("ENABLE_GROUP_TAB", "ENABLE_TIMELINE_TAB"))) return@forEach
                instructions.indices.filter { index ->
                    index >= 2 && index + 1 < instructions.size &&
                        instructions[index].opcode == Opcode.SGET_OBJECT &&
                        (instructions[index] as ReferenceInstruction).reference.let { reference ->
                            reference is FieldReference && reference.name == "DISCOVERY" &&
                                reference.type == reference.definingClass
                        } && instructions[index + 1].opcode == Opcode.INVOKE_VIRTUAL &&
                        (instructions[index + 1] as ReferenceInstruction).reference.let { reference ->
                            reference is MethodReference && reference.definingClass == "Ljava/util/ArrayList;" &&
                                reference.name == "add" && reference.parameterTypes == listOf("Ljava/lang/Object;") &&
                                reference.returnType == "Z"
                        } && instructions[index - 1].opcode == Opcode.IF_EQZ &&
                        instructions[index - 2].opcode == Opcode.IGET_BOOLEAN &&
                        (instructions[index - 2] as TwoRegisterInstruction).registerA ==
                            (instructions[index - 1] as OneRegisterInstruction).registerA
                }.forEach { discoveryIndex ->
                    val mutableClass = mutableClassDefBy(classDef)
                    val method = mutableClass.methods.single {
                        it.name == original.name && it.parameterTypes == original.parameterTypes &&
                            it.returnType == original.returnType
                    }
                    matches.add(method to discoveryIndex - 2)
                }
            }
        }
        check(matches.size == 1) { "Expected one Discovery tab gate, found ${matches.size}" }
        val (method, gateIndex) = matches.single()
        val instructions = method.implementation!!.instructions.toList()
        val gateRegister = (instructions[gateIndex] as OneRegisterInstruction).registerA
        method.replaceInstruction(gateIndex,
            "invoke-static {}, Lapp/template/extension/extension/NezumiSettings;->isDiscoveryHidden()Z")
        method.addInstructions(gateIndex + 1, "move-result v$gateRegister\nxor-int/lit8 v$gateRegister, v$gateRegister, 0x1")
        attachNezumiSettings("attachDiscovery")
    }
}