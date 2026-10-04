group = "app.aidan"

patches {
    about {
        name = "Aidan's Patches"
        description = "Morphe patches for supported Android applications"
        source = "git@github.com:ihatenodejs/aidans-patches.git"
        author = "Aidan"
        contact = "https://github.com/ihatenodejs/aidans-patches/issues"
        website = "https://github.com/ihatenodejs/aidans-patches"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
}
val emojiFontDir = layout.buildDirectory.dir("generated/resources/emojiFont")
val outputFontFile = emojiFontDir.map { it.file("fonts/AppleColorEmoji.ttf") }

val prepareEmojiFont = tasks.register<Exec>("prepareEmojiFont") {
    description = "Downloads and transforms Apple Color Emoji font for Fizz"
    outputs.file(outputFontFile)

    val fontCacheDir = File(gradle.gradleUserHomeDir, "caches/aidans-patches/fonts")
    val scriptFile = rootProject.file(".github/scripts/prepare_emoji_font.py")

    inputs.file(scriptFile)
    inputs.property("scriptVersion", "1.0.1")

    workingDir = rootDir
    doFirst {
        fontCacheDir.mkdirs()
        outputFontFile.get().asFile.parentFile.mkdirs()
    }

    commandLine(
        "python3",
        scriptFile.absolutePath,
        "--output",
        outputFontFile.get().asFile.absolutePath,
        "--cache-dir",
        fontCacheDir.absolutePath,
    )
}

sourceSets["main"].resources.srcDir(emojiFontDir)

tasks {
    named("processResources") {
        dependsOn(prepareEmojiFont)
    }

    named("build") {
        finalizedBy("buildAndroid")
    }

    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn("buildAndroid")

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}
