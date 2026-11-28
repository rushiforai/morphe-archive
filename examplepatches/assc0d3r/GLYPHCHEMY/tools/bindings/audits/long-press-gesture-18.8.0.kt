// Re-derived targets for Gboard 18.8.0.1022711984-beta-arm64-v8a, kept so the next person does not
// repeat the audit. This file is input for tools/bindings/BindingAudit.java and is never compiled:
// see README.md beside it for how each value was found and for the command that re-checks them.
//
// Audited APK: com.google.android.inputmethod.latin_18.8.0.1022711984-beta-arm64-v8a
// sha256:      d1406caa270011aaea2a58bf828a3ffd94a58927a53688dc7bcd26e537c4d34b
//
// The first three are the `18.8.0` row of GboardGestureTargets.kt; the input-event method is the row
// GboardLongPressQuickActionsInputEventPatch.kt already carried.

package audits

class LongPressGesture1880 {
    val `gestureDispatch` = GboardMethodTarget(
        classType = "Lagyn;",
        name = "f",
        parameterTypes = listOf("Lagyw;", "Lagkl;", "Lagmb;", "Lcom/google/android/libraries/inputmethod/metadata/SoftKeyDef;", "J", "Z", "Z", "I", "Z", "J", "I"),
        returnType = "V",
    )

    val `gestureStockDelegateField` = GboardFieldTarget(
        classType = "Lagyn;",
        name = "n",
        type = "Lagyl;",
    )

    val `gestureStockDispatch` = GboardMethodTarget(
        classType = "Lagyl;",
        name = "h",
        parameterTypes = listOf("Lagyw;", "Lagkl;", "Lagmb;", "Lcom/google/android/libraries/inputmethod/metadata/SoftKeyDef;", "J", "Z", "Z", "I", "Z", "J", "I"),
        returnType = "V",
    )

    val `longPressInputEvent` = GboardMethodTarget(
        classType = "Lafae;",
        name = "ay",
        parameterTypes = listOf("Ladan;"),
        returnType = "Z",
    )
}
