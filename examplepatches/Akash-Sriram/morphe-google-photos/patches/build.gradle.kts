group = "app.morphe"

patches {
    about {
        name = "Morphe Google Photos Patches"
        description = "Google Photos patches, ported for Morphe."
        source = "https://github.com/Akash-Sriram/morphe-google-photos"
        author = "Morphe Photo Patches"
        contact = "na"
        website = "https://github.com/Akash-Sriram/morphe-google-photos"
        license = "GNU General Public License v3.0, with additional GPL section 7 requirements"
    }
}

repositories {
    mavenCentral()
    google()
    maven { url = uri("${rootDir}/local-repo") }
    maven { url = uri("https://jitpack.io") }
}

val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

configurations.all {
    resolutionStrategy {
        force(libs.guava)
        force("com.google.errorprone:error_prone_annotations:2.50.0")
    }
}

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)

    compileOnly(libs.guava)

    // Android API stubs defined here.
    compileOnly(project(":patches:stub"))
}

tasks {
    register<JavaExec>("checkStringResources") {
        description = "Checks resource strings for invalid formatting"

        dependsOn(compileKotlin)

        classpath = sourceSets["main"].runtimeClasspath
        mainClass.set("app.morphe.util.resource.CheckStringResourcesKt")
    }

    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("app.morphe.util.PatchListGeneratorKt")
    }
    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs = listOf("-Xcontext-receivers", "-Xskip-metadata-version-check")
    }
}
