# Sleep as Android

Package `com.urbandroid.sleep`, supported target `20261016`.
Source: [`patches/src/main/kotlin/dev/hyzor/patches/sleep/`](../../patches/src/main/kotlin/dev/hyzor/patches/sleep/).

| Patch | Default | What it does |
|---|---|---|
| Enable Premium | on | Unlocks the in-app premium features. |
| Enable Cloud Premium | off | Reports the Sleep Cloud subscription as active (client-side only). |

`20261016` is the build the fingerprints and register counts were verified against.

## How the app decides you are premium

Sleep as Android validates in-app purchases entirely on-device:

1. Play Billing returns a purchase; the app verifies Play's signature over it with an
   RSA key embedded in `classes4.dex` (`Billing.verify`, `SHA1withRSA`).
2. On success it writes `BS = 42` into the `TVF` SharedPreferences file — a plain
   `long`, no MAC, no Keystore wrapping.
3. `TrialFilter.refresh()` maps that to `isTrial = false`, which 64 call sites read.

There is no server-issued licence. The patches therefore rewrite the decision
(`isTrial`, `hasUnlock`, `isUnlockAcked`) rather than trying to forge a receipt, and
additionally clear the two tamper signals a re-signed sideload triggers
(`isOurSignature`, `isUnknownSource`).

The genuine paid unlocker (`com.urbandroid.sleep.full.key`) is *not* required and
does **not** work alongside these patches — Morphe re-signs the app, so the
`checkSignatures()` comparison between the two packages no longer matches.

## Port history

`20261016` (versionCode 2311729) was ported from `20261006` (2311725). The licensing core did
not move: `PreferencesUtils` is byte-identical apart from `.line` debug markers, and
`TrialFilter` differs only by two `const-string` → `const-string/jumbo` re-encodings (string-pool
index growth). The `TVF` keys (`BS`, `UNLKACK`, `CP`) are unchanged, and `isTrial` / `hasUnlock`
are still private to `TrialFilter` with no read outside the class, so every consumer still goes
through the getters the patch rewrites. All seven fingerprints resolved on the first check
(`tools/verify_fingerprints.py`), and Morphe applied the set with `--validate`: every fingerprint
matched exactly once and only `TrialFilter` and `PreferencesUtils` were made mutable.

Verified on an Android 16 (API 36) emulator (`sdk_gphone64_x86_64`, ABI list
`x86_64,arm64-v8a`): cold start with no fatal exception, and on the patched build the
`AlarmClock` home screen shows no "SALE 50% OFF" / "Premium trial 4 day(s) left" banner, while
the same build installed *unpatched* on that emulator shows that banner — the differential was run
back-to-back on the same screen. The premium prompt the patch's description refers to also
changes: stock offers "4 days FREE Premium trial", patched offers "Wait, I already paid!". The
re-signed patched build still logs `TrialFilter: Package: unknown - Y/vJ…` and still shows no
"This version is unofficial and may not work properly" strip, which is `isOurSignature()`
patched to true. That strip is only raised on a build whose certificate the app does not
recognise (which includes any re-signed build), so its absence is
established from the code path (`refreshTrialStatusForTabs` gates it on `isOurSignature()`) plus
the patched getter, not from an unpatched control build — stock keeps Urbandroid's certificate
and never trips the check. The Cloud variant (both patches) also applied with `--validate` and
was checked statically only: `isCloudPremiumStatus()` returns true and
`isCloudPremiumStatusUnknown()` false.

Not exercised: actual premium features (charts, lullabies, sleep tracking and its audio), a
physical arm64 device, and Sleep Cloud upload against the backend.

## Limitations

The patch only changes the client-side decision. Anything that authenticates against
Urbandroid's backend still sees the real account. Sleep Cloud Premium is reported as
active locally; the cloud service may still refuse requests.
