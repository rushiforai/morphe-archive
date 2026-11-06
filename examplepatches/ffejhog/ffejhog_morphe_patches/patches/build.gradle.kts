group = "app.ffejhog"

patches {
    // TODO: Update this section with your project details.
    about {
        name = "ffejhog Morphe Patches"
        description = "Personal patches for apps I use"
        source = "git@github.com:ffejhog/ffejhog_morphe_patches.git"
        author = "ffejhog"
        contact = "https://github.com/ffejhog"
        website = "https://github.com/ffejhog/ffejhog_morphe_patches"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)

    testImplementation(libs.junit.jupiter)
    testImplementation(kotlin("test-junit5"))
}

tasks.withType<Test>().configureEach {
    useJUnitPlatform()
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
