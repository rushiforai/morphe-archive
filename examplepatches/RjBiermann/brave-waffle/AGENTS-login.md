# AGENTS-login.md — login state model (three states, mapped in smali 2026-09-17)

Entry: `AGENTS.md`. Patch internals: `AGENTS-patches.md`. TV: `AGENTS-tv.md`.

State lives ONLY in prefs (`ka1.j`): `username`, `password`, `accessToken`. No persisted
LoginStatus object — after any login the state is re-established by POST `v9/login`
(`dj.c(UserData, hash, Authorization)`); `UserData()`'s ctor auto-loads stored
username/password + android_id each time it is constructed. The response
`LoginStatus{status:int, pro:J expiry, token, unixtime}` is fanned out in memory via
LiveData to consumers (`p81.B`, `g13.V2`, `os7.n`, players' `V2`).

- **Not logged in**: prefs empty. Startup `v9/device` is ALWAYS sent with a null
  LoginStatus → `x93.b(null)` → hash reports `{pro:0, token:"", status:0, unixtime:now}`
  even on PRO devices — identity travels in the `Authorization` header, not the hash.
  Login handler (`eb0.c`): `status < 200` → error dialog (Try again / Cancel /
  Reset Password), nothing saved.
- **Logged in, free account**: `status >= 200 && pro < unixtime` → "You are logged in!"
  toast; saves accessToken/username/password; fires `sa4.e(true)`.
- **Logged in, PRO**: `status >= 200 && pro >= unixtime` → "PRO until <date> - N days
  remaining" PRO Check dialog; same save + `sa4.e(true)`. With the getPro→MAX hook
  EVERY successful login shows the PRO dialog — client-side free vs PRO is gone.

Mobile per-state behavior:

| | not logged in | free | PRO |
|---|---|---|---|
| Browse sites / video info / playback | ✅ | ✅ | ✅ |
| Client-side PRO UI (`p81` sheet items, `g13.V2` proEnabled, player playlist `sk8`) | unlocked by hook | unlocked | unlocked |
| Swipe interstitial ads (`os7.n`, every 10th swipe, `h75`) | **ACTIVE** (flag only set from a successful login response) | gone (hook) | gone |
| PornDB / favorites / history / playlists (`v9/*`) | ❌ server: "You are not logged in!" | depends on account's server-side state | ✅ |
| Global Search (`fr5` → `porn-app.com/login/inapp` WebView) | login page | ✅ | ✅ |
| TV site browsing (`wk2` → VideoActivityTV) | — | ❌ server: "not a PRO User!" | ✅ |

Details:
- All local PRO checks are `getPro() > now` (via `getUnixtime()` — or
  `System.currentTimeMillis()/1000` in `g75`, still works with MAX) → all neutralized
  by the getter hook.
- `os7.n` is the ONE client-side remnant the getter hook misses for anonymous use: it
  defaults false and is only set true from a login response (`g75`). If ever needed:
  force `n=true` in `os7.<init>` (one-line smali/patch).
- `i75` (NSFWSwipe fragment) silently re-logins at startup with stored creds; the
  swipe login path (`es7`) persists accessToken only when `status == 200`.

**TV difference**: "everything is PRO" — even browsing is a server-side PRO gate (it
checks the account's server state, not the hash's pro; past-pro hash tested → rejected).
The TV tile/login gates are client-side and already patched (see `AGENTS-tv.md`).
TV login UI exists again (v1.8.0): "Login with PRO Account" tile → `fk.D` dialog →
LOGIN ("Set your Login Details" username/password) or SIGN UP — the free-sites
bypass no longer swallows it.

**Goal**: make not-logged-in and logged-in flows seamless, bypass every client-side
PRO check (done — getter hook; only leftover above). Server-side walls (PornDB for
anonymous, TV browse for non-PRO accounts) are NOT client-patchable — they need a real
account the server blesses with PRO.
