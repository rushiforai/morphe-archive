package app.uakino.patches.ads

import app.morphe.patcher.Fingerprint

/*
 * Код UAKino обфускований R8 (пакет `uk`), тому класи шукаються за рядками,
 * які обфускація не змінює. Назви з UAKino 1.15 наведені лише для довідки.
 */

/**
 * `AdsTier(group=..., adFree=...)` — серверний рівень реклами.
 * 1.15: `Luk/dd;`, метод toString().
 */
internal object AdsTierToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("AdsTier(group="),
)

/**
 * Репозиторій банерів, який реалізує інтерфейс показу реклами.
 * 1.15: `Luk/br0;` (implements `Luk/g9;`), метод a(o7) логує "ad_impression".
 */
internal object AdImpressionFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("L"),
    strings = listOf("ad_platform", "uakino", "ad_impression"),
)

/**
 * `List d(Placement)` — синхронний список банерів для місця в UI.
 * 1.15: `Luk/br0;->d(Luk/da;)Ljava/util/List;`
 */
internal object BannersListFingerprint : Fingerprint(
    classFingerprint = AdImpressionFingerprint,
    returnType = "Ljava/util/List;",
    parameters = listOf("L"),
)

/**
 * `Flow<List> c(Placement)` — потік банерів для місця в UI.
 * 1.15: `Luk/br0;->c(Luk/da;)Luk/p64;`
 */
internal object BannersFlowFingerprint : Fingerprint(
    classFingerprint = AdImpressionFingerprint,
    parameters = listOf("L"),
    custom = { method, _ ->
        method.returnType.startsWith("L") &&
            method.returnType != "Ljava/util/List;" &&
            method.returnType != "Ljava/util/ArrayList;"
    },
)
