plugins { id("com.android.application") version "9.1.0" }

abstract class SharedExtensionSources : DefaultTask() {
    @get:InputDirectory abstract val inputDirectory: DirectoryProperty
    @get:OutputDirectory abstract val outputDirectory: DirectoryProperty
    @get:Inject abstract val files: FileSystemOperations

    @TaskAction fun sync() {
        files.sync {
            from(inputDirectory)
            // Every capability reports installed, so new patches appear here without a separate stub.
            filesMatching("app/spicetify/extension/spotify/settings/InstalledPatches.java") {
                filter { line -> line.replace("return false;", "return true;") }
            }
            into(outputDirectory)
        }
    }
}
val sharedSources = tasks.register<SharedExtensionSources>("sharedSources") {
    inputDirectory.set(layout.projectDirectory.dir("../extensions/extension/src/main/java"))
    outputDirectory.set(layout.buildDirectory.dir("generated/extension"))
}

android {
    namespace = "app.spicetify.development"
    compileSdk = 36
    defaultConfig {
        applicationId = "app.spicetify.development"
        minSdk = 26
        targetSdk = 36
        versionCode = 1
        versionName = "development"
    }
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
    testOptions.unitTests.isIncludeAndroidResources = true
}
androidComponents {
    beforeVariants(selector().withBuildType("release")) { it.enable = false }
    onVariants { variant ->
        variant.sources.java?.addGeneratedSourceDirectory(sharedSources) { it.outputDirectory }
    }
}

dependencies {
    implementation("io.reactivex.rxjava3:rxjava:3.1.10")
    testImplementation("junit:junit:4.13.2")
    testImplementation("org.robolectric:robolectric:4.17")
}
