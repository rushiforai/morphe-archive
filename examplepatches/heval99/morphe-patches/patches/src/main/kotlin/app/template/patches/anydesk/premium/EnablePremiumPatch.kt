package app.template.patches.anydesk.premium

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_ANYDESK
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val JNI = "Lcom/anydesk/jni/JniAdExt;"

/**
 * The JNI class keeps its native `jni*` entry points stable but R8 rotates the Java wrapper
 * names every release (the previous patch pinned r3/a2/b2/Q1, which on 9.0.0 are unrelated
 * helpers - the patch silently no-opped). Anchor on the native call instead: every no-arg
 * boolean wrapper that invokes one of the license natives is forced to the paid result.
 */
private val LICENSE_GATES = mapOf(
    "jniIsFreeLicense" to false,
    "jniDoesLicenseAllowAccountRegistration" to true,
    "jniDoesLicenseAllowAddressBook" to true,
    "jniCanRemoveLicense" to true,
)

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Enables premium features by making the app treat the free license as paid."
) {
    compatibleWith(COMPATIBILITY_ANYDESK)

    execute {
        classDefForEach { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { it.implementation != null }
                .filter { it.returnType == "Z" && it.parameterTypes.isEmpty() }
                .forEach { method ->
                    val gate = method.implementation!!.instructions
                        .mapNotNull { insn ->
                            (insn as? ReferenceInstruction)?.reference as? MethodReference
                        }
                        .firstOrNull { ref ->
                            ref.definingClass == JNI && LICENSE_GATES.containsKey(ref.name)
                        }
                    if (gate != null) method.returnEarly(LICENSE_GATES.getValue(gate.name))
                }
        }
    }
}
