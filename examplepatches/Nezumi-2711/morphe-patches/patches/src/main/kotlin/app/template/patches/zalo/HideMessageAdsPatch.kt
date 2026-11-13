package app.template.patches.zalo

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private data class MessageAdsMatch(
    val method: MutableMethod,
    val insertionIndex: Int,
    val nextIndex: Int,
)

@Suppress("unused")
val hideMessageAdsPatch = bytecodePatch(
    name = "Hide ads in Messages",
    description = "Hide Z Instant Ads rows in Zalo's Messages page when enabled in Nezumi Settings.",
    default = false,
) {
    compatibleWith(Compatibility(
        name = "Zalo",
        packageName = "com.zing.zalo",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0068FF,
        targets = listOf(AppTarget(version = "26.10.02")),
    ))

    dependsOn(nativeSignaturePatch)
    extendWith("extensions/extension.mpe")

    execute {
        var adRowClass: String? = null
        classDefForEach { classDef ->
            if (classDef.superclass == "Ll20/e0;") {
                val hasStableAdId = classDef.methods.any { method ->
                    method.returnType == "Ljava/lang/String;" &&
                        method.implementation?.instructions?.any { instruction ->
                            instruction.opcode == Opcode.CONST_STRING &&
                                (instruction as? ReferenceInstruction)?.reference.toString() == "zinstant_ads"
                        } == true
                }
                if (hasStableAdId) {
                    check(adRowClass == null)
                    adRowClass = classDef.type
                }
            }
        }
        val rowClass = checkNotNull(adRowClass)
        val matches = mutableListOf<MessageAdsMatch>()

        classDefForEach { classDef ->
            classDef.methods
                .filter { method ->
                    method.accessFlags and AccessFlags.ABSTRACT.value == 0 &&
                        method.returnType == "V" &&
                        method.parameterTypes == listOf("Ljava/util/ArrayList;") &&
                        method.implementation != null
                }
                .forEach { original ->
                    val instructions = original.implementation!!.instructions.toList()
                    instructions.indices.filter { index ->
                        index + 5 < instructions.size &&
                            instructions[index].opcode == Opcode.NEW_INSTANCE &&
                            (instructions[index] as? ReferenceInstruction)?.reference.toString() == rowClass &&
                            instructions[index + 1].opcode == Opcode.INVOKE_DIRECT &&
                            ((instructions[index + 1] as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                                it.definingClass == rowClass && it.name == "<init>" &&
                                    it.parameterTypes == listOf("La10/j;")
                            } == true &&
                            instructions[index + 2].opcode == Opcode.ADD_INT_LIT8 &&
                            instructions[index + 3].opcode == Opcode.INVOKE_VIRTUAL &&
                            (instructions[index + 3] as? ReferenceInstruction)?.reference.toString() ==
                                "Ljava/util/ArrayList;->add(ILjava/lang/Object;)V" &&
                            instructions[index + 4].opcode == Opcode.MOVE &&
                            instructions[index + 5].opcode == Opcode.GOTO
                    }.forEach { index ->
                        val mutableClassDef = mutableClassDefBy(classDef)
                        val method = mutableClassDef.methods.single {
                            it.name == original.name &&
                                it.parameterTypes == original.parameterTypes &&
                                it.returnType == original.returnType
                        }
                        matches.add(MessageAdsMatch(method, index, index + 5))
                    }
                }
        }

        check(matches.size == 1) { "Expected one Messages ad row builder, found ${matches.size}" }
        val match = matches.single()
        check(match.method.implementation!!.registerCount == 8)
        val instructions = match.method.implementation!!.instructions.toList()
        match.method.addInstructionsWithLabels(match.insertionIndex, """
            invoke-static {}, Lcom/zing/zalo/MainApplication;->getAppContext()Landroid/content/Context;
            move-result-object v5
            invoke-static {v5}, Lapp/template/extension/extension/NezumiSettings;->isMessageAdsHidden(Landroid/content/Context;)Z
            move-result v5
            if-eqz v5, :nezumi_show_message_ad
            goto :nezumi_next_message_ad
        """.trimIndent(),
            ExternalLabel("nezumi_show_message_ad", instructions[match.insertionIndex]),
            ExternalLabel("nezumi_next_message_ad", instructions[match.nextIndex]),
        )

        attachNezumiSettings("attachMessageAds")
    }
}