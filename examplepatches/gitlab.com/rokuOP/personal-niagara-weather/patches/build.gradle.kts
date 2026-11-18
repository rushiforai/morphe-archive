group = "dev.personal.niagaraweather"

patches {
    about {
        name = "Personal Niagara Weather"
        description = "Use your own OpenWeather key with Niagara Launcher 1.16.28."
        source = "https://gitlab.com/rokuOP/personal-niagara-weather"
        author = "rokuOP"
        contact = "na"
        website = "https://gitlab.com/rokuOP/personal-niagara-weather"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
    testImplementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.10.2")
    testImplementation("org.jetbrains.kotlinx:kotlinx-datetime:0.8.0")
    testImplementation(libs.gson)
}

tasks {
    register<JavaExec>("verifySourceMetadata") {
        description = "Parse the generated metadata using Morphe's date parser."
        dependsOn("generatePatchesList", "testClasses")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("dev.personal.patches.weather.MetadataCompatibilityTestKt")
        args(rootProject.file("patches-bundle.json").absolutePath)
    }
    register<JavaExec>("verifyBundle") {
        description = "Load the built MPP and apply it to the exact original Niagara APK."
        dependsOn("buildAndroid", "testClasses")
        // Deliberately exclude main output: patch classes and extension must load from the MPP.
        classpath = sourceSets["test"].output + configurations["testRuntimeClasspath"]
        mainClass.set("dev.personal.patches.weather.BundleVerificationKt")
        workingDir = rootProject.projectDir
        maxHeapSize = "3g"
        doFirst {
            val input = providers.gradleProperty("niagaraApk").orNull
                ?: error("Pass -PniagaraApk=absolute-path-to-original.apk")
            args(input, layout.buildDirectory.file("libs/patches-${project.version}.mpp").get().asFile.absolutePath,
                rootProject.layout.buildDirectory.file("verification/Niagara-morphe-unsigned.apk").get().asFile.absolutePath)
        }
    }

    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn("buildAndroid")

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
        args(layout.buildDirectory.file("libs/patches-${project.version}.mpp").get().asFile.absolutePath)
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}
