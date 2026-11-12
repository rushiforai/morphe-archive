package app.template.patches.wemuslim.layout

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.template.patches.shared.Constants.COMPATIBILITY_WEMUSLIM
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.wemuslim.misc.encryption.bypassNativeEncryptionPatch

internal const val AVAILABLE_MODULE_TO_STRING = "AvailableModule(hasUmmah="

// The data class AvailableModule(hasUmmah, hasSocial) (lk0 in 3.5.5; R8-renamed, so it is found by its
// toString text). MainActivity adds the Ummah tab to the pager only when hasUmmah is true, and
// MainBottomNavigationLayout hides the Ummah nav item from the same flag; the app already ships
// without Ummah where the server or its MMKV switch ("ummah_post_local_model_status") says so, and
// tabs are matched by type ("ummah"), not by index. The patch forces hasUmmah false in the
// constructor, so every reader sees a build without Ummah. hasSocial is left alone.
internal object AvailableModuleToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf(string(AVAILABLE_MODULE_TO_STRING, StringComparisonType.STARTS_WITH)),
)

@Suppress("unused")
val hideUmmahTabPatch = bytecodePatch(
    name = "Hide Ummah tab",
    description = "Hides the Ummah tab.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WEMUSLIM)

    dependsOn(bypassNativeEncryptionPatch)

    execute {
        val type = AvailableModuleToStringFingerprint.method.definingClass
        val constructor = mutableClassDefBy(type).methods.singleOrNull {
            it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf("Z", "Z") &&
                it.implementation != null
        } ?: throw PatchException("Hide Ummah tab: no $type-><init>(ZZ)V")
        // p1 = hasUmmah (the first boolean, as toString prints it first).
        constructor.addInstructionsChecked(0, "const/4 p1, 0x0")
    }
}
