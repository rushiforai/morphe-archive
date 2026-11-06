group = "app.ayufa"

patches {
    about {
        name = "Ayufa Patches"
        description = "Custom Morphe patches by Ayufa for various apps (currently Simeji: in-app settings with runtime toggles, ad and promotion removal, VIP utilities and more)"
        source = "git@github.com:Ayufa/ayufa-patches.git"
        author = "Ayufa"
        contact = "https://github.com/Ayufa/ayufa-patches/issues"
        website = "https://github.com/Ayufa/ayufa-patches"
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
