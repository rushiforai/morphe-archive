group = "pixkk"

patches {
    about {
        name = "pixkk patches"
        description = "TikTok 47.5.3 patches: expand descriptions in place, sound names, " +
            "right column spacing, comment menu, old-style seeking and counts, animated profile " +
            "covers, Discover tab."
        source = "https://github.com/pixkk/pixkk-patches"
        author = "pixkk"
        contact = "https://github.com/pixkk/pixkk-patches/issues"
        website = "https://github.com/pixkk/pixkk-patches"
        license = "GNU General Public License v3.0"
    }
}

dependencies {
    compileOnly(libs.morphe.patcher)

    // Used by JsonGenerator.
    implementation(libs.gson)

    // Required due to smali, or build fails. Can be removed once smali is bumped.
    implementation(libs.guava)

    // Android API stubs defined here.
    compileOnly(project(":patches:stub"))
}

// Writes ../patches-list.json, the list of patches Morphe Manager shows for a source added by URL.
tasks.register<JavaExec>("generatePatchesList") {
    description = "Build patch with patch list"
    dependsOn("buildAndroid")

    classpath = sourceSets["main"].runtimeClasspath
    mainClass.set("app.morphe.util.PatchListGeneratorKt")
    args(project.version.toString())
}
