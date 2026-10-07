group = "com.r2beeaton.morphe"

patches {
    about {
        name = "R2bEEaton Walmart Morphe"
        description = "Route My List enhancements for the Walmart Android app"
        source = "https://github.com/R2bEEaton/walmart-morphe"
        author = "R2bEEaton"
        contact = "https://github.com/R2bEEaton"
        website = "https://github.com/R2bEEaton/walmart-morphe"
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
