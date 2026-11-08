group = "app.shiki.boost"

val shikifyRepository = providers.gradleProperty("shikifyRepository").orNull
    ?: providers.environmentVariable("GITHUB_REPOSITORY").orNull
shikifyRepository?.let { require(it.matches(Regex("[A-Za-z0-9_.-]+/[A-Za-z0-9_.-]+"))) { "Use owner/repository for shikifyRepository" } }

patches {
    about {
        name = "Shikify"
        description = "Material 3 and Material You patches for Android apps"
        source = shikifyRepository?.let { "https://github.com/$it" } ?: "local:shikify"
        author = "Shiki"
        contact = shikifyRepository?.let { "https://github.com/$it/issues" } ?: "na"
        website = shikifyRepository?.let { "https://github.com/$it" } ?: "na"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Generate patch metadata from the current compiled bundle"
        systemProperty("patchBundlePath", layout.buildDirectory.file("libs/patches-${project.version}.mpp").get().asFile.absolutePath)

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}

// Keep the upstream examples on disk, but never include them in this bundle.
kotlin.sourceSets.named("main") { kotlin.exclude("app/template/**") }

// Validation harness is compiled separately and never packaged in the patch bundle.
val validation by sourceSets.creating
configurations[validation.implementationConfigurationName].extendsFrom(configurations["implementation"])
tasks.register<JavaExec>("validateBundle") {
    dependsOn("buildAndroid", validation.classesTaskName)
    classpath = validation.runtimeClasspath
    mainClass.set("ValidateBundleKt")
    maxHeapSize = "2g"
    args(
        layout.buildDirectory.file("libs/patches-${project.version}.mpp").get().asFile.absolutePath,
        providers.gradleProperty("boostApk").getOrElse(rootProject.file("inputs/boost-for-reddit-1.14.3.apk").absolutePath),
        rootProject.file("output/boost-1.14.3-chrome-unsigned.apk").absolutePath,
    )
}
dependencies {
    // Same coroutine version as official Morphe Patcher 2.1.0; only the validator uses it directly.
    add(validation.implementationConfigurationName, "org.jetbrains.kotlinx:kotlinx-coroutines-core:1.10.2")
    // Actual ARSCLib revision used by pinned official Patcher 2.1.0. Validation only:
    // inspect the recompiled binary manifest; never package this library into our runtime.
    add(validation.implementationConfigurationName, "com.github.MorpheApp:ARSCLib:4695b583ef")
}

tasks.register<JavaExec>("validateMixed") {
    dependsOn("buildAndroid", validation.classesTaskName)
    classpath = validation.runtimeClasspath
    mainClass.set("ValidateMixedKt")
    maxHeapSize = "2g"
    args(
        layout.buildDirectory.file("libs/patches-${project.version}.mpp").get().asFile.absolutePath,
        providers.gradleProperty("mixedInput").getOrElse(rootProject.file("inputs/mixed.apk").absolutePath),
        providers.gradleProperty("mixedOutput").getOrElse(rootProject.file("output/mixed-patched.apk").absolutePath),
    )
}

tasks.register<JavaExec>("validateWrapper") {
    dependsOn("buildAndroid", validation.classesTaskName)
    classpath = validation.runtimeClasspath
    mainClass.set("ValidateWrapperKt")
    maxHeapSize = "2g"
    systemProperty("regressionMode", providers.gradleProperty("regressionMode").getOrElse("STRIP_FAST"))
    args(
        providers.gradleProperty("validationBundle").getOrElse(layout.buildDirectory.file("libs/patches-${project.version}.mpp").get().asFile.absolutePath),
        providers.gradleProperty("boostApk").getOrElse(rootProject.file("inputs/boost-for-reddit-1.14.3.apk").absolutePath),
        providers.gradleProperty("regressionOutput").getOrElse(rootProject.file(".work/regression/live-wrapper-fixed.apk").absolutePath),
    )
}

tasks.register<JavaExec>("validatePostWrapper") {
    dependsOn("buildAndroid", validation.classesTaskName)
    classpath = validation.runtimeClasspath
    mainClass.set("ValidatePostWrapperKt")
    maxHeapSize = "2g"
    systemProperty("regressionMode", providers.gradleProperty("regressionMode").getOrElse("STRIP_FAST"))
    args(
        providers.gradleProperty("validationBundle").getOrElse(layout.buildDirectory.file("libs/patches-${project.version}.mpp").get().asFile.absolutePath),
        providers.gradleProperty("boostApk").getOrElse(rootProject.file("inputs/boost-for-reddit-1.14.3.apk").absolutePath),
        providers.gradleProperty("regressionOutput").getOrElse(rootProject.file(".work/regression/live-post-wrapper-fixed.apk").absolutePath),
    )
}

// Run on demand: needs Patcheddit's bundle, which is not part of this project's build.
tasks.register<JavaExec>("validateCombined") {
    dependsOn("buildAndroid", validation.classesTaskName)
    classpath = validation.runtimeClasspath
    mainClass.set("ValidateCombinedKt")
    maxHeapSize = "3g"
    args(
        layout.buildDirectory.file("libs/patches-${project.version}.mpp").get().asFile.absolutePath,
        providers.gradleProperty("patcheddit").getOrElse(rootProject.file("inputs/patcheddit-2.1.0-dev.4.mpp").absolutePath),
        providers.gradleProperty("boostApk").getOrElse(rootProject.file("inputs/boost-for-reddit-1.14.3.apk").absolutePath),
        rootProject.file(".work/combined").absolutePath,
    )
}

// Run on demand: applies each patch alone and each left out, which takes several minutes.
tasks.register<JavaExec>("validateSubsets") {
    dependsOn("buildAndroid", validation.classesTaskName)
    classpath = validation.runtimeClasspath
    mainClass.set("ValidateSubsetsKt")
    maxHeapSize = "3g"
    args(
        layout.buildDirectory.file("libs/patches-${project.version}.mpp").get().asFile.absolutePath,
        providers.gradleProperty("boostApk").getOrElse(rootProject.file("inputs/boost-for-reddit-1.14.3.apk").absolutePath),
        rootProject.file(".work/subsets").absolutePath,
    )
}
