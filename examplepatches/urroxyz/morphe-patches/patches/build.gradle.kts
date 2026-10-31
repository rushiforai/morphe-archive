group = "xyz.urro.patches"

patches {
    about {
        name = "Urro"
        description = "Amazon dark mode, Transit GO enhancements, configurable Niagara weather, universal activity recognition overrides and Gboard clipboard/translation tools."
        source = "https://github.com/urroxyz/morphe-patches"
        author = "urroxyz"
        contact = "https://github.com/urroxyz"
        website = "https://morphe.software/add-source?github=urroxyz/morphe-patches"
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
val patchListGeneratorClasspath: Configuration by configurations.creating

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
        args(layout.buildDirectory.file("libs/patches-${project.version}.mpp").get().asFile.absolutePath, project.version.toString())
    }

    // Keep the standard publication task coupled to the generated catalog.
    publish {
        dependsOn("generatePatchesList")
    }
}

// Optional private-fixture validation; never packages input APKs or output evidence.
dependencies {
    compileOnly("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.10.2")
    runtimeOnly("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.10.2")
    runtimeOnly("app.morphe:morphe-patcher:2.0.0")
}

tasks.register<JavaExec>("validateComfortFix") {
    dependsOn("build")
    classpath = sourceSets["main"].runtimeClasspath
    mainClass.set("app.morphe.util.ValidateComfortFixesKt")
    args(
        layout.buildDirectory.file("libs/patches-${project.version}.mpp").get().asFile.absolutePath,
        providers.gradleProperty("fixtureApk").getOrElse("missing.apk"),
        providers.gradleProperty("validationOut").getOrElse("build/private-validation"),
        providers.gradleProperty("fixName").getOrElse("missing fix"),
    )
}

tasks.register<JavaExec>("validateTransit") {
 dependsOn("build")
 classpath = sourceSets["main"].runtimeClasspath
 mainClass.set("util.ValidateTransitKt")
 args(providers.gradleProperty("transitApk").getOrElse("missing.apk"), providers.gradleProperty("validationOut").getOrElse("build/private-validation"))
}

tasks.register<JavaExec>("validateGboard") {
    dependsOn("build")
    classpath = sourceSets["main"].runtimeClasspath
    mainClass.set("util.ValidateGboardKt")
    args(
        layout.buildDirectory.file("libs/patches-${project.version}.mpp").get().asFile.absolutePath,
        providers.gradleProperty("gboardApk").getOrElse("missing.apk"),
        providers.gradleProperty("validationOut").getOrElse("build/private-validation"),
    )
    providers.gradleProperty("communityBundle").orNull?.let { args(it) }
}

// Deliberately changed R8 names exercise the resolver independently of release numbers.
tasks.register<JavaExec>("renameGboardFixture") {
    dependsOn("classes")
    classpath = sourceSets["main"].runtimeClasspath
    mainClass.set("util.RenameGboardFixtureKt")
    args(providers.gradleProperty("renameInput").orElse(providers.gradleProperty("gboardApk")).getOrElse("missing.apk"), providers.gradleProperty("renamedFixture").getOrElse("missing-output.apk"))
}
