group = "com.anime.witcher.patches"

patches {

    about {
        name = "Anime Witcher Patches"
        description = "Patches for Anime Witcher: Remove ads, disable VPN detection, play with an external player"
        source = "git@github.com:user/anime-witcher-patches.git"
        author = "User"
        contact = "na"
        website = "na"
        license = "GPLv3"
    }

}

kotlin {

    compilerOptions {
        freeCompilerArgs.add("-Xcontext-parameters")
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
