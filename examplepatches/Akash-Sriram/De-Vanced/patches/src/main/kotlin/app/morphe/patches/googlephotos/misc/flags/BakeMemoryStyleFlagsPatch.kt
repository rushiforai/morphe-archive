package app.morphe.patches.googlephotos.misc.flags

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31i
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private val BOOL_FLAGS_TO_ENABLE = setOf(
    "45417849", // Styles in Memories
    "45417850",
    "45422890"
)

private const val LONG_FLAG_ID = "45418195"
private const val LONG_FLAG_VALUE = 4L

val bakeMemoryStyleFlagsPatch = bytecodePatch(
    name = "Bake memory style flags",
    description = "Hard-codes the Styles in Memories feature flags into the DEX.",
    default = true,
) {
    compatibleWith(AppCompatibilities.GOOGLE_PHOTOS)
    
    execute {
        classDefForEach { classDef ->
            val methodA = classDef.methods.find {
                it.parameterTypes == listOf("Ljava/lang/String;", "Landroid/os/CancellationSignal;") &&
                it.returnType == "Landroid/net/Uri;"
            }
            
            val methodB = classDef.methods.find {
                it.parameterTypes == listOf("Landroid/net/Uri;") &&
                it.returnType == "[B"
            }

            if (methodA != null && methodB != null) {
                val mutableClass by lazy { mutableClassDefBy(classDef) }
                
                var streamReaderRef: MethodReference? = null
                methodB.implementation?.instructions?.forEach { instr ->
                    if (instr.opcode == Opcode.INVOKE_STATIC) {
                        val ref = (instr as? ReferenceInstruction)?.reference as? MethodReference
                        if (ref?.parameterTypes == listOf("Ljava/io/InputStream;") && ref.returnType == "[B") {
                            streamReaderRef = ref
                        }
                    }
                }

                if (streamReaderRef != null) {
                    val streamReaderClass = streamReaderRef!!.definingClass
                    val streamReaderMethod = streamReaderRef!!.name
                    
                    val mutableMethodA = mutableClass.findMutableMethodOf(methodA)
                    mutableMethodA.addInstructions(0, """
                        if-eqz p1, :cond_default_a
                        invoke-virtual { p1 }, Ljava/lang/String;->toLowerCase()Ljava/lang/String;
                        move-result-object v0
                        const-string v1, "serif"
                        invoke-virtual { v0, v1 }, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                        move-result v0
                        if-eqz v0, :cond_default_a
                        const-string v0, "file:///system/fonts/NotoSerif-Italic.ttf"
                        goto :cond_parse_a
                        :cond_default_a
                        const-string v0, "file:///system/fonts/Roboto-Regular.ttf"
                        :cond_parse_a
                        invoke-static { v0 }, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
                        move-result-object v0
                        return-object v0
                    """.trimIndent())

                    val mutableMethodB = mutableClass.findMutableMethodOf(methodB)
                    mutableMethodB.addInstructions(0, """
                        if-eqz p1, :cond_default_b
                        invoke-virtual { p1 }, Landroid/net/Uri;->getPath()Ljava/lang/String;
                        move-result-object v0
                        if-eqz v0, :cond_default_b
                        new-instance v1, Ljava/io/File;
                        invoke-direct { v1, v0 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
                        invoke-virtual { v1 }, Ljava/io/File;->exists()Z
                        move-result v0
                        if-eqz v0, :cond_default_b
                        new-instance v0, Ljava/io/FileInputStream;
                        invoke-direct { v0, v1 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
                        invoke-static { v0 }, $streamReaderClass->$streamReaderMethod(Ljava/io/InputStream;)[B
                        move-result-object v1
                        invoke-virtual { v0 }, Ljava/io/FileInputStream;->close()V
                        return-object v1
                        :cond_default_b
                        new-instance v0, Ljava/io/File;
                        const-string v1, "/system/fonts/Roboto-Regular.ttf"
                        invoke-direct { v0, v1 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
                        new-instance v1, Ljava/io/FileInputStream;
                        invoke-direct { v1, v0 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
                        invoke-static { v1 }, $streamReaderClass->$streamReaderMethod(Ljava/io/InputStream;)[B
                        move-result-object v0
                        invoke-virtual { v1 }, Ljava/io/FileInputStream;->close()V
                        return-object v0
                    """.trimIndent())
                }
            }
        }

        getAllClassesWithStrings().forEach { classDef ->
            if (classDef.type.startsWith("Lapp/morphe/extension/")) return@forEach

            val mutableClass by lazy { mutableClassDefBy(classDef) }

            classDef.methods.forEach classLoop@{ method ->
                val implementation = method.implementation ?: return@classLoop
                val instructionList = implementation.instructions.toList()
                val mutableMethod by lazy { mutableClass.findMutableMethodOf(method) }

                instructionList.forEachIndexed { index, instruction ->
                    if (instruction.opcode != Opcode.CONST_STRING &&
                        instruction.opcode != Opcode.CONST_STRING_JUMBO
                    ) return@forEachIndexed

                    val flagId =
                        ((instruction as? Instruction21c)?.reference as? StringReference)?.string
                            ?: return@forEachIndexed

                    when {
                        flagId in BOOL_FLAGS_TO_ENABLE -> {
                            for (lookahead in 1..3) {
                                val nextIdx = index + lookahead
                                if (nextIdx >= instructionList.size) break

                                val nextInst = instructionList[nextIdx]

                                if (nextInst is NarrowLiteralInstruction &&
                                    nextInst is OneRegisterInstruction
                                ) {
                                    val valRegister = nextInst.registerA
                                    val callIdx = nextIdx + 1
                                    if (callIdx < instructionList.size) {
                                        val callInst = instructionList[callIdx]
                                        if (callInst.opcode == Opcode.INVOKE_VIRTUAL) {
                                            val ref =
                                                (callInst as? ReferenceInstruction)?.reference as? MethodReference
                                            if (ref?.parameterTypes == listOf("Ljava/lang/String;", "Z") && ref.returnType == "Z") {
                                                mutableMethod.replaceInstruction(
                                                    nextIdx,
                                                    BuilderInstruction11n(
                                                        Opcode.CONST_4,
                                                        valRegister,
                                                        1,
                                                    ),
                                                )
                                                return@forEachIndexed
                                            }
                                        }
                                    }
                                }
                            }
                        }

                        flagId == LONG_FLAG_ID -> {
                            for (lookahead in 1..3) {
                                val nextIdx = index + lookahead
                                if (nextIdx >= instructionList.size) break

                                val nextInst = instructionList[nextIdx]

                                if (nextInst is WideLiteralInstruction &&
                                    nextInst is OneRegisterInstruction
                                ) {
                                    val valRegister = nextInst.registerA
                                    val callIdx = nextIdx + 1
                                    if (callIdx < instructionList.size) {
                                        val callInst = instructionList[callIdx]
                                        if (callInst.opcode == Opcode.INVOKE_VIRTUAL) {
                                            val ref =
                                                (callInst as? ReferenceInstruction)?.reference as? MethodReference
                                            if (ref?.parameterTypes == listOf("Ljava/lang/String;", "J") && ref.returnType == "J") {
                                                mutableMethod.replaceInstruction(
                                                    nextIdx,
                                                    BuilderInstruction31i(
                                                        Opcode.CONST_WIDE_32,
                                                        valRegister,
                                                        LONG_FLAG_VALUE.toInt(),
                                                    ),
                                                )
                                                return@forEachIndexed
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
