group = "app.fblite"

patches {
    about {
        name = "Morphe FB Lite"
        description = "Morphe patches for Facebook Lite"
        source = "git@github.com:ToThangGTVT/morphe-fb-lite.git"
        author = "ToThangGTVT"
        contact = "na"
        website = "https://github.com/ToThangGTVT/morphe-fb-lite"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
}

// The patch version (gradle.properties, bumped by semantic-release before the build) is written into a Kotlin
// constant, so the Morphe settings screen can show the version of the patches that built the app.
val generatedVersionDir = layout.buildDirectory.dir("generated/patchVersion")
val generatePatchVersion by tasks.registering {
    val versionText = project.version.toString().takeUnless { it == "unspecified" } ?: ""
    val outputDir = generatedVersionDir
    inputs.property("version", versionText)
    outputs.dir(outputDir)
    doLast {
        val file = outputDir.get().file("app/fblite/patches/shared/PatchVersion.kt").asFile
        file.parentFile.mkdirs()
        file.writeText(
            "package app.fblite.patches.shared\n\n" +
                "/** Generated from the Gradle version. Do not edit. */\n" +
                "internal const val PATCH_VERSION = \"$versionText\"\n"
        )
    }
}

sourceSets["main"].java.srcDir(generatePatchVersion)

tasks.configureEach {
    if (name == "compileKotlin") dependsOn(generatePatchVersion)
}

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
