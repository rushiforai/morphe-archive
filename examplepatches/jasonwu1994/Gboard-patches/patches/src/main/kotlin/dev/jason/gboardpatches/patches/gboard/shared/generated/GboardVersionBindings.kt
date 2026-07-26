package dev.jason.gboardpatches.patches.gboard.shared.generated

internal data class GboardMethodBinding(
    val classType: String,
    val name: String,
    val parameterTypes: List<String>,
    val returnType: String,
)

internal data class GboardFieldBinding(
    val classType: String,
    val name: String,
    val type: String,
)

internal object GboardVersionBindings {
    const val targetVersion = "17.7.7"
    const val profileVersion = "1.2.0"
    const val projectionSha256 = "bfc44f884d3cfbc1aa1c98af7eb81eaa376e24954e2ab587c3baa2d55d60a662"

    val flagBoolGetter = GboardMethodBinding(
        classType = "Lneg;",
        name = "g",
        parameterTypes = emptyList(),
        returnType = "Ljava/lang/Object;",
    )

    val flagNameField = GboardFieldBinding(
        classType = "Lneg;",
        name = "a",
        type = "Ljava/lang/String;",
    )

    val gestureDispatch = GboardMethodBinding(
        classType = "Lpbj;",
        name = "f",
        parameterTypes = listOf("Lpbl;", "Loth;", "Loud;", "Lowd;", "J", "Z", "Z", "I", "Z", "J", "I"),
        returnType = "V",
    )

    val keyboardExtensionManager = GboardMethodBinding(
        classType = "Lncc;",
        name = "c",
        parameterTypes = listOf("Lovf;"),
        returnType = "Loea;",
    )

    val keyboardProviderRequest = GboardMethodBinding(
        classType = "Lilo;",
        name = "H",
        parameterTypes = listOf("Landroid/content/Context;", "Lody;", "Lcom/google/android/libraries/inputmethod/metadata/ImeDef;", "Lovf;", "Ljava/lang/String;", "Ltol;", "Lodz;"),
        returnType = "V",
    )

    val pointerCancel = GboardMethodBinding(
        classType = "Lpbl;",
        name = "s",
        parameterTypes = listOf("J"),
        returnType = "V",
    )

    val pointerOwner = GboardMethodBinding(
        classType = "Lpbl;",
        name = "B",
        parameterTypes = listOf("Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;", "F", "F", "J", "I"),
        returnType = "V",
    )

    val pointerReset = GboardMethodBinding(
        classType = "Lpbl;",
        name = "C",
        parameterTypes = emptyList(),
        returnType = "V",
    )

    val softKeyBind = GboardMethodBinding(
        classType = "Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;",
        name = "q",
        parameterTypes = listOf("Lowd;", "J"),
        returnType = "Z",
    )
}
