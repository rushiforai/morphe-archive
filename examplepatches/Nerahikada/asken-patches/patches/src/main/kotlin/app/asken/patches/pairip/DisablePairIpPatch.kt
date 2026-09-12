package app.asken.patches.pairip

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.asken.patches.shared.Constants.ASKEN_COMPATIBILITY
import app.asken.patches.devirt.devirtualizePatch
import app.asken.patches.restore.restoreStringsPatch

@Suppress("unused")
val disablePairIpPatch = bytecodePatch(
    name = "Disable PairIP",
    description = "Fully removes PairIP so no native code runs: skips the startup VM program (StartupLauncher.launch), prevents libpairipcore from loading (VMRunner.<clinit> return-void, where System.loadLibrary lives), and no-ops the signature/license gates. libpairipcore staying out is what keeps the Play-license paywall away; the only thing that needed its VM — YLPacker — is reimplemented in Java (see reimplementYlpackerPatch). Decrypted Strings and virtualized bodies are rebuilt by the Restore and De-virtualize patches."
) {
    compatibleWith(ASKEN_COMPATIBILITY)
    // Removing PairIP leaves the VM-decrypted Strings null and the virtualized method bodies missing; force the compensating patches so PairIP can never be stripped without them (avoids boot NPE).
    dependsOn(restoreStringsPatch, devirtualizePatch)
    execute {
        StartupLauncherFingerprint.method.addInstruction(0, "return-void")
        VMRunnerClinitFingerprint.method.addInstruction(0, "return-void")
        SignatureCheckFingerprint.method.addInstruction(0, "return-void")
        LicenseCheckFingerprint.method.addInstruction(0, "return-void")
        // Defense-in-depth: with libpairipcore unloaded the paywall cannot fire, but keep the Play-license paywall/shutdown paths severed in case any path reaches them.
        StartPaywallActivityFingerprint.method.addInstruction(0, "return-void")
        StartErrorDialogActivityFingerprint.method.addInstruction(0, "return-void")
        LicenseActivityOnStartFingerprint.method.addInstructions(0, "invoke-super {p0}, Landroid/app/Activity;->onStart()V\ninvoke-virtual {p0}, Lcom/pairip/licensecheck/LicenseActivity;->finish()V\nreturn-void")
    }
}
