group = "app.me"

patches {
    about {
        name = "Me Patches"
        description = "Ad and nag removal patches for the Me caller-ID app"
        source = "git@github.com:ReemX/morphe-me-patches.git"
        author = "ReemX"
        contact = "na"
        website = "na"
        license = "GPLv3"
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs.add("-Xcontext-parameters")
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath: Configuration by configurations.creating

dependencies {
    // Bundled (not compileOnly): the generated util/* classes reference gson at
    // runtime, and Morphe Manager's patch classloader has no gson unless the bundle
    // ships it. Without this the bundle loads as 0 patches in Manager.
    implementation(libs.gson)
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