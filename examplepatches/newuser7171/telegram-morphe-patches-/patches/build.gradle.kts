group = "app.cingxcong.telegram123"

patches {
    // TODO: Update this section with your project details.
    about {
        name = "Telegram 12.10.3 Monster Patches"
        description = "Feature-rich Telegram 12.10.3 Morphe patch bundle"
        source = "https://github.com/cingxcong/telegram-morphe-patches-"
        author = "cingxcong"
        contact = "GitHub"
        website = "https://github.com/cingxcong/telegram-morphe-patches-"
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
