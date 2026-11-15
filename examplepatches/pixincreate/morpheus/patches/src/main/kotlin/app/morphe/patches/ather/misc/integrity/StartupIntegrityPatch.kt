/*
 * Ather Morphe patches.
 * Copyright 2026 pixincreate.
 * SPDX-License-Identifier: Apache-2.0
 */

package app.morphe.patches.ather.misc.integrity

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Matches the startup verdict coroutine.
 *
 * ```
 * public final Object a(kotlin.coroutines.jvm.internal.c): Enum
 * ```
 *
 * The method combines three checks and returns `startupintegrity.a`:
 *  - `coreUtils.w.b(boolean)` must return `u` (Secure), otherwise it rejects,
 *  - `NativeRuntimeGuard.a()` must return true (the native `atherguard` check), and
 *  - `com.ather.firebase.integrity` asks a server for the Play Integrity verdict.
 *
 * A rejected verdict drives the app-level gate that shows the
 * "You cannot use this app on your device. It looks like the device that you are
 * using has a modified operating system." dialog, which blocks custom ROMs such as
 * GrapheneOS even when the device is not rooted.
 *
 * Ather 13.6.0 moved the verifier to `startupintegrity.c` and the verdict enum to
 * `startupintegrity.b`, and added a second method `c.b` for the periodic re-check.
 * All three methods are patched when they are present.
 */
internal object StartupVerdictFingerprint : Fingerprint(
    definingClass = "Lcom/athermobileapp/startupintegrity/d;",
    name = "a",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Enum;",
    parameters = listOf("Lkotlin/coroutines/jvm/internal/c;"),
)

/**
 * Matches the startup verdict coroutine in Ather 13.6.0.
 *
 * ```
 * public final a(kotlin.coroutines.jvm.internal.d): Enum
 * ```
 *
 * The verifier moved from `startupintegrity.d` to `startupintegrity.c`; `d` is now the
 * continuation class. The verdict enum moved from `startupintegrity.a` to
 * `startupintegrity.b`.
 */
internal object StartupVerdict1360Fingerprint : Fingerprint(
    definingClass = "Lcom/athermobileapp/startupintegrity/c;",
    name = "a",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Enum;",
    parameters = listOf("Lkotlin/coroutines/jvm/internal/d;"),
)

/**
 * Matches the periodic re-check added in Ather 13.6.0.
 *
 * ```
 * public final b(kotlin.coroutines.jvm.internal.d): Enum
 * ```
 *
 * The app re-runs the same verdict while it is open, so both methods must pass.
 */
internal object StartupVerdictWhenOnline1360Fingerprint : Fingerprint(
    definingClass = "Lcom/athermobileapp/startupintegrity/c;",
    name = "b",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Enum;",
    parameters = listOf("Lkotlin/coroutines/jvm/internal/d;"),
)

/**
 * Matches the native runtime guard wrapper.
 *
 * ```
 * public final boolean a()
 * ```
 *
 * It runs the native `atherguard` checks and returns false when they fail. The guard
 * is read on its own by `AtherApplication` and by `NativeKeyManager`, so it is patched
 * too.
 */
internal object NativeRuntimeGuardFingerprint : Fingerprint(
    definingClass = "Lcom/ather/common/security/NativeRuntimeGuard;",
    name = "a",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
)

/**
 * Matches the continuous device-integrity monitor added in Ather 13.6.0.
 *
 * ```
 * public final invokeSuspend(Object): Object
 * ```
 *
 * `DeviceIntegrityMonitor$start$1` loops every 30-120 seconds, re-runs the local
 * checks and, when they fail, asks Firebase App Check for a Play Integrity verdict.
 * A rejection clears the startup gate and emits `true`, which the main screen maps
 * to `IntegrityRejected`.
 */
internal object DeviceIntegrityMonitorFingerprint : Fingerprint(
    definingClass = "Lcom/athermobileapp/integrity/a;",
    name = "invokeSuspend",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
)

/**
 * Matches the only method that enters the blocking integrity screen.
 *
 * ```
 * public static final i(MainViewModel): void
 * ```
 *
 * It sets `IntegrityRejected` and the second blocking state. Patching it is a
 * defence-in-depth guard: even if a future check reaches the same method, the UI
 * cannot switch to the rejection screen.
 */
internal object IntegrityRejectedUiFingerprint : Fingerprint(
    definingClass = "Lcom/athermobileapp/ui/main/w1;",
    name = "i",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Lcom/athermobileapp/ui/main/w1;"),
)

/**
 * Disables the startup integrity gate.
 *
 * Verified against Ather 13.5.1 (versionCode 324). The verdict method returns
 * `Passed` at its first instruction, so the local root check, the native
 * `atherguard` check and the Firebase / Play Integrity verdict never run, and the
 * app stops showing the "modified operating system" dialog on GrapheneOS.
 *
 * Equivalent smali, `startupintegrity/d.a(kotlin.coroutines.jvm.internal.c)`:
 * ```
 * sget-object v0, Lcom/athermobileapp/startupintegrity/a;->Passed:Lcom/athermobileapp/startupintegrity/a;
 * return-object v0
 * ```
 *
 * On builds that do not ship the startup integrity classes (Ather 13.5.0) both
 * fingerprints match nothing and the patch is a no-op.
 */
@Suppress("unused")
val startupIntegrityPatch = bytecodePatch(
    name = "Bypass startup integrity",
    description = "Stops the startup integrity gate that closes the app with a " +
        "'modified operating system' message on custom ROMs such as GrapheneOS.",
) {
    compatibleWith("com.athermobileapp")

    execute {
        StartupVerdictFingerprint.matchOrNull()?.method?.patchVerdict("Lcom/athermobileapp/startupintegrity/a;")
        StartupVerdict1360Fingerprint.matchOrNull()?.method?.patchVerdict("Lcom/athermobileapp/startupintegrity/b;")
        StartupVerdictWhenOnline1360Fingerprint.matchOrNull()?.method
            ?.patchVerdict("Lcom/athermobileapp/startupintegrity/b;")

        NativeRuntimeGuardFingerprint.matchOrNull()?.method?.addInstructions(0, "const/4 p0, 0x1\nreturn p0")

        DeviceIntegrityMonitorFingerprint.matchOrNull()?.method?.addInstructions(
            0,
            "sget-object v0, Lkotlin/b0;->a:Lkotlin/b0;\nreturn-object v0",
        )
        IntegrityRejectedUiFingerprint.matchOrNull()?.method?.addInstructions(0, "return-void")
    }
}

/**
 * Returns the `Passed` constant of the given verdict enum at the method's first instruction.
 */
private fun MutableMethod.patchVerdict(verdictType: String) {
    addInstructions(
        0,
        """
            sget-object v0, $verdictType->Passed:$verdictType
            return-object v0
        """.trimIndent(),
    )
}
