package app.template.patches.netflix.shared

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext

// Guard against Morphe Manager's "Optimize for device architecture" (Expert mode).
//
// With that option on, Manager keeps only the CPU architecture of the device doing
// the patching. For a split bundle (.apkm) it skips the other architecture splits
// while merging — BEFORE patches run. Netflix 13.0.1 is an armeabi-v7a-only TV
// bundle, so when someone patches on an arm64 phone for a TV box it reaches us with
// no lib/armeabi-v7a/ at all. Every patch would still report "Applied", but the
// output would crash on the TV (our injected gadget is there, Netflix's own engine
// library is not).
//
// Ported from ajstrick81/morphe-androidtv-patches (GPL-3.0) shared/arch helper.
fun ResourcePatchContext.requireNativeLib(appName: String, mainLib: String, abi: String = "armeabi-v7a") {
    if (get("lib/$abi/$mainLib").exists()) return

    val present = get("lib").listFiles()?.filter { it.isDirectory }?.map { it.name }?.sorted().orEmpty()
    val found = if (present.isEmpty()) "no native libraries at all" else "only ${present.joinToString()}"

    throw PatchException(
        "$appName needs its $abi native libraries, but this APK has $found " +
            "(lib/$abi/$mainLib is missing). This usually means Morphe Manager's " +
            "\"Optimize for device architecture\" option was ON while patching on a phone. " +
            "Turn it OFF (it is an Expert mode setting) and patch the original .apkm again. " +
            "If the option is already off, re-download the exact Android TV bundle " +
            "linked in docs/NETFLIX.md.",
    )
}
