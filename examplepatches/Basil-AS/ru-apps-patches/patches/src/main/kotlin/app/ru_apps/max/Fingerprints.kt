package app.ru_apps.max

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Ported from RealCyberwash/max-patches (GPLv3), app/template/patches/analytics/vpnchecker/Fingerprints.kt.
 *
 * Structural match for the external-IP-checker coroutine body: a Kotlin suspend-lambda
 * `invoke`/continuation method (public final, `(Ljava/lang/Object;)Ljava/lang/Object;`)
 * that computes a timeout via `Math.max(8192, ...)` and compares the resolved IP string
 * against the literal "127.0.0.1" to discard loopback/local results.
 *
 * Re-verified 2026-10-06 against ru.oneme.app 26.34.0 (versionCode 6850): resolves to
 * `ji8.smali` method `w(Ljava/lang/Object;)Ljava/lang/Object;` (smali_classes2), a single
 * 900+ line method spanning the literal `0x2000` (8192) + `Math;->max(II)I` call near
 * line 483-485, and the `"127.0.0.1"` string compare at line 774 — i.e. the same class
 * that was named `vb7`/`qb7`/`pb7` in the habr.com audits (R8 renames it per build; the
 * structural fingerprint still matches). See
 * apps/ru.oneme.app/analysis/habr_audit_findings.md section A.2.
 */
object VpnCheckerFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        literal(8192),
        methodCall(
            definingClass = "Ljava/lang/Math;",
            name = "max"
        ),
        string("127.0.0.1")
    )
)
