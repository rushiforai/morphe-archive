# SnoreLab

Package `com.snorelab.app`, supported target `2.33.7.7953` (XAPK).
Source: [`patches/src/main/kotlin/dev/hyzor/patches/snorelab/`](../../patches/src/main/kotlin/dev/hyzor/patches/snorelab/).

| Patch | Default | What it does |
|---|---|---|
| Enable Premium | on | Unlocks the in-app premium features. |

## Port notes

This is a port of [hoo-dles/morphe-patches](https://github.com/hoo-dles/morphe-patches)'
2.27.3.6291 patch. The 2.33.x build is not a drop-in replacement for its fingerprints:
the prefs class gained two more boolean getters, and a second class now matches the
"public one-object constructor" anchor, so both reference fingerprints become
ambiguous. `Fingerprints.kt` pins the exact method / premium-source interface and
documents why.

The 2.33.5.7814 → 2.33.7.7953 bump needed no fingerprint changes. The prefs holder
moved from `vp.h` to `up.h` (the patch matches it by its `sharedPrefs`, `jsonBridge`
and `remotePremiumActive` string anchors), and both hook methods kept their shape:
`up.h.q()` is still the only `remotePremiumActive` getter, and `mp.d` still implements
`pl.a0`. Only the pinned class name in `tools/verify_fingerprints.py` and the
compatibility target changed.

The 2.33.5.7814 build was verified end-to-end on a Pixel 9 (Android 17): a premium-only
soundscape (`Soundscape.FOREST`) selects and plays without opening the purchase
screen, Trends renders without its upgrade banner, and *Settings → Profile → Your
Subscription* reports “You have the Premium version of SnoreLab”.

For 2.33.7.7953:

- `tools/verify_fingerprints.py` resolves both anchors against the stock XAPK.
- `morphe-desktop patch --validate` applied `Enable Premium` to the stock XAPK: each
  fingerprint matched exactly once (`Changed 2 of 48159 classes to mutable`), and the
  patched DEX shows `up.h.q()` and `mp.d.p(...)` as `const/4 v0, 0x1; return v0`.
- On an Android 16 (API 36) x86_64 emulator with ARM translation, onboarding completed,
  a session started and stopped, Trends demo data rendered without an upgrade banner,
  and *Settings → Profile → Your Subscription* reports “You have the Premium version of
  SnoreLab with access to all features.” No fatal exception was logged.
- Not exercised: the soundscape selector (`SoundscapeActivity`) is not linked from any
  screen reachable in this build, so the premium-soundscape playback check was not
  repeated. Its lock decision (`SoundscapeActivity.a`) reads the same
  `SnoreLabPremiumStatus.q()` the subscription page reports, which was verified as
  Premium.

## How the app decides you are premium

SnoreLab uses the `lib-billing` library. `BasePremiumRepository` (`pl.c`) merges Play
Billing with a local premium source (`mp.d`):

1. `mp.d` reads `remotePremiumActive` and `remotePremiumExpirationDate` from the
   user-data SharedPreferences (`up.h`).
2. It emits `Premium` when the flag is set and the expiry is in the future;
   otherwise `Expired` or `Free`.
3. `pl.c` keeps a local `Premium` even when Play Billing returns no purchases, and
   `pl.a0.isPremium()` follows the merged state.

The patch forces the two inputs of the local source (`up.h.q()` → true and
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
