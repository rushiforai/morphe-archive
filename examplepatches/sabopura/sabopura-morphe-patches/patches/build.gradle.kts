group = "io.github.sabopura.morphe.patches"

patches {
    about {
        name = "Sabopura Morphe Patches"
        description = "Patches for use with Morphe: danmaku comments and ambient light for YouTube, chat, danmaku and playback enhancements for Twitch, auto-translate for Reddit, mission reward auto-claim and opening pages in another browser for SmartNews, and ad, telemetry or popup cleanup and fixes for SmartNews, Pinterest, pixiv, Google News and Sankaku."
        source = "https://github.com/sabopura/sabopura-morphe-patches"
        author = "sabopura"
        contact = "na"
        website = "https://github.com/sabopura/sabopura-morphe-patches"
        license = "GPLv3"
    }
}

// The bundle's version as a constant, so a patch can write it into the app it patches.
val generateBuildInfo by tasks.registering {
    val version = project.version.toString()
    val directory = layout.buildDirectory.dir("generated/buildInfo")
    inputs.property("version", version)
    outputs.dir(directory)
    doLast {
        val file = directory.get().file("io/github/sabopura/morphe/patches/BuildInfo.kt").asFile
        file.parentFile.mkdirs()
        file.writeText(
            "package io.github.sabopura.morphe.patches\n\ninternal const val PATCHES_VERSION = \"$version\"\n",
        )
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs.add("-Xcontext-parameters")
    }
    sourceSets.named("main") {
        kotlin.srcDir(generateBuildInfo)
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath: Configuration by configurations.creating

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
    testImplementation("junit:junit:4.13.2")
}

configurations.testImplementation { extendsFrom(configurations.compileOnly.get()) }

tasks {
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
