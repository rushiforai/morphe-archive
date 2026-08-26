import org.gradle.language.jvm.tasks.ProcessResources

group = "app.mix"

patches {
    about {
        name = "Mix Patches"
        description = "Mix Patches for Morphe"
        source = "git@gitlab.com:IMXEren/mix-patches.git"
        author = "IMXEren"
        contact = "vickrey_readings@simplelogin.com"
        website = "https://gitlab.com/IMXEren/mix-patches"
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

// The Morphe plugin adds extensionConfiguration as a resource source directory. IntelliJ's
// tooling model then resolves it outside Gradle's project lock. Keep generated extension
// artifacts as processResources inputs instead, so they are resolved only during task execution.
val extensionArtifacts = configurations.named("extensionConfiguration")
sourceSets.named("main") {
    resources.setSrcDirs(listOf("src/main/resources"))
}
tasks.named<ProcessResources>("processResources") {
    from(extensionArtifacts)
}

dependencies {
    patchListGeneratorClasspath(libs.gson)

    implementation(libs.morphe.patches.library) {
        exclude(group = "com.google.code.gson", module = "gson")
    }

    testImplementation(kotlin("test"))
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("app.morphe.util.PatchListGeneratorKt")
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}
