group = "me.dyskal"

patches {
    about {
        name = "Dyskal YouTube Music Discord RPC"
        description = "Discord rich presence add-on for Morphe YouTube Music"
        source = "https://github.com/Dyskal/morphe-yt-music-discord-rpc"
        author = "Dyskal"
        contact = "na"
        website = "https://github.com/Dyskal/morphe-yt-music-discord-rpc"
        license = "GPLv3 with the additional terms in NOTICE"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
    testImplementation(kotlin("test"))
    testImplementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.10.2")
    testRuntimeOnly("org.junit.jupiter:junit-jupiter-engine:5.10.1")
    testRuntimeOnly("org.junit.platform:junit-platform-launcher")
}

tasks {
    withType<Jar>().configureEach {
        from(rootProject.file("LICENSE"), rootProject.file("NOTICE"), rootProject.file("UPSTREAM-NOTICE"),
            rootProject.file("THIRD-PARTY-NOTICES.md"))
    }
    test {
        useJUnitPlatform()
        dependsOn(":extensions:extension:testDebugUnitTest")
    }
    register<JavaExec>("validateDiscord") {
        description = "Applies the standalone Discord patch to a supplied APK with SDK DEX verification"
        group = "verification"
        dependsOn("testClasses")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("me.dyskal.patches.discord.DiscordDeviceBuildKt")
        doFirst {
            val apk = providers.gradleProperty("discordApk").orNull
                ?: throw GradleException("Requires -PdiscordApk=/absolute/path/to/music.apk")
            val official = providers.gradleProperty("morpheBundle").orNull
                ?: throw GradleException("Requires -PmorpheBundle=/absolute/path/to/official-patches.mpp (2.0.0+)")
            setArgs(listOfNotNull(apk, official, providers.gradleProperty("discordOutput").orNull))
        }
    }
    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}
