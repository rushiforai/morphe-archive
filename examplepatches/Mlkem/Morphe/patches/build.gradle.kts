group = "ca.mlkem.patches"

// The Morphe plugin sets target 11; mixed Java/Kotlin sources also need
// the Java source level pinned instead of inheriting the runner's JDK 21.
java {
    sourceCompatibility = JavaVersion.VERSION_11
    targetCompatibility = JavaVersion.VERSION_11
}
tasks.withType<JavaCompile>().configureEach {
    options.release.set(11)
}

patches {
    about {
        name = "mlkemac patches"
        description = "Community patches for Music League, Walmart Canada, Wongnai, Zoom Earth, PushPress, and XAPK merging."
        source = "https://github.com/Mlkem/Morphe"
        author = "mlkemac"
        contact = "https://github.com/Mlkem/Morphe/issues"
        website = "https://github.com/Mlkem/Morphe"
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
