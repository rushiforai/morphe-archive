group = "io.github.electroheavenvn"

patches {
    // TODO: Update this section with your project details.
    about {
        name = "EHVN Patches"
        description = "Morphe patches for Android apps."
        source = "git@github.com:ElectroHeavenVN/morphe-patches.git"
        author = "ElectroHeavenVN"
        contact = "https://t.me/electroheavenvn"
        website = "https://discord.gg/electroheavenvn-va-nhung-nguoi-ban-1115634791321190420"
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
