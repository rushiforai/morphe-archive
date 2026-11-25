package patches.gboard.features.manualincognito

import patches.gboard.shared.GboardMethodTarget

internal object GboardManualIncognitoTargets {
    val onStartInput = method(
        owner = "Lpbk;",
        name = "onStartInput",
        parameters = listOf("Landroid/view/inputmethod/EditorInfo;", "Z"),
        returns = "V",
    )
    val onStartInputView = method(
        owner = "Lpbk;",
        name = "onStartInputView",
        parameters = listOf("Landroid/view/inputmethod/EditorInfo;", "Z"),
        returns = "V",
    )
    val onWindowHidden = method("Lpbk;", "onWindowHidden", emptyList(), "V")
    val incognitoPredicate = method("Lesj;", "I", emptyList(), "Z")
    val clipboardListener = method("Lfok;", "onPrimaryClipChanged", emptyList(), "V")
    val voiceEligibility = method(
        owner = "Luya;",
        name = "aQ",
        parameters = listOf(
            "Landroid/content/Context;",
            "Landroid/view/inputmethod/EditorInfo;",
            "Z",
        ),
        returns = "Z",
    )
    val dictationEligibility = method(
        owner = "Lsnd;",
        name = "b",
        parameters = listOf("Leqh;", "Z", "Z"),
        returns = "Lkql;",
    )
    private fun method(
        owner: String,
        name: String,
        parameters: List<String>,
        returns: String,
    ) = GboardMethodTarget(owner, name, parameters, returns)
}
