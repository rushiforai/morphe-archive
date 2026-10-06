import java.util.Properties
import java.util.zip.ZipFile

group = "app.yydarlinker"

patches {
    about {
        name = "Anchored AI Captions"
        description = "Real-time multilingual YouTube captions through a user-provided OpenAI-compatible API"
        source = "https://github.com/YYDarlinker/morphe-ai-caption-translator"
        author = "YYDarlinker"
        contact = "https://github.com/YYDarlinker/morphe-ai-caption-translator/issues"
        website = "https://github.com/YYDarlinker/morphe-ai-caption-translator"
        license = "GPLv3"
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs.add("-Xcontext-parameters")
    }
}

// Separate configuration so gson is available at runtime for the patch-list generator but is
// never bundled into the patched YouTube APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

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
    }

    publish {
        dependsOn("generatePatchesList")
    }
}

// Explicit, opt-in separate-bundle integration; never part of publication assets.
// An official distribution JAR can supply the same Patcher when GitHub Packages is unavailable.
val compositionPatcherJar = providers.gradleProperty("composition.patcherJar")
val localCompositionPatcherJar = compositionPatcherJar.orNull?.let { file(it) }
    ?: rootProject.file(".verification/toolchain/morphe-patcher-1.14.1-all.jar").takeIf { it.isFile }
localCompositionPatcherJar?.let { jar ->
    val version = ZipFile(jar).use { zip ->
        Properties().apply {
            zip.getInputStream(zip.getEntry("app/morphe/patcher/version.properties")).use { load(it) }
        }.getProperty("version")
    }
    require(version == "1.14.1") { "Composition requires Patcher 1.14.1, got $version" }
}
dependencies {
    if (localCompositionPatcherJar != null) {
        testImplementation(files(localCompositionPatcherJar))
    } else {
        testImplementation("app.morphe:morphe-patcher:1.14.1") { version { strictly("1.14.1") } }
    }
    testImplementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.10.2")
    testImplementation("com.android.tools.build:apkzlib:9.1.1")
    testImplementation("com.google.guava:guava:33.5.0-jre")
}
tasks.named<org.gradle.api.tasks.testing.Test>("test") { failOnNoDiscoveredTests.set(false) }
tasks.register<JavaExec>("verifyComposition") {
    dependsOn(tasks.named("testClasses"))
    classpath=sourceSets["test"].runtimeClasspath-sourceSets["main"].output
    mainClass.set("validation.CompositionHarnessKt")
    maxHeapSize="6G"
    listOf("input","official","addon","output","selection","compile","fault","compile-failed","dex-only").forEach { key ->
        providers.gradleProperty("composition.$key").orNull?.let { args("--$key",it) }
    }
}
tasks.register<JavaExec>("auditComposition") {
    dependsOn(tasks.named("testClasses"))
    classpath=sourceSets["test"].runtimeClasspath-sourceSets["main"].output
    mainClass.set("validation.CompositionDexAuditKt")
    maxHeapSize="4G"
    providers.gradleProperty("composition.apk").orNull?.let { args(it) }
}
