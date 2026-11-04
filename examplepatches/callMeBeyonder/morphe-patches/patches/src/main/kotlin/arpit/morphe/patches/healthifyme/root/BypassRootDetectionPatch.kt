package arpit.morphe.patches.healthifyme.root

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import arpit.morphe.patches.healthifyme.shared.Constants.COMPATIBILITY_HEALTHIFYME
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

@Suppress("unused")
val bypassRootDetectionPatch = bytecodePatch(
    name = "Bypass Root Detection",
    description = "Removes the root-detection block so the app can be used on rooted devices.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_HEALTHIFYME)

    execute {
        //
        // Signal 1 — `RootDetector.d(...)`, the build-tag / su-binary / `which su`
        // detector. Its only public entry point returns `Pair(true, 1|2|3)` for a
        // rooted device or `Pair(false, -1)` otherwise; every app start funnels
        // through it via `HealthifymeUtils.checkIfDeviceIsRooted()`. Replacing the
        // whole evaluation with the app's own "not rooted" result kills all three
        // checks at once and leaves the Analytics/CleverTap "Device Rooted" logging
        // path untouched (it only runs when a root signal is actually detected).
        //
        // The original `Pair(false, -1)` construction (smali `:cond_40`, lines 948-973)
        // is reproduced verbatim. `.registers 3` leaves v0/v1/v2 available; v2 is the
        // parameter register, which is safe to clobber because we return immediately.
        //
        RootDetectorIsDeviceRootedFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                const/4 v1, -0x1
                invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
                move-result-object v1
                new-instance v2, Lkotlin/Pair;
                invoke-direct {v2, v0, v1}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V
                return-object v2
            """,
        )

        //
        // Signal 2 — `CrashLogUtils.g()`, the independent Crashlytics/Fabric term
        // that `HealthifymeUtils.checkIfDeviceIsRooted()` ORs with signal 1
        // (test-keys build tags, `Superuser.apk`, `/system/xbin/su`, emulator …).
        // Without zeroing it, devices where only this term fires (some Magisk
        // setups, test-keys ROMs, emulators) would still hit the block screen.
        //
        // The getter's only call site in the APK is the root chain — fail loudly if
        // that ever changes, so no other consumer silently loses its value.
        //
        val crashLogRootFlagGetter = CrashLogUtilsIsDeviceRootedFingerprint.method

        val callSites = countCallSitesOf(crashLogRootFlagGetter)
        check(callSites == 1) {
            "Expected the CrashLogUtils root-flag getter to have exactly 1 call site, " +
                "found $callSites."
        }

        crashLogRootFlagGetter.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )
    }
}

/**
 * Counts instructions across all app classes that invoke [reference].
 */
private fun BytecodePatchContext.countCallSitesOf(reference: MethodReference): Int {
    var callSites = 0
    classDefForEach { classDef ->
        classDef.methods.forEach { method ->
            method.implementation?.instructions?.forEach { instruction ->
                if (instruction is ReferenceInstruction) {
                    val target = instruction.reference
                    if (target is MethodReference &&
                        target.definingClass == reference.definingClass &&
                        target.name == reference.name &&
                        target.returnType == reference.returnType &&
                        target.parameterTypes == reference.parameterTypes
                    ) {
                        callSites++
                    }
                }
            }
        }
    }
    return callSites
}
