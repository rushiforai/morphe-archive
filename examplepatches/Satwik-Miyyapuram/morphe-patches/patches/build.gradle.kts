group = "app.mmc"

patches {
    about {
        name = "MMC Patches"
        description = "Patches for use with Morphe: ad-free Mini Militia Classic (com.appsomniacs.mmc). For educational and research purposes."
        source = "https://github.com/xyz-user/xyz-patches"
        author = "xyz-user"
        contact = "https://github.com/xyz-user/xyz-patches/issues"
        website = "https://github.com/xyz-user/xyz-patches"
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
