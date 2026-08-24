package dev.jason.gboardpatches.patches.gboard.features.manualincognito

import dev.jason.gboardpatches.patches.gboard.shared.GboardMethodTarget

internal object GboardManualIncognitoTargets {
    val onStartInput = method(
        owner = "Loup;",
        name = "onStartInput",
        parameters = listOf("Landroid/view/inputmethod/EditorInfo;", "Z"),
        returns = "V",
    )
    val onStartInputView = method(
        owner = "Loup;",
        name = "onStartInputView",
        parameters = listOf("Landroid/view/inputmethod/EditorInfo;", "Z"),
        returns = "V",
    )
    val onWindowHidden = method("Loup;", "onWindowHidden", emptyList(), "V")
    val incognitoPredicate = method("Leqy;", "G", emptyList(), "Z")
    val clipboardListener = method("Lfjv;", "onPrimaryClipChanged", emptyList(), "V")
    val voiceEligibility = method(
        owner = "Lunb;",
        name = "cm",
        parameters = listOf(
            "Landroid/content/Context;",
            "Landroid/view/inputmethod/EditorInfo;",
            "Z",
        ),
        returns = "Z",
    )
    val dictationEligibility = method(
        owner = "Lsdg;",
        name = "b",
        parameters = listOf("Lenf;", "Z", "Z"),
        returns = "Lkmp;",
    )
    val orderFactory = method(
        owner = "Lmjv;",
        name = "n",
        parameters = listOf(
            "Landroid/content/Context;",
            "Lmxf;",
            "Lnmm;",
            "Lvxe;",
            "Lvxe;",
        ),
        returns = "Lmjv;",
    )
    val accessPointControllerConstructor = method(
        owner = "Lmlh;",
        name = "<init>",
        parameters = listOf("Landroid/content/Context;", "Lmmq;"),
        returns = "V",
    )

    private fun method(
        owner: String,
        name: String,
        parameters: List<String>,
        returns: String,
    ) = GboardMethodTarget(owner, name, parameters, returns)
}
