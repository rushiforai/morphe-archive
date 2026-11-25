package app.salaat.patches.integrity

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Salaat First hides an anti-tamper signature check behind an innocuous-looking file,
 * `org.hicham.salaat.LanguageCheckerKt`. The app's own package (`org.hicham.salaat.*`) is
 * kept by R8, so these match on defining class plus method name.
 *
 * The flow (verified against 6.3.4): `DiskLruCache$launchCleanup$1` (into which R8 merged the
 * caller) reads the default-prefs flags `"check"`/`"mis"` each launch and invokes
 * `access$b(Context)`. `access$b` takes the MD5 of the installed signing certificate
 * (`doFingerprint`), Base64-encodes it and `equalsIgnoreCase`-compares it to a bundled string
 * resource. On a match it stores `check=false`; on a mismatch it stores `mis=true` and calls
 * `initLanguage()`, which reports "wrong language" to Firebase, sleeps 500 ms and calls
 * `System.exit(0)`. Any re-signed (patched) APK mismatches, so the app kills itself on launch.
 */

/**
 * `LanguageCheckerKt.access$b(Context)` — performs the signature fingerprint + compare and
 * writes the `check`/`mis` verdict flags. Stubbing it means the verdict is never computed, so
 * `mis` is never set on a patched build.
 */
object SignatureCheckFingerprint : Fingerprint(
    definingClass = "Lorg/hicham/salaat/LanguageCheckerKt;",
    name = "access\$b",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf("check", "mis"),
)

/**
 * `LanguageCheckerKt.initLanguage()` — the kill path: Firebase "wrong language" report,
 * `Thread.sleep(500)`, `System.exit(0)`. Stubbing it also rescues any install that already has
 * `mis=true` stuck in prefs from a prior unpatched launch.
 */
object InitLanguageFingerprint : Fingerprint(
    definingClass = "Lorg/hicham/salaat/LanguageCheckerKt;",
    name = "initLanguage",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = emptyList(),
    strings = listOf("wrong language"),
)
