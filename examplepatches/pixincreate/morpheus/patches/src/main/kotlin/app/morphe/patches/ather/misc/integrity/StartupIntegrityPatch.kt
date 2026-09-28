/*
 * Ather Morphe patches.
 * Licensed under CC0 1.0 Universal.
 */

package app.morphe.patches.ather.misc.integrity

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
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
 */
internal object StartupVerdictFingerprint : Fingerprint(
    definingClass = "Lcom/athermobileapp/startupintegrity/d;",
    name = "a",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Enum;",
    parameters = listOf("Lkotlin/coroutines/jvm/internal/c;"),
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
 */
@Suppress("unused")
val startupIntegrityPatch = bytecodePatch(
    name = "Bypass startup integrity",
    description = "Stops the startup integrity gate that closes the app with a " +
        "'modified operating system' message on custom ROMs such as GrapheneOS.",
) {
    compatibleWith("com.athermobileapp")

    execute {
        StartupVerdictFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Lcom/athermobileapp/startupintegrity/a;->Passed:Lcom/athermobileapp/startupintegrity/a;
                return-object v0
            """,
        )

        NativeRuntimeGuardFingerprint.method.addInstructions(0, "const/4 p0, 0x1\nreturn p0")
    }
}
