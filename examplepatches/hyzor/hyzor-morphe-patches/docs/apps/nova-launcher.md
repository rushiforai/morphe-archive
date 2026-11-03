# Nova Launcher

Package `com.teslacoilsw.launcher`, supported target `8.9.6` (versionCode `89600`, versionName
`89600 (8.9.6)`).
Source: [`patches/src/main/kotlin/dev/hyzor/patches/nova/`](../../patches/src/main/kotlin/dev/hyzor/patches/nova/).

| Patch | Default | What it does |
|---|---|---|
| Enable Prime | on | Unlocks the features gated on Nova Prime. |

## Why 8.9.6, not 8.9.5

8.9.5 has a settings regression of its own. Its custom switches change the persisted preference
but do not repaint, so almost every toggle looks dead: the row stays in its old state until the
screen is recreated. On a Pixel 9 running Android 17 this reproduced on the stock 8.9.5 APK, not
only on a patched build:

| Build | Show Keyboard switch |
|---|---|
| 8.9.5 stock | tap changes the preference but the switch does not repaint; the new value appears only after leaving and reopening the screen |
| 8.9.6 stock | turns off and on immediately, every tap |
| 8.9.6 + Enable Prime | turns off and on immediately, every tap |

8.9.6 fixes that in the app, so this bundle targets 8.9.6. 8.9.5 is deliberately not a target:
shipping the Prime patch on top of it would leave users with a settings screen that looks
broken.

## Port notes

Two upstream patches cover neighbouring Nova versions and neither drops in on 8.9.6:

- [rushiranpise/morphe-patches](https://github.com/rushiranpise/morphe-patches) targets 8.8.8
  and patches the static isPrime gate, the runtime Prime field and the subscription check.
- [hoo-dles/morphe-patches](https://github.com/hoo-dles/morphe-patches) targets 8.8.6 and
  rewrites only the persisted Prime value that the settings initialiser reads.

The obfuscated classes move with every release:

| Role | 8.8.x (upstream) | 8.9.5 | 8.9.6 |
|---|---|---|---|
| static Prime gate | `wu.v0.b()` | `px.b1.b()` | `qx.b1.b()` |
| Prime field / state initialiser | `oy.h2` | `i10.g2` | `j10.h2` |
| active-subscription check | `lv.c0.w()` | `fy.d0.w()` | `gy.d0.w()` |
| Prime grant | — | `fy.g0.a()` | `gy.g0.a()` |

8.9.5 added the Play licence (LVL) revocation path, so the reference fingerprints miss. The
hooks here are re-resolved against 8.9.6 and use instruction shapes rather than the obfuscated
class/method names wherever possible. The static gate's fingerprint still anchors on the
`j10/h2` field and the `gy/g0` call, so re-resolve those two anchors if they move.

One naming detail matters for compatibility: Nova's `versionName` is literally
`89600 (8.9.6)`, not `8.9.6`. Morphe compares the version name exactly, so
[`Constants.kt`](../../patches/src/main/kotlin/dev/hyzor/patches/nova/shared/Constants.kt)
declares the full string.

## How the app decides you are Prime

The Prime boolean is `j10.h2.h`. More than forty classes read that field directly; 17 more
call the static gate `qx.b1.b()`, whose body is:

```java
return j10.h2.h || qx.b1.b || gy.g0.a(context);
```

`qx.b1.b` (the field) is set when the separate Nova Prime unlocker APK is installed, and
`gy.g0.a()` is the time-limited grant read from the `nova_prime_grant` preferences.

The field itself is derived on startup by `j10.h2.a(SharedPreferences)` from the persisted
`"1"` integer: `h = value != 0` and `c = value == 0x200`, where `0x200` is the value the app
writes when it accepts a direct licence or the unlocker APK.

8.9.5 also added a revocation path that 8.9.6 keeps. `qx.b1.c(context)` returns immediately when
`gy.d0.w(context)` reports a fresh subscription; otherwise it installs the Play licence
checker. On a re-signed build that check always fails; `ci.j4.d()` clears `"1"` and posts
`qx.b1.g`, which re-enters `qx.b1.c()` and can drop `j10.h2.h` back to `false`. The same
`gy.d0.w()` result makes the billing sync keep the cached subscription and skip the "Play
query returned nothing" downgrade.

## What the patch changes

1. `qx.b1.b()` returns `true`.
2. The `getInt("1", 0)` result in `j10.h2.a()` is overwritten with `0x200`, so the app starts
   in its own Prime state (`h = true`, `c = true`).
3. `gy.d0.w(context)` returns `true`. This reports an active subscription and, because
   `qx.b1.c()` short-circuits on it, keeps the licence revocation path from ever starting.

Only client-side decisions change. Anything Nova asks its backend for still needs a real
account.

## Verification

- `python3 tools/verify_fingerprints.py <stock 8.9.6 apk>` resolves all three pinned methods.
- Applying the patch with `validate = true` matched each fingerprint exactly once
  (`Changed 3 of 43519 classes to mutable`).
- The patched 8.9.6 DEX was decoded and checked: `qx.b1.b()` and `gy.d0.w()` start with
  `const/4 v0, 0x1; return v0`, and `j10.h2.a()` derives the Prime state from `512` (0x200)
  after the `getInt("1", 0)` read.
- Runtime checks on a physical Pixel 9 (Android 17, `tokay`), stock 8.9.5 vs stock 8.9.6 vs
  patched 8.9.6:

  | Check | 8.9.5 stock | 8.9.6 stock | 8.9.6 + Enable Prime |
  |---|---|---|---|
  | Show Keyboard switch | no repaint after tap | toggles on/off | toggles on/off |
  | Fast scrollbar switch | no repaint after tap | toggles on/off | toggles on/off |
  | Feed page row | absent | absent | present |
  | Nova AI row | present | present | absent |
  | Hide apps | Prime badge | Prime badge | no badge, opens the hide list |
  | Drawer groups | Prime badge | Prime badge | no badge |
  | Prime after force-stop + relaunch | — | — | still active |

  Folders first is a checkbox rather than a switch and toggles immediately on the patched build.
  No fatal exception appeared in `logcat` during the cold starts or the toggles.

Not exercised: any real purchase, Play account flow, or the Manage Subscription screen's
summary. The 8.9.6 switch behaviour was checked by screenshot comparison before and after each
tap; the preferences were verified by the switch repainting, not by reading the private
`shared_prefs` file (the release build is not debuggable).
