import org.jetbrains.kotlin.gradle.dsl.JvmTarget

group = "io.github.kljjh"
patches {
    about {
        name = "Flyme Lyrics Add-on"
        description = "One independent patch to use alongside official Morphe Third-party lyrics"
        source = "https://github.com/kljjh/flyme-lyrics-patches"
        author = "kljjh"
        contact = "https://github.com/kljjh/flyme-lyrics-patches/issues"
        website = "https://github.com/kljjh/flyme-lyrics-patches"
        license = "GPL-3.0-only; see LICENSE and NOTICE"
    }
}
java {
    sourceCompatibility = JavaVersion.VERSION_17
    targetCompatibility = JavaVersion.VERSION_17
    toolchain.languageVersion.set(JavaLanguageVersion.of(17))
}
kotlin { compilerOptions { jvmTarget.set(JvmTarget.JVM_17) } }
configurations.compileClasspath {
    attributes {
        attribute(LibraryElements.LIBRARY_ELEMENTS_ATTRIBUTE, objects.named(LibraryElements.JAR))
    }
}
dependencies {
    testImplementation(kotlin("test-junit"))
    testImplementation("junit:junit:4.13.2")
}
tasks.test {
    // Preserve the rewritten DEX when Gradle restores successful tests from cache.
    outputs.file(layout.buildDirectory.file("test-results/official-lockscreen-patched.dex"))
    testLogging { exceptionFormat = org.gradle.api.tasks.testing.logging.TestExceptionFormat.FULL }
    systemProperty("officialBundle", rootProject.file("work/official/patches-2.1.0.mpp").absolutePath)
}
tasks.processResources {
    from(rootProject.files("LICENSE", "NOTICE", "UPSTREAM.md")) { into("community") }
}
