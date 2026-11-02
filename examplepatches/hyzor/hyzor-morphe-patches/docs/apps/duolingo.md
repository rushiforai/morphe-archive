# Duolingo

Package `com.duolingo`, supported target `6.104.3` (APKM, versionCode 2492).
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
(`ss90.<init>(User)` in 6.104.3), so only the signed-in account is affected —
opening a friend's profile still shows their real state — and the fields are set
again every time the state is rebuilt from a fresh server user. `EnergyConfig`'s primary
constructor gets `move p1, p2` and its Kotlinx default-args constructor gets `move p2, p3`
(the leading argument is the default-args mask), so the current energy is the maximum
whichever constructor the app uses.

MAX additionally sets the computed MAX bit, forces the
`VIDEO_CALL_IN_PATH` / `VIDEO_CALL_IN_PRACTICE_HUB` feature checks and clears the
two `VideoCallTabCtaButtonState` upsell flags that would otherwise open the purchase
screen from the bottom bar.

## Disable login integrity

`LoginRequest$EmailLoginRequest` carries a fourth constructor parameter, the login
integrity signal. On a re-signed sideload that signal fails attestation and login is
rejected. The app already ships an empty signal singleton (the one the normal email
login path passes), so the patch loads that instance instead of the supplied
parameter inside the constructor. That covers the builder, the shared-login lambda
and the Kotlinx serializer. Every other Duolingo patch depends on it.

## On-device verification

Verified end-to-end on a Pixel 9 (Android 17) with a real account, patching the
supplied APKM with the built bundle and installing the merged APK:

| Surface | Result |
|---|---|
| Install / cold start | installs and starts; no crash, still signed in after a force-stop |
| Home header | the top-right button reads **Super Dashboard** instead of the Super upsell |
| Super dashboard | member view: “SUPER duolingo”, **Manage Features** with **Unlimited energy** checked, **No ads** |
| Profile | **SUPER** badge next to the name |
| Settings | **DEBUG OPTIONS** section is present; opening it shows `DebugActivity` — `6.104.3 (2492) built Oct 30 4:25 PM ET` |
| Launcher | one `MAIN`/`LAUNCHER` entry (`com.duolingo/.app.LoginActivity`); the manifest goes from 216 to 4 `activity-alias` entries |
| RampUp timer | both `RampupTimerState$Paused` and `$Tick` constructors start with `const v1, 3600` in the patched DEX; not exercised in the UI — the test account has no RampUp challenge, and the debug `Show Ramp Up Challenge FAB` override did not surface one |

The MAX variant patches and applies cleanly (27 modified classes instead of 10,
`Q0`/`GOLD` set, both upsell flags zeroed) but was not installed; Super is the
default and was the one tested at runtime.

## Limitations

Only the client-side decision is changed. Subscription state that the Duolingo
backend owns (purchase, restore, live AI/video-call entitlement, account pages) still
sees the real account, and this build is still a re-signed sideload — the login
integrity patch keeps email login working, but it does not make the app pass Play
Integrity anywhere else.
