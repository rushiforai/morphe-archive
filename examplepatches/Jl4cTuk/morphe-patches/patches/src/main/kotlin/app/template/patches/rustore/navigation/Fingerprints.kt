package app.template.patches.rustore.navigation

import app.morphe.patcher.Fingerprint

/** Matches `BottomNavigationContainer`, which receives the visible navigation tabs. */
object BottomNavigationContainerFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "Ljava/util/List;",
        "Ljava/util/Map;",
        "Ljava/lang/String;",
        "L",
        "Lkotlin/jvm/functions/Function1;",
        "Lkotlin/jvm/functions/Function1;",
        "L",
        "L",
        "Landroidx/compose/runtime/a;",
        "I",
    ),
    custom = { method, classDef ->
        classDef.sourceFile == "BottomNavigationContainer.kt" && method.implementation != null
    },
)

/** Matches `RootNavHost`, which selects the app's initial navigation route. */
object RootNavHostFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "L",
        "Z",
        "L",
        "Landroidx/compose/runtime/a;",
        "I",
    ),
    custom = { method, classDef ->
        classDef.sourceFile == "RootNavHost.kt" && method.implementation != null
    },
)

/** Matches the singleton `ShowcaseTab.Featuring` variant. */
object FeaturedTabToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    strings = listOf("Featuring"),
    custom = { method, classDef ->
        classDef.sourceFile == "ShowcaseTab.kt" && method.implementation != null
    },
)

/** Matches the stateful `ShowcaseTab.Games` variant. */
object GamesTabToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    strings = listOf("Games(customIcon="),
    custom = { method, classDef ->
        classDef.sourceFile == "ShowcaseTab.kt" && method.implementation != null
    },
)
