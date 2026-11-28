group = "app.v4inwald"

patches {
    about {
        name = "Wispr Flow patches"
        description = "Patches for the Wispr Flow Android app: an unlimited dictation quota, and the install-source answer its Play licensing check needs."
        source = "git@github.com:V4inwald/wispr-flow-patches.git"
        author = "V4inwald"
        contact = "na"
        website = "https://github.com/V4inwald/wispr-flow-patches"
        license = "GNU General Public License v3.0"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the .mpp.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)

    implementation(libs.morphe.patches.library)
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Build a patches list for third-party tools"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}
