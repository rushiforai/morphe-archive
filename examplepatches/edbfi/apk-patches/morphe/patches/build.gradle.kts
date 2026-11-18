// SPDX-License-Identifier: AGPL-3.0-or-later
import org.jetbrains.kotlin.gradle.dsl.JvmTarget

plugins {
    alias(libs.plugins.ktlint)
}

group = "app.edbfi"

patches {
    about {
        name = "edbfi patches"
        description = "Patches by edbfi for use with Morphe"
        source = "https://github.com/edbfi/apk-patches"
        author = "edbfi"
        contact = "https://github.com/edbfi/apk-patches/issues"
        website = "https://github.com/edbfi/apk-patches"
        license = "AGPL-3.0-or-later"
    }
}

// --release 17 holds Java sources to Java 17's language and library, which is what Morphe Manager runs patches on.
// Kotlin targets the same, as the Kotlin plugin requires; the Morphe plugin's default for both is 11.
tasks.withType<JavaCompile>().configureEach {
    options.release = 17
}

kotlin {
    compilerOptions { jvmTarget = JvmTarget.JVM_17 }
}

ktlint {
    version = libs.versions.ktlint
}

dependencies {
    testImplementation(kotlin("test"))
}

tasks.test {
    useJUnitPlatform()
    // Load the bundle the way Morphe Manager and the CLI do: from the built file.
    val bundle = tasks.jar.flatMap { it.archiveFile }
    inputs.file(bundle)
    jvmArgumentProviders.add(CommandLineArgumentProvider { listOf("-Dpatches.bundle=${bundle.get().asFile}") })
    // ReadmeTest checks the README's app table, and each app's page in docs/morphe/, against the bundle.
    val repository = rootProject.layout.projectDirectory.dir("..")
    val readme = repository.file("README.md")
    inputs.file(readme)
    inputs.dir(repository.dir("docs/morphe"))
    jvmArgumentProviders.add(CommandLineArgumentProvider { listOf("-Dreadme.file=${readme.asFile}") })
}
