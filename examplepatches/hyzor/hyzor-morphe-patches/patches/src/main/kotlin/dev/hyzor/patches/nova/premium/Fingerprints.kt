/*
 * Copyright 2026 rushiranpise and hoo-dles
 * https://github.com/rushiranpise/morphe-patches
 * https://github.com/hoo-dles/morphe-patches
 *
 * Ported from the 8.8.8 Nova Launcher patch in rushiranpise/morphe-patches and the 8.8.6
 * patch in hoo-dles/morphe-patches (both GPLv3), re-resolved for 8.9.6.
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
 * `qx.b1.b()Z` — the static "am I Prime?" gate in 8.9.6.
 *
 * Its whole body is an OR of three sources:
 *
 *   `j10.h2.h`                  the runtime Prime boolean (read directly by 40+ classes)
 *   `qx.b1.b`                   set when the separate Nova Prime unlocker APK is installed
 *   `gy.g0.a(Context)`          the time-limited "prime grant" from `nova_prime_grant`
 *
 * 17 call sites use it instead of reading `j10.h2.h`, among them `NovaApplication`,
 * `NovaLauncher`, `NovaFeedContentView` and the settings screens.
 *
 * Both filter anchors are unique to this method across all five DEX shards: the boolean read
 * of the Prime field plus the call to the grant check. The fingerprint deliberately does not
 * pin its own class or method name (`qx/b1.b`): the two instruction anchors find it. They
 * still name the obfuscated `j10/h2` field and `gy/g0` grant check, so re-resolve those two
 * anchors if a future obfuscation pass moves them; the rest of the shape is structural.
 */
object IsPrimeFingerprint : Fingerprint(
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL, AccessFlags.STATIC),
    parameters = emptyList(),
    filters = listOf(
        // iget-boolean v0, v0, Lj10/h2;->h:Z
        fieldAccess(
            opcode = Opcode.IGET_BOOLEAN,
            definingClass = "Lj10/h2;",
            name = "h",
        ),
        // invoke-static {v2}, Lgy/g0;->a(Landroid/content/Context;)Z
        methodCall(
            definingClass = "Lgy/g0;",
            name = "a",
        ),
    ),
)

/**
 * `j10.h2.a(SharedPreferences)V` — the Prime state initialiser, called once from the
 * preference setup ("initPrefs") that runs during application startup.
 *
 * The method reads the persisted `"1"` integer (0 = not Prime, 0x200 = Prime) and derives
 * both `j10.h2.h` (Prime) and `j10.h2.c` (Prime came from a direct licence / the unlocker
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
 * `gy.d0.w(Context)Z` — "is an active subscription on record?" in 8.9.6.
 *
 * It reads `subActive` from the `nova_billing` preferences and returns false when
 * `last_verified` is older than 48 hours (`y(prefs)`). That is the same check upstream
 * patches as `lv/c0.w(Context)Z` in 8.8.8.
 *
 * The three anchors together are unique to this method:
 *   - the `"nova_billing"` and `"subscription_active"` literals (the method itself contains
 *     both; `"last_verified"` lives in the `y()` it calls),
 *   - `xor-int/lit8` — `w()` inverts `y()`'s result, `x()` next to it does not.
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
