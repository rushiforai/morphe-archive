# Trakt

Package `tv.trakt.trakt`, supported target `3.28.0` (versionCode `452`, APKM bundle).
Source: [`patches/src/main/kotlin/dev/hyzor/patches/trakt/`](../../patches/src/main/kotlin/dev/hyzor/patches/trakt/).

| Patch | Default | What it does |
|---|---|---|
| Fix sign-in | on | Signs in through a regular browser tab so the OAuth callback can return to a re-signed build. If the browser offers to open Trakt, choose it. |
| Unlock VIP | on | Reports the signed-in account as VIP to the app's own checks, unlocking the local VIP gates (the recap screens, the VIP badge and the other surfaces gated on that flag). Client side only: limits and perks the Trakt API enforces server-side still follow the real account tier. |

## How the app decides you have VIP

VIP is one boolean on the Kotlinx-serialized account model
`tv.trakt.trakt.common.model.User`. The class name survives R8 because it is `@Serializable`;
the field letters do not. In 3.28.0 the layout is still the 3.26.1 one, and `User.toString()`
spells it out:

```text
a=Ids  b..f=Strings  g=isPrivate  h=isVip  i=isVipEp  j=isVipOg  k=isDirector
l=Images  m=Streamings  n=Settings
```

`h` is read at 18 `iget-boolean` sites across 16 methods in 3.28.0 — the VIP upsell and badge
code (`User.d()` is `isVip || isVipEp || isVipOg`), the recap screen and the other UI surfaces
that consult the flag. `isVipEp`, `isVipOg` and `isDirector` are badge/staff flags rather than
feature gates, so the patch deliberately leaves them alone.

Two constructors write `h`:

| Constructor | Shape | Used by |
|---|---|---|
| primary | `(Ids, String×5, Z×5, Images, Streamings, Settings)V` | `UserKt.a(User.Companion, i86)`, which maps the API model to `User` |
| Kotlinx-serialization synthetic | `(I, Ids, String×5, Z×5, Images, Streamings, Settings)V` | `User$$serializer`, when a `User` is decoded from JSON (cached sessions, list responses) |

Both are patched: the patch finds the `iput-boolean` into `User.h` in each constructor and
inserts `const/16 <value register>, 0x1` immediately before it. The value register is read from
the instruction, so the injection stays correct even if R8 renumbers the arguments.

## Sign-in on a re-signed build

Trakt 3.28 signs in through AndroidX **AuthTab** with the HTTPS redirect
`https://app.trakt.tv/callback/app/trakt`. Chrome completes an AuthTab hand-off only after
Digital Asset Links verification against `app.trakt.tv`, which lists Trakt's certificate
`2A:FF:40:C6:A3:68:82:31:0C:6B:D1:B3:9F:F1:0D:A0:4A:DD:FB:D2:D1:00:1B:8C:29:3C:9B:CF:5C:40:F5:8B`.
Morphe re-signs the APK with its own key
(`36:C2:13:D4:EB:9E:30:8B:1E:09:19:5F:F2:3C:34:5A:2B:C8:45:7A:86:0A:74:C8:85:05:F6:D1:22:30:9C:8B`),
so verification fails (`Statement failure matching fingerprint`) and Chrome never delivers the
code. The app then falls back to the retired `trakt://auth` redirect, which `auth.trakt.tv`
answers with "This version of the Trakt app can no longer sign in". The official Play build of
the same 3.28.0 signs in normally, which isolates the cause to the signature.

The app has a second, AuthTab-free path: a regular Custom Tab using the *same* HTTPS redirect.
`MainActivity.w(Uri)` already accepts that callback and starts the token exchange. `Fix sign-in`
routes the flow there with two hooks:

1. it forces the `mobile_https_auth_callback_enabled_2` Remote Config read to `true`, so the app
   builds the HTTPS redirect even when Firebase Remote Config cannot be fetched;
2. it makes `s2j.b(MainActivity, String)` answer `false`, so the auth coroutine takes its regular
   Custom Tab branch instead of AuthTab.

Chrome then treats the callback as an app link. If Trakt is already the approved handler for
`app.trakt.tv`, the app opens directly; otherwise the system shows an **"Open in Trakt"**
prompt (or a chooser) and the link must be opened once by hand. The HTTPS filter is part of the
stock manifest, so no manifest change is needed, and nothing about the Trakt account or the
server changes.

## Port notes

This is a port of the Trakt "Unlock VIP" patch in
[ineednotitle/Proteus-Patches](https://github.com/ineednotitle/Proteus-Patches), written against
3.26.1 (versionCode `449`). The model did not move between the two builds:

| Role | 3.26.1 (upstream) | 3.28.0 |
|---|---|---|
| VIP flag | `User.h` | same field, same position in `User.toString()` |
| primary constructor | 14 args, `isVip` = `p8` | same signature; `isVip` still `p8` |
| serializer constructor | delegated to the primary constructor | stores the fields itself; `isVip` = `p9`, so it is patched separately |
| distributable | APK | APKM (base + ABI/locale/density splits; versionCode `452`) |

The second constructor is the one real difference in the VIP hook. Upstream's comment says the
synthetic "default-args bridge" delegates to the primary constructor; that is no longer true in
the 3.28.0 R8 output. Patching only the primary constructor would have upgraded users built by
`UserKt.a` while leaving users decoded by `User$$serializer` on the real account tier. The port
hooks both stores.

`Fix sign-in` is new here and has no upstream counterpart: 3.26.1 still used the `trakt://auth`
redirect that `auth.trakt.tv` accepted, so re-signed builds could sign in without it.

The tested artifact is the APKMirror bundle for 3.28.0
(`tv.trakt.trakt_3.28.0-452_2arch_2dpi_24lang_…_apkmirror.com.apkm`, arm64-v8a + armeabi-v7a).
Trakt is distributed as a bundle, so the compatibility target is `APKM`; there is no plain-APK
target.

## Verification

- `python3 tools/verify_fingerprints.py <apkm>` — both `User.<init>` argument lists and
  `s2j.b(MainActivity, String)` resolve in the stock APK.
- `dexdump` on the stock `classes2.dex` — the public constructor stores `v8` into `User.h`, the
  synthetic constructor stores `v11` into it; no other instruction writes `User.h`.
- The 18 `iget-boolean User.h` sites were enumerated with `dexdump` before writing the
  fingerprint.
- Morphe apply `--validate` with both patches — 3 classes change (`User`, `jr8`, `s2j`). The
  patched DEX contains `const/16 v11, #int 1` before the serializer constructor's `User.h`
  store, `const/16 v8, #int 1` before the primary constructor's, `const/16 v3, #int 1` before the
  auth redirect branch, and `s2j.b` starts with `const/4 v0, #int 0; return v0`.
- ART runtime check — a small verifier DEX was run with `app_process` against the app's DEX on
  an Android 16 emulator, constructing `User` with `isVip = false` through both constructors:

  ```text
  stock:    primary isVip=false   serializer isVip=false
  patched:  primary isVip=true    serializer isVip=true
  ```

- Device check on the Android 16 x86_64 emulator, signed in with a **free** account:
  - the fixed flow completed end-to-end (email + 6-digit code in a regular Custom Tab, callback
    back into `MainActivity`, token exchange), and reinstalling the final two-patch bundle kept
    the session;
  - the profile shows the **VIP** badge on the avatar and username;
  - Discover → Filters opens the VIP-only advanced panel (Genre, Availability, Decade, Runtime,
    Certification, Region, Status, Trakt-rating range, Hide Watched/Watchlisted).

  On the emulator, `app.trakt.tv` was approved for the app with
  `pm set-app-links --package tv.trakt.trakt 2 app.trakt.tv` before the sign-in, so Chrome opened
  the callback directly. A normal install that has not approved the link may show the
  "Open in Trakt" prompt instead.

### Limits

- The patch only changes the client's `User.isVip`. Server-enforced limits (personal-list count,
  collection size, API-side VIP checks) still apply, even when the local UI looks unlocked.
- A server-enforced VIP-only endpoint (for example adding more lists than the free tier allows)
  was not exercised; the device check covers the local UI gates.
