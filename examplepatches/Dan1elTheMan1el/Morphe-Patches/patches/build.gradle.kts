import org.gradle.api.tasks.compile.JavaCompile
import org.gradle.api.tasks.Exec

group = "app.danielthemaniel"

patches {
    about {
        name = "DanielTheManiel's Morphe Patches"
        description = "New phone, who dis"
        source = "github"
        author = "DanielTheManiel"
        contact = "https://github.com/Dan1elTheMan1el"
        website = "https://github.com/Dan1elTheMan1el/Morphe-Patches"
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

val androidSdkRoot = System.getenv("ANDROID_HOME")
    ?: "${System.getProperty("user.home")}/Library/Android/sdk"

sourceSets {
    create("extension") {
        java.srcDir("src/extension/java")
    }
}

tasks.named<JavaCompile>("compileExtensionJava") {
    classpath += files("$androidSdkRoot/platforms/android-36/android.jar")
}

tasks {
    withType<JavaCompile>().configureEach {
        options.release.set(11)
    }

    // Android API stubs for compiling the extension. Only the Java compile gets
    // them, so they can't leak into Kotlin compilation of the patches.
    val sdkRoot = System.getenv("ANDROID_HOME")
        ?: "${System.getProperty("user.home")}/Library/Android/sdk"


    val currentFrameExtensionDex = register<Exec>("currentFrameExtensionDex") {
        dependsOn("compileExtensionJava")

        val sdkDirectory = System.getenv("ANDROID_HOME")
            ?: "${System.getProperty("user.home")}/Library/Android/sdk"
        val buildToolsDirectory = file("$sdkDirectory/build-tools/36.1.0")
        val outputDirectory = layout.buildDirectory.dir("current-frame-extension").get().asFile
        val resourceDirectory = layout.buildDirectory.dir("resources/main/extensions").get().asFile
        val androidJar = file("$sdkDirectory/platforms/android-36/android.jar")

        doFirst {
            outputDirectory.deleteRecursively()
            outputDirectory.mkdirs()
            resourceDirectory.mkdirs()
        }

        doFirst {
            val extensionClasses = fileTree(
                "$buildDir/classes/java/extension/app/danielthemaniel/patches/youtube/extension"
            ).matching {
                include("CurrentFrameMediaArtwork*.class")
            }.files
            commandLine(
                file("$buildToolsDirectory/d8"),
                "--min-api", "28",
                "--lib", androidJar,
                "--output", outputDirectory,
                *extensionClasses.toTypedArray(),
            )
        }

        doLast {
            copy {
                from(outputDirectory.resolve("classes.dex"))
                into(resourceDirectory)
                rename { "current_frame_media_artwork.dex" }
            }
        }
    }

    processResources {
        dependsOn(currentFrameExtensionDex)
    }

    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}
