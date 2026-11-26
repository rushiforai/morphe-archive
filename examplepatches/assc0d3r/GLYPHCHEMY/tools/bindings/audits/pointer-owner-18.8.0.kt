// Re-derived targets for Gboard 18.8.0.1022711984-beta-arm64-v8a, kept so the next person does not
// repeat the audit. This file is input for tools/bindings/BindingAudit.java and is never compiled:
// see README.md beside it for how each value was found and for the command that re-checks them.
//
// Audited APK: com.google.android.inputmethod.latin_18.8.0.1022711984-beta-arm64-v8a
// sha256:      d1406caa270011aaea2a58bf828a3ffd94a58927a53688dc7bcd26e537c4d34b
//
// These are the values GboardPointerTargets.kt uses for 18.8.0. The pointer owner and its four
// lifecycle anchors are the members every pointer feature rewrites; the dispatcher and the
// update-target method are checked by shape when the family is applied.

package audits

class PointerOwner1880 {
    val `pointerOwner` = GboardMethodTarget(
        classType = "Lagyw;",
        name = "D",
        parameterTypes = listOf("Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;", "F", "F", "J", "I"),
        returnType = "V",
    )

    val `pointerFinish` = GboardMethodTarget(
        classType = "Lagyw;",
        name = "t",
        parameterTypes = listOf("J", "I"),
        returnType = "V",
    )

    val `pointerPreReset` = GboardMethodTarget(
        classType = "Lagyw;",
        name = "ad",
        parameterTypes = emptyList(),
        returnType = "V",
    )

    val `pointerCancel` = GboardMethodTarget(
        classType = "Lagyw;",
        name = "u",
        parameterTypes = listOf("J"),
        returnType = "V",
    )

    val `pointerReset` = GboardMethodTarget(
        classType = "Lagyw;",
        name = "E",
        parameterTypes = emptyList(),
        returnType = "V",
    )

    val `pointerUpdateTargetView` = GboardMethodTarget(
        classType = "Lagyw;",
        name = "H",
        parameterTypes = listOf("Landroid/view/MotionEvent;", "I"),
        returnType = "V",
    )

    val `pointerFinishDispatch` = GboardMethodTarget(
        classType = "Lagyx;",
        name = "f",
        parameterTypes = listOf("Lagyw;", "Lagkl;", "Lagmb;", "Lcom/google/android/libraries/inputmethod/metadata/SoftKeyDef;", "J", "Z", "Z", "I", "Z", "J", "I"),
        returnType = "V",
    )
}
