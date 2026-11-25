package dev.jason.gboardpatches.patches.gboard.shared.accesspoint

import dev.jason.gboardpatches.patches.gboard.shared.GboardMethodTarget

internal object GboardAccessPointContributionsTargets {
    val orderFactory = GboardMethodTarget(
        classType = "Lmob;",
        name = "m",
        parameterTypes = listOf(
            "Landroid/content/Context;",
            "Lnbt;",
            "Lnru;",
            "Lwim;",
            "Lwim;",
        ),
        returnType = "Lmob;",
    )

    val controllerConstructor = GboardMethodTarget(
        classType = "Lmpq;",
        name = "<init>",
        parameterTypes = listOf("Landroid/content/Context;", "Lmqw;"),
        returnType = "V",
    )
}
