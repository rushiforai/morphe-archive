package app.morphe.patches.cromite.layout.theme

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Functional web-darkening synchronization for Cromite 153.
 * Runs BEFORE the original theme preference callback, which still writes
 * setting 71 via JNI VIOZ and stores the selected native browser theme.
 * No WebContents decision or site exception handling is replaced.
 */
private val cromiteNativeThemePreferenceCallback = Fingerprint(
    definingClass = "Lb3f;",
    name = "c0",
    returnType = "Z",
    parameters = listOf("Landroidx/preference/Preference;", "Ljava/lang/Object;"),
)

@Suppress("unused")
val cromiteWebDarkeningSyncPatch = bytecodePatch(
    name = "Cromite automatic web darkening with native theme",
    description = "Synchronizes the existing web-darkening checkbox on theme changes, preserving manual toggles and site exceptions.",
    default = false,
) {
    compatibleWith("org.cromite.cromite"("153.0.8010.37"))
    extendWith("extensions/cromite.mpe")

    execute {
        classDefBy("Lapp/morphe/extension/cromite/amoled/WebDarkeningPolicy;")
        val method = cromiteNativeThemePreferenceCallback.method
        val implementation = checkNotNull(method.implementation)
        val calls = implementation.instructions.mapNotNull {
            (it as? ReferenceInstruction)?.reference as? MethodReference
        }.toList()
        check(calls.any { it.definingClass == "LJ/N;" && it.name == "VIOZ" }) {
            "Native content setting 71 writer missing; refusing to patch"
        }
        check(calls.any { it.name == "l" && it.definingClass == "Lorg/chromium/base/shared_preferences/SharedPreferencesManager;" }) {
            "Native theme persistence missing; refusing to patch"
        }
        // No register allocations and no changes to original callback or JNI.
        // p0 is the b3f callback, p2 is the selected theme Integer.
        method.addInstructions(
            0,
            "invoke-static {p0, p2}, Lapp/morphe/extension/cromite/amoled/WebDarkeningPolicy;->onThemePreferenceChanged(Ljava/lang/Object;Ljava/lang/Object;)V",
        )
    }
}
