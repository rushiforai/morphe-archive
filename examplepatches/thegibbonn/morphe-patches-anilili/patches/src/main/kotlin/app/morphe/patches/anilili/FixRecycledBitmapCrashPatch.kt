package app.morphe.patches.anilili

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.Constants.COMPATIBILITY_ANILILI
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val MEDIA_METADATA_BUILDER = "Landroid/media/MediaMetadata\$Builder;"
private const val ICON_CLASS = "Landroid/graphics/drawable/Icon;"
private const val ICON_COMPAT_CLASS = "Landroidx/core/graphics/drawable/IconCompat;"
private const val GUARD_CLASS = "Lcom/thegibbonn/extension/BitmapCrashGuard;"

@Suppress("unused")
val fixRecycledBitmapCrashPatch = bytecodePatch(
    name = "Fix Recycled Bitmap Crash",
    description = "Fixes recycled bitmap crashes on Android 14/15+ during media playback metadata updates and notification creation.",
    default = true
) {
    compatibleWith(COMPATIBILITY_ANILILI)

    extendWith("extensions/extension.mpe")

    execute {
        classDefForEach { classDef ->
            val hasTargetCall = classDef.methods.any { m ->
                m.implementation?.instructions?.any { instr ->
                    if (instr is ReferenceInstruction && instr.reference is MethodReference) {
                        val ref = instr.reference as MethodReference
                        (ref.definingClass == MEDIA_METADATA_BUILDER && ref.name == "putBitmap") ||
                        (ref.definingClass == ICON_CLASS && (ref.name == "createWithBitmap" || ref.name == "createWithAdaptiveBitmap")) ||
                        (ref.definingClass == ICON_COMPAT_CLASS && (ref.name == "toIcon" || ref.name == "e"))
                    } else false
                } ?: false
            }

            if (!hasTargetCall) return@classDefForEach

            val mutableClass = mutableClassDefBy(classDef)

            mutableClass.methods.forEach { mutableMethod ->
                val implementation = mutableMethod.implementation ?: return@forEach
                val instructions = implementation.instructions.toList()

                instructions.forEachIndexed { instrIndex, instruction ->
                    if (instruction is ReferenceInstruction && instruction.reference is MethodReference) {
                        val ref = instruction.reference as MethodReference
                        val definingClass = ref.definingClass
                        val methodName = ref.name

                        // 1. MediaMetadata.Builder.putBitmap
                        if (definingClass == MEDIA_METADATA_BUILDER && methodName == "putBitmap") {
                            if (instruction is Instruction35c) {
                                val vBld = "v${instruction.registerC}"
                                val vKey = "v${instruction.registerD}"
                                val vBm = "v${instruction.registerE}"
                                mutableMethod.replaceInstruction(
                                    instrIndex,
                                    "invoke-static {$vBld, $vKey, $vBm}, $GUARD_CLASS->safePutBitmap($MEDIA_METADATA_BUILDER" + "Ljava/lang/String;Landroid/graphics/Bitmap;)$MEDIA_METADATA_BUILDER"
                                )
                            }
                        }

                        // 2. Icon.createWithBitmap
                        else if (definingClass == ICON_CLASS && methodName == "createWithBitmap") {
                            val reg = when (instruction) {
                                is Instruction21c -> "v${instruction.registerA}"
                                is Instruction35c -> "v${instruction.registerC}"
                                else -> null
                            }
                            if (reg != null) {
                                mutableMethod.replaceInstruction(
                                    instrIndex,
                                    "invoke-static {$reg}, $GUARD_CLASS->safeCreateWithBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Icon;"
                                )
                            }
                        }

                        // 3. Icon.createWithAdaptiveBitmap
                        else if (definingClass == ICON_CLASS && methodName == "createWithAdaptiveBitmap") {
                            val reg = when (instruction) {
                                is Instruction21c -> "v${instruction.registerA}"
                                is Instruction35c -> "v${instruction.registerC}"
                                else -> null
                            }
                            if (reg != null) {
                                mutableMethod.replaceInstruction(
                                    instrIndex,
                                    "invoke-static {$reg}, $GUARD_CLASS->safeCreateWithAdaptiveBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Icon;"
                                )
                            }
                        }

                        // 4. IconCompat.toIcon or IconCompat.e
                        else if (definingClass == ICON_COMPAT_CLASS && (methodName == "toIcon" || methodName == "e")) {
                            if (instruction is Instruction35c) {
                                val vIcon = "v${instruction.registerC}"
                                val vCtx = "v${instruction.registerD}"
                                mutableMethod.replaceInstruction(
                                    instrIndex,
                                    "invoke-static {$vIcon, $vCtx}, $GUARD_CLASS->safeToIcon(Landroidx/core/graphics/drawable/IconCompat;Landroid/content/Context;)Landroid/graphics/drawable/Icon;"
                                )
                            }
                        }
                    }
                }
            }
        }
    }
}