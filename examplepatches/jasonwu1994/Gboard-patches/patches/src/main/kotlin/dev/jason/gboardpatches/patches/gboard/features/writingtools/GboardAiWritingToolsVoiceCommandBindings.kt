package dev.jason.gboardpatches.patches.gboard.features.writingtools

import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardMethodBinding

internal object GboardAiWritingToolsVoiceCommandBindings {
    const val targetVersion = "17.7.7"

    val genAiInit = GboardMethodBinding(
        classType = "Lhoa;",
        name = "c",
        parameterTypes = listOf(
            "Lcom/google/android/apps/inputmethod/libs/nga/impl/input/NgaInputManager;",
            "Lgvm;",
        ),
        returnType = "V",
    )

    val ngaInputRefresh = GboardMethodBinding(
        classType = "Lcom/google/android/apps/inputmethod/libs/nga/impl/input/NgaInputManager;",
        name = "n",
        parameterTypes = emptyList(),
        returnType = "V",
    )

    val smartEditInit = GboardMethodBinding(
        classType = "Lhoa;",
        name = "d",
        parameterTypes = emptyList(),
        returnType = "V",
    )

    val modulePredicate = GboardMethodBinding(
        classType = "Lgfo;",
        name = "a",
        parameterTypes = listOf("Lnea;"),
        returnType = "Z",
    )

    val ambiguityConstructor = GboardMethodBinding(
        classType = "Lgfl;",
        name = "<init>",
        parameterTypes = emptyList(),
        returnType = "V",
    )

    val classifierInit = GboardMethodBinding(
        classType = "Lgfn;",
        name = "a",
        parameterTypes = listOf("Landroid/content/Context;"),
        returnType = "Lwcz;",
    )

    val classificationRun = GboardMethodBinding(
        classType = "Lgfh;",
        name = "run",
        parameterTypes = emptyList(),
        returnType = "V",
    )

    val protoValue = GboardMethodBinding(
        classType = "Lneu;",
        name = "l",
        parameterTypes = emptyList(),
        returnType = "Lyxf;",
    )

    val smartEditRequest = GboardMethodBinding(
        classType = "Lhnk;",
        name = "run",
        parameterTypes = emptyList(),
        returnType = "V",
    )
}

internal fun GboardMethodBinding.descriptor(): String =
    classType + "->" + name + "(" + parameterTypes.joinToString("") + ")" + returnType
