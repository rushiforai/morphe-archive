group = "com.thegibbonn.patches"

patches {
    about {
        name = "Anilili Patches"
        description = "Patches for Anilili to fix recycled bitmap crashes on Android 14/15+"
        source = "git@github.com:thegibbonn/morphe-patches-anilili.git"
        author = "thegibbonn"
        contact = "https://github.com/thegibbonn"
        website = "https://github.com/thegibbonn/morphe-patches-anilili"
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
