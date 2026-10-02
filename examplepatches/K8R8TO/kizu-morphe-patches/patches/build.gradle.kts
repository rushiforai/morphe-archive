group = "app.morphe"

patches {
    about {
        name = "Kizu Twitch Patches"
        description = "Twitch Android patches for Kizu enhancements."
        source = "https://github.com/K8R8TO/kizu-morphe-patches.git"
        author = "Kizu"
        contact = "https://github.com/K8R8TO"
        website = "https://github.com/K8R8TO/kizu-morphe-patches"
        license = "GPLv3"
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs.add("-Xcontext-parameters")
    }
}

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
        mainClass.set("app.morphe.util.PatchListGeneratorKt")
    }
    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}
