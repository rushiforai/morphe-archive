// SPDX-License-Identifier: AGPL-3.0-or-later
import org.jetbrains.kotlin.gradle.dsl.abi.ExperimentalAbiValidation

plugins {
    alias(libs.plugins.ktlint)
}

group = "app.edbfi"

patches {
    about {
        name = "edbfi patches"
        description = "ReVanced patches by edbfi"
        source = "https://github.com/edbfi/apk-patches"
        author = "edbfi"
        contact = "https://github.com/edbfi/apk-patches/issues"
        website = "https://github.com/edbfi/apk-patches"
        license = "AGPL-3.0-or-later"
    }
}

// The plugin sets only the bytecode target; --release 17 also holds Java sources to Java 17's language
// and library, which is what ReVanced Manager and the CLI run on.
tasks.withType<JavaCompile>().configureEach {
    options.release = 17
}

kotlin {
    // The plugin turns ABI validation on. Nothing consumes this bundle's Kotlin API, so there is
    // no reference dump to check against.
    @OptIn(ExperimentalAbiValidation::class)
    abiValidation { enabled.set(false) }
}

ktlint {
    version = libs.versions.ktlint
}

dependencies {
    testImplementation(kotlin("test"))
}

tasks.test {
    useJUnitPlatform()
    // Load the bundle the way ReVanced Manager and the CLI do: from the built jar.
    val bundle = tasks.jar.flatMap { it.archiveFile }
    inputs.file(bundle)
    jvmArgumentProviders.add(CommandLineArgumentProvider { listOf("-Dpatches.bundle=${bundle.get().asFile}") })
    // ReadmeTest checks the README's app table, and each app's page in docs/revanced/, against the bundle. Both sit
    // at the repository root, one level above this build.
    val repository = rootProject.layout.projectDirectory.dir("..")
    val readme = repository.file("README.md")
    inputs.file(readme)
    inputs.dir(repository.dir("docs/revanced"))
    jvmArgumentProviders.add(CommandLineArgumentProvider { listOf("-Dreadme.file=${readme.asFile}") })
}
