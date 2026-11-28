// Re-checked target for Gboard 18.8.0.1022711984-beta-arm64-v8a, kept so the next person does not
// repeat the audit. This file is input for tools/bindings/BindingAudit.java and is never compiled:
// see README.md beside it for how the value was found and for the command that re-checks it.
//
// Audited APK: com.google.android.inputmethod.latin_18.8.0.1022711984-beta-arm64-v8a
// sha256:      d1406caa270011aaea2a58bf828a3ffd94a58927a53688dc7bcd26e537c4d34b
//
// This is the `18.8.0` row of GboardSettingsHomepageTargets.kt. The descriptor is unchanged from
// 18.6.3; only the declaration's access flags moved, from protected final (0x14) to public final
// (0x11), which BindingAudit does not check and the patch's own gate does.

package audits

class SettingsHomepage1880 {
    val `settingsHomepageOnCreate` = GboardMethodTarget(
        classType = "Lcom/google/android/apps/inputmethod/latin/preference/SettingsActivity;",
        name = "onCreate",
        parameterTypes = listOf("Landroid/os/Bundle;"),
        returnType = "V",
    )
}
