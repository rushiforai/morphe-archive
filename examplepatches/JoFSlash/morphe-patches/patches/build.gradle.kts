group = "app.jofslash"

patches {
    about {
        name = "JoFSlash Patches"
        description = "Patches for Quora, Booking.com, Google Health (Fitbit) and Kalorické Tabulky"
        source = "git@github.com:JoFSlash/morphe-patches.git"
        author = "JoFSlash"
        contact = "https://github.com/JoFSlash/morphe-patches/issues"
        website = "https://github.com/JoFSlash/morphe-patches"
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

// PATCHES_VERSION, the version these patches are built as, for the Update notice patch. The release
// sets the version in gradle.properties before it builds.
val generatePatchesVersion = tasks.register("generatePatchesVersion") {
    val out = layout.buildDirectory.dir("generated/patchesVersion")
    val patchesVersion = project.version.toString()
    inputs.property("version", patchesVersion)
    outputs.dir(out)
    doLast {
        val file = out.get().file("app/jofslash/patches/quora/shared/PatchesVersion.kt").asFile
        file.parentFile.mkdirs()
        file.writeText(
            "package app.jofslash.patches.quora.shared\n\n" +
                "internal const val PATCHES_VERSION = \"$patchesVersion\"\n"
        )
    }
}

kotlin.sourceSets.named("main") {
    kotlin.srcDir(generatePatchesVersion)
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
