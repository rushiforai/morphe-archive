group = "app.template"

patches {
    about {
        name = "Cloverlord Patches"
        description = "Save file access, editing and backup patches for Shattered Pixel Dungeon"
        source = "git@github.com:erobertsme/shatteredpixel-morphe-patches.git"
        author = "erobertsme"
        contact = "na"
        website = "https://github.com/erobertsme/shatteredpixel-morphe-patches"
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

val generatePatchesVersion = tasks.register("generatePatchesVersion") {
    val outputDir = layout.buildDirectory.dir("generated/patchesVersion")
    val versionName = project.version.toString()
    inputs.property("version", versionName)
    outputs.dir(outputDir)
    doLast {
        val file = outputDir.get().file("app/template/patches/shared/PatchesVersion.kt").asFile
        file.parentFile.mkdirs()
        file.writeText("package app.template.patches.shared\n\ninternal const val PATCHES_VERSION = \"$versionName\"\n")
    }
}

sourceSets["main"].java.srcDir(generatePatchesVersion)

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
