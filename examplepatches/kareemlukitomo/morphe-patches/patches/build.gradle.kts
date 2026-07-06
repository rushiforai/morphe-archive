group = "app.morphe"

patches {
    about {
        name = "Kareem Patches"
        description = "Targeted patches for use with Morphe, currently focused on app share links."
        source = "git@github.com:kareemlukitomo/morphe-patches.git"
        author = "kareemlukitomo"
        contact = "https://github.com/kareemlukitomo/morphe-patches/issues"
        website = "https://github.com/kareemlukitomo/morphe-patches"
        license = "GNU General Public License v3.0"
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
        mainClass.set("app.kareem.util.PatchListGeneratorKt")
    }
    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs = listOf("-Xcontext-receivers")
    }
}
