package app.template.patches.zalo

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val SETTINGS_CLASS = "Lapp/template/extension/extension/NezumiSettings;"
private const val ARRAY_LIST = "Ljava/util/ArrayList;"
private const val FEED_LIST = "Ljava/util/List;"
private const val TIMELINE_VIEW = "Lcom/zing/zalo/social/presentation/timeline/view/TimelineView;"

private data class FeedListMatch(
    val method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod,
    val insertionIndex: Int,
    val listRegister: Int,
)

@Suppress("unused")
val hideFeedAdsPatch = bytecodePatch(
    name = "Hide feed ads",
    description = "Remove sponsored and advertising items from Zalo's user feed when enabled in Nezumi Settings.",
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
        val matches = mutableListOf<FeedListMatch>()
        classDefForEach { classDef ->
            classDef.methods
                .filter { it.accessFlags and AccessFlags.ABSTRACT.value == 0 && it.implementation != null }
                .forEach { original ->
                    val instructions = original.implementation!!.instructions.toList()
                    instructions.indices.filter { index ->
                        index + 3 < instructions.size &&
                            instructions[index].opcode == Opcode.NEW_INSTANCE &&
                            (instructions[index] as? ReferenceInstruction)?.reference.toString() == ARRAY_LIST &&
                            instructions[index + 1].opcode == Opcode.INVOKE_DIRECT &&
                            ((instructions[index + 1] as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                                it.definingClass == ARRAY_LIST &&
                                    it.name == "<init>" &&
                                    it.parameterTypes == listOf("Ljava/util/Collection;")
                            } == true &&
                            instructions[index + 2].opcode == Opcode.IPUT_OBJECT &&
                            ((instructions[index + 2] as? ReferenceInstruction)?.reference as? FieldReference)?.type == ARRAY_LIST &&
                            instructions[index + 3].opcode == Opcode.MONITOR_EXIT
                    }.forEach { index ->
                        val initializer = instructions[index + 1] as FiveRegisterInstruction
                        check(initializer.registerCount == 2)
                        val listRegister = initializer.registerD
                        check(listRegister < 16)
                        val hasTimelineCast = instructions.take(index).any {
                            it.opcode == Opcode.CHECK_CAST &&
                                (it as? ReferenceInstruction)?.reference.toString() == TIMELINE_VIEW
                        }
                        val hasListCast = instructions.take(index).any {
                            it.opcode == Opcode.CHECK_CAST &&
                                (it as? ReferenceInstruction)?.reference.toString() == FEED_LIST &&
                                (it as? OneRegisterInstruction)?.registerA == listRegister
                        }
                        if (hasTimelineCast && hasListCast) {
                            val mutableClass = mutableClassDefBy(classDef)
                            val method = mutableClass.methods.single {
                                it.name == original.name &&
                                    it.parameterTypes == original.parameterTypes &&
                                    it.returnType == original.returnType
                            }
                            matches.add(FeedListMatch(method, index, listRegister))
                        }
                    }
                }
        }

        check(matches.size == 1) { "Expected one feed list update, found ${matches.size}" }
        val match = matches.single()
        match.method.addInstructions(match.insertionIndex,
            "invoke-static {v${match.listRegister}}, $SETTINGS_CLASS->filterFeedAds(Ljava/util/List;)Ljava/util/List;\n" +
                "move-result-object v${match.listRegister}")

        attachNezumiSettings("attachFeedAds")
    }
}