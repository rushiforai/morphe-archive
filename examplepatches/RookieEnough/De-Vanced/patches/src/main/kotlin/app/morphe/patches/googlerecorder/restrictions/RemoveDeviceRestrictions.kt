/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/googlerecorder/restrictions/RemoveDeviceRestrictions.kt
 */
package app.morphe.patches.googlerecorder.restrictions

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.findMutableMethodOf
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstruction
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val LEGACY_PIXEL_FEATURE = "com.google.android.feature.PIXEL_2017_EXPERIENCE"

private fun isPixelFeatureGateString(s: String): Boolean =
    s == LEGACY_PIXEL_FEATURE ||
        (s.startsWith("com.google.android.feature") && s.contains("PIXEL"))

private fun classHierarchyExtendsAndroidApplication(
    classDef: ClassDef,
    classByType: Map<String, ClassDef>,
): Boolean {
    var parent: String? = classDef.superclass
    while (parent != null) {
        if (parent == "Landroid/app/Application;") return true
        parent = classByType[parent]?.superclass
    }
    return false
}

@Suppress("unused")
val removeDeviceRestrictionsPatch = bytecodePatch(
    name = "Remove device restrictions",
    description = "Removes restrictions from using the app on any device. Requires mounting patched app over original.",
) {
    compatibleWith(AppCompatibilities.GOOGLE_RECORDER)

    execute {
        val method =
            ApplicationOnCreateFingerprint.methodOrNull
                ?: findApplicationOnCreateWithPixelGate()
                ?: throw PatchException(
                    "Remove device restrictions: could not find Application.onCreate " +
                        "(RecorderApplication or direct Application subclass with Pixel feature gate).",
                )

        val featureStringIndex = method.indexOfFirstInstruction {
            opcode == Opcode.CONST_STRING &&
                getReference<StringReference>()?.string?.let(::isPixelFeatureGateString) == true
        }
        if (featureStringIndex < 0) {
            throw PatchException(
                "Remove device restrictions: expected a Pixel feature const-string in Application.onCreate",
            )
        }

        val featureAvailableRegister =
            method.getInstruction<OneRegisterInstruction>(featureStringIndex).registerA

        method.removeInstructions(featureStringIndex - 2, 5)
        method.addInstruction(featureStringIndex, "const/4 v$featureAvailableRegister, 0x1")
    }
}

/** When [ApplicationOnCreateFingerprint] fails, find Application.onCreate that loads the Pixel feature string. */
private fun app.morphe.patcher.patch.BytecodePatchContext.findApplicationOnCreateWithPixelGate(): MutableMethod? {
    val classByType = buildMap {
        classDefForEach { classDef -> put(classDef.type, classDef) }
    }
    var found: MutableMethod? = null
    classDefForEach { classDef ->
        if (found != null) return@classDefForEach
        if (!classHierarchyExtendsAndroidApplication(classDef, classByType)) return@classDefForEach

        val onCreate =
            classDef.methods.find { m ->
                m.name == "onCreate" &&
                    m.returnType == "V" &&
                    m.parameterTypes.isEmpty() &&
                    m.indexOfFirstInstruction {
                        opcode == Opcode.CONST_STRING &&
                            getReference<StringReference>()?.string?.let(
                                ::isPixelFeatureGateString,
                            ) == true
                    } >= 0
            } ?: return@classDefForEach

        found = mutableClassDefBy(classDef).findMutableMethodOf(onCreate)
    }
    return found
}
