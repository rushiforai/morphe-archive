group = "app.sygic"

patches {
    about {
        name = "Sygic Premium Patches"
        description = "Community patches for Sygic GPS Truck & Caravan (com.sygic.truck): experimental store/billing unlock"
        source = "git@gitlab.com:georgewoodall82/sygic-patches.git"
        author = "georgewoodall82"
        contact = "na"
        website = "https://gitlab.com/georgewoodall82/sygic-patches"
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
