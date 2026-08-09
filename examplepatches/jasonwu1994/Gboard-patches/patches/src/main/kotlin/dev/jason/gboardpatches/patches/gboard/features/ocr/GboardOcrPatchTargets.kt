package dev.jason.gboardpatches.patches.gboard.features.ocr

import dev.jason.gboardpatches.patches.gboard.shared.GboardMethodTarget

internal object GboardOcrPatchTargets {
    val configLabel = method("b", "Ljava/lang/String;")
    val languageHint = method("c", "Ljava/lang/String;")
    val loggingLibrary = method("d", "Ljava/lang/String;")
    val optionalModuleName = method("e", "Ljava/lang/String;")
    val moduleId = method("f", "Ljava/lang/String;")
    val moduleAvailability = method("g", "Z")

    val optionalModuleBuilder = GboardMethodTarget(
        classType = "Lxwg;",
        name = "a",
        parameterTypes = listOf("Lysk;"),
        returnType = "[Lkdd;",
    )
    val moduleManagerRequest = GboardMethodTarget(
        classType = "Lytc;",
        name = "a",
        parameterTypes = emptyList(),
        returnType = "[Lkdd;",
    )
    val thinRecognizerInit = GboardMethodTarget(
        classType = "Lysw;",
        name = "a",
        parameterTypes = emptyList(),
        returnType = "V",
    )

    private fun method(name: String, returnType: String) = GboardMethodTarget(
        classType = "Lyth;",
        name = name,
        parameterTypes = emptyList(),
        returnType = returnType,
    )
}
