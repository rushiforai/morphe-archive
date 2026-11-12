package app.template.patches.protonvpn

import app.morphe.patcher.Fingerprint

/**
 * Fingerprints for Proton VPN 5.20.98.0 (versionCode 605209800), package
 * `ch.protonvpn.android`.
 *
 * Proton VPN R8-shrinks its UI/app code (`bj/`, `eg/`, `wl/`) but **keeps the
 * names of its model and config classes** (`com.protonvpn.android.models.login.*`,
 * `com.protonvpn.android.appconfig.*`) because they are (de)serialized. Those kept
 * classes are the anchors below — re-verify them on every app update.
 *
 * ## The entitlement choke point
 * `me/proton/core/presentation/utils/x.N(VpnInfoResponse, UserId, SessionId, long,
 * String)` is the **only** place the app builds the `eg.a` VPN-user entity from the
 * login response — it reads `VpnInfoResponse.getSubscribed()`/`getDelinquent()` and
 * `VPNInfo.getMaxTier()`/`getMaxConnect()`/`getTierName()`/`getPlanDisplayName()`/
 * `getExpirationTime()`/`getNetShield()` and passes them to `new eg.a(...)`.
 * Patching those *getters* therefore makes the whole app (UI, feature availability and
 * connection limits) see a Plus account, instead of forcing one derived boolean the
 * way the community patch does.
 *
 * `eg.a` semantics (from its methods): `a()` = maxTier (0 when null), `b()` = tierName
 * ("free" when null), `c()` = `maxTier == 0` (is free), `d()` = `maxTier >= 2` (is plus).
 * So **maxTier = 2 ⇒ Plus**.
 */

// --- Entitlement getters feeding the VpnUser entity (x.N) ------------------------

/** `VpnInfoResponse.getSubscribed()I` */
val VpnInfoResponseGetSubscribed = Fingerprint(
    definingClass = "Lcom/protonvpn/android/models/login/VpnInfoResponse;",
    name = "getSubscribed",
    returnType = "I",
    parameters = emptyList(),
)

/** `VpnInfoResponse.getDelinquent()I` */
val VpnInfoResponseGetDelinquent = Fingerprint(
    definingClass = "Lcom/protonvpn/android/models/login/VpnInfoResponse;",
    name = "getDelinquent",
    returnType = "I",
    parameters = emptyList(),
)

/** `VPNInfo.getMaxTier()Ljava/lang/Integer;` — null ⇒ tier 0. 2 == VPN Plus. */
val VpnInfoGetMaxTier = Fingerprint(
    definingClass = "Lcom/protonvpn/android/models/login/VPNInfo;",
    name = "getMaxTier",
    returnType = "Ljava/lang/Integer;",
    parameters = emptyList(),
)

/** `VPNInfo.getMaxConnect()I` — device/connection limit. */
val VpnInfoGetMaxConnect = Fingerprint(
    definingClass = "Lcom/protonvpn/android/models/login/VPNInfo;",
    name = "getMaxConnect",
    returnType = "I",
    parameters = emptyList(),
)

/** `VPNInfo.getTierName()Ljava/lang/String;` — `eg.a.b()` falls back to "free". */
val VpnInfoGetTierName = Fingerprint(
    definingClass = "Lcom/protonvpn/android/models/login/VPNInfo;",
    name = "getTierName",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
)

/** `VPNInfo.getPlanDisplayName()Ljava/lang/String;` — shown in the account UI. */
val VpnInfoGetPlanDisplayName = Fingerprint(
    definingClass = "Lcom/protonvpn/android/models/login/VPNInfo;",
    name = "getPlanDisplayName",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
)

/** `VPNInfo.getExpirationTime()I` — a past value can flag the plan as expired. */
val VpnInfoGetExpirationTime = Fingerprint(
    definingClass = "Lcom/protonvpn/android/models/login/VPNInfo;",
    name = "getExpirationTime",
    returnType = "I",
    parameters = emptyList(),
)

/** `VPNInfo.getNetShield()Lcom/protonvpn/android/models/login/NetShieldConfig;` */
val VpnInfoGetNetShield = Fingerprint(
    definingClass = "Lcom/protonvpn/android/models/login/VPNInfo;",
    name = "getNetShield",
    returnType = "Lcom/protonvpn/android/models/login/NetShieldConfig;",
    parameters = emptyList(),
)

// --- NetShield (block malware / ads+trackers / adult content) availability --------

/** `NetShieldConfig.getMalwareBlockingAvailable()Z` */
val NetShieldGetMalwareBlocking = Fingerprint(
    definingClass = "Lcom/protonvpn/android/models/login/NetShieldConfig;",
    name = "getMalwareBlockingAvailable",
    returnType = "Z",
    parameters = emptyList(),
)

/** `NetShieldConfig.getAdsAndTrackersBlockingAvailable()Z` */
val NetShieldGetAdsAndTrackersBlocking = Fingerprint(
    definingClass = "Lcom/protonvpn/android/models/login/NetShieldConfig;",
    name = "getAdsAndTrackersBlockingAvailable",
    returnType = "Z",
    parameters = emptyList(),
)

/** `NetShieldConfig.getAdultContentBlockingAvailable()Z` */
val NetShieldGetAdultContentBlocking = Fingerprint(
    definingClass = "Lcom/protonvpn/android/models/login/NetShieldConfig;",
    name = "getAdultContentBlockingAvailable",
    returnType = "Z",
    parameters = emptyList(),
)

// --- Server config (delays, attempt limit, telemetry sampling) --------------------

/** `AppConfigResponse.getChangeServerShortDelayInSeconds()I` */
val AppConfigGetChangeServerShortDelay = Fingerprint(
    definingClass = "Lcom/protonvpn/android/appconfig/AppConfigResponse;",
    name = "getChangeServerShortDelayInSeconds",
    returnType = "I",
    parameters = emptyList(),
)

/** `AppConfigResponse.getChangeServerLongDelayInSeconds()I` */
val AppConfigGetChangeServerLongDelay = Fingerprint(
    definingClass = "Lcom/protonvpn/android/appconfig/AppConfigResponse;",
    name = "getChangeServerLongDelayInSeconds",
    returnType = "I",
    parameters = emptyList(),
)

/** `AppConfigResponse.getChangeServerAttemptLimit()I` */
val AppConfigGetChangeServerAttemptLimit = Fingerprint(
    definingClass = "Lcom/protonvpn/android/appconfig/AppConfigResponse;",
    name = "getChangeServerAttemptLimit",
    returnType = "I",
    parameters = emptyList(),
)

/** `AppConfigResponse.getLargeMetricsSamplingMultiplier()I` — Proton's telemetry. */
val AppConfigGetLargeMetricsSamplingMultiplier = Fingerprint(
    definingClass = "Lcom/protonvpn/android/appconfig/AppConfigResponse;",
    name = "getLargeMetricsSamplingMultiplier",
    returnType = "I",
    parameters = emptyList(),
)

// --- Sentry (crash/telemetry reporting) ------------------------------------------

/**
 * `wl.y.b()V` — the app's Sentry bootstrap (reads the `sentry_is_enabled` pref and
 * calls `io.sentry.p2.f(...)` / `SentryAndroid` init). Same class also exposes
 * `a()Ljava/lang/String;` (DSN) and `b()`; identified by the pair so an R8 shift
 * cannot silently match the wrong method.
 */
val SentryBootstrap = Fingerprint(
    definingClass = "Lwl/y;",
    name = "b",
    returnType = "V",
    parameters = emptyList(),
    strings = listOf("sentry_is_enabled"),
)
