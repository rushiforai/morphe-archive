/*
 * The native ad strip is a port of ajstrick81's Prime Video Android TV patch
 * (GPL-3.0): https://github.com/ajstrick81/morphe-androidtv-patches
 * ALL CREDIT FOR THE ORIGINAL DESIGN GOES TO ajstrick81. Changes: built for
 * arm64-v8a (which the original never shipped), and the v7a-only inline mid-roll
 * patch reports "not applicable" on arm64 instead of logging every 500ms.
 */

package semicoloncolonel.mobilestream.patches.primevideotv.nativehook

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourceFile
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

// Prime Video's Application class, read from the manifest's <application
// android:name> (com.amazon.primevideo.PrimeVideoApplication). skipAdsPatch,
// which depends on this patch, injects the loader into its onCreate.
internal lateinit var applicationClass: String

private const val LIB = "libpvhook.so"
private val ABIS = listOf("arm64-v8a", "armeabi-v7a")

// Writes the prebuilt libpvhook.so into each native lib dir the APK actually
// carries. Prime Video Android TV is split by ABI; the merged input has
// lib/<abi>/libignite.so for every ABI it ships (allAbis = both). We put our
// hook beside it so the app loads the matching one.
//
// A dependency of Skip ads.
val bundleAdStripHookPatch = resourcePatch {
    execute {
        var written = 0
        for (abi in ABIS) {
            // Only ABIs whose engine (libignite.so) is present — the app loads
            // libignite per ABI, so our hook is only useful where it sits.
            val ignitePresent = try {
                get("lib/$abi/libignite.so", true).exists()
            } catch (e: Exception) {
                false
            }
            if (!ignitePresent) continue

            val bytes = object {}.javaClass.getResourceAsStream("/native/primevideotv/$abi/$LIB")
                ?.use { it.readBytes() } ?: continue

            val target = resourceFile("lib/$abi/$LIB", false)
            target.parentFile?.mkdirs()
            target.outputStream().use { it.write(bytes) }
            written++
        }

        if (written == 0) {
            throw PatchException(
                "Prime Video's native engine (libignite.so) was not found in this input. " +
                    "Patch the full APKM bundle (base plus the ABI split) — the native " +
                    "libraries live in the split and the ad strip has nothing to attach to.",
            )
        }

        // Prime Video ships android:extractNativeLibs="false", which mmaps libs
        // straight from the APK and throws UnsatisfiedLinkError (res=-2 at
        // install) on the injected, re-compressed library. Force extraction so
        // the linker loads our lib from nativeLibraryDir instead.
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element
            application.setAttribute("android:extractNativeLibs", "true")

            val name = application.getAttribute("android:name")
            if (name.isEmpty()) throw PatchException("The manifest names no Application class")
            val className = if (name.startsWith(".")) {
                document.documentElement.getAttribute("package") + name
            } else {
                name
            }
            applicationClass = "L" + className.replace('.', '/') + ";"
        }
    }
}
