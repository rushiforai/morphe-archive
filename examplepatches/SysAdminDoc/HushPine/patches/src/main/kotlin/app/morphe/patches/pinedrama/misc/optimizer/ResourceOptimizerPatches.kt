/*
 * Adapted from kveld9/kveld-morphe-patches at
 * fcb1768620b8f98a6dd31e801074589ce9a63356 (GPL-3.0).
 * https://github.com/kveld9/kveld-morphe-patches/tree/fcb1768620b8f98a6dd31e801074589ce9a63356
 */
package app.morphe.patches.pinedrama.misc.optimizer

import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.pinedrama.misc.diagnostics.BUILD_DETAILS_ASSET
import app.morphe.patches.pinedrama.misc.diagnostics.BuildChoice
import app.morphe.patches.pinedrama.misc.diagnostics.BuildDetails
import app.morphe.patches.pinedrama.misc.diagnostics.buildChoicePatch
import java.util.Locale

@Suppress("unused")
val p2pRelayBlockerPatch = rawResourcePatch(
    name = "Block P2P video relay",
    description = "Removes the files PineDrama uses to pass videos on to other viewers through " +
        "your phone's internet connection. The app gets about 3.5 MB smaller. It's built in while " +
        "patching, so only patching again without it brings them back.",
    default = false,
) {
    category("Performance")
    compatibleWith(*AppCompatibilities.pineDrama())
    dependsOn(buildChoicePatch(BuildChoice.P2P))

    execute {
        val nativeFiles = listOf(
            "lib/arm64-v8a/libavmdlp2pv2.so",
            "lib/arm64-v8a/libp2plivevdp.so",
            "lib/armeabi-v7a/libavmdlp2pv2.so",
            "lib/armeabi-v7a/libp2plivevdp.so",
        )
        val result = stripVerifiedResources(
            get("."),
            "P2P Relay Blocker",
            emptyList(),
            nativeFiles,
            p2pRelayProfiles,
            resolveStandaloneFile = { path -> get(path) },
            versionName = packageMetadata.versionName,
        )
        BuildDetails.stripped(get(BUILD_DETAILS_ASSET), BuildChoice.P2P, result)
        result.report("P2P Relay Blocker")
    }
}

@Suppress("unused")
val languagePackPurgerPatch = rawResourcePatch(
    name = "Remove unused language packs",
    description = "Removes the app languages you don't list in this patch's options, saving " +
        "up to about 26 MB of storage. English is always kept. With no list it keeps them all. " +
        "Only patching again brings removed ones back.",
    default = false,
) {
    category("Performance")
    compatibleWith(*AppCompatibilities.pineDrama())
    dependsOn(buildChoicePatch(BuildChoice.LANGUAGES))
    val targetLocales by stringOption(
        key = "locales",
        title = "Languages to keep",
        description = "The languages to keep, as short codes separated by commas, like en, es, " +
            "pt, fr or de. Type all to keep every language. English is always kept.",
        // Keep native translations unless the user chooses which languages to remove (#67).
        default = "all",
        required = false,
    )

    execute {
        decode("assets/strings#lang_*")
        val result = stripVerifiedLanguagePacks(get("."), targetLocales, languageInventories)
        if (result.retainedLocales == null) {
            // Build details keep "unverified": nothing here was checked against a reviewed APK.
            println("[Language Pack Purger] Kept every language pack. This APK's set isn't a reviewed one, so none could be removed.")
        } else {
            BuildDetails.languages(get(BUILD_DETAILS_ASSET), result)
            if (result.missingLocales.isNotEmpty()) {
                println(
                    "[Language Pack Purger] This PineDrama has no pack for " +
                        "${result.missingLocales.sorted().joinToString()}, so there was nothing to keep for it.",
                )
            }
            if (result.files == 0) {
                println("[Language Pack Purger] Kept every reviewed language pack.")
            } else {
                result.report("Language Pack Purger")
            }
        }
    }
}

private fun StripSummary.report(patchName: String) {
    if (files == 0) {
        println("[$patchName] This build ships none of the reviewed files, so there was nothing to empty.")
    } else if (alreadyStripped) {
        println("[$patchName] The reviewed target set was already empty.")
    } else {
        val mebibytes = String.format(Locale.US, "%.2f", bytes.toDouble() / (1024.0 * 1024.0))
        println("[$patchName] Emptied $files reviewed files ($mebibytes MiB unpacked).")
    }
}

internal val p2pRelayProfiles = listOf(
    // PineDrama 47.5.3 (APKMirror's bundle, read on 2026-10-24) ships no relay library in its base
    // or any ABI split, so the strip has nothing to empty. Only on 47.5.3: another build without
    // these files has renamed or moved them, and the strip must refuse it.
    ResourceProfile("PineDrama 47.5.3", emptyList(), onlyVersion = "47.5.3"),
)

internal val languageInventories = listOf(
    // The split bundle: 25 language splits and 102 files.
    LanguageInventoryContract(
        directories = setOf(
            "ar", "de", "en", "es", "et", "fi", "fr", "hi", "hu", "id", "in", "it", "ja", "ko", "ms", "nl",
            "pl", "pt", "ru", "sv", "th", "tr", "uk", "vi", "zh",
        ),
        pathManifestSha256 = "33aad0753feebf540e226b415eecfc59323d40f7b52dfc70a06bd278e7acc9a6",
        contentManifestSha256 = setOf(
            "bc1162803b462d2b856cb35e7f5130bd81aa7b1c29a071a9c264089182da3e05",
        ),
    ),
)
