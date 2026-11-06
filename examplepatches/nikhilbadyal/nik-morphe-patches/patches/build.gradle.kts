// Keep publication coordinates under this project's maintainer rather than the inherited namespace.
group = "nikhilbadyal"

patches {
    // Identify this bundle as Swift Backup-only so Manager users know its supported scope.
    about {
        name = "nikhilbadyal Swift Backup Patches"
        description = "Patches for Swift Backup"
        source = "https://github.com/nikhilbadyal/nik-morphe-patches"
        author = "nikhilbadyal"
        contact = "na"
        website = "https://github.com/nikhilbadyal/nik-morphe-patches"
        license = "GPLv3"
    }
}

dependencies {
    // Used by JsonGenerator.
    implementation(libs.gson)

    implementation(libs.morphe.patches.library)
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn("buildAndroid")

        classpath = sourceSets["main"].runtimeClasspath
        mainClass.set("app.morphe.util.PatchListGeneratorKt")
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs = listOf("-Xcontext-parameters")
    }
}
