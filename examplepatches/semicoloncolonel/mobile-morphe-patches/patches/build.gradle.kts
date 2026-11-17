group = "app.morphe"

// Bundle flavor: -Pflavor=all (default), phone, or tv. See
// shared/misc/BundleFlavor.kt. Releases still ship the combined "all" bundle.
// The phone and tv flavors are for the planned split into two patch sources.
val bundleFlavor: String = providers.gradleProperty("flavor").getOrElse("all").also {
    require(it in setOf("all", "phone", "tv")) { "-Pflavor must be all, phone, or tv, not $it" }
}

// Patches that exist only for Android TV apps. The phone bundle leaves them out.
// Each app's shared/ folder stays, because the shared patches name its Constants.
val tvOnlySources = listOf(
    "**/patches/appletv/tv/**",
    "**/patches/espn/tv/**",
    "**/patches/mlb/tv/**",
    "**/patches/nba/tv/**",
    "**/patches/shared/privacy/RejectTrackingConsentPatch.kt",
    "**/patches/newsnation/tv/**",
    "**/patches/hulutv/privacy/**",
    "**/patches/hulutv/nativehook/**",
    "**/patches/hulutv/misc/**",
    "**/patches/primevideotv/**",
    "**/patches/yttvshell/ads/**",
    "**/patches/yttvshell/misc/**",
)

// Folders the TV bundle keeps: the Android TV apps, the apps with one entry for
// phone and TV builds, and the shared helpers. Everything else is phone-only.
// Keep this list in step with docs/android-tv.md.
val tvBundleApps = setOf(
    "appletv", "disney", "espn", "foxone", "hbomax", "hulutv", "justwatch", "mgm", "mlb",
    "nba", "newsnation", "nfl", "pbs", "peacock", "plex", "pluto", "primevideotv", "starz", "tubi", "yttvshell",
)
val patchesSourceDir = file("src/main/kotlin/semicoloncolonel/mobilestream/patches")
// Shown only by the combined bundle, which is the one that stops carrying the
// Android TV apps after 1.1. The phone and tv flavors leave it out.
val combinedOnlySources = listOf("**/patches/shared/misc/TvSourceNoticePatch.kt")
val flavorExcludes: List<String> = when (bundleFlavor) {
    "phone" -> tvOnlySources + combinedOnlySources
    "tv" -> combinedOnlySources + buildList {
        patchesSourceDir.listFiles().orEmpty()
            .filter { it.isDirectory && it.name != "shared" && it.name !in tvBundleApps }
            .forEach { app ->
                // Keep shared/ for its Constants; drop the patches.
                app.listFiles().orEmpty()
                    .filter { it.name != "shared" }
                    .forEach { add("**/patches/${app.name}/${it.name}" + if (it.isDirectory) "/**" else "") }
            }
        // Phone-only patches inside the folders the TV bundle keeps.
        addAll(listOf(
            "**/patches/appletv/ads/**",
            "**/patches/appletv/misc/**",
            "**/patches/appletv/privacy/**",
            "**/patches/newsnation/ads/**",
            "**/patches/espn/ads/**",
            "**/patches/espn/misc/**",
            "**/patches/nba/ads/SkipAdsPatch.kt",
            "**/patches/nba/misc/**",
            "**/patches/mgm/ads/SkipAdsPatch.kt",
            "**/patches/mgm/ads/SkipPrerollPromoPatch.kt",
            "**/patches/mgm/misc/RemoveSocialSignInPatch.kt",
            "**/patches/peacock/misc/DisableHomeNetworkSignInPatch.kt",
            "**/patches/mlb/misc/GmsCoreSupportPatch.kt",
            "**/patches/mlb/misc/HideSurveysPatch.kt",
            // The Android TV build draws odds through a native odds-provider
            // banner, not the web scores config this patch targets (that config
            // object is dead code in the TV dex), so it does not apply here.
            "**/patches/mlb/misc/HideBettingOddsPatch.kt",
            // The Android TV builds have no social sign-in or, for Starz, no launch video.
            "**/patches/hbomax/misc/RemoveSocialSignInPatch.kt",
            // The Android TV build's media3 has no MediaCodecInfo capability methods to force.
            "**/patches/hbomax/misc/ForceDecodeCapabilityPatch.kt",
            "**/patches/starz/misc/RemoveSocialSignInPatch.kt",
            "**/patches/starz/misc/SkipLaunchVideoPatch.kt",
        ))
        // Shared patches with no Android TV app. A shared patch that lists one
        // stays and filters its list with forBundle().
        addAll(listOf(
            "**/patches/shared/privacy/RouteThroughProxyPatch.kt",
            "**/patches/shared/privacy/GovBlockAnalyticsPatch.kt",
            "**/patches/shared/links/**",
        ))
    }
    else -> emptyList()
}

// Patches kept in the tree but excluded from the public bundle, so Morphe
// Manager never offers them to an unrooted user.
//
//   hallmark — unpatchable. The app ships Pairip's native anti-tamper VM and
//              crashes (SIGSEGV) on any re-signed or mounted build, so the
//              recovered patches do not produce a working app on any device.
//   moviebase/misc/LoadCommunityTabsPatch — dead. It unblocks the Activity and
//              Members tabs client-side, but the server rejects the requests
//              through Firebase App Check (Play Integrity), so the tabs still do
//              not load on a re-signed app. They work only on a rooted device
//              that mounts the patched base and runs Play Integrity Fix. The
//              rest of the Moviebase patches ship normally.
//
// The source stays for reference and future reworks; to build any of these,
// remove its entry here (or compile the package on its own).
sourceSets {
    named("main") {
        kotlin.exclude(
            "**/patches/hallmark/**",
            "**/patches/moviebase/misc/LoadCommunityTabsPatch.kt",
        )
        kotlin.exclude(flavorExcludes)
    }
}

// patches-list.json for third-party tools, from Morphe's patches template.
// gson is only on this task's classpath, never in the bundle.
//   ./gradlew :patches:generatePatchesList -Pflavor=tv -PpatchesList=build/tv/patches-list.json
val patchListGeneratorClasspath: Configuration = configurations.create("patchListGeneratorClasspath")
dependencies {
    compileOnly("com.google.code.gson:gson:2.11.0")
    patchListGeneratorClasspath("com.google.code.gson:gson:2.11.0")
}
tasks.register<JavaExec>("generatePatchesList") {
    description = "Writes patches-list.json for the bundle in build/libs."
    dependsOn(tasks.named("build"))
    classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
    mainClass.set("util.PatchListGeneratorKt")
    args(providers.gradleProperty("patchesList").getOrElse("../patches-list.json"))
}

patches {
    about {
        name = if (bundleFlavor == "tv") "TV Morphe Patches" else "Mobile Morphe Patches"
        description = if (bundleFlavor == "tv") {
            "Ad-blocking and anti-tracking patches for Android TV streaming apps"
        } else {
            "Ad-blocking and anti-tracking patches for phone streaming apps"
        }
        source = "https://github.com/semicoloncolonel/mobile-morphe-patches"
        author = "semicoloncolonel"
        contact = "https://github.com/semicoloncolonel"
        website = "https://github.com/semicoloncolonel/mobile-morphe-patches"
        license = "GPLv3"
    }
}


// Release channel. Builds from the dev branch mark the app versions added
// there as experimental (see devTarget in shared/misc/DevTarget.kt). The same
// versions build as stable on main, so nothing has to change at merge time.
val releaseBranch: String = System.getenv("GITHUB_REF_NAME")
    ?: providers.exec { commandLine("git", "rev-parse", "--abbrev-ref", "HEAD") }
        .standardOutput.asText.get().trim()
val generatedChannelDir = layout.buildDirectory.dir("generated/channel")
val generateReleaseChannel by tasks.registering {
    val isDev = releaseBranch == "dev"
    val flavor = bundleFlavor
    inputs.property("isDev", isDev)
    inputs.property("flavor", flavor)
    outputs.dir(generatedChannelDir)
    doLast {
        val file = generatedChannelDir.get().file("ReleaseChannel.kt").asFile
        file.parentFile.mkdirs()
        file.writeText(
            "package semicoloncolonel.mobilestream.patches.shared.misc\n\n" +
                "/** True when this bundle is built from the dev branch. Generated by Gradle. */\n" +
                "internal const val IS_DEV_BUILD = $isDev\n\n" +
                "/** all, phone, or tv, from -Pflavor. Generated by Gradle. */\n" +
                "internal const val BUNDLE_FLAVOR = \"$flavor\"\n",
        )
    }
}
kotlin.sourceSets.named("main") { kotlin.srcDir(generateReleaseChannel) }
