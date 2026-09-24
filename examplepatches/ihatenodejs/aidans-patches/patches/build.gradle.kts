group = "app.finance"

patches {
    about {
        name = "Aidan's Patches"
        description = "Morphe patches for finance and shopping applications"
        source = "git@github.com:ihatenodejs/aidans-patches.git"
        author = "Aidan"
        contact = "https://github.com/ihatenodejs/aidans-patches/issues"
        website = "https://github.com/ihatenodejs/aidans-patches"
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
    named("build") {
        finalizedBy("buildAndroid")
    }

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
