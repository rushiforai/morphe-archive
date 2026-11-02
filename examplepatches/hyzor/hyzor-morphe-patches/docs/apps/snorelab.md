# SnoreLab

Package `com.snorelab.app`, supported target `2.33.5.7814` (XAPK).
Source: [`patches/src/main/kotlin/dev/hyzor/patches/snorelab/`](../../patches/src/main/kotlin/dev/hyzor/patches/snorelab/).

| Patch | Default | What it does |
|---|---|---|
| Enable Premium | on | Unlocks the in-app premium features. |

## Port notes

This is a port of [hoo-dles/morphe-patches](https://github.com/hoo-dles/morphe-patches)'
2.27.3.6291 patch. The newer build is not a drop-in replacement for its fingerprints:
the prefs class gained two more boolean getters, and a second class now matches the
"public one-object constructor" anchor, so both reference fingerprints become
ambiguous. `Fingerprints.kt` pins the exact method / premium-source interface and
documents why.

Verified end-to-end on a Pixel 9 (Android 17): a premium-only soundscape
(`Soundscape.FOREST`) selects and plays without opening the purchase screen, Trends
renders without its upgrade banner, and *Settings → Profile → Your Subscription*
reports “You have the Premium version of SnoreLab”.

## How the app decides you are premium

SnoreLab uses the `lib-billing` library. `BasePremiumRepository` (`pl.c`) merges Play
Billing with a local premium source (`mp.d`):

1. `mp.d` reads `remotePremiumActive` and `remotePremiumExpirationDate` from the
   user-data SharedPreferences (`vp.h`).
2. It emits `Premium` when the flag is set and the expiry is in the future;
   otherwise `Expired` or `Free`.
3. `pl.c` keeps a local `Premium` even when Play Billing returns no purchases, and
   `pl.a0.isPremium()` follows the merged state.

The patch forces the two inputs of the local source (`vp.h.q()` → true and
`mp.d.p(...)` → true), so the merge always produces `Premium`. It only changes the
client-side decision; anything that authenticates against SnoreLab's backend still
needs a real account.

## Recording immediately returns to the landing page

SnoreLab will not start a session without microphone access, and it does not show
an error when the permission is missing. `NightViewActivity` checks `RECORD_AUDIO`
in `onCreate`, then calls `finish()` and relaunches `MainActivity`, so tapping
**Start** looks like it bounces straight back to the home screen.

Grant the permission and try again:

- **Settings → Apps → SnoreLab → Permissions → Microphone → Allow while using app**, or
- `adb shell pm grant com.snorelab.app android.permission.RECORD_AUDIO`

Reinstalling or updating the app can reset runtime permissions, so re-check this
after every install. A test session can also be stopped from the ongoing
notification's **STOP** action; the in-app slide-to-stop control shows the
30-minute minimum-recording warning first.
