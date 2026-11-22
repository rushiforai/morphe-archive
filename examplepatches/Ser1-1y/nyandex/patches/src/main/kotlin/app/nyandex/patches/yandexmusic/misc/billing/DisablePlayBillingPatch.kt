/*
 * Copyright 2026 Nyandex contributors.
 *
 * Nyandex: Yandex Music patches for Morphe Patcher.
 * Licensed under the GNU General Public License v3.0; see LICENSE and NOTICE.
 */

package app.nyandex.patches.yandexmusic.misc.billing

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.nyandex.patches.yandexmusic.shared.Constants.COMPATIBILITY_YANDEX_MUSIC
import app.nyandex.patches.yandexmusic.util.StringReplacement
import app.nyandex.patches.yandexmusic.util.replaceStringConstants
import java.util.logging.Logger

private val logger = Logger.getLogger("YandexMusicDisableBilling")

private const val DISABLED_ACTION = "app.nyandex.yandexmusic.BILLING_DISABLED"

/**
 * Binder actions and interface descriptors used by Play Billing and Play Core.
 *
 * Replacing the descriptors with a name that no Play Store service exports makes every
 * bind/transaction fail locally. The app does not need billing when the Plus flags are
 * forced by the entitlement patch, and the replacement keeps the mod from talking to
 * the real billing service.
 *
 * Longest values must come first where one is a prefix of another; the shared replacement
 * helper also prefers the most specific match.
 */
private val BILLING_STRINGS = arrayOf(
    "com.android.vending.billing.InAppBillingService.BIND",
    "com.android.vending.billing.IN_APP_BILLING_RESULT_UPDATE_ACTION",
    "com.android.vending.billing.IInAppBillingService",
    "com.google.android.play.core.install.BIND_UPDATE_SERVICE",
    "com.google.android.play.core.install.ACTION_INSTALL_STATUS",
    "com.google.android.play.core.appupdate.protocol.IAppUpdateServiceCallback",
    "com.google.android.play.core.appupdate.protocol.IAppUpdateService",
    "com.google.android.play.core.inappreview.protocol.IInAppReviewServiceCallback",
    "com.google.android.play.core.inappreview.protocol.IInAppReviewService",
    "com.google.android.apps.play.billingtestcompanion.BillingOverrideService.BIND",
)

val disablePlayBillingPatch = patch(
    name = "Отключить Play Billing",
    description = "Отключает вызовы Play Billing и Play Core. Делает покупки недоступными.",
) {
    compatibleWith(COMPATIBILITY_YANDEX_MUSIC)

    execute {
        val replacements = BILLING_STRINGS.map { StringReplacement(it, DISABLED_ACTION) }
        val changed = replaceStringConstants(*replacements.toTypedArray())

        if (changed == 0) {
            throw PatchException("No Play Billing or Play Core string constant was found")
        }

        logger.info("Disabled $changed billing/Play Core string constants")
    }
}
