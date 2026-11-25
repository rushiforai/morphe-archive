# Nova Launcher

Package `com.teslacoilsw.launcher`, supported target `9.0.1` (versionCode `90100`, versionName
`90100 (9.0.1)`).
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

8.9.6 fixed that in the app, every later release keeps the fix, and the bundle moved from 8.9.5
to 8.9.6 to 8.9.7 and now to 9.0.1. 8.9.5 stays unsupported; the older targets are dropped
because the bundle supports one version per app.

## Port notes

Two upstream patches cover neighbouring Nova versions and neither drops in as-is:

- [rushiranpise/morphe-patches](https://github.com/rushiranpise/morphe-patches) targets 8.8.8
  and patches the static isPrime gate, the runtime Prime field and the subscription check.
- [hoo-dles/morphe-patches](https://github.com/hoo-dles/morphe-patches) targets 8.8.6 and
  rewrites only the persisted Prime value that the settings initialiser reads.

The obfuscated classes move with every release. 9.0.1 reshuffles them again and splits the old
subscription check into a Prime-level and a Plus-level method:

| Role | 8.8.x (upstream) | 8.9.5 | 8.9.6 | 8.9.7 | 9.0.1 |
|---|---|---|---|---|---|
| static Prime gate | `wu.v0.b()` | `px.b1.b()` | `qx.b1.b()` | `ix.i1.b()` | `rw.e1.b()` |
| Prime field / state initialiser | `oy.h2` | `i10.g2` | `j10.h2` | `b10.k2` | `p00.i2` |
| subscription-on-record check | `lv.c0.w()` | `fy.d0.w()` | `gy.d0.w()` | `xx.b0.w()` | `lx.v0.v()` |
| Plus check | — | — | — | — | `lx.v0.w()` |
| Prime grant | — | `fy.g0.a()` | `gy.g0.a()` | `xx.e0.a()` | `lx.y0.a()` |
| unlocker-APK flag / revocation setup | `wu.v0` | `px.b1` | `qx.b1` | `ix.i1` | `rw.e1` |

In 9.0.1 the revocation setup and the unlocker flag still live on the same class as the gate
(`rw.e1`), and the grant check moved next to the billing code (`lx.y0`). The fingerprints use
instruction shapes rather than the obfuscated class/method names wherever possible, but the
static gate still anchors on the `p00/i2` field and the `lx/y0` grant call, so re-resolve those
two anchors when the obfuscation moves them again.

One naming detail matters for compatibility: Nova's `versionName` is literally
`90100 (9.0.1)`, not `9.0.1`. Morphe compares the version name exactly, so
[`Constants.kt`](../../patches/src/main/kotlin/dev/hyzor/patches/nova/shared/Constants.kt)
declares the full string.

## How the app decides you are Prime

The Prime boolean is `p00.i2.h`. The settings screens read it directly (the version row uses it
to print `Nova Prime` instead of `Nova Launcher`), and the static gate `rw.e1.b()` reads it too:

```java
return p00.i2.h || rw.e1.b || lx.y0.a(context);
```

`rw.e1.b` (the field) is set when the separate Nova Prime unlocker APK is installed, and
`lx.y0.a()` is the time-limited grant read from the `nova_prime_grant` preferences.

The field itself is derived on startup by `p00.i2.a(SharedPreferences)` from the persisted `"1"`
integer: `h = value != 0` and `c = value == 0x200`, where `0x200` is the value the app writes
when it accepts a direct licence or the unlocker APK.

The anti-tamper path is driven by `lx.v0.v(context)`, the "subscription on record" check:
`subscription_active` must be set in `nova_billing` and `last_verified` younger than 48 hours.
`rw.e1.c(context)` returns immediately when it reports a subscription; otherwise it installs the
licence revocation setup, and the delayed re-checks that `rw.c0` and `rw.d1` post after seeing a
Prime field re-enter through `c()` too. Any of those can end in the reset runnable
(`da.l`) writing `"1"` back to 0 and dropping `p00.i2.h`.

9.0.1 split 8.9.7's single `xx.b0.w(context)` in two:

- `lx.v0.v(context)` — `subscription_active` plus the 48-hour freshness check. This is the
  method the revocation setup consults, and the one this patch forces.
- `lx.v0.w(context)` — the same checks, but it then returns `plus_active`, i.e. whether the
  newer Nova Plus tier is active.

The patch deliberately forces only `v()`. Forcing `w()` as well would report Plus (it changes
`prime_status` to `plus` and unlocks the Nova AI tier), which this Prime patch does not claim.

## What the patch changes

1. `rw.e1.b()` returns `true`.
2. The `getInt("1", 0)` result in `p00.i2.a()` is overwritten with `0x200`, so the app starts
   in its own Prime state (`h = true`, `c = true`).
3. `lx.v0.v(context)` returns `true`. This reports a subscription on record and, because
   `rw.e1.c()` short-circuits on it, keeps the licence revocation path from ever starting.

Only client-side decisions change. Anything Nova asks its backend for still needs a real
account.

## Verification

- `python3 tools/verify_fingerprints.py <stock 9.0.1 apk>` resolves all three pinned methods.
- Applying the patch with `--validate` matched each fingerprint exactly once
  (`Changed 3 of 50954 classes to mutable`), and the output APK was rebuilt and signed.
- The patched 9.0.1 DEX was decoded from a new `classes7.dex` shard and checked:
  `rw.e1.b()` and `lx.v0.v()` start with `const/4 v0, 0x1; return v0`, and `p00.i2.a()` has
  `const/16 p1, 0x200` immediately after the `getInt("1", 0)` move-result.
- Runtime checks on an x86_64 emulator (`sdk_gphone64_x86_64`, Android 16, arm64 native
  bridge), patched 9.0.1, cold start:

  | Check | 9.0.1 + Enable Prime |
  |---|---|
  | Settings version row | `Nova Prime 90100 (9.0.1)` (stock wording is `Nova Launcher`) |
  | Hide apps | no Prime badge; opens `GroupAppListActivity` with the per-app checkbox list instead of the subscription screen |
  | Force-stop + relaunch, checked again after the 20 s delayed re-check | still `Nova Prime 90100 (9.0.1)` |
  | Settings → Manage Subscription (opens the Prime upsell paywall), then back | version row still `Nova Prime 90100 (9.0.1)`; the billing screen did not reset the Prime state |
  | `logcat` | no fatal exception |

- Also observed: the Manage Subscription row still reads `Nova Prime · Upgrade for Nova AI`
  (the Plus upsell summary). That is the cosmetic upsell row, not a Prime gate; the Prime
  surfaces and the version row are unlocked.
- Not exercised: any real purchase, the Play account flow, completing a subscription action
  from that paywall, hiding an app, the launcher's Prime-gated gesture options, or any Nova
  Plus surface (Plus is intentionally left gated). The 8.9.5 vs 8.9.6 switch behaviour in the
  table above was recorded during the 8.9.6 port and was not re-measured here.
- On this emulator the Hide apps list renders empty if the settings screen is opened without
  the launcher's app list having been loaded first; opening the app drawer populates it. That
  reproduced without involving the patch.
