group = "app.template"

patches {
    about {
        name = "Heval's Morphe Patches"
        description = "Patches for apps I like"
        source = "https://github.com/heval99/morphe-patches"
        author = "heval99"
        contact = "https://github.com/heval99"
        website = "https://morphe.software/add-source?github=heval99/morphe-patches"
        license = "GPLv3"
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs.add("-Xcontext-parameters")
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)

    // Provides app.morphe.util helpers (returnEarly, findMutableMethodOf, getReference, etc.)
    // used by patches ported from Heval-Patches.
    implementation(libs.morphe.patches.library)
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
