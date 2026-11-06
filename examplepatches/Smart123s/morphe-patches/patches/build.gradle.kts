group = "app.smart123s"

patches {
    about {
        name = "Smart123s' patches"
        description = "Patches for apps I like"
        source = "https://github.com/Smart123s/morphe-patches"
        author = "Smart123s"
        contact = "https://github.com/Smart123s/morphe-patches/issues"
        website = "https://github.com/Smart123s/morphe-patches"
        license = "GPLv3"
    }
}

dependencies {
    // Used by the menu resource patch and patch-list generator. This belongs
    // in the patch host's bundle, not the separate Android extension DEX.
    implementation(libs.gson)
    testImplementation(kotlin("test-junit"))
}

apply(from = rootProject.file("extensions/ricardo/native.gradle.kts"))

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}
