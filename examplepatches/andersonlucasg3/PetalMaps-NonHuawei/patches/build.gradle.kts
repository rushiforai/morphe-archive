group = "dev.petalaa"

patches {
    about {
        name = "Petal Maps Non-Huawei"
        description = "Patches to run Petal Maps on non-Huawei devices"
        source = "https://github.com/petalaa/PetalMaps-NonHuawei"
        author = "petalaa"
        contact = "petalaa@example.com"
        website = "https://github.com/petalaa/PetalMaps-NonHuawei"
        license = "GNU General Public License v3.0"
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs = listOf("-Xcontext-parameters")
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath: Configuration by configurations.creating

dependencies {
    implementation(libs.morphe.patches.library)

    patchListGeneratorClasspath(libs.gson)
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Generates patches-list.json for tooling/manager consumption"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("app.morphe.util.PatchListGeneratorKt")

        // The generator writes ../patches-list.json relative to the working dir.
        // With workingDir = projectDir (patches/), the JSON lands at repo root.
        workingDir = projectDir
    }
}
