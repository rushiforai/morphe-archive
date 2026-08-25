group = "legendsciber"

patches {
    about {
        name = "legendsciber's Patches"
        description = "Morphe patches by legendsciber"
        source = "https://github.com/legendsciber/morphe-patches"
        author = "legendsciber"
        contact = "na"
        website = "https://github.com/legendsciber/morphe-patches"
        license = "GPLv3"
    }
}

dependencies {
    // Used by JsonGenerator.
    implementation(libs.gson)

    implementation(libs.morphe.patches.library)
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn("buildAndroid")

        classpath = sourceSets["main"].runtimeClasspath
        mainClass.set("app.morphe.util.PatchListGeneratorKt")
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs = listOf("-Xcontext-parameters")
    }
}
