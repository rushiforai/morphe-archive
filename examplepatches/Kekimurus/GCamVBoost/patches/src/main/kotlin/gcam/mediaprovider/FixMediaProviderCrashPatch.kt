package gcam.mediaprovider

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

@Suppress("unused")
val fixMediaProviderCrashPatch = bytecodePatch(
    name = "Fix MediaProvider invalid column crash",
    description = "Prevents IllegalArgumentException crashes on file_name and restore_path columns when saving Video Boost or querying MediaStore without stock Google Photos signatures.",
    default = true
) {
    compatibleWith(
        "com.google.android.GoogleCameraEng",
        "com.google.android.GoogleCamera"
    )

    val stripContentValuesPut by booleanOption(
        key = "stripContentValuesPut",
        default = true,
        title = "Strip file_name and restore_path from ContentValues",
        description = "Neutralizes ContentValues.put() calls for proprietary file_name and restore_path columns."
    )

    val remapStandardColumns by booleanOption(
        key = "remapStandardColumns",
        default = true,
        title = "Remap columns to standard MediaStore equivalents",
        description = "Replaces file_name with _display_name and restore_path with relative_path in query projections and Cursor lookups."
    )

    execute {
        val columnRemap = mapOf(
            "file_name" to "_display_name",
            "restore_path" to "relative_path"
        )

        // Collect the classes matched by our fingerprints so we inspect all methods within them
        val targetClasses = mutableSetOf(
            mutableClassDefBy(MediaProviderFileNameFingerprint.classDef),
            mutableClassDefBy(MediaProviderRestorePathFingerprint.classDef)
        )

        var patchedCount = 0

        fun patchMethod(method: MutableMethod) {
            val insns = method.instructions
            for (index in insns.indices) {
                val instruction = insns[index]
                if (instruction.opcode != Opcode.CONST_STRING && instruction.opcode != Opcode.CONST_STRING_JUMBO) {
                    continue
                }

                val strRef = (instruction as? ReferenceInstruction)?.reference as? StringReference ?: continue
                val replacementColumn = columnRemap[strRef.string] ?: continue
                val stringReg = (instruction as OneRegisterInstruction).registerA

                var strippedPutCall = false

                // 1. Look ahead up to 5 instructions for `ContentValues->put(Ljava/lang/String;...)V`
                if (stripContentValuesPut == true) {
                    val lookaheadLimit = minOf(index + 5, insns.size - 1)
                    for (nextIdx in (index + 1)..lookaheadLimit) {
                        val nextInsn = insns[nextIdx]
                        if (nextInsn.opcode == Opcode.INVOKE_VIRTUAL) {
                            val methodRef = (nextInsn as? ReferenceInstruction)?.reference as? MethodReference
                            if (
                                methodRef != null &&
                                methodRef.definingClass == "Landroid/content/ContentValues;" &&
                                methodRef.name == "put"
                            ) {
                                val invokeInsn = nextInsn as FiveRegisterInstruction
                                // registerC is `this` (ContentValues), registerD is key (String)
                                if (invokeInsn.registerD == stringReg) {
                                    method.replaceInstruction(nextIdx, "nop")
                                    strippedPutCall = true
                                    patchedCount++
                                    break
                                }
                            }
                        }
                    }
                }

                // 2. Remap the string constant to a valid MediaStore column so query projections,
                //    Selection args, and Cursor.getColumnIndex() calls remain consistent.
                if (remapStandardColumns == true) {
                    method.replaceInstruction(
                        index,
                        """const-string v$stringReg, "$replacementColumn""""
                    )
                    if (!strippedPutCall) {
                        patchedCount++
                    }
                }
            }
        }

        targetClasses.forEach { mutableClass ->
            mutableClass.methods.forEach { method ->
                if (method.implementation != null) {
                    patchMethod(method)
                }
            }
        }

        if (patchedCount == 0) {
            throw PatchException("Failed to locate or patch file_name / restore_path MediaProvider references.")
        }
    }
}