package arpit.morphe.patches.healthifyme.root

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * Class locator for the in-house `RootDetector` (`Ljx0/d;`, source `RootDetector.kt`).
 *
 * Matches the private su/busybox path scan — the method holding the 29 root-binary
 * path literals and the `"rooted : "` crash-log message. This string set exists in
 * exactly one class of the APK, so the obfuscated class name `jx0/d` is not needed
 * as an anchor.
 *
 * Verified against `smali/classes5/jx0/d.smali` — `private final b(Function1)Z`
 * (line 202, `.registers 33`); the strings live at lines 220, 224, 232, 332 and 394.
 */
object RootDetectorClassFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("Lkotlin/jvm/functions/Function1;"),
    strings = listOf(
        "/system/app/Superuser.apk",
        "/system/bin/su",
        "/system/xbin/su",
        "/dev/busybox",
        "rooted : ",
    ),
)

/**
 * Matches `RootDetector.d(Function1)Lkotlin/Pair;` (`Ljx0/d;`, smali line 791) — the
 * detector's only public entry point (its sole external caller is
 * `HealthifymeUtils.checkIfDeviceIsRooted()`), which chains the three checks and
 * returns `Pair(true, 1|2|3)` for a rooted device or `Pair(false, -1)` otherwise.
 *
 * Verified against `smali/classes5/jx0/d.smali` — `public static final`, `.registers 3`,
 * `const-string "logMessage"` (the Kotlin non-null parameter check) at line 816.
 *
 * Fallback (should this fingerprint ever fail): patch
 * `HealthifymeUtils.isDeviceRooted(...)Z` to `false` instead.
 */
object RootDetectorIsDeviceRootedFingerprint : Fingerprint(
    classFingerprint = RootDetectorClassFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Lkotlin/Pair;",
    parameters = listOf("Lkotlin/jvm/functions/Function1;"),
    filters = listOf(
        string("logMessage"),
    ),
)

/**
 * Class locator for the in-app crash-log utility (`Lcom/healthifyme/base/utils/v0;`,
 * source `CrashLogUtils.kt`).
 *
 * Anchors (verified against `smali/classes5/com/healthifyme/base/utils/v0.smali`):
 * - the `"debug_exception"` literal (lines 646 and 1586) — it exists only in this
 *   class; both methods holding it are synthetic default-argument bridges of the
 *   same class, so either match resolves to the same ClassDef;
 * - source file `CrashLogUtils.kt` (line 3) — the only class in the APK with it.
 *
 * The obfuscated class name `v0` is deliberately not used as an anchor.
 */
object CrashLogUtilsClassFingerprint : Fingerprint(
    strings = listOf("debug_exception"),
    custom = { _, classDef -> classDef.sourceFile == "CrashLogUtils.kt" },
)

/**
 * Matches `CrashLogUtils.g()Z` (`Lcom/healthifyme/base/utils/v0;`, smali line 403) —
 * the second, independent root signal: `HealthifymeUtils.checkIfDeviceIsRooted()`
 * ORs `RootDetector.d(...)` with this Crashlytics/Fabric term. It reports `true`
 * when the Crashlytics wrapper is initialised and flags the build as rooted
 * (test-keys build tags, `/system/app/Superuser.apk`, `/system/xbin/su`, emulator …).
 *
 * Getter shape (verified): `.registers 1`, `public static final`, zero parameters —
 * the only `Z`-returning method of the class; the body reads the static wrapper
 * field `b:Lvl/d;` (line 100) and calls `Lvl/d;->k()Z` through it.
 *
 * Its only call site in the APK is the root chain (`HealthifymeUtils.smali:3491`;
 * asserted at patch time).
 *
 * Fallback (should this fingerprint ever fail): force the term's only reader
 * `HealthifymeUtils.isDeviceRooted(...)Z` to `false` instead.
 */
object CrashLogUtilsIsDeviceRootedFingerprint : Fingerprint(
    classFingerprint = CrashLogUtilsClassFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(opcode = Opcode.SGET_OBJECT, definingClass = "this", name = "b", type = "Lvl/d;"),
        methodCall(definingClass = "Lvl/d;", name = "k", parameters = emptyList(), returnType = "Z"),
    ),
    // `.registers 1` — a single `v0` register.
    custom = { method, _ -> method.implementation?.registerCount == 1 },
)
