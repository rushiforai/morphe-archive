group = "soundcloud.morphe"

patches {
    about {
        name = "SoundCloud Russian"
        description = "Combined SoundCloud patches for use with Morphe: Russian localization, Android Auto Home, privacy, ad/upsell removal, AMOLED black-and-orange theme, Sleep timer, Cast removal, and client Go+ caching."
        source = "https://github.com/2kshoka/morphe-patches"
        author = "2kshoka (longthree1 fork, combined from JohninNL, Psylos, V4n1X, Hoo-dles, kondratjev)"
        contact = "https://github.com/2kshoka/morphe-patches/issues"
        website = "https://github.com/2kshoka/morphe-patches"
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
