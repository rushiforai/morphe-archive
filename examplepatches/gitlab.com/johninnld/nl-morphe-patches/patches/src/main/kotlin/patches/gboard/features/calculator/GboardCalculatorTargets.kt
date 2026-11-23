package patches.gboard.features.calculator

import patches.gboard.shared.GboardFieldTarget
import patches.gboard.shared.GboardMethodTarget

internal object GboardCalculatorTargets {
    val inputView = GboardFieldTarget(
        classType = "Lafae;",
        name = "k",
        type = "Lcom/google/android/libraries/inputmethod/inputview/InputView;",
    )
    val onStartInputView = GboardMethodTarget(
        classType = "Lafae;",
        name = "onStartInputView",
        parameterTypes = listOf("Landroid/view/inputmethod/EditorInfo;", "Z"),
        returnType = "V",
    )
    val onUpdateSelection = GboardMethodTarget(
        classType = "Lafae;",
        name = "onUpdateSelection",
        parameterTypes = listOf("I", "I", "I", "I", "I", "I"),
        returnType = "V",
    )
    val onWindowHidden = GboardMethodTarget(
        classType = "Lafae;",
        name = "onWindowHidden",
        parameterTypes = emptyList(),
        returnType = "V",
    )
}
