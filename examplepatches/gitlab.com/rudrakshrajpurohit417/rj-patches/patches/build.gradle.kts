group = "com.github.RudrakshRJ"

patches {
    about {
        name = "RJ Patches"
        description = "High-performance Morphe patches by RudrakshRJ for smooth streaming, buffer optimization, VIP unlock, and ad removal."
        source = "https://gitlab.com/rudrakshrajpurohit417/rj-patches.git"
        author = "RudrakshRJ"
        contact = "https://gitlab.com/rudrakshrajpurohit417/rj-patches"
        website = "https://gitlab.com/rudrakshrajpurohit417/rj-patches"
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

        dependsOn("buildAndroid")

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}

