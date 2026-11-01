group = "app.noam"

patches {
    about {
        name = "Quwi's Chess Patches"
        description = "A fork of Noam's Morphe Patches for chess.com: Game Review on the Stockfish of your own computer, plus Great (!) and Brilliant (!!) moves."
        source = "git@github.com:quwi26/Quwis-Patches.git"
        author = "ImNoammm, quwi26"
        contact = "na"
        website = "https://github.com/quwi26/Quwis-Patches"
        license = "GNU General Public License v3.0"
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
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }

    publish {
        dependsOn("generatePatchesList")
    }
}
