package app.template.patches.rustore.ads

import app.morphe.patcher.Fingerprint

/**
 * Matches `RawAdvertisementRepositoryImpl.get()`, the central entry point
 * used to load SSP, MyTarget, and VKR advertisements.
 */
object RawAdvertisementRepoGetFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf(
        "Ljava/util/List;",
        "L",
        "Ljava/util/List;",
        "L",
        "Ljava/util/Set;",
        "Ljava/util/UUID;",
        "Z",
        "L",
    ),
    custom = { method, classDef ->
        classDef.sourceFile == "RawAdvertisementRepositoryImpl.kt" &&
            method.implementation != null
    },
)

/**
 * Matches `SearchZeroState.Content`, whose first, second, and fourth fields
 * contain recommendations shown before a search query is entered.
 */
object SearchZeroContentConstructorFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    parameters = listOf(
        "L",
        "Ljava/util/List;",
        "L",
        "L",
        "Ljava/util/Map;",
        "Ljava/util/Map;",
    ),
    custom = { method, classDef ->
        classDef.sourceFile == "SearchZeroState.kt" &&
            method.implementation != null
    },
)
