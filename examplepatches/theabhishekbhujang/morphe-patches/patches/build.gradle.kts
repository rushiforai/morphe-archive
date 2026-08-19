group = "com.theabhishekbhujang.morphe"

patches {
    about {
        name = "Abhishek Bhujang's Patches"
        description = "Pro feature unlocks and ad removal patches for Rhythm Free"
        source = "https://github.com/theabhishekbhujang/morphe-patches"
        author = "Abhishek Bhujang"
        contact = "https://github.com/theabhishekbhujang"
        website = "https://github.com/theabhishekbhujang/morphe-patches"
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
