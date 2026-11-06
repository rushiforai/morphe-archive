package dev.jason.gboardpatches.patches.gboard.shared.accesspoint

import dev.jason.gboardpatches.patches.gboard.shared.GboardMethodTarget

internal object GboardAccessPointContributions1803Targets {
    val orderFactory = GboardMethodTarget(
        classType = "Lmjv;",
        name = "n",
        parameterTypes = listOf(
            "Landroid/content/Context;",
            "Lmxf;",
            "Lnmm;",
            "Lvxe;",
            "Lvxe;",
        ),
        returnType = "Lmjv;",
    )

    val controllerConstructor = GboardMethodTarget(
        classType = "Lmlh;",
        name = "<init>",
        parameterTypes = listOf("Landroid/content/Context;", "Lmmq;"),
        returnType = "V",
    )
}
