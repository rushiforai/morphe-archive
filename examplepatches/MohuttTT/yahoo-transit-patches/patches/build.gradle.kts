group = "local.transit"

patches {
    about {
        name = "Transit UI Patches"
        description = "English UI and ad removal for Yahoo! Transit 8.5.5."
        source = "https://github.com/MohuttTT/yahoo-transit-patches"
        author = "MohuttTT"
        contact = "https://github.com/MohuttTT/yahoo-transit-patches/issues"
        website = "https://github.com/MohuttTT/yahoo-transit-patches"
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
