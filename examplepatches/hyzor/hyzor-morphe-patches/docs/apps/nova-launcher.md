# Nova Launcher

Package `com.teslacoilsw.launcher`, supported target `8.9.7` (versionCode `89700`, versionName
`89700 (8.9.7)`).
Source: [`patches/src/main/kotlin/dev/hyzor/patches/nova/`](../../patches/src/main/kotlin/dev/hyzor/patches/nova/).

| Patch | Default | What it does |
|---|---|---|
| Enable Prime | on | Unlocks the features gated on Nova Prime. |

## Why 8.9.5 is not supported

8.9.5 has a settings regression: its custom switches change the persisted preference but do not
repaint, so almost every toggle looks dead — the row stays in its old state until the screen is
recreated. On a Pixel 9 running Android 17 this reproduced on the stock 8.9.5 APK, not only on a
patched build:

| Build | Show Keyboard switch |
|---|---|
| 8.9.5 stock | tap changes the preference but the switch does not repaint; the new value appears only after leaving and reopening the screen |
| 8.9.6 stock | turns off and on immediately, every tap |
| 8.9.6 + Enable Prime | turns off and on immediately, every tap |

8.9.6 fixed that in the app, which is why this bundle moved from 8.9.5 to 8.9.6 and now to 8.9.7.
8.9.5 stays unsupported; 8.9.6 is dropped because the bundle supports one version per app.

## Port notes

Two upstream patches cover neighbouring Nova versions and neither drops in as-is:

- [rushiranpise/morphe-patches](https://github.com/rushiranpise/morphe-patches) targets 8.8.8
  and patches the static isPrime gate, the runtime Prime field and the subscription check.
- [hoo-dles/morphe-patches](https://github.com/hoo-dles/morphe-patches) targets 8.8.6 and
  rewrites only the persisted Prime value that the settings initialiser reads.

The obfuscated classes move with every release, and 8.9.7 folds several of them together:

| Role | 8.8.x (upstream) | 8.9.5 | 8.9.6 | 8.9.7 |
|---|---|---|---|---|
| static Prime gate | `wu.v0.b()` | `px.b1.b()` | `qx.b1.b()` | `ix.i1.b()` |
| Prime field / state initialiser | `oy.h2` | `i10.g2` | `j10.h2` | `b10.k2` |
| active-subscription check | `lv.c0.w()` | `fy.d0.w()` | `gy.d0.w()` | `xx.b0.w()` |
| Prime grant | — | `fy.g0.a()` | `gy.g0.a()` | `xx.e0.a()` |
| unlocker-APK flag / revocation setup | `wu.v0` | `px.b1` | `qx.b1` | `ix.i1` |

The revocation setup and the unlocker flag now live on the same class as the gate (`ix.i1`), and
the subscription, grant and billing helpers are all in the `xx` package (`xx.b0` also absorbed
`gy.d0`). The fingerprints use instruction shapes rather than the obfuscated class/method names
wherever possible, but the static gate still anchors on the `b10/k2` field and the `xx/e0` grant
call, so re-resolve those two anchors when the obfuscation moves them again.

One naming detail matters for compatibility: Nova's `versionName` is literally
`89700 (8.9.7)`, not `8.9.7`. Morphe compares the version name exactly, so
[`Constants.kt`](../../patches/src/main/kotlin/dev/hyzor/patches/nova/shared/Constants.kt)
declares the full string.

## How the app decides you are Prime

The Prime boolean is `b10.k2.h`. 41 classes read that field directly; 17 more call the static
gate `ix.i1.b()`, whose body is:

```java
return b10.k2.h || ix.i1.b || xx.e0.a(context);
```

`ix.i1.b` (the field) is set when the separate Nova Prime unlocker APK is installed, and
`xx.e0.a()` is the time-limited grant read from the `nova_prime_grant` preferences.

The field itself is derived on startup by `b10.k2.a(SharedPreferences)` from the persisted
`"1"` integer: `h = value != 0` and `c = value == 0x200`, where `0x200` is the value the app
writes when it accepts a direct licence or the unlocker APK.

The anti-tamper path is still driven by `xx.b0.w(context)`. `ix.i1.c(context)` returns
immediately when it reports a fresh subscription; otherwise it installs the Play licence
checker. On a re-signed build that check always fails; `ci.j4.d(I)` posts `ix.i1.g`, which
re-enters `ix.i1.c()` and runs the reset that writes `"1"` back to 0 and drops `b10.k2.h` to
false. The same `xx.b0.w()` result makes the billing sync keep the cached subscription (and
re-set `b10.k2.h`) instead of applying the "Play query returned nothing" downgrade.

## What the patch changes

1. `ix.i1.b()` returns `true`.
2. The `getInt("1", 0)` result in `b10.k2.a()` is overwritten with `0x200`, so the app starts
   in its own Prime state (`h = true`, `c = true`).
3. `xx.b0.w(context)` returns `true`. This reports an active subscription and, because
   `ix.i1.c()` short-circuits on it, keeps the licence revocation path from ever starting.

Only client-side decisions change. Anything Nova asks its backend for still needs a real
account.

## Verification

- `python3 tools/verify_fingerprints.py <stock 8.9.7 apk>` resolves all three pinned methods.
- Applying the patch with `--validate` matched each fingerprint exactly once
  (`Changed 3 of 43297 classes to mutable`).
- The patched 8.9.7 DEX was decoded and checked: `ix.i1.b()` and `xx.b0.w()` start with
  `const/4 v0, 0x1; return v0`, and `b10.k2.a()` reads 512 (0x200) from the `getInt("1", 0)`
  result before deriving the Prime field and the direct-licence marker.
- Runtime checks on an x86_64 emulator (`sdk_gphone64_x86_64`, Android 16, arm64 native
  bridge), patched 8.9.7, cold start:

  | Check | 8.9.7 + Enable Prime |
  |---|---|
  | Settings version row | `Nova Prime 89700 (8.9.7)` (stock wording is `Nova Launcher`) |
  | Feed page row | present |
  | Hide apps | no Prime badge; opens `GroupAppListActivity` (checkboxes per app) instead of the subscription screen; the list rendered once the app drawer had been opened |
  | Force-stop + relaunch | Prime state re-applied on the cold start |
  | `logcat` | no fatal exception |

- Not exercised: any real purchase, the Play account flow, the Manage Subscription summary,
  hiding an app, or the launcher's Prime-gated gesture options. The 8.9.5 vs 8.9.6 switch
  behaviour in the table above was recorded during the 8.9.6 port and was not re-measured here.
- On this emulator the Hide apps list renders empty if the settings screen is opened without
  the launcher's app list having been loaded first; opening the app drawer populates it. That
  reproduced without involving the patch.
