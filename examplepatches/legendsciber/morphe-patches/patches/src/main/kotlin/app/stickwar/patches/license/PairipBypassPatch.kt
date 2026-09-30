package app.stickwar.patches.license

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.stickwar.patches.shared.Constants.COMPATIBILITY_STICKWAR

/**
 * Stick War Legacy — full PairIP removal.
 *
 * The app registers `com.pairip.application.Application`, whose
 * `attachBaseContext` calls `verifyIntegrity` then `checkLicense`. The check binds
 * Play's licensing service, validates the signed response against a pinned RSA key
 * and, on any failure (always, on a re-signed APK), starts `LicenseActivity` and
 * schedules `System.exit(0)`. A second, independent path runs a PairIP VM program
 * from `assets/` through `libpairipcore.so` via `VMRunner.invoke`, which is what
 * produced the "Get this game from Play" wall and a SIGSEGV before Unity started.
 *
 * Both are neutralised here, plus the obfuscation string holders PairIP would
 * normally populate at runtime (without the native VM they stay `null`, which
 * crashes AutoValue-generated constructors such as
 * `AutoValue_LibraryVersion` with `NullPointerException: Null libraryName`).
 *
 * Every hook wipes the whole body (instructions *and* try/catch ranges) before
 * writing the replacement, so no orphaned handler PC can survive.
 *
 * References: the community PairIP recipes in byehi98/okish-morphe-patches
 * (Lumina, Big Hunter, Only One) and rushiranpise/morphe-patches
 * (`killPairIpFull`, `pairIPManifestPatch`).
 */
@Suppress("unused")
val stickWarPairipBypassPatch = bytecodePatch(
    name = "Stick War Legacy PairIP bypass",
    description = "Removes the PairIP license gate, the native PairIP VM and the Play Store redirect so the game starts on a re-signed APK.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_STICKWAR)

    execute {
        VmRunnerClinitFingerprint.method.wipeBodyAndReturnEarly()
        VmRunnerInvokeFingerprint.method.wipeBodyAndReturnEarly()
        VerifyIntegrityFingerprint.method.wipeBodyAndReturnEarly()
        VerifySignatureMatchesFingerprint.method.wipeBodyAndReturnEarly()
        StartupLaunchFingerprint.method.wipeBodyAndReturnEarly()
        CheckLicenseFingerprint.method.wipeBodyAndReturnEarly()
        InitializeLicenseCheckFingerprint.method.wipeBodyAndReturnEarly()
        ProcessResponseFingerprint.method.wipeBodyAndReturnEarly()
        StartPaywallActivityFingerprint.method.wipeBodyAndReturnEarly()
        LicenseActivityOnStartFingerprint.method.wipeBodyAndReturnEarly()
        ValidateResponseFingerprint.method.wipeBodyAndReturnEarly()
        ExitActionFingerprint.method.wipeBodyAndReturnEarly()

        PerformLocalInstallerCheckFingerprint.method.wipeBodyAndReturnEarly()
        ContentProviderOnCreateFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent(),
        )
    }
}
