group = "dev.petalaa"

patches {
    about {
        name = "PetalMaps Android Auto"
        description = "Patches to inject Android Auto support into Petal Maps (com.huawei.maps.app)"
        source = "https://github.com/petalaa/PetalMaps-AndroidAuto"
        author = "petalaa"
        contact = "petalaa@example.com"
        website = "https://github.com/petalaa/PetalMaps-AndroidAuto"
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
