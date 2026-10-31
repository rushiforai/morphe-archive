group = "com.feurstagram"

patches {
    about {
        name = "Oxbow Patches"
        description = "Calm Instagram: no feed, Reels, Explore, endless scrolling, ads or telemetry; " +
            "downloads, ghost mode and clean links. Built on FeurStagram by Jean Herail."
        source = "git@github.com:aic0d3r/oxbow.git"
        author = "aic0d3r (FeurStagram: Jean Herail)"
        contact = "https://github.com/aic0d3r/oxbow/issues"
        website = "https://github.com/aic0d3r/oxbow"
        license = "GPLv3"
    }
}

// gson is only for the patch-list generator (release.sh), never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    // Provides app.morphe.util.* helpers (DOM, bytecode, references) used by the patches.
    implementation(libs.morphe.patches.library)
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
}

tasks.register<JavaExec>("generatePatchesList") {
    description = "Writes ../patches-list.json for Morphe Manager and patch registries"
    dependsOn("build")
    classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
    mainClass.set("util.PatchListGeneratorKt")
    args(project.version.toString())
}

kotlin {
    compilerOptions {
        freeCompilerArgs.add("-Xcontext-parameters")
    }
}
