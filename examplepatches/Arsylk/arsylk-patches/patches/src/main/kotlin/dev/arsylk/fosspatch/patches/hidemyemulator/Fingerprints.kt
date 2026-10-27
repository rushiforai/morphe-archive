package dev.arsylk.fosspatch.patches.hidemyemulator

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.Opcode

/**
 * The app-wide licence state reducer. The licence repository collects the handshake result (a sealed
 * licence state) and converts it to the UI/feature model via this static method: when the state is
 * the "licensed" variant it returns a licensed model carrying the expiry (as an epoch-day), otherwise
 * it returns the singleton "unlicensed" model. The resulting model is pushed into the StateFlow that
 * both the licence UI and the protection toggles observe.
 *
 * The app encrypts its string pool, so the method is anchored on its distinctive framework time-API
 * calls — converting the expiry epoch-millis to an epoch-day via `ZoneId.systemDefault()` +
 * `Instant.ofEpochMilli()` + `LocalDate.toEpochDay()`. That trio is unique to this reducer.
 */
object LicenseStateReducerFingerprint : Fingerprint(
    filters = listOf(
        methodCall(definingClass = "Ljava/time/ZoneId;", name = "systemDefault"),
        methodCall(definingClass = "Ljava/time/Instant;", name = "ofEpochMilli"),
        methodCall(definingClass = "Ljava/time/LocalDate;", name = "toEpochDay"),
    ),
)

/**
 * The licence gate in the mask builder. It reads the cached licence expiry (`license_until`) from both
 * an `XSharedPreferences` and a `SharedPreferences`, compares it to `System.currentTimeMillis()`, and
 * applies the premium masks only while the expiry is in the future:
 *
 * ```
 *     XSharedPreferences.getLong(key, 0)   ; false-branch read
 *     SharedPreferences.getLong(key, 0)    ; license_until
 *     System.currentTimeMillis()           ; now
 *     cmp-long v0, license_until, now
 *     if-lez  v0, :skip_masks              ; expired -> skip premium block
 * ```
 *
 * The `license_until` prefs value is only written by a successful licence handshake, which never runs
 * offline, so this gate is patched separately from the UI state. Anchored on framework/Xposed call
 * shape (encrypted strings make the key unusable); the `XSharedPreferences.getLong` is what makes it
 * unique in the app.
 */
object LicenseGateFingerprint : Fingerprint(
    filters = listOf(
        methodCall(definingClass = "Lde/robv/android/xposed/XSharedPreferences;", name = "getLong"),
        methodCall(definingClass = "Landroid/content/SharedPreferences;", name = "getLong"),
        methodCall(definingClass = "Ljava/lang/System;", name = "currentTimeMillis"),
        opcode(Opcode.CMP_LONG),
        opcode(Opcode.IF_LEZ),
    ),
)

/**
 * 1.5 licence-state reducer. Licensing moved to a backend token flow, and the repository now maps
 * the verified claims JSON to the UI model in one static method (`Ld9/a;->H`): `is_premium` false
 * returns the `Unlicensed` singleton, otherwise the `Premium` model carrying the expiry as an
 * epoch-day. The resulting model is pushed into the StateFlow the licence UI observes.
 *
 * The epoch-day conversion (`Instant.ofEpochSecond` + `atZone` + `toLocalDate` + `toEpochDay`) plus
 * the `JSONObject.optBoolean` claims read are unique to this method — anchored on that trio. The
 * `Premium` model class and its constructor are 1.5 pins (see `UnlockPremiumPatch.kt`).
 */
object LicenseStateReducerFingerprint15 : Fingerprint(
    filters = listOf(
        methodCall(definingClass = "Lorg/json/JSONObject;", name = "optBoolean"),
        methodCall(definingClass = "Ljava/time/Instant;", name = "ofEpochSecond"),
        methodCall(definingClass = "Ljava/time/LocalDate;", name = "toEpochDay"),
    ),
)

/**
 * 1.5 hook licence inputs (`HookLicenseInputs`, `Lvb/b;`): token, device ULID, server-time anchor,
 * boot id, user id and cap slot. Every premium gate in the hook path reads the token from this
 * object, so forcing the first constructor argument non-empty passes all of the
 * `token.length() > 0` gates at once.
 */
object HookLicenseInputsFingerprint15 : Fingerprint(
    definingClass = "Lvb/b;",
    name = "<init>",
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "J",
        "J",
        "Ljava/lang/String;",
        "J",
        "[B",
    ),
)

/**
 * 1.5 runtime watchdog installer (`RuntimeWatchdog.a()`), anchored on the non-obfuscable native
 * `installWatchdogNative` call. The watchdog scans `/proc/self/maps` for hooking frameworks from a
 * native thread; neutralised so a patched build cannot be tripped by it.
 */
object WatchdogInstallerFingerprint15 : Fingerprint(
    filters = listOf(
        methodCall(
            definingClass = "Lnet/wowsoftware/hidemyemulator/hook/entity/RuntimeWatchdog;",
            name = "installWatchdogNative",
        ),
    ),
)

/**
 * 1.5 sign-in state. The `TokenStore` (`Lac/c;`) constructor initialises the signed-in
 * `StateFlow` from the encrypted prefs: `token != null`. The root UI state carries that boolean
 * (`kc/o.i`) and shows the sign-in screen while it is false. Anchored on the encrypted-prefs
 * read (`Ll5/b;->getString`) plus the `Boolean.valueOf` / `Ldb/t0;->c` flow construction, which
 * is unique to this constructor.
 */
object TokenStoreSignInStateFingerprint15 : Fingerprint(
    filters = listOf(
        methodCall(definingClass = "Ll5/b;", name = "getString"),
        methodCall(definingClass = "Ljava/lang/Boolean;", name = "valueOf"),
        methodCall(definingClass = "Ldb/t0;", name = "c"),
    ),
)

/**
 * 1.5 module-status stub. `ModuleStatus.isModuleActive()` is a hardcoded `false` in this build
 * (the real Xposed activation check was stubbed out), and the root UI state carries its result:
 * with it false the licence combiner maps even a Premium licence to HIDDEN and the app shows a
 * permanent "Module Inactive" banner. Anchored on the non-obfuscated class/method.
 */
object ModuleActiveStateFingerprint15 : Fingerprint(
    definingClass = "Lnet/wowsoftware/hidemyemulator/core/ModuleStatus;",
    name = "isModuleActive",
    returnType = "Z",
)

/**
 * 1.5 OkHttp token authenticator (`ApiClient.tokenAuthenticator$lambda$0`). On a 401 it runs the
 * refresh policy; when the refresh fails it clears the token prefs and pushes `false` into the
 * signed-in StateFlow, which bounces the UI back to the sign-in screen. Anchored on the
 * `TokenRefreshPolicy.Result` type checks plus the `Lac/c;` token-store calls.
 */
object TokenRefreshFailureFingerprint15 : Fingerprint(
    filters = listOf(
        methodCall(
            definingClass = "Lnet/wowsoftware/hidemyemulator/api/TokenRefreshPolicy\$Result\$Refreshed;",
            name = "getToken",
        ),
        methodCall(definingClass = "Lac/c;", name = "b"),
        methodCall(definingClass = "Ll5/a;", name = "clear"),
    ),
)

/**
 * 1.5 user store (`Lac/d;`) constructor. It rebuilds the cached user from `user_prefs` only when
 * the stored id is non-zero, so with no account the user StateFlow stays null and the auth-gated
 * screens keep asking for a sign-in. Anchored on the prefs reads plus the `Lac/b;` user
 * construction and the flow init.
 */
object UserStoreStateFingerprint15 : Fingerprint(
    filters = listOf(
        methodCall(definingClass = "Landroid/content/SharedPreferences;", name = "getInt"),
        methodCall(definingClass = "Lac/b;", name = "<init>"),
        methodCall(definingClass = "Ldb/t0;", name = "c"),
    ),
)

/**
 * 1.5 licence repository constructor (`Lob/i;<init>`). It seeds the licence StateFlow with the
 * `Unknown` singleton; every auth-gated screen derives its premium state from that flow.
 * Anchored on the `Unknown` load plus the flow construction and the coroutine launch.
 */
object LicenseStateInitFingerprint15 : Fingerprint(
    definingClass = "Lob/i;",
    name = "<init>",
)

/**
 * 1.5 licence-load failure path (`Lob/d;invokeSuspend`). When the stored licence blob is
 * missing or the backend call fails it pushes the `Unlicensed` singleton into the licence
 * StateFlow. Anchored on the flow fetch plus the `Unlicensed` load and the StateFlow update.
 */
object LicenseFailureEmissionFingerprint15 : Fingerprint(
    definingClass = "Lob/d;",
    name = "invokeSuspend",
)
