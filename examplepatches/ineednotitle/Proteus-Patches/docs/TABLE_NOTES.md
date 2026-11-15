# Table Notes — patch status and analysis

Table Notes - Mobile Excel (`vivekagarwal.playwithdb`, Solution Developers) is a
no-code mobile database/spreadsheet app with a Firebase-backed sync layer,
PairIP licensing and AdMob ad units. This page documents the issue #29 work.

## Target build used for analysis

| Field | Value |
|---|---|
| Version | **20261111** |
| Version code | **20261111** |
| Package | `vivekagarwal.playwithdb` |
| Form | universal APK (the Play distribution is a split bundle; Manager merges APKM/APKS the same way) |
| Source | APKPure universal build, Android 10+ |
| Min / target SDK | 29 / 36 |

The earlier `20251108` analysis (short entitlement names `U`, `V`, `c`, `d`, `p`)
no longer matches: that build's obfuscation is gone and the fields were
renamed. Only the build above is offered by the manager.

## Entitlement model (from the 20261111 build)

`App` keeps the paid flags the rest of the app reads:

| Field | Meaning |
|---|---|
| `App.a` | active subscription (expiry compared with `App.C`/`App.H`) |
| `App.b` | active one-time purchase (expiry compared with `App.D`/`App.I`) |
| `App.c` | subscription premium flag set by the subscription prefs loader |
| `App.O` | subscription latch; while true the prefs loader will not recompute `App.a` |
| `App.P` | one-time-purchase latch; same role for `App.b` |
| `App.f` | plan enum `mo6` — `LITE` / `PERSONAL` / `BUSINESS` / `CORPORATE` / `NONE` |

The app never reads the expiry timestamps directly for entitlement decisions.
It uses one predicate — `App.a || App.b || App.c || App.O` — in 28 places
across the UI, the ad slots, the row/column caps and the export path. Forcing
those five booleans therefore unlocks everything the subscription sells:

- the PDF / Word / Excel export dialog opens instead of routing to the paywall,
- the AdMob banner and interstitial slots are skipped,
- the free-tier row/column caps are lifted (`App.f` only drives the limit text,
  so it is set to `BUSINESS` to match).

`App.O`/`App.P` are forced too, otherwise the two Firebase preference listeners
recompute `App.a`/`App.b` from an empty free-account purchase set shortly after
startup and the app drops back to the paywall.

## Patch shipped for Table Notes

| Patch | Default | Effect |
|---|---|---|
| **Table Notes: Unlock premium** | off | Appends the five `sput-boolean` writes and `App.f = mo6.BUSINESS` to the end of `App.<clinit>`. That is after the class's own `App.f = mo6.NONE`, which is why the write is appended rather than prepended. |

There is no separate ad-removal patch: the ad slots read the same paid
predicate, so the premium unlock already removes them. Short-circuiting the
Compose ad composables was rejected — they are Compose groups, and a
`return-void` prologue would skip the matching `endRestartGroup`, risking
runtime corruption.

## Limitations

- Pinned to **20261111**. The entitlement field names are R8 output; the patch
  checks the field set and aborts with a clear `PatchException` instead of
  applying half a bypass. A new build needs its field set re-verified.
- Server-side collaboration limits (member counts, shared-table permissions)
  are not changed; the app reports local entitlement only.
- PairIP licensing is left alone. If a future build gates startup on it, enable
  the universal **Disable PairIP license check** patch as well.

## Verification

- Patch source compiles into the locally built bundle.
- Patch application verified against the downloaded **20261111** APK (Morphe
  patcher 2.x): the patch applies cleanly and the re-dexed `App.<clinit>` ends
  with the five `sput-boolean` writes and `sput-object ...->f:Lmo6;` pointing at
  `Lmo6;->BUSINESS`.
- On-device confirmation of the export sheet and ad-free screens is still
  required; this environment has no Android device.
