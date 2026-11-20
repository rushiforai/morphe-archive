package app.tgseed.patches.symfonium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.tgseed.patches.shared.Constants.COMPATIBILITY_SYMFONIUM

/**
 * LeakCanary ships inside this release build and is started by its own ContentProvider
 * (declared in the manifest as `leakcanary.internal.PlumberInstaller`, exported=false).
 *
 * The class name is not obfuscated - the manifest references it - so it is a rank-2 anchor
 * that survives app updates. Its ContentProvider entry point is `onCreate()`, which returns
 * a boolean; making it return false leaves the provider registered but inert.
 */
private val PlumberInstallerFingerprint = Fingerprint(
    definingClass = "Lleakcanary/internal/PlumberInstaller;",
    name = "onCreate",
    returnType = "Z"
)

@Suppress("unused")
val disableLeakCanaryPatch = patch(
    name = "Disable LeakCanary",
    description = "Stops the bundled LeakCanary memory profiler from installing itself by " +
        "making its ContentProvider onCreate() return false.",
    default = false
) {
    compatibleWith(COMPATIBILITY_SYMFONIUM)

    execute {
        val method = PlumberInstallerFingerprint.method
        val registers = method.implementation?.registerCount ?: 0
        if (registers < 1) {
            throw PatchException("PlumberInstaller.onCreate has no registers to return through")
        }
        method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )
    }
}
