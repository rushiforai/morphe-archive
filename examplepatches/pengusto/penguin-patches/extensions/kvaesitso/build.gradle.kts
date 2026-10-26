plugins {
    id("org.jetbrains.kotlin.plugin.compose") version "2.4.10"
}

extension { name = "extensions/kvaesitso.mpe" }

android {
    namespace = "io.github.pengusto.patches.extension.kvaesitso"
    // Match the target APK; API 23 desugaring references absent interface bridges.
    defaultConfig { minSdk = 26 }
    sourceSets.getByName("main").kotlin.srcDir(
        "../extension/src/main/java/io/github/pengusto/patches/extension/kvaesitso"
    )
}

kotlin {
    compilerOptions {
        freeCompilerArgs.addAll("-Xno-param-assertions", "-Xno-call-assertions", "-Xno-receiver-assertions")
    }
}

composeCompiler {
    includeSourceInformation.set(false)
}

dependencies {
    // All are supplied by the pinned app, not included in the MPE.
    compileOnly(project(":stubs:kvaesitso"))
    compileOnly("androidx.compose.material3:material3:1.5.0-alpha26")
    compileOnly("androidx.compose.runtime:runtime:1.13.0-alpha01")
    compileOnly("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.11.0")
}

configurations.matching { it.name.endsWith("RuntimeClasspath") }.configureEach {
    exclude(group = "org.jetbrains.kotlin", module = "kotlin-stdlib")
}
