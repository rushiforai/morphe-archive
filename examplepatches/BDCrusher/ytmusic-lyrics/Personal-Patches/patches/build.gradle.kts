import org.jetbrains.kotlin.gradle.dsl.JvmTarget

group = "app.morphe"

patches {
    about {
        name = "BDCrusher YT-Music Lyrics Full"
        description = "Personal YouTube Music lyrics build based on 1.48.0-dev.19; Braccato renderer and source adapters"
        source = "local:YT-Music/Personal-Patches"
        author = "BDCrusher; upstream MorpheApp and Better Lyrics contributors"
        contact = "na"
        website = ""
        license = "GNU General Public License v3.0, with additional GPL section 7 requirements"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")
val jamApk = providers.gradleProperty("jamApk")
val jamOutput = providers.gradleProperty("jamOutput")

java {
    sourceCompatibility = JavaVersion.VERSION_17
    targetCompatibility = JavaVersion.VERSION_17
    toolchain {
        languageVersion.set(JavaLanguageVersion.of(17))
    }
}

kotlin {
    compilerOptions {
        jvmTarget.set(JvmTarget.JVM_17)
    }
}

dependencies {
    // Required due to smali, or build fails. Can be removed once smali is bumped.
    implementation(libs.guava)

    implementation(libs.morphe.patches.library)

    patchListGeneratorClasspath(libs.gson)

    // Android API stubs defined here.
    compileOnly(project(":patches:stub"))

    testImplementation(kotlin("test"))
    testImplementation(libs.kotlinx.coroutines.core)
    testRuntimeOnly(libs.junit.jupiter.engine)
}

tasks {
    named<Jar>("jar") {
        dependsOn(":lyrics-addon:prepareRuntime")
        from(project(":lyrics-addon").layout.buildDirectory.file("runtime/lyrics-addon.mpe")) {into("extensions")}
    }
    register<JavaExec>("validateBetterLyricsOnly") {
        group = "verification"
        dependsOn("testClasses", "buildAndroid")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("app.bdcrusher.lyrics.ValidateLyricsKt")
        workingDir = rootProject.projectDir
        maxHeapSize = "6g"
        doFirst {
            val input = providers.gradleProperty("lyricsApk").get()
            val output = providers.gradleProperty("lyricsVerification").get() + "-only"
            val bundle = project.tasks.getByName("jar").outputs.files.singleFile
            setArgs(listOf(input, bundle.absolutePath, output, "lyrics"))
        }
    }
    register<JavaExec>("validateBetterLyrics") {
        group = "verification"
        dependsOn("testClasses", "buildAndroid")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("app.bdcrusher.lyrics.ValidateLyricsKt")
        workingDir = rootProject.projectDir
        maxHeapSize = "6g"
        doFirst {
            val input = providers.gradleProperty("lyricsApk").get()
            val output = providers.gradleProperty("lyricsVerification").get()
            val mode = providers.gradleProperty("lyricsMode").getOrElse("lyrics")
            val bundle = project.tasks.getByName("jar").outputs.files.singleFile
            setArgs(listOf(input, bundle.absolutePath, output, mode))
        }
    }
    test {
        useJUnitPlatform()
        jamApk.orNull?.let { systemProperty("jamApk", it) }
    }

    register<JavaExec>("checkStringResources") {
        description = "Checks resource strings for invalid formatting"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath
        mainClass.set("app.morphe.patches.util.resource.CheckStringResourcesKt")
    }

    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("app.morphe.util.PatchListGeneratorKt")
    }

    register<JavaExec>("validateJam") {
        description = "Patches a supplied YouTube Music APK for Jam validation and optional device testing"
        group = "verification"

        dependsOn("testClasses")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("app.morphe.patches.music.interaction.jam.JamDeviceBuildKt")

        doFirst {
            val apk = jamApk.orNull
                ?: throw GradleException("validateJam requires -PjamApk=/absolute/path/to/ytm.apk")
            setArgs(listOfNotNull(apk, jamOutput.orNull))
        }
    }
    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}


kotlin.sourceSets.named("main") { kotlin.srcDir(rootProject.file("shared-lyrics-patches/src/main/kotlin")) }
