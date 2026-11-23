package patches.gboard.features.manualincognito

import patches.gboard.shared.GboardMethodTarget

internal object GboardManualIncognitoTargets {
    val onStartInput = method(
        owner = "Lafae;",
        name = "onStartInput",
        parameters = listOf("Landroid/view/inputmethod/EditorInfo;", "Z"),
        returns = "V",
    )
    val onStartInputView = method(
        owner = "Lafae;",
        name = "onStartInputView",
        parameters = listOf("Landroid/view/inputmethod/EditorInfo;", "Z"),
        returns = "V",
    )
    val onWindowHidden = method("Lafae;", "onWindowHidden", emptyList(), "V")
    val incognitoPredicate = method("Lihw;", "K", emptyList(), "Z")
    val clipboardListener = method("Lljp;", "onPrimaryClipChanged", emptyList(), "V")
    val voiceEligibility = method(
        owner = "Lanip;",
        name = "e",
        parameters = listOf(
            "Landroid/content/Context;",
            "Landroid/view/inputmethod/EditorInfo;",
            "Z",
        ),
        returns = "Z",
    )
    val dictationEligibility = method(
        owner = "Lalzr;",
        name = "b",
        parameters = listOf("Lidr;", "Z", "Z"),
        returns = "Lwrq;",
    )
    private fun method(
        owner: String,
        name: String,
        parameters: List<String>,
        returns: String,
    ) = GboardMethodTarget(owner, name, parameters, returns)
}
