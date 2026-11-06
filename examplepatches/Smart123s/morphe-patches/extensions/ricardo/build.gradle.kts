// The settings plugin applies Morphe's Android extension plugin to this project.
android {
    namespace = "ricardonemlopot.nemlopot.patches"
    defaultConfig {
        minSdk = 15
    }
}

// AGP enables Kotlin support by default. This extension is pure Java, so the
// automatically added Kotlin runtime would only bloat the patched game.
configurations.configureEach {
    exclude(group = "org.jetbrains.kotlin", module = "kotlin-stdlib")
}

// Only API signatures from the original APK. Never package these classes: the
// game supplies them, including its old void-returning Preferences.putInteger.
val compileGameStubs = tasks.register<JavaCompile>("compileGameStubs") {
    source("stubs")
    classpath = files()
    destinationDirectory.set(layout.buildDirectory.dir("gameStubs"))
    options.release.set(8)
}
val gameStubsJar = tasks.register<Jar>("gameStubsJar") {
    from(compileGameStubs.flatMap { it.destinationDirectory })
    archiveFileName.set("game-stubs.jar")
    destinationDirectory.set(layout.buildDirectory.dir("stubs"))
}
val gameStubs = files(gameStubsJar.flatMap { it.archiveFile })

dependencies {
    compileOnly(gameStubs)
    testImplementation(gameStubs)
    testImplementation("junit:junit:4.13.2")
}
