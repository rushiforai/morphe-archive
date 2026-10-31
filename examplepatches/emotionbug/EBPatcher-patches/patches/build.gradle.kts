import org.jetbrains.kotlin.gradle.dsl.JvmTarget

group = "io.github.emotionbug"

patches {
    about {
        name = "EBPatcher patches"
        description = "ACall and YouTube Music patches for Morphe"
        source = "https://github.com/emotionbug/EBPatcher-patches"
        author = "emotionbug"
        contact = "https://github.com/emotionbug/EBPatcher-patches/issues"
        website = "https://github.com/emotionbug/EBPatcher-patches"
        license = "GNU General Public License v3.0, with additional GPL section 7 requirements"
    }
}

val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

// D8 must receive jars, not both project class directories and their jars.
configurations.compileClasspath {
    attributes {
        attribute(LibraryElements.LIBRARY_ELEMENTS_ATTRIBUTE, objects.named(LibraryElements.JAR))
    }
}

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

sourceSets.test {
    java.srcDir(rootProject.file("runtime/src/main/java"))
    java.exclude(
        "**/ShellRecorder.java", "**/RecorderService.java", "**/RecorderShizukuProvider.java",
        "**/RecorderIdentity.java", "**/RecorderBootstrap.java",
        "**/ExtensionSettings.java", "**/ExtensionSettingsProvider.java", "**/ExtensionSettingsActivity.java",
        "**/ExtensionSettingsEntry.java", "**/ModelUpdateBadge.java", "**/ModelDownloadProgress.java",
        "**/Summary*.java", "**/AdotSummary*.java", "**/AdotSpeakerMapping.java", "**/AdotApiSnapshot.java", "**/AdotApiPublication.java",
        "**/CloudMonoAudio.java", "**/CloudMonoUpload.java"
    )
}

// Add only the recorder payload; do not filter the Music and extension resources.
tasks.processResources {
    dependsOn(":runtime:payload", ":summary-engine:payload")
    from(project(":runtime").layout.buildDirectory.dir("payload")) {
        into("payload")
    }
    from(project(":summary-engine").layout.buildDirectory.dir("payload")) {
        into("payload/summary")
    }
    from(project(":runtime").file("src/main/AndroidManifest.xml")) {
        into("payload")
        rename { "manifest.xml" }
    }
}

dependencies {
    implementation(libs.guava)
    implementation(libs.gson)
    implementation(libs.morphe.patches.library)
    implementation(libs.apksig)
    implementation(libs.arsclib)
    compileOnly(project(":patches:stub"))

    patchListGeneratorClasspath(libs.gson)

    testImplementation(libs.junit)
    testImplementation(kotlin("test-junit"))
    testImplementation(libs.gson)
    testImplementation(libs.kotlinx.coroutines.core)
}

tasks.withType<Jar>().configureEach {
    isPreserveFileTimestamps = false
    isReproducibleFileOrder = true
}

tasks.test {
    useJUnit()
    maxHeapSize = "2g"
    testLogging { events("passed", "skipped", "failed") }
}

val generatePatchesList = tasks.register<JavaExec>("generatePatchesList") {
    description = "Generate patch metadata from the compiled Morphe patches"
    dependsOn(tasks.build)
    // Upstream selects the first build/libs archive. Isolate the current artifact
    // and exclude loose project classes so metadata always describes that artifact.
    classpath = configurations.runtimeClasspath.get() + patchListGeneratorClasspath
    mainClass.set("app.morphe.util.PatchListGeneratorKt")
    val generatorRoot = layout.buildDirectory.dir("patch-list-generator")
    workingDir(generatorRoot.map { it.dir("work").asFile })
    doFirst {
        project.sync {
            from(tasks.jar.get().archiveFile)
            into(workingDir.resolve("build/libs"))
        }
    }
    doLast {
        generatorRoot.get().file("patches-list.json").asFile.copyTo(
            rootProject.file("patches-list.json"), overwrite = true
        )
    }
}

// The official plugin mutates the JVM archive to append DEX. Keep this last.
tasks.named("buildAndroid") {
    mustRunAfter(tasks.build, tasks.check, generatePatchesList)
}
