# W-rung — v1.3.1-R2 fix round (2026-11-11)

## What your S-results proved

| Build | Patch | Verdict |
|---|---|---|
| s1 | 02a eula read-bypass | **guilty** — T&C gone but stuck at "Almost there!", black screen on reopen |
| s2 | 03a manifest cut | **guilty** — instant crash |
| s3 | 03c string blanks | innocent — and the only patch with a visible effect (part of a VPN Pro notice blanked) |
| s4 | 02b r65.l → false | innocent — but the data-collection dialog still showed (wrong gate) |
| s5 | 02c mm6.e → false | innocent — but the default-browser dialog still showed (wrong gate) |
| s6 | 03b wdn.a → false | innocent — but the VPN Pro button still showed (not wdn-gated) |

Root cause of the s1 hang: the old 02a faked the *reads* of
`eula_accepted.gdpr` but never *wrote* it and never ran the real accept path.
The onboarding state machine then deadlocks at the "Almost there!"
finalization. The dialogs 02b/02c targeted are standalone re-prompts — the
first-run dialogs you saw are steps of the onboarding machine itself.

## The two builds

| # | File | Content | Expected |
|---|---|---|---|
| 1 | `W2-rung-universal_signed.apk` | C1 + all of the below | **flash this first** — the v1.3.1 feature candidate |
| 2 | `W1-rung-universal_signed.apk` | C1 + only the four proven-innocent patches (02b, 02c, 03b, 03c-extended) | fallback differential — only needed if W2 misbehaves |

What W2 changes (W1 + these):

1. **02a' — T&C auto-accept.** The fresh-launch branch now calls the real T&C
   accept handler (`WelcomeActivity.X()`): it writes `eula_accepted.gdpr`,
   starts the startup dependencies and continues the flow — byte-for-byte the
   same state as pressing "Next". No T&C dialog, no deadlock.
2. **Default-browser onboarding step killed** (`canOfferDefaultBrowser` → false).
3. **Data-collection ("Help us make Opera better") step killed** (CONSENT +
   CMP_INTRO gates → false). Unasked consent = all collection denied.
4. **Omnibox VPN Pro + eSIM suggestion chips removed** (the suggestion enum is
   emptied).
5. 03c extended: 12 VPN Pro / eSIM promo strings blanked in all locales.
6. The wallpaper/interests picker + "Start browsing" is intentionally KEPT
   (it is the step that completes first-run properly).

## Flash protocol

Uninstall Opera Beta first (same keystore as before, clean baseline).

**W2 checklist** (one line per item is enough):

1. Installs without Play Protect warning.
2. First open: splash → **no T&C dialog** → **no default-browser dialog** →
   **no data-collection dialog** → wallpaper/interests picker → "Start
   browsing" → **new tab page appears (no "Almost there!" hang)**.
3. Close and reopen: normal start, no black screen, no dialogs re-appearing.
4. Omnibox: focus it / type — **no VPN Pro or eSIM suggestion chip**.
5. Free VPN still works (VPN toggle in settings/start page).
6. Anywhere VPN Pro text/button survives — note where.
7. Adblock spot-check (optional): built-in enhanced mode should behave as
   stock (35% on your test site is the stock baseline — custom lists are the
   v1.3.2 default-list item, not in this build).

**If W2 crashes or hangs**: flash W1.
- W1 boots + W2 fails → my redesign is guilty; the diag log will say where
  (`Android/data/com.opera.browser.beta/files/vogelkop-diag.log` — W2 carries
  the startup diagnostics).
- W1 also fails → combination issue among the innocent four (unexpected;
  would bisect next).

## Hashes

```
1584a87927885ff523788704ac0df58bb8f20ef536781eb37a33cbb695ff39b3  W1-rung-universal_signed.apk
ac83c18e43585da0705467e95fbfd87ad89931bae96753bcb2850d78f3dfecc8  W2-rung-universal_signed.apk
```
