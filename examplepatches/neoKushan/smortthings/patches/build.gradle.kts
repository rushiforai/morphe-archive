group = "biz.kushan.ltkey"

patches {
    about {
        name = "Smortthings Patches"
        description = "Show a Samsung device's LocalThings OwnerPSK on its Edit screen (proof of concept)."
        source = "git@github.com:neoKushan/smortthings.git"
        author = "neoKushan"
        contact = "na"
        website = "https://github.com/neoKushan/smortthings"
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
