# Deezer 9.0.26.3: signed out after every restart

## Symptom

On the owner's phone (OnePlus CPH2747, Android 17), Deezer stayed signed in until the
app was force-stopped or restarted. The next start opened the welcome/sign-in screen.
In Android Auto, the signed-out app produced an empty Browse page ("Could not load this
list."). The account itself was fine: signing in again with the same credentials worked.

## Reproduction (bounded logcat, unrooted phone, no Frida)

1. 19:07:11 native email/password sign-in; Home (`DynamicPageRootActivity`) at 19:07:13.
2. 19:07:31 force stop from Settings.
3. 19:07:31.232 `am_proc_start ... bound-service DeezerMediaBrowserService
   callingPackage = app.johninnl.drivedeck`: the car host rebinds the media browser
   immediately and Deezer cold-starts in the background.
4. 19:07:32.350 the background process itself starts `AuthUIInitActivity` with
   `NEW_TASK | CLEAR_TASK`, the logout navigation (`AuthUIInitDeeplink`, flag 32768).

The November emulator check restarted through the launcher with no media host bound,
which is why it kept the session.

## Mechanism

- `IlllIIlIIIIIIII.IIIIIlIIIlIlIIlI(Context, boolean loggedOut)` writes the whole
  in-memory user to `APP_PREFS` (XOR-obfuscated, no device or signer dependency):
  `807b5f36` = `!loggedOut` (signed-in flag) and `bc391985` = user id, plus ARL,
  email and profile fields. Callers update one field (ARL refresh, credentials,
  email, profile) and then save everything. With an empty user id Deezer records
  `IllegalStateException("Where are you now")` but writes anyway.
- The startup check (`IlIlllIlIlIllIII` case 9) reads `807b5f36`; if it is true and
  `bc391985` is empty it runs the full logout (`IlIIlllllIll.IlIIllIlIIIIIlI`:
  clears `PROFILE_CACHE`, user storage and cookies, opens the welcome screen).
- In a background cold start through the media browser, a refresh can reach the
  save before the user was restored from preferences. It stores an empty user id
  next to `807b5f36 = true`, so the following start logs out.

Ruled out: the auth-UI token key comes from the bundled `icon2.png` asset, not the APK
signature; the APP_PREFS store has no signer/device dependency; the preferences version
migration clears only once.

## Fix

`SessionPersistencePatch.kt` (internal, required by every Deezer patch) returns early
from the save when `loggedOut == false` and the in-memory user id is empty. That is the
one invalid write; logout (`loggedOut == true`) and every save that carries a user id are
unchanged, so the stored session survives and is restored on the next start.

Build check: `./gradlew :patches:build` passed; Morphe desktop 1.19.1 applied all six
Deezer patches to the 9.0.26.3 APKM (`success: true`, no failed patches); `dexdump`
shows the guard (`if-nez p1` / `TextUtils.isEmpty` / `return-void`) at the start of the
method. Phone acceptance (sign in, force stop with DriveDeck bound, reopen) needs the
released bundle, because the phone's APK signer belongs to its Morphe Manager.
