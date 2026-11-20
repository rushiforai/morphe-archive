package app.parchefacemoji.patches.facemoji.vip

import app.morphe.patcher.Fingerprint

/**
 * Huellas del sistema VIP/Pro de Facemoji 3.7.0.
 *
 * El estado "esto es de pago" de cada contenido no vive en una sola clase: cada modelo
 * (`CoolFontBean`, `SeriesStickerItem`, `StickerItem`, `TextBombBean`) lleva su propia
 * bandera, y la IU pregunta por ella antes de dejar aplicar el contenido. Esas banderas son
 * metodos con nombre propio (no los toca R8 porque son beans de datos), asi que son el punto
 * de enganche estable de esta version.
 *
 * Todas se han verificado sobre la APK 3.7.0 real (ver `analisis/34-vip-metodos.txt`).
 */

/** Fuentes de color: la app pregunta si la fuente es de pago. */
internal object CoolFontIsVipFingerprint : Fingerprint(
    definingClass = "Lcom/baidu/simeji/coolfont/CoolFontBean;",
    name = "isVip",
    returnType = "Z",
)

/** Fuentes de color: si esta desbloqueada por video o suscripcion. */
internal object CoolFontIsVipUnlockedFingerprint : Fingerprint(
    definingClass = "Lcom/baidu/simeji/coolfont/CoolFontBean;",
    name = "isVipUnLockByVideoOrSubscribe",
    returnType = "Z",
)

/** Fuentes de color: mapa de bloqueos ya desbloqueados por video. */
internal object CoolFontVipUnlockedObjectFingerprint : Fingerprint(
    definingClass = "Lcom/baidu/simeji/coolfont/CoolFontBean;",
    name = "getVipIsUnLock",
    returnType = "Ljava/lang/Boolean;",
)

/** Fuentes de color: si la fuente aparece con candado. */
internal object CoolFontIsFontLockFingerprint : Fingerprint(
    definingClass = "Lcom/baidu/simeji/coolfont/CoolFontBean;",
    name = "isFontLock",
    returnType = "Z",
)

/** Fuentes de color: candado o VIP, la comprobacion que usan las listas. */
internal object CoolFontIsFontStateLockOrVipFingerprint : Fingerprint(
    definingClass = "Lcom/baidu/simeji/coolfont/CoolFontBean;",
    name = "isFontStateLockOrVip",
    returnType = "Z",
)

/** Fuentes de color: si el elemento es de tipo bloqueado. */
internal object CoolFontIsLockTypeFingerprint : Fingerprint(
    definingClass = "Lcom/baidu/simeji/coolfont/CoolFontBean;",
    name = "isLockType",
    returnType = "Z",
)

/** Series de stickers de pago (catalogo). */
internal object SeriesStickerIsVipFingerprint : Fingerprint(
    definingClass = "Lcom/baidu/simeji/sticker/series/SeriesStickerItem;",
    name = "isSeriesVip",
    returnType = "Z",
)

/** Series de stickers de pago (modelo local del skin). */
internal object StickerItemIsSeriesVipFingerprint : Fingerprint(
    definingClass = "Lcom/baidu/simeji/skins/content/itemdata/StickerItem;",
    name = "isSeriesVip",
    returnType = "Z",
)

/** TextBomb: si el mensaje rapido es de pago. */
internal object TextBombIsVipFingerprint : Fingerprint(
    definingClass = "Lcom/baidu/simeji/inputview/convenient/textbomb/TextBombBean;",
    name = "isVip",
    returnType = "Z",
)

/** Teclado Rizz: bandera VIP de las frases (0 = para todos, 1 = solo VIP). */
internal object RizzConfigIsVipFingerprint : Fingerprint(
    definingClass = "Lcom/gbu/ime/kmm/biz/chatgpt/bean/rizzKeyboard/RizzConfigInfoDetail;",
    name = "isVip",
    returnType = "I",
)

/** Teclado Rizz: bandera VIP de los detalles adicionales. */
internal object RizzConfigDetailIsVipFingerprint : Fingerprint(
    definingClass = "Lcom/gbu/ime/kmm/biz/chatgpt/bean/rizzKeyboard/RizzConfigInfoDetail2;",
    name = "isVip",
    returnType = "I",
)

/** Teclado Rizz: bandera VIP de las frases para romper el hielo. */
internal object RizzIceBreakerIsVipFingerprint : Fingerprint(
    definingClass = "Lcom/gbu/ime/kmm/biz/chatgpt/bean/rizzKeyboard/RizzIceBreakerConfigInfoDetail;",
    name = "isVip",
    returnType = "I",
)
