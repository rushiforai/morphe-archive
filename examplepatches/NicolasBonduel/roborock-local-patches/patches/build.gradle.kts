group = "local.roborock"
version = rootProject.version

patches {
    about {
        name = "Roborock Local Server patches"
        description = "Local server login and saved-URL patches for Roborock 4.76.08 (build 100944, arm64-v8a)"
        source = "https://github.com/NicolasBonduel/roborock-local-patches"
        author = "Nicolas Bonduel"
        contact = "https://github.com/NicolasBonduel/roborock-local-patches/issues"
        website = "https://github.com/NicolasBonduel/roborock-local-patches"
        license = "0BSD"
    }
}

val compileLoginUi = tasks.register<Exec>("compileLoginUi") {
    workingDir(rootProject.projectDir)
    commandLine("npm", "run", "build:js")
    inputs.files(
        rootProject.file("package-lock.json"),
        rootProject.file("package.json"),
        rootProject.file("scripts/build-login-ui.cjs"),
        file("src/main/resources/local-server.js"),
        file("src/main/resources/artwork/local-server-arrow.png"),
    )
    outputs.file(layout.buildDirectory.file("generated-resources/local-server.runtime.js"))
}

tasks.processResources {
    dependsOn(compileLoginUi)
    exclude("local-server.js", "artwork/**")
    from(layout.buildDirectory.dir("generated-resources"))
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the patch bundle.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Build patch bundle and generate patches-list.json"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}
