group = "app.template"

patches {
    // TODO: Update this section with your project details.
    about {
        name = "Shuhaib's Patches"
        description = "Efficiency justice for morphe patches"
        source = "https://github.com/ShuhaibNC/morphe-patches"
        author = "ShuhaibNC"
        contact = "t.me/shuhaibnc"
        website = "https://shuhaibnc.github.io"
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

kotlin {
    compilerOptions {freeCompilerArgs.add("-Xcontext-parameters")
    }
}
