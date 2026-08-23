group = "com.rhubarbshoelaces"
version = project.findProperty("version")?.toString() ?: "1.0.0"
patches {
    about {
        name = "Rhubarb Shoelaces Patches"
        description = "Fixes for Boost Random Subreddit and theScore ad removal"
        source = "https://github.com/rhubarbshoelaces/morphe-patches"
        author = "rhubarbshoelaces"
        contact = "na"
        website = "https://github.com/rhubarbshoelaces/morphe-patches"
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