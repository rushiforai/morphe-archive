package app.morphe.patches.arcore.availability

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * VERIFIED fingerprint — from the real dex of CardboardXR 1.0.0
 * (com.brenpoly.cardboardxr, versionCode 10000, versionName 1.0.0),
 * dumped with `dexdump -d` on 2026-11-12.
 * Analysis files: ~/workspace/morphe-arcore/analysis/cardboardxr/
 *
 * Why this class and not ArCoreApk:
 * - `ArCoreApk.checkAvailability(Context)` in this APK is a STUB: its
 *   whole body is `throw new UnsupportedOperationException("Stub")`.
 * - `ArCoreApk.getInstance()` returns `k.a()` — the singleton of
 *   `com.google.ar.core.k`, the real implementation (FINAL class
 *   extending ArCoreApk). Every virtual call to checkAvailability
 *   dispatches to `k.checkAvailability`, which is what Unity's JNI
 *   adapter calls (`ArCoreApkJniAdapter.checkAvailability` ->
 *   `getInstance().checkAvailability(...)` -> `k.checkAvailability`).
 * - `k.checkAvailability` (PUBLIC FINAL, 63 code units) is the real
 *   method: monitor-enter, cached result in field `h`, calls worker
 *   `k.h(Context, h)`, returns the cached Availability.
 *
 * Filter: the string "request not running but result is null?" occurs
 * exactly ONCE in the whole dex, inside this method (offset 0x0033).
 * (The "ARCore-ArCoreApk" tag occurs 5 times — not used, not unique.)
 *
 * The old fingerprint (ArCoreApk.checkAvailability in the ARCore
 * SERVICE apk) is deleted: that class does not exist in the service
 * APK at all (verified 2026-11-11 by dexdump of ARCore 1.57.262640283),
 * so no fingerprint can ever match there. See FINGERPRINT_RESEARCH.md.
 */
object CardboardXrCheckAvailabilityFingerprint : Fingerprint(
    definingClass = "Lcom/google/ar/core/k;",
    name = "checkAvailability",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Lcom/google/ar/core/ArCoreApk\$Availability;",
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(
        // Unique in the whole dex (1 occurrence), in this method only.
        string("request not running but result is null?")
    )
)
