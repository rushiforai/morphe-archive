val runNumber = System.getenv("GITHUB_RUN_NUMBER") ?: "local"
version = "1.0.$runNumber"
group = "app.pausefix"

patches {
    about {
        name = "YouTube Pause Fix Patches for use with Morphe"
        description = "Fixes YouTube auto-pause bug when logged in"
        source = "git@github.com:user/morphe-pause-fix.git"
        author = "morphe-pause-fix"
        contact = "na"
        website = "https://morphe.software"
        license = "GPLv3"
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs.add("-Xcontext-parameters")
    }
}

dependencies {
    // Removed extension dependency

    implementation(libs.gson)
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath
        mainClass.set("app.pausefix.util.PatchListGeneratorKt")
    }
    publish {
        dependsOn("generatePatchesList")
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs = listOf("-Xcontext-receivers")
    }
}
