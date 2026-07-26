group = "app.morphe.thirdparty.yavot"

patches {
    about {
        name = "Morphe Yandex VoT"
        description = "Yandex voice-over translation add-on for Morphe Patches"
        source = "git@github.com:MarcaDian/morphe-patches-yavot.git"
        author = "MarcaDian"
        contact = "na"
        website = "https://github.com/MarcaDian/morphe-patches-yavot"
        license = "GNU General Public License v3.0, with additional GPL section 7 requirements"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.register("patchListGeneratorClasspath")

// Compile against base morphe-patches' Kotlin classes; loaded at runtime via Add-On-Bundle.
val baseKotlinClasses = files(rootProject.file("../morphe-patches/patches/build/classes/kotlin/main"))

dependencies {
    // Required due to smali, or build fails. Can be removed once smali is bumped.
    implementation(libs.guava)

    implementation(libs.morphe.patches.library)

    compileOnly(baseKotlinClasses)

    patchListGeneratorClasspath(libs.gson)

    // Android API stubs defined here.
    compileOnly(project(":patches:stub"))
}

// Friend-access to base for internal declarations (playerOverlayButtonsHookPatch, onCreateHook, Constants).
tasks.withType<org.jetbrains.kotlin.gradle.tasks.KotlinCompile>().configureEach {
    compilerOptions.freeCompilerArgs.add(
        baseKotlinClasses.singleFile.absolutePath.let { "-Xfriend-paths=$it" }
    )
}

tasks.named<Jar>("jar") {
    manifest {
        attributes["Add-On-Bundle"] = "Morphe Patches"
    }
}

tasks {
    register<JavaExec>("checkStringResources") {
        description = "Checks resource strings for invalid formatting"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath
        mainClass.set("app.morphe.patches.util.resource.CheckStringResourcesKt")
    }

    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build)

        // base classes on runtime for reflection-based enumeration
        classpath = sourceSets["main"].runtimeClasspath +
                baseKotlinClasses +
                patchListGeneratorClasspath.get()
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
