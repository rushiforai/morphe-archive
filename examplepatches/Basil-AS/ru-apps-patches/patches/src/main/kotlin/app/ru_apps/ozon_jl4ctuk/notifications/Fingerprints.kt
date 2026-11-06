// Ported from Jl4cTuk/morphe-patches (GPLv3), app/template/patches/ozon/notifications/Fingerprints.kt.
package app.ru_apps.ozon_jl4ctuk.notifications

import app.morphe.patcher.Fingerprint

/**
 * Matches the shared Ozon Push SDK handler used by FCM, RuStore Push, and HMS.
 *
 * Only the `"OzonPushServiceDelegate"` log tag is required: live decompile of a 2026-10 build
 * confirmed the other two strings this used to require ("The received push message isn't an Ozon
 * push message.", "pw_msg_tag") moved out of this method during a refactor, but the tag string
 * alone is still enough to disambiguate — there's exactly one `(RemoteMessage, *, String) -> void`
 * method in the whole app containing it; the other call-sites matching that shape are thin
 * delegating wrappers with no string literals of their own.
 */
object OzonPushServiceDelegateFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "Lru/ozon/push/sdk/external/service/RemoteMessage;",
        "L",
        "Ljava/lang/String;",
    ),
    strings = listOf("OzonPushServiceDelegate"),
)
