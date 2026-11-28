// Verification runs can isolate candidates. Normal builds use standard module paths.
providers.gradleProperty("verification.buildRoot").orNull?.let { verificationBuildRoot ->
    allprojects {
        // R8 looks for its default rules inside the extension's standard build directory.
        if (path != ":extensions:extension") {
            val projectDirectory = if (path == ":") "root" else path.trimStart(':').replace(':', '/')
            layout.buildDirectory.set(rootProject.layout.projectDirectory.dir("$verificationBuildRoot/$projectDirectory"))
        }
    }
}

// Enforce the integration boundary on the actual Android delivery entrance.
val verifyIntegrationSources = tasks.register<Exec>("verifyIntegrationSources") {
    workingDir(rootProject.projectDir)
    val python = providers.environmentVariable("MORPHE_TASK_PYTHON").orElse("python")
    val report = layout.buildDirectory.file("reports/integration-sources.json")
    commandLine(python.get(), "-X", "utf8", "tools/verify_integration.py", "--source-only", "--output", report.get().asFile.absolutePath)
}
allprojects {
    tasks.configureEach {
        if (name == "assembleRelease" || project.path == ":patches" && name in setOf("build", "buildAndroid")) {
            dependsOn(verifyIntegrationSources)
        }
    }
}
