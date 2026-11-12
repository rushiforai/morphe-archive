# Proton VPN patches

**App:** Proton VPN (`ch.protonvpn.android`) · **version 5.20.98.0** · versionCode
`605209800` · minSdk 26 / targetSdk 36 · **single APK** carrying every ABI
(arm64-v8a, armeabi-v7a, x86, x86_64) — not a `.xapk`/bundle.

**Signer (SHA-256):** `dcc9439ec1a6c6a8d0203f3423ee42bcc8b970628e53cb73a0393f398dd5b853`.

## Patches

| Patch | Default | Toggle key | What it does |
|---|---|---|---|
| **Unlock Proton Plus features** | ✅ | `protonUnlockPlusFeatures` | Makes the client build a Plus VPN-user entity: subscription, plan identity, `maxTier = 2`, 10 connections, NetShield levels, no expiry/delinquent. |
| **Remove server-change delay** | ✅ | `protonRemoveServerChangeDelay` | Zeroes the short/long "change server" waits and raises the attempt limit (100). |
| **Disable telemetry (Sentry)** | ✅ | `protonDisableTelemetry` | No-ops the Sentry bootstrap and zeroes Proton's large-metrics sampling multiplier. |

All three apply cleanly (`failedPatches: []`) and each exposes a `SwitchPreference`
toggle in Morphe Manager, so any of them can be turned off before patching.

## Why this beats the community patch

The community (hoo-dles) patch forces one derived boolean — `isPlusMember` — and flips
three UI "restricted" flags, and removes the delay by fingerprinting
`getChangeServerLongDelayInSeconds` **by method name**. Proton VPN R8-shrinks its UI code,
so name-based fingerprints and per-screen flag flips are fragile and leave feature
availability incoherent.

This patch set works on the **single place** where the app turns a login response into its
VPN-user entity — `me/proton/core/presentation/utils/x.N(VpnInfoResponse, UserId,
SessionId, long, String) → eg.a` (it is the only `new eg.a(...)` site in the app) — by
overriding the getters that feed it:

| Anchor (real dex name) | Forced value | Effect |
|---|---|---|
| `VpnInfoResponse.getSubscribed()I` | `1` | account treated as subscribed |
| `VpnInfoResponse.getDelinquent()I` | `0` | clears the delinquent lock |
| `VPNInfo.getMaxTier()Ljava/lang/Integer;` | `Integer.valueOf(2)` | `eg.a.d()` is `maxTier >= 2` ⇒ **Plus** (`eg.a.c()` is `maxTier == 0` ⇒ free) |
| `VPNInfo.getMaxConnect()I` | `10` | Plus device/connection allowance |
| `VPNInfo.getTierName()` / `getPlanDisplayName()` | `"plus"` / `"Proton Plus"` | plan identity (`eg.a.b()` falls back to `"free"` when null) |
| `VPNInfo.getExpirationTime()I` | `Int.MAX_VALUE` | plan never "expired" |
| `VPNInfo.getNetShield()` + the three `NetShieldConfig` getters | all `true` | malware / ads+trackers / adult-content blocking available |

Because the entity itself carries Plus state, the settings screens, the feature-availability
logic and the connection limit all agree — no per-screen hacks.

The delay/telemetry side is anchored on **kept model names**
(`com.protonvpn.android.appconfig.AppConfigResponse`) instead of shrunk UI methods:
`getChangeServerShortDelayInSeconds`/`getChangeServerLongDelayInSeconds` → `0`,
`getChangeServerAttemptLimit` → `100`, `getLargeMetricsSamplingMultiplier` → `0`.

**Honest limits:** plan enforcement lives on Proton's **servers**. Plus-only server
countries, Secure Core/Tor back-ends and P2P are decided backend-side, so the client can
expose/select them but a free account may still be refused when connecting. This patch
unlocks everything the client controls (and the connection cap, NetShield levels and the
server-change delay are client-side, so those take effect).

## Telemetry

- **Sentry** — DSN `https://…@vpn-api.proton.me/core/v4/reports/sentry/12`. The bootstrap
  `wl.y.b()V` (guarded by the `sentry_is_enabled` preference) is replaced with `return-void`,
  so the SDK is never initialised; Sentry calls elsewhere become safe no-ops.
- **Large metrics** — `AppConfigResponse.getLargeMetricsSamplingMultiplier()` forced to `0`.
- No ad SDK ships, and no advertising ID is requested, so nothing else is needed for ads.

## Verification

- **Bytecode (independent re-decode of the patched APK):** every anchor above shows the
  forced value at the head of its method (`const v0, 0x1`, `const/4 v0, 0x2` +
  `Integer.valueOf`, `const v0, 0xa`, `const-string "plus"`, `const-string "Proton Plus"`,
  `const v0, 0x7fffffff`, `new-instance NetShieldConfig(true,true,true)`, `return-void` for
  the Sentry bootstrap).
- **Device (RootEmu, x86_64 Android 14 with ARM translation):** installs and launches
  cleanly to `me.proton.core.auth.presentation.ui.AddAccountActivity` (the "Create an
  account / Sign in" screen), process alive, **no `Fatal signal`, no `FATAL EXCEPTION`**.
- The entitlement takes effect when a login response is mapped, so the unlocked features
  show after signing in — that last visual confirmation needs an account.
