package app.xiondigital.patches.tandem.darkmode

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * `net.tandem.TandemApp.onCreate()` — in both inspected builds (6.38.0 and 6.12.0).
 *
 * Tandem's real `Application` subclass is not obfuscated: the manifest declares
 * `com.pairip.application.Application`, which extends `net.tandem.TandemApp` and only overrides
 * `attachBaseContext` (PairIP integrity/licence checks). `onCreate` is therefore inherited
 * unchanged from `TandemApp`, which makes it a stable, readable anchor that survives the PairIP
 * wrapper in both builds.
 *
 * The body itself is not stable: 6.38.0's `onCreate()` starts with an `invoke-virtual` to a
 * `TandemApp` helper and reads the `"coroutineScope"` delegate error message, while 6.12.0's is
 * compiled differently and does not reference that string. An earlier revision filtered on
 * `"coroutineScope"` and therefore stopped matching on 6.12.0. The class, name, visibility and
 * empty parameter list already identify the method uniquely in both builds — `TandemApp` declares
 * exactly one `onCreate()` — so no body filter is needed.
 *
 * The injected code prepends instructions that use `v0` and `v1`, which are dead at entry: the
 * method declares 12 registers and takes no parameters in both builds, i.e. 11 locals plus `p0`,
 * so the two scratch registers are free at the top of the body.
 */
internal object TandemAppOnCreateFingerprint : Fingerprint(
    definingClass = "Lnet/tandem/TandemApp;",
    name = "onCreate",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = emptyList(),
)
