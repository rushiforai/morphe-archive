// Re-derived targets for Gboard 18.8.0.1022711984-beta-arm64-v8a, kept so the next person does not
// repeat the audit. This file is input for tools/bindings/BindingAudit.java and is never compiled:
// see README.md beside it for how each value was found and for the command that re-checks them.
//
// Audited APK: com.google.android.inputmethod.latin_18.8.0.1022711984-beta-arm64-v8a
// sha256:      d1406caa270011aaea2a58bf828a3ffd94a58927a53688dc7bcd26e537c4d34b
//
// Both values are the `18.8.0` row of GboardSymbolFooterTargets.kt.

package audits

class SymbolFooter1880 {
    val `symbolFooterCorpus` = GboardMethodTarget(
        classType = "Lnxt;",
        name = "a",
        parameterTypes = listOf("Landroid/view/inputmethod/EditorInfo;", "Z"),
        returnType = "Lauaz;",
    )

    val `symbolFooterReceiverConstructor` = GboardMethodTarget(
        classType = "Lnxp;",
        name = "<init>",
        parameterTypes = listOf("Lnxt;", "Landroid/view/inputmethod/EditorInfo;", "Z"),
        returnType = "V",
    )
}
