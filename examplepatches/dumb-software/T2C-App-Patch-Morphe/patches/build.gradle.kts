group = "com.github.dumb_software"

patches {
    about {
        name = "T2C App Patches"
        description = "Patches for T2C App"
        source = "git@github.com:dumb-software/T2C-API-Documentation.git"
        author = "dumb-software"
        contact = "https://github.com/dumb-software/T2C-API-Documentation/issues"
        website = "https://dumb-software.github.io/T2C-API-Documentation/"
        license = "MIT License"
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
        mainClass.set("com.dumbsoftware.t2c.util.PatchListGeneratorKt")
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
