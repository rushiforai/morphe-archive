group = "app.pigfoot"

patches {
    // Public bundle metadata.
    about {
        name = "Pigfoot Patches"
        description = "App-scoped Morphe patches"
        source = "https://github.com/pigfoot/morphe-patches"
        author = "pigfoot"
        contact = "na"
        website = "na"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
    testImplementation(libs.junit)
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

sourceSets["test"].java.srcDirs("../extensions/railsgo/src/main/java", "../extensions/railsgo/stubs/src/main/java")
tasks.test { useJUnit() }

// Match the official plugin's JVM 11 target for Java test sources as well.
java { sourceCompatibility = JavaVersion.VERSION_11 }

// Validate the actual embedded extension, not only source-level behavior.
tasks.test { dependsOn("buildAndroid") }
