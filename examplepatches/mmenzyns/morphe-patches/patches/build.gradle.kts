group = "app.template"

repositories {
    maven {
        url = uri("${rootProject.rootDir}/m2-repo")
    }
    mavenCentral()
    google()
    maven { url = uri("https://jitpack.io") }
}

patches {
    about {
        name = "Menzac Patches"
        description = "Custom Morphe patches collection"
        source = "https://github.com/mmenzyns/morphe-patches.git"
        author = "Mark Menzynski"
        contact = "menzac97@gmail.com"
        website = "https://github.com/mmenzyns/morphe-patches"
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

tasks {
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
