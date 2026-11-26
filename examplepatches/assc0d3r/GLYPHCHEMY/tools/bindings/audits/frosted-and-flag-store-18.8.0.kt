// Re-derived targets for Gboard 18.8.0.1022711984-beta-arm64-v8a, kept so the next person does not
// repeat the audit. This file is input for tools/bindings/BindingAudit.java and is never compiled:
// see README.md beside it for how each value was found and for the command that re-checks them.
//
// Audited APK: com.google.android.inputmethod.latin_18.8.0.1022711984-beta-arm64-v8a
// sha256:      d1406caa270011aaea2a58bf828a3ffd94a58927a53688dc7bcd26e537c4d34b
//
// Ten of these are consumed by GboardFrostedGlassTargets.kt; the three flag-store entries are recorded
// here because no 18.8 bindings projection exists yet.

package audits

class FrostedAndFlagStore1880 {
    val `frostedConfigure` = GboardMethodTarget(
        classType = "Lafae;",
        name = "onConfigureWindow",
        parameterTypes = listOf("Landroid/view/Window;", "Z", "Z"),
        returnType = "V",
    )

    val `frostedHidden` = GboardMethodTarget(
        classType = "Lafae;",
        name = "onWindowHidden",
        parameterTypes = emptyList(),
        returnType = "V",
    )

    val `frostedShown` = GboardMethodTarget(
        classType = "Lafae;",
        name = "onWindowShown",
        parameterTypes = emptyList(),
        returnType = "V",
    )

    val `frostedNavApply` = GboardMethodTarget(
        classType = "Lajlf;",
        name = "g",
        parameterTypes = listOf("Landroid/view/Window;", "Lajle;"),
        returnType = "V",
    )

    val `frostedNavParamsConstructor` = GboardMethodTarget(
        classType = "Lajle;",
        name = "<init>",
        parameterTypes = listOf("I", "I", "Lj$/util/OptionalInt;", "Lj$/util/OptionalInt;", "Z"),
        returnType = "V",
    )

    val `frostedNavBody` = GboardFieldTarget(
        classType = "Lajle;",
        name = "c",
        type = "Lj$/util/OptionalInt;",
    )

    val `frostedNavColor` = GboardFieldTarget(
        classType = "Lajle;",
        name = "a",
        type = "I",
    )

    val `frostedNavDivider` = GboardFieldTarget(
        classType = "Lajle;",
        name = "b",
        type = "I",
    )

    val `frostedNavHeader` = GboardFieldTarget(
        classType = "Lajle;",
        name = "d",
        type = "Lj$/util/OptionalInt;",
    )

    val `frostedNavLight` = GboardFieldTarget(
        classType = "Lajle;",
        name = "e",
        type = "Z",
    )

    val `flagBoolGetter` = GboardMethodTarget(
        classType = "Ladfs;",
        name = "g",
        parameterTypes = emptyList(),
        returnType = "Ljava/lang/Object;",
    )

    val `flagNameField` = GboardFieldTarget(
        classType = "Ladfs;",
        name = "a",
        type = "Ljava/lang/String;",
    )

    val `flagHolderField` = GboardFieldTarget(
        classType = "Ladfs;",
        name = "f",
        type = "Ladgf;",
    )
}
