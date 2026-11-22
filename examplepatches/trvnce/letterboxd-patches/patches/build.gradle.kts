group = "app.bardo.letterboxd"

patches {
    // TODO: Update this section with your project details.
    about {
        name = "Letterboxd × Bardo"
        description = "Conecta Letterboxd con Bardo: notas, amigos, reseñas y watchlist con tu sesión"
        source = "https://github.com/Trvnce/letterboxd-patches"
        author = "KDrew"
        contact = "na"
        website = "na"
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
