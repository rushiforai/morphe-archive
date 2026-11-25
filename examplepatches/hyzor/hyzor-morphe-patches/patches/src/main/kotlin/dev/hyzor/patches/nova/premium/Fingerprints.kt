/*
 * Copyright 2026 rushiranpise and hoo-dles
 * https://github.com/rushiranpise/morphe-patches
 * https://github.com/hoo-dles/morphe-patches
 *
 * Ported from the 8.8.8 Nova Launcher patch in rushiranpise/morphe-patches and the 8.8.6
 * patch in hoo-dles/morphe-patches (both GPLv3), re-resolved for 9.0.1.
 */

package dev.hyzor.patches.nova.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * `rw.e1.b()Z` — the static "am I Prime?" gate in 9.0.1.
 *
 * Its whole body is an OR of three sources:
 *
 *   `p00.i2.h`                  the runtime Prime boolean (read directly by many classes)
 *   `rw.e1.b`                   set when the separate Nova Prime unlocker APK is installed
 *   `lx.y0.a(Context)`          the time-limited "prime grant" from `nova_prime_grant`
 *
 * Both filter anchors are unique to this method across all six DEX shards: the boolean read
 * of the Prime field plus the call to the grant check. The fingerprint deliberately does not
 * pin its own class or method name (`rw/e1.b`): the two instruction anchors find it. They
 * still name the obfuscated `p00/i2` field and `lx/y0` grant check, so re-resolve those two
 * anchors if a future obfuscation pass moves them; the rest of the shape is structural.
 */
object IsPrimeFingerprint : Fingerprint(
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL, AccessFlags.STATIC),
    parameters = emptyList(),
    filters = listOf(
        // iget-boolean v0, v0, Lp00/i2;->h:Z
        fieldAccess(
            opcode = Opcode.IGET_BOOLEAN,
            definingClass = "Lp00/i2;",
            name = "h",
        ),
        // invoke-static {v2}, Llx/y0;->a(Landroid/content/Context;)Z
        methodCall(
            definingClass = "Llx/y0;",
            name = "a",
        ),
    ),
)

/**
 * `p00.i2.a(SharedPreferences)V` — the Prime state initialiser, called once from the
 * preference setup ("initPrefs") that runs during application startup.
 *
 * The method reads the persisted `"1"` integer (0 = not Prime, 0x200 = Prime) and derives
 * both `p00.i2.h` (Prime) and `p00.i2.c` (Prime came from a direct licence / the unlocker
 * APK) from it. The app writes 0x200 into `"1"` itself when it accepts the Prime unlocker.
 *
 * The `android.os.SystemProperties` lookup (the Razer device branch) is a globally unique
 * string anchor. The filters pin the exact read the patch rewrites:
 *
 *   const-string "1"            the preference key
 *   const/4      v1, 0x0        the default value
 *   invoke-interface getInt     sharedPreferences.getInt("1", 0)
 *   move-result  p1             the value every later branch derives from
 *
 * Only this method in the APK contains that sequence together with the SystemProperties
 * string.
 */
object PrimeStateInitFingerprint : Fingerprint(
    strings = listOf("android.os.SystemProperties"),
    returnType = "V",
    parameters = listOf("Landroid/content/SharedPreferences;"),
    filters = listOf(
        string("1"),
        literal(0),
        methodCall(name = "getInt"),
        opcode(Opcode.MOVE_RESULT),
    ),
)

/**
 * `lx.v0.v(Context)Z` — "is an active subscription on record?" in 9.0.1.
 *
 * It reads `subscription_active` from the `nova_billing` preferences and returns false when
 * `last_verified` is older than 48 hours (`x(prefs)`). That is the same check upstream
 * patches as `lv/c0.w(Context)Z` in 8.8.8 and this bundle patched as `xx/b0.w(Context)Z` in
 * 8.9.7.
 *
 * 9.0.1 split the two tiers apart, and the method names moved with the split:
 *
 *   `v(Context)`  `subscription_active` and a fresh `last_verified` — Prime-level check
 *   `w(Context)`  the same, but additionally requires `plus_active`, i.e. Nova Plus
 *
 * `rw.e1.c(Context)`, the revocation/refresh setup, returns immediately when `v()` is true;
 * the delayed re-check that `rw.c0` and `rw.d1` post also re-enters through it. So `v()` is
 * the method this patch has to force, not `w()`, otherwise the licence path starts again.
 *
 * The three anchors together are unique to this method:
 *   - the `"nova_billing"` and `"subscription_active"` literals (the method itself contains
 *     both; `"last_verified"` lives in the `x()` it calls),
 *   - `xor-int/lit8` — `v()` inverts `x()`'s result, `w()` next to it does not.
 */
object IsSubscriptionActiveFingerprint : Fingerprint(
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL, AccessFlags.STATIC),
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(
        string("nova_billing"),
        string("subscription_active"),
        opcode(Opcode.XOR_INT_LIT8),
    ),
)
