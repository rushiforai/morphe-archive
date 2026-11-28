package semicoloncolonel.mobilestream.patches.netflix.bypass

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.netflix.shared.Constants

// Lets a re-signed Netflix build run without tripping its native tamper guard.
//
// Netflix ships a native integrity guard that reads the install's signing
// certificate independently of any Java-level hook. On a re-signed build it
// kills its own process a few seconds after launch (a plain kill(getpid(),
// SIGKILL) routed through libc). This loads a bundled native library
// (libnfkill.so) at the very start of the Application's attachBaseContext;
// the library inline-hooks libc's kill primitives and swallows the fatal
// signal, so the app survives and plays. Widevine stays L1/HD. No root.
//
// The signing change is what the user does when they patch and install; this
// patch only keeps the app alive afterwards. It must load before onCreate, so
// the hook is armed before the guard first fires.
//
// The Application class is the one the manifest names; R8 renames it on every
// build, so bundleTamperBypassPatch reads it from the manifest. Its
// attachBaseContext(Context) runs before onCreate and before the guard arms.
@Suppress("unused")
val bypassTamperProtectionPatch = bytecodePatch(
    name = "Bypass tamper protection",
    description = "Keeps a patched (re-signed) Netflix build from killing its own process a " +
        "few seconds after launch. Loads a bundled in-process native hook that blocks the " +
        "fatal signal Netflix's native integrity guard raises against itself, so the app runs " +
        "and plays normally, with no root. Required for any other Netflix patch to take effect.",
) {
    category("Setup")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(bundleTamperBypassPatch)

    extendWith("extensions/extension.mpe")

    execute {
        if (classDefByOrNull(applicationClass) == null) {
            throw PatchException("Application class $applicationClass not found")
        }
        val attachBaseContext = mutableClassDefBy(applicationClass).methods.firstOrNull { method ->
            method.name == "attachBaseContext" &&
                method.returnType == "V" &&
                method.parameterTypes.map { it.toString() } == listOf("Landroid/content/Context;") &&
                method.implementation != null
        } ?: throw PatchException("$applicationClass does not override attachBaseContext")

        attachBaseContext.addInstructions(
                0,
                "invoke-static {}, " +
                    "Lsemicoloncolonel/mobilestream/extension/netflix/bypass/NetflixBypassLoader;->load()V",
            )
    }
}
