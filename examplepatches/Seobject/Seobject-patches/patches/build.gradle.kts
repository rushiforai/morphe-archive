import java.io.File


group = "app.morphe"

val pinPlaylistClasses = project(":extensions:music").layout.buildDirectory.dir(
    "intermediates/javac/release/compileReleaseJavaWithJavac/classes",
)
val pinPlaylistJarDirectory = layout.buildDirectory.dir("tmp/pinplaylist")
val pinPlaylistJar = pinPlaylistJarDirectory.map { it.file("pinplaylist.jar") }
val pinPlaylistDexDirectory = layout.buildDirectory.dir("tmp/pinplaylist/dex")
val pinPlaylistResources = layout.buildDirectory.dir(
    "generated/pinplaylist-extension",
)

val buildPinPlaylistJar = tasks.register<Jar>("buildPinPlaylistJar") {
    dependsOn(":extensions:music:compileReleaseJavaWithJavac")
    archiveFileName.set("pinplaylist.jar")
    destinationDirectory.set(pinPlaylistJarDirectory)
    from(pinPlaylistClasses) {
        include("app/morphe/extension/music/patches/pinplaylist/**")
    }
}

val buildPinPlaylistExtension = tasks.register<Exec>("buildPinPlaylistExtension") {
    dependsOn(buildPinPlaylistJar)
    inputs.file(pinPlaylistJar)
    outputs.file(
        pinPlaylistResources.map { it.file("extensions/pinplaylist.mpe") },
    )

    doFirst {
        val sdkRoot = sequenceOf(
            providers.environmentVariable("ANDROID_SDK_ROOT").orNull,
            providers.environmentVariable("ANDROID_HOME").orNull,
            providers.environmentVariable("LOCALAPPDATA").orNull
                ?.let { "$it/Android/Sdk" },
        )
            .filterNotNull()
            .map(::file)
            .firstOrNull { it.isDirectory }
            ?: error("Android SDK not found")

        val buildToolsDirectory = sdkRoot.resolve("build-tools")
        val d8 = buildToolsDirectory.listFiles()
            ?.asSequence()
            ?.filter { it.isDirectory }
            ?.mapNotNull { directory ->
                runCatching {
                    org.gradle.util.GradleVersion.version(directory.name)
                }.getOrNull()?.let { version -> directory to version }
            }
            ?.sortedByDescending { (_, version) -> version }
            ?.flatMap { (directory, _) ->
                sequenceOf(
                    directory.resolve("d8"),
                    directory.resolve("d8.bat"),
                )
            }
            ?.firstOrNull { it.isFile }
            ?: error("D8 not found under: $buildToolsDirectory")

        delete(pinPlaylistDexDirectory)
        pinPlaylistDexDirectory.get().asFile.mkdirs()
        commandLine(
            d8,
            "--release",
            "--min-api",
            "26",
            "--output",
            pinPlaylistDexDirectory.get().asFile,
            pinPlaylistJar.get().asFile,
        )
    }

    doLast {
        val output = pinPlaylistResources.get()
            .file("extensions/pinplaylist.mpe").asFile
        output.parentFile.mkdirs()
        pinPlaylistDexDirectory.get().file("classes.dex").asFile
            .copyTo(output, overwrite = true)
    }
}

val bunnyClasses = project(":extensions:discord").layout.buildDirectory.dir(
    "intermediates/javac/release/compileReleaseJavaWithJavac/classes",
)
val bunnyJarDirectory = layout.buildDirectory.dir("tmp/bunny")
val bunnyJar = bunnyJarDirectory.map { it.file("bunny.jar") }
val bunnyDexDirectory = layout.buildDirectory.dir("tmp/bunny/dex")
val bunnyResources = layout.buildDirectory.dir(
    "generated/bunny-extension",
)
val buildBunnyJar = tasks.register<Jar>("buildBunnyJar") {
    dependsOn(":extensions:discord:compileReleaseJavaWithJavac")
    archiveFileName.set("bunny.jar")
    destinationDirectory.set(bunnyJarDirectory)
    from(bunnyClasses) {
        include("app/morphe/extension/discord/bunny/**")
    }
}

val buildBunnyExtension = tasks.register<Exec>("buildBunnyExtension") {
    dependsOn(buildBunnyJar)
    inputs.file(bunnyJar)
    outputs.file(
        bunnyResources.map { it.file("extensions/bunny.mpe") },
    )

    doFirst {
        val sdkRoot = sequenceOf(
            providers.environmentVariable("ANDROID_SDK_ROOT").orNull,
            providers.environmentVariable("ANDROID_HOME").orNull,
            providers.environmentVariable("LOCALAPPDATA").orNull
                ?.let { "$it/Android/Sdk" },
        )
            .filterNotNull()
            .map(::file)
            .firstOrNull { it.isDirectory }
            ?: error("Android SDK not found")

        val buildToolsDirectory = sdkRoot.resolve("build-tools")
        val d8 = buildToolsDirectory.listFiles()
            ?.asSequence()
            ?.filter { it.isDirectory }
            ?.mapNotNull { directory ->
                runCatching {
                    org.gradle.util.GradleVersion.version(directory.name)
                }.getOrNull()?.let { version -> directory to version }
            }
            ?.sortedByDescending { (_, version) -> version }
            ?.flatMap { (directory, _) ->
                sequenceOf(
                    directory.resolve("d8"),
                    directory.resolve("d8.bat"),
                )
            }
            ?.firstOrNull { it.isFile }
            ?: error("D8 not found under: $buildToolsDirectory")

        delete(bunnyDexDirectory)
        bunnyDexDirectory.get().asFile.mkdirs()

        commandLine(
            d8,
            "--release",
            "--min-api",
            "24",
            "--output",
            bunnyDexDirectory.get().asFile,
            bunnyJar.get().asFile,
        )
    }

    doLast {
        val output = bunnyResources.get()
            .file("extensions/bunny.mpe").asFile

        output.parentFile.mkdirs()

        bunnyDexDirectory.get()
            .file("classes.dex")
            .asFile
            .copyTo(output, overwrite = true)
    }
}

patches {
    about {
        name = "Seobjects Random Patches"
        description = "Random QoL patches"
        source = "git@github.com:Seobject/Seobject-patches.git"
        author = "Seobject"
        contact = "na"
        website = "na"
        license = "GPLv3"
    }
}

dependencies {
    // Used by JsonGenerator.
    implementation(libs.gson)

    // Required due to smali, or build fails. Can be removed once smali is bumped.
    implementation(libs.guava)

    implementation(libs.morphe.patches.library)

    // Android API stubs defined here.
    compileOnly(project(":patches:stub"))
}

tasks {
    processResources {
        dependsOn(buildPinPlaylistExtension, buildBunnyExtension)
    }

    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath
        mainClass.set("app.morphe.util.PatchListGeneratorKt")
    }
    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}

kotlin {
    sourceSets.named("main") {
        kotlin.setSrcDirs(listOf("src/main/kotlin"))
        resources.srcDir(pinPlaylistResources)
        resources.srcDir(bunnyResources)
        kotlin.include(
            "app/morphe/patches/music/layout/pinplaylist/**",
            "app/seobject/patches/music/Compatibility.kt",
            "app/morphe/patches/discord/**",
            "app/seobject/patches/discord/**",
        )
    }

    compilerOptions {
        freeCompilerArgs = listOf("-Xcontext-parameters")
    }
}

tasks.named("sourcesJar") {
    dependsOn("buildPinPlaylistExtension", "buildBunnyExtension")
}
