package semicoloncolonel.mobilestream.patches.netflix.bypass

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourceFile
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

// Writes the prebuilt native anti-tamper library into the APK's arm64-v8a
// native lib dir. libnfkill.so inline-hooks libc's kill primitives (via
// And64InlineHook, address-based, no linker parsing) and blocks the fatal
// signal Netflix's native guard raises against its own process, so a re-signed
// build survives instead of self-killing a few seconds after launch.
//
// A dependency of Bypass tamper protection.
private const val ABI = "arm64-v8a"
private const val LIB = "libnfkill.so"

// Netflix's Application class, as a type descriptor ("Lo/gIm;"), read from the
// manifest's <application android:name>. R8 renames the class on every build
// (o.gLY on 9.93.0, o.gIm on 9.92.0), so it is read here rather than written
// into a fingerprint. Bypass tamper protection, which depends on this patch,
// injects into its attachBaseContext.
internal lateinit var applicationClass: String

val bundleTamperBypassPatch = resourcePatch {
    execute {
        // Netflix keeps its own native libraries (libsqlcipher, libcronet, the
        // guard lib, and more) in the arm64_v8a split APK, not in base.apk.
        // Patching base.apk alone drops them and the app crashes at launch.
        // Refuse with a clear message instead of producing a broken build.
        // libsqlcipher.so is a stable probe: it is present on every build.
        val appLibPresent = try {
            get("lib/$ABI/libsqlcipher.so", true).exists()
        } catch (e: Exception) {
            false
        }
        if (!appLibPresent) {
            throw PatchException(
                "Netflix's native libraries are missing from this input. Patch the " +
                    "full APKM bundle (base plus the arm64_v8a split) from APKMirror. " +
                    "Do not use \"Use installed app\" or a base.apk alone — the native " +
                    "libraries live in the split and the patched app would crash.",
            )
        }

        val bytes = object {}.javaClass.getResourceAsStream("/native/$ABI/$LIB")
            ?.use { it.readBytes() }
            ?: throw IllegalStateException("bundled native library /native/$ABI/$LIB missing")
        val target = resourceFile("lib/$ABI/$LIB", false)
        target.parentFile?.mkdirs()
        target.outputStream().use { it.write(bytes) }

        // Netflix ships android:extractNativeLibs="false", which mmaps libs
        // straight from the (compressed, unaligned) APK and would throw
        // UnsatisfiedLinkError on the injected library. Force extraction so the
        // linker loads our lib from nativeLibraryDir instead.
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element
            application.setAttribute("android:extractNativeLibs", "true")

            val name = application.getAttribute("android:name")
            if (name.isEmpty()) throw PatchException("The manifest names no Application class")
            // A name starting with "." is relative to the package.
            val className = if (name.startsWith(".")) {
                document.documentElement.getAttribute("package") + name
            } else {
                name
            }
            applicationClass = "L" + className.replace('.', '/') + ";"
        }
    }
}
