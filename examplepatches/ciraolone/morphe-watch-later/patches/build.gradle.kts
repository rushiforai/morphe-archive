group = "app.ciraolone"

patches {
    about {
        name = "Watch Later Patches"
        description = "Pulsante Guarda piu tardi nella barra di navigazione di YouTube"
        source = "git@github.com:ciraolone/morphe-watch-later.git"
        author = "ciraolone"
        contact = "na"
        website = "https://github.com/ciraolone/morphe-watch-later"
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
    // Utilita' di authoring delle patch (app.morphe.util.*) usate da WatchLaterButtonPatch
    // e ProtoLibraryFixPatch: registri liberi, inserimento smali, clonazione metodi.
    implementation(libs.morphe.patches.library)

    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
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
