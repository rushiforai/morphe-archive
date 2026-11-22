/*
 * Copyright 2026 Nyandex contributors.
 *
 * Nyandex: Yandex Music patches for Morphe Patcher.
 * Licensed under the GNU General Public License v3.0; see LICENSE and NOTICE.
 */

package app.nyandex.patches.yandexmusic.misc.entitlement

import app.morphe.patcher.patch.patch
import app.nyandex.patches.yandexmusic.shared.Constants.COMPATIBILITY_YANDEX_MUSIC
import app.nyandex.patches.yandexmusic.util.findMusicSessionClass
import app.nyandex.patches.yandexmusic.util.forceBooleanField
import java.util.logging.Logger

private val logger = Logger.getLogger("YandexMusicUnlockPlus")

private data class BooleanOverride(
    val classType: String,
    val fieldName: String,
    val value: Boolean,
    val meaning: String,
)

/**
 * Client-side entitlement flags. Yandex Music receives these values from the server and
 * then trusts them for UI and playback gates, so the constructor writes are the narrowest
 * place to make the rest of the app see an active subscription.
 *
 * [sessionClass] is resolved by shape because R8 renames it between builds.
 */
private fun entitlementOverrides(sessionClass: String) = listOf(
    // ru.yandex.music user session DTO.
    BooleanOverride(sessionClass, "d", true, "serviceAvailable"),
    BooleanOverride(sessionClass, "f", false, "isKid"),
    BooleanOverride(sessionClass, "g", true, "hasPlus"),
    BooleanOverride(sessionClass, "h", true, "hasMusicSubscription"),

    // Passport DTOs that carry the same flags independently of the music session.
    BooleanOverride("Lcom/yandex/passport/data/network/d4;", "b", true, "hasPlus"),
    BooleanOverride("Lcom/yandex/passport/internal/database/b;", "c", false, "isChild"),
    BooleanOverride("Lcom/yandex/passport/internal/database/b;", "d", true, "hasPlus"),
    BooleanOverride("Lcom/yandex/passport/common/core/g;", "p", true, "hasPlus"),
    BooleanOverride("Lcom/yandex/passport/common/core/g;", "q", true, "hasMusicSubscription"),
    BooleanOverride("Lcom/yandex/passport/common/core/g;", "x", false, "isChild"),
    BooleanOverride("Lcom/yandex/passport/data/models/w;", "q", true, "hasPlus"),
    BooleanOverride("Lcom/yandex/passport/data/models/w;", "r", true, "hasMusicSubscription"),
    BooleanOverride("Lcom/yandex/passport/data/models/w;", "y", false, "isChild"),
    BooleanOverride("Lcom/yandex/passport/internal/account/g;", "o", true, "hasPlus"),
    BooleanOverride("Lcom/yandex/passport/internal/ui/bouncer/model/m2;", "h", true, "hasPlus"),
    BooleanOverride(
        "Lcom/yandex/passport/internal/ui/bouncer/roundabout/items/h0;",
        "g",
        true,
        "hasPlus",
    ),
    BooleanOverride(
        "Lcom/yandex/passport/internal/ui/bouncer/roundabout/items/i0;",
        "i",
        true,
        "hasPlus",
    ),
)

val unlockYandexPlusPatch = patch(
    name = "Разблокировать Яндекс Плюс",
    description = "Разблокирует клиентский код, включающий подписку Plus.",
) {
    compatibleWith(COMPATIBILITY_YANDEX_MUSIC)

    execute {
        val overrides = entitlementOverrides(findMusicSessionClass())
        val patchedWrites = overrides.sumOf { override ->
            forceBooleanField(
                classType = override.classType,
                fieldName = override.fieldName,
                value = override.value,
            )
        }

        check(patchedWrites >= overrides.size) {
            "Expected at least ${overrides.size} entitlement writes, " +
                "but patched $patchedWrites"
        }

        logger.info("Forced $patchedWrites entitlement boolean writes")
    }
}
