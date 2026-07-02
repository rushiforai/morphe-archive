group = "io.github.lynx6319"

patches {
    about {
        name = "patch-youtube-scroll-block"
        description = "Patches to block scrolling in YouTube Shorts"
        source = "https://github.com/Lynx6319/patch-youtube-scroll-block"
        author = "Lynx6319"
        contact = "https://github.com/Lynx6319"
        website = "https://github.com/Lynx6319/patch-youtube-scroll-block"
        license = "GPLv3"
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs.add("-Xcontext-parameters")
    }
}

dependencies {
    // Used by JsonGenerator.
    implementation(libs.gson)
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath
        mainClass.set("app.morphe.util.PatchListGeneratorKt")
    }
    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}
