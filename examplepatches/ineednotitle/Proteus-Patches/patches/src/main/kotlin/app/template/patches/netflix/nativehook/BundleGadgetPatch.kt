package app.template.patches.netflix.nativehook

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.netflix.shared.requireNativeLib
import app.template.patches.shared.Constants.NETFLIX_COMPATIBILITY

// ─────────────────────────────────────────────────────────────────────────────
// THE AD REMOVER (delivery half). Bundles a frida-gadget into com.netflix.ninja
// running in SCRIPT mode against the bundled ad-kill script (killads.js) — the
// gadget runs inside Netflix's own process at launch, so the ad kills apply with
// no PC, no root, and no frida server.
//
// Writes into the decoded APK:
//   1. lib/armeabi-v7a/libgadget.so         — the frida-gadget binary
//   2. lib/armeabi-v7a/libgadget.script.so  — the ad-kill script (killads.js)
//   3. lib/armeabi-v7a/libgadget.config.so  — gadget config (run the script at load)
//   4. manifest flip: extractNativeLibs=true (so the libs land in an app-readable dir)
//
// Companion to loadGadgetPatch, which injects the System.loadLibrary("gadget")
// call and dependsOn() this so the .so + script + config are in place first.
//
// CREDIT: ported from ajstrick81/morphe-androidtv-patches (GPL-3.0), Netflix
// Android TV patch set. The gadget is Frida (wxWindows Library Licence); the
// ad-kill script is from the same upstream project. Default ON.
// ─────────────────────────────────────────────────────────────────────────────
@Suppress("unused")
val bundleGadgetPatch = resourcePatch(
    name = "Remove Netflix ads (bundle engine)",
    description = "Bundles the in-process ad-kill script (killads.js) and its loader into the " +
        "app. This is the ad remover: at launch the app runs the script itself (script mode — no " +
        "PC, no root, no frida server) and empties Netflix's ad breaks (pre-roll, mid-roll) and " +
        "the pause-screen ad overlay. Pairs with the loader patch. Default ON.",
    default = true,
) {
    compatibleWith(NETFLIX_COMPATIBILITY)

    execute {
        // Fail clearly on an architecture-optimized input (no armeabi-v7a engine
        // lib) instead of producing an APK that crashes on the TV.
        requireNativeLib(appName = "Netflix", mainLib = "libnetflix.so")

        val abi = "armeabi-v7a"

        // ── 1. Copy the supplied frida-gadget into lib/<abi>/ ────────────────
        val resourcePath = "/netflix/native/$abi/libgadget.so"
        val soBytes = object {}.javaClass.getResourceAsStream(resourcePath)
            ?.use { it.readBytes() }
            ?: error(
                "bundleGadgetPatch: $resourcePath not found on the patch " +
                    "classpath — restore the armeabi-v7a frida-gadget at " +
                    "patches/src/main/resources/netflix/native/$abi/libgadget.so",
            )

        get("lib/$abi/libgadget.so").apply {
            parentFile?.mkdirs()
            writeBytes(soBytes)
        }

        // ── 2a. Bundle the ad-kill script INSIDE the apk (next to the .so) ───
        // Self-contained: the gadget runs the script itself at load — no PC, no
        // frida-CLI. "script" mode normally can't read /data/local/tmp (SELinux
        // blocks untrusted_app from shell_data_file), so we place the script in
        // the app's OWN lib dir (named .so so extractNativeLibs extracts it) and
        // reference it by a RELATIVE path, which frida resolves next to the
        // gadget library — a location the app can always read.
        val scriptBytes = object {}.javaClass.getResourceAsStream("/netflix/native/killads.js")
            ?.use { it.readBytes() }
            ?: error("bundleGadgetPatch: /netflix/native/killads.js not found on the patch classpath")
        get("lib/$abi/libgadget.script.so").apply {
            parentFile?.mkdirs()
            writeBytes(scriptBytes)
        }

        // ── 2b. Gadget config: run the bundled script at load ────────────────
        // frida-gadget auto-loads "<soname>.config.so" from the same dir; here it
        // runs the bundled killads script (relative path -> resolved beside
        // libgadget.so in the extracted lib dir, which is app-readable). No
        // on_load:"wait", so the app launches NORMALLY and self-applies the kills.
        // Stability: no "on_change":"reload" — the shipped script never changes on
        // a TV, and "reload" keeps a file-monitor thread alive and would re-run the
        // whole script (all timers + memory scans) if the file were ever touched.
        val config = """
            {
              "interaction": {
                "type": "script",
                "path": "libgadget.script.so"
              }
            }
        """.trimIndent()
        get("lib/$abi/libgadget.config.so").apply {
            parentFile?.mkdirs()
            writeText(config)
        }

        // ── 3. Manifest flips ────────────────────────────────────────────────
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0)
                    as? org.w3c.dom.Element ?: return@use
            // base.apk ships extractNativeLibs="false"; injected libs that aren't
            // page-aligned fail to mmap → force extraction to sidestep. Also
            // required so the bundled killads script (libgadget.script.so) is
            // extracted to the app-readable lib dir for the gadget to load.
            application.setAttribute("android:extractNativeLibs", "true")
        }
    }
}
