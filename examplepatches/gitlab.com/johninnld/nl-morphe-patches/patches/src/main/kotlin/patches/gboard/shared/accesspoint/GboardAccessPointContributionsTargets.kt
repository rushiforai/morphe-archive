package patches.gboard.shared.accesspoint

import patches.gboard.shared.GboardMethodTarget

internal object GboardAccessPointContributionsTargets {
    val orderFactory = GboardMethodTarget(
        classType = "Laagb;",
        name = "m",
        parameterTypes = listOf(
            "Landroid/content/Context;",
            "Laaiz;",
            "Lackz;",
            "Lauco;",
            "Lauco;",
        ),
        returnType = "Laagb;",
    )

    val controllerConstructor = GboardMethodTarget(
        classType = "Laajh;",
        name = "<init>",
        parameterTypes = listOf("Landroid/content/Context;", "Laalq;"),
        returnType = "V",
    )
}
