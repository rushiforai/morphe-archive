package lab.hutch.patches.security

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import lab.hutch.patches.shared.COMPATIBILITY_HUTCH

/**
 * Hutch 4.4.1 refuses to run on a device that looks modified. The gate is
 * entirely client-side: JailMonkeyModule.getConstants() eagerly evaluates
 * RootBeer's nine root checks, a su-file checker, a Frida/Xposed hook scan,
 * mock-location and external-storage probes, and adb_enabled; two further
 * @ReactMethods report developer options and an attached debugger. The
 * Hermes JS bundle (checkDeviceSecurityStatus) then shows a refusal dialog,
 * skips scapp/api/updateGcmRegId and can call RNExitApp.exitApp().
 *
 * Every value crossing the bridge is a boolean produced in DEX, so forcing
 * those producers to false is enough: getConstants() and the
 * rootedDetectionMethods map then report false naturally, with no need to
 * touch the Hermes bytecode (HBC v96, checksummed footer) or to hardcode the
 * map keys. Promise methods must resolve(Boolean.FALSE) rather than just
 * return, otherwise the JS await never settles. The force-quit is stubbed too,
 * so a stale refusal dialog cannot kill the process.
 *
 * Verified on an Android 17 x86_64 emulator with developer options, USB
 * debugging, qemu and Magisk su all active: the stock build blocks with
 * "Developer options are turned on...", the patched build reaches the login
 * screen and successfully POSTs updateGcmRegId on both warm and cold starts.
 */
@Suppress("unused")
val removeEnvironmentChecksPatch = bytecodePatch(
    name = "Remove environment checks",
    description = "Forces every JailMonkey / RootBeer / device-info device-trust check to " +
            "false (root, developer options, USB debugging, emulator, hook frameworks, " +
            "debugger, mock location, external storage) and disables the force-quit " +
            "used by the refusal dialog.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_HUTCH)

    execute {
        // Every producer has .locals >= 1, so v0 is a valid scratch register.
        val returnFalse = """
            const/4 v0, 0x0
            return v0
        """.trimIndent()

        // Promise.resolve takes Ljava/lang/Object;, so the boolean must be boxed.
        val resolveFalse = """
            const/4 v0, 0x0
            invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
            move-result-object v0
            invoke-interface {p1, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V
            return-void
        """.trimIndent()

        // RootBeer: su/busybox binaries, magisk, test-keys, dangerous props,
        // rw system mounts, root/hook apps, which su and libtoolChecker.so.
        RootBeerCheckFingerprint.matchAll(10..10).forEach {
            it.method.addInstructions(0, returnFalse)
        }

        // JailMonkey's own su paths / "which su" and the two OR aggregates.
        SuBinaryCheckFingerprint.matchAll(3..3).forEach {
            it.method.addInstructions(0, returnFalse)
        }
        JailMonkeyAggregateFingerprint.matchAll(2..2).forEach {
            it.method.addInstructions(0, returnFalse)
        }
        RootBeerAggregateFingerprint.method.addInstructions(0, returnFalse)

        // USB debugging, hook frameworks, mock location and external storage.
        AdbEnabledFingerprint.method.addInstructions(0, returnFalse)
        HookCheckFingerprint.matchAll(3..3).forEach {
            it.method.addInstructions(0, returnFalse)
        }
        MockLocationFingerprint.method.addInstructions(0, returnFalse)
        ExternalStorageFingerprint.method.addInstructions(0, returnFalse)

        // Developer options / debugger / emulator: resolve the promises with false.
        JailMonkeyPromiseFingerprint.matchAll(2..2).forEach {
            it.method.addInstructions(0, resolveFalse)
        }
        DeviceInfoEmulatorFingerprint.method.addInstructions(0, resolveFalse)
        DeviceInfoEmulatorSyncFingerprint.method.addInstructions(0, returnFalse)

        // A stale refusal dialog would otherwise terminate the process on dismiss.
        RnExitAppFingerprint.method.addInstructions(0, "return-void")
        ExitAppDelegateFingerprint.method.addInstructions(0, "return-void")
    }
}
