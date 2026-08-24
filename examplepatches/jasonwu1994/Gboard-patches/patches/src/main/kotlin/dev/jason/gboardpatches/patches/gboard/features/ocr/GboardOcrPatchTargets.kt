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
        classType = "Lytg;",
        name = "p",
        parameterTypes = listOf("Lzpo;"),
        returnType = "[Lkve;",
    )
    val moduleManagerRequest = GboardMethodTarget(
        classType = "Lzqi;",
        name = "a",
        parameterTypes = emptyList(),
        returnType = "[Lkve;",
    )
    val thinRecognizerInit = GboardMethodTarget(
        classType = "Lzqb;",
        name = "a",
        parameterTypes = emptyList(),
        returnType = "V",
    )

    private fun method(name: String, returnType: String) = GboardMethodTarget(
        classType = "Lzqn;",
        name = name,
        parameterTypes = emptyList(),
        returnType = returnType,
    )
}
