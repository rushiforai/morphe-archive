# Duolingo

Package `com.duolingo`, supported target `6.104.5` (APKM, versionCode 2494).
Source: [`patches/src/main/kotlin/dev/hyzor/patches/duolingo/`](../../patches/src/main/kotlin/dev/hyzor/patches/duolingo/).

| Patch | Default | What it does |
|---|---|---|
| Enable Premium | on | Reports the signed-in account as Super (or MAX) so the client unlocks subscriber features. |
| Disable dynamic app icon | off | Removes the disabled launcher aliases so only the default icon remains. |
| Enable debug mode | off | Adds the hidden **Debug options** menu to Settings. |
| Unlimited RampUp time | off | Pins the RampUp challenge timer at one hour. |

This is a port of [hoo-dles/morphe-patches](https://github.com/hoo-dles/morphe-patches)'
Duolingo 6.98.4 patch set. The hooks that moved between 6.98.4 and 6.104.3:

| Hook | 6.98.4 | 6.104.3 |
|---|---|---|
| Email login builder | `LoginFragmentViewModel` class | class renamed; matched by return type `LoginRequest$EmailLoginRequest` and `(String, String)` parameters |
| `EnergyConfig` primary constructor | `(IIJJJIJ)V` | `(IIJJJIJLjava/lang/Integer;)V`; a Kotlin default-args constructor was added |
| `SubscriptionFeatures` | `com.duolingo.core.subscription.models` | `com.duolingo.data.subscription.models` |
| `VideoCallTabCtaButtonState` upsell fields | label directly followed by `iget-boolean` | label, `append`, then `iget-boolean`, so the filter uses `MatchAfterAnywhere` |
| `User.toString()` field labels | label, `append`, field | two labels and the field batched into a helper call; the field is still two instructions after the label |

## What moved in 6.104.5

6.104.5 is a patch-compatible bump: every fingerprint matches exactly once under
`--validate`, and only two obfuscated class names moved.

| Hook | 6.104.3 | 6.104.5 |
|---|---|---|
| Email login builder | `k3o.G0(String, String)` | `j3o.G0(String, String)` (method name unchanged) |
| `LoggedIn` state constructor | `ss90.<init>(User)` | `us90.<init>(User)` |
| `User` premium fields | `R0`, `Q0`, `y`, `B0` | unchanged |
| computed paid helper | `z22.k(User, f9d)Z` | unchanged |
| `EnergyConfig` constructors | `(IIJJJIJLjava/lang/Integer;)V` and `(IIIJJJIJLjava/lang/Integer;Z)V` | unchanged |
| debug `BuildTarget` class | `go3`, field `a` | unchanged |
| login signal / empty singleton | `Lri00;` / `Loi00;.a` | unchanged |

The class names are matched structurally (return type, parameter lists and instruction
shapes), so neither move needed a fingerprint change — only the comments and this page.

The few `app.morphe.util` helpers the patches use are implemented locally in
`dev.hyzor.patches.util` (`Dex.kt`) and `duolingo/shared/ToString.kt` rather than pulled in
from the shared patch library.

## How the app decides you are premium

Duolingo keeps the decision on the device, on the `User` model
(`com.duolingo.data.user.User`) that comes back with the session:

| Field | Serialized name | Meaning |
|---|---|---|
| `y` | `hasPlus` | the classic Super flag |
| `B0` | `subscriberLevel` | `FREE` / `LITE` / `PREMIUM` / `GOLD` |
| `R0` | — | computed "paid" bit read by every paid helper (`hasPlus` or the other flags) |
| `Q0` | — | computed "MAX" bit read by `MaxHooksUserData` |

The last two are calculated rather than serialized, so the patch finds them through
the helpers that read them (`z22.k(User, …)` for `R0`, the `MaxHooksUserData`
constructor for `Q0`) instead of through `toString()`.

The values are written into the `User` instance that the `LoggedIn` state wraps
(`us90.<init>(User)` in 6.104.5, `ss90` in 6.104.3), so only the signed-in account is
affected — opening a friend's profile still shows their real state — and the fields are set
again every time the state is rebuilt from a fresh server user. `EnergyConfig`'s primary
constructor gets `move p1, p2` and its Kotlinx default-args constructor gets `move p2, p3`
(the leading argument is the default-args mask), so the current energy is the maximum
whichever constructor the app uses.

MAX additionally sets the computed MAX bit, forces every method that checks the
`VIDEO_CALL_IN_PATH` / `VIDEO_CALL_IN_PRACTICE_HUB` feature and clears the two
`VideoCallTabCtaButtonState` upsell flags that would otherwise open the purchase screen from
the bottom bar.

## Disable login integrity

`LoginRequest$EmailLoginRequest` carries a fourth constructor parameter, the login
integrity signal. On a re-signed sideload that signal fails attestation and login is
rejected. The app already ships an empty signal singleton (the one the normal email
login path passes), so the patch loads that instance instead of the supplied
parameter inside the constructor. That covers the builder, the shared-login lambda
and the Kotlinx serializer. Every other Duolingo patch depends on it.

## Verification

Static, on the supplied 6.104.5 APKM with the built bundle:

| Check | Result |
|---|---|
| `tools/verify_fingerprints.py` | all four pinned class/method anchors resolve |
| Apply with `--validate` | all four patches apply; Super rewrites 8 classes, MAX 25 |
| Login constructor | `sget-object Loi00;.a` replaces the supplied signal before the `Lri00` field write |
| `LoggedIn(user)` | `R0` and `y` set, `B0` = `PREMIUM`; MAX also sets `Q0` and `B0` = `GOLD` |
| `EnergyConfig` | primary constructor starts `move p1, p2`, default-args constructor `move p2, p3` |
| RampUp timer | both `RampupTimerState$Paused` and `$Tick` constructors start with `const … 3600` |
| Debug mode | `go3.<init>` ends with `const/4 v0, 1` + `iput-boolean … .a:Z` |
| MAX feature checks | all 16 stock methods that read `SubscriptionFeatures.VIDEO_CALL_IN_PATH` / `…_PRACTICE_HUB` and call `contains` get `const/16 …, 1` after the result |
| MAX upsell flags | both `VideoCallTabCtaButtonState` upsell fields are written as 0 |
| Launcher | manifest goes from 216 `activity-alias` / 213 `LAUNCHER` entries to 4 / 1 |

On-device, on the Android 16 emulator (`sdk_gphone64_x86_64`, with arm64-v8a translation),
Super variant, from a fresh install of the merged APK:

| Surface | Result |
|---|---|
| Install / cold start | installs and starts; no `FATAL EXCEPTION`; `dumpsys package` reports 6.104.5 (2494) |
| Email login | a fresh install signs in with username + password through the re-signed build, i.e. the login-integrity patch holds |
| Home header | the top-right button is **Super Dashboard** instead of the Super upsell |
| Super dashboard | member view: “SUPER duolingo”, **Manage Features** with **Unlimited energy** checked, **No ads** |
| Profile | the **SUPER** badge is on the avatar card |
| Settings | **DEBUG OPTIONS** opens `DebugActivity` — `6.104.5 (2494) built Nov 03 10:11 AM ET` |
| Launcher | one `MAIN`/`LAUNCHER` entry (the manifest check above) |

The MAX variant also applies, validates and cold-starts (25 classes), but the signed-in
checks above were run on the Super build only. The test account has no RampUp challenge, so
the RampUp timer remains a DEX-only check.

## Limitations

Only the client-side decision is changed. Subscription state that the Duolingo
backend owns (purchase, restore, live AI/video-call entitlement, account pages) still
sees the real account, and this build is still a re-signed sideload — the login
integrity patch keeps email login working, but it does not make the app pass Play
Integrity anywhere else.
