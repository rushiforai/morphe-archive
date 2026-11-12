# X-rung — v1.3.1-R3: the waiter fix (2026-11-12)

## What your W-results proved

| Build | Verdict |
|---|---|
| W1 | **boots** — the four-innocent combination (02b, 02c, 03b, 03c-ext) is cleared |
| W2 | patches all visibly work (no T&C, no default-browser step, no data-collection step, wallpaper picker kept) — but **"Start browsing" froze the app**, and reopening gave a black screen |

## Why W2 froze (found it)

On a fresh install, Opera's onboarding refuses to finish until a
**startup-dependency waiter** is satisfied: the remote-config bundle and the
Leanplum/Braze push-marketing start, or a ~15 s give-up timeout. Stock
resolves this wait, which is why every earlier rung booted. In the patched
flow (S1 and W2 alike) none of those completion signals ever arrive, so the
app parks on the "Almost there!" dependencies screen forever — that was
your freeze, and the black screen on reopen is the same gate hit with an
empty step queue.

The X-rung kills the waiter outright (02f): the first run now behaves like
every later launch, which never wait. The splash you flagged ("Opera logo
with a loading bar") is also gone (02h) — that screen is a stock
"delayed launch" cover, not a patch target until now.

## The two builds

| # | File | Content | Expected |
|---|---|---|---|
| 1 | `X2-rung-universal_signed.apk` | W2 + waiter bypass + splash skip | **flash this first** — the v1.3.1 feature candidate |
| 2 | `X1-rung-universal_signed.apk` | W2 + waiter bypass only | differential — only needed if X2 misbehaves |

Everything else is exactly what W2 carried: no T&C (auto-accepted the same
way a real "Next" press does), no default-browser step, no data-collection
step (unasked consent = everything denied), no VPN Pro / eSIM omnibox
chips, VPN Pro strings blanked, and the C1 startup diagnostics
(`Android/data/com.opera.browser.beta/files/vogelkop-diag.log`).

## Flash protocol

Uninstall Opera Beta first (same keystore as before, clean baseline).

**X2 checklist** (one line per item is enough):

1. Installs without Play Protect warning.
2. First open: **no Opera-logo loading screen** → wallpaper/interests
   picker → "Start browsing" → **browser opens (no freeze)**.
3. Close and reopen: normal start, no black screen, no dialogs
   re-appearing, no splash.
4. Omnibox: focus it / type — no VPN Pro or eSIM suggestion chip.
5. Free VPN still works (VPN toggle in settings / start page).
6. Anywhere VPN Pro text/button survives — note where.
7. Optional: note whether first launch feels "unconfigured" for a few
   seconds (remote config now arrives in the background after the browser
   opens, instead of before).

**If X2 misbehaves**: flash X1 (splash still shows there, waiter bypassed).
- X1 boots + X2 fails → the splash skip is guilty (unexpected — it only
  removes one screen posting); report what X2 did.
- X1 also fails → the waiter model is wrong or incomplete; grab the diag
  log (`vogelkop-diag.log`) and tell me where it stopped.

## Hashes

```
9e75640a5307979c2152c606bede55550e93e64052d6a01c01abc108ae48b66f  X1-rung-universal_signed.apk
45d60f9a4674f21366e1e0d039fe9a3abbbf6b764cfaf7765bb0e00d10bdc410  X2-rung-universal_signed.apk
```
