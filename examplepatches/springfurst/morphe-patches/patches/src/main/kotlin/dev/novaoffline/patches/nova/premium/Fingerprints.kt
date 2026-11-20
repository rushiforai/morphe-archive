/*
 * Prime fingerprints ported from hyzor/hyzor-morphe-patches (GPLv3),
 * originally from rushiranpise/morphe-patches and hoo-dles/morphe-patches.
 * Re-resolved for Nova Launcher 8.9.7 (89700).
 */

package dev.novaoffline.patches.nova.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * `ix.i1.b()Z` — the static "am I Prime?" gate in 8.9.7.
 * Anchors: read of the Prime field `Lb10/k2;->h:Z` plus the `Lxx/e0;->a` grant check.
 */
object IsPrimeFingerprint : Fingerprint(
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL, AccessFlags.STATIC),
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_BOOLEAN,
            definingClass = "Lb10/k2;",
            name = "h",
        ),
        methodCall(
            definingClass = "Lxx/e0;",
            name = "a",
        ),
    ),
)

/**
 * `b10.k2.a(SharedPreferences)V` — the Prime state initialiser.
 * Anchor: the `android.os.SystemProperties` string (Razer branch) is unique to this method.
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
 * `xx.b0.w(Context)Z` — "is an active subscription on record?".
 * Anchors: `nova_billing` + `subscription_active` literals and the `xor-int/lit8` inversion.
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
