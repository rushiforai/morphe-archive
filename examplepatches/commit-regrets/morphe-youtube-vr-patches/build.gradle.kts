// Formatting and static analysis for both source trees. Spotless is ratcheted to origin/main so
// adopting it never mass-reformats the tree: only files a branch actually touches are enforced.
// detekt runs with defaults plus a baseline of pre-existing findings, so new code is checked and
// old code is not churned. Both fail buildAndroid, the task the CI gate runs.
plugins {
    id("com.diffplug.spotless") version "8.10.4"
    id("io.gitlab.arturbosch.detekt") version "1.23.8"
}

spotless {
    ratchetFrom("origin/main")
    kotlin {
        target("patches/src/main/kotlin/**/*.kt", "patches/src/test/kotlin/**/*.kt")
        ktlint()
    }
    java {
        target(fileTree("extensions/src") { include("**/*.java") })
        // AOSP style is the 4-space variant, the style the extension already uses.
        googleJavaFormat("1.25.2").aosp()
    }
    format("misc") {
        target(".editorconfig")
        trimTrailingWhitespace()
        endWithNewline()
    }
}

detekt {
    buildUponDefaultConfig = true
    baseline = file("config/detekt/baseline.xml")
    source.setFrom(fileTree("patches/src/main/kotlin") { include("**/*.kt") })
}

project(":patches") {
    tasks.named("buildAndroid") {
        dependsOn(rootProject.tasks.named("spotlessCheck"), rootProject.tasks.named("detekt"))
        // The CI gate and the local loop both run buildAndroid, so the JUnit suite rides on it
        // rather than needing its own invocation to be remembered.
        dependsOn(":patches:test")
    }
}
