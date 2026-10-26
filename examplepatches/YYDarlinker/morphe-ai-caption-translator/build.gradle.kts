// Verification runs can isolate current candidates without overwriting historical packages.
val verificationBuildRoot = providers.gradleProperty("verification.buildRoot").getOrElse("build/n39/gradle")
allprojects {
    // The extension keeps the default build directory: R8 looks up its default rules file there.
    if (path != ":extensions:extension") {
        layout.buildDirectory.set(rootProject.layout.projectDirectory.dir(verificationBuildRoot + "/" + if (path == ":") "root" else path.trimStart(':').replace(':', '/')))
    }
}

// Enforce the integration boundary on the actual Android delivery entrance.
val verifyIntegrationSources = tasks.register<Exec>("verifyIntegrationSources") {
    workingDir(rootProject.projectDir)
    val python = providers.environmentVariable("MORPHE_TASK_PYTHON").orElse("python")
    commandLine(python.get(), "-X", "utf8", "tools/verify_integration.py", "--source-only")
}
allprojects {
    tasks.configureEach {
        if (name == "assembleRelease" || project.path == ":patches" && name in setOf("build", "buildAndroid")) {
            dependsOn(verifyIntegrationSources)
        }
    }
}
