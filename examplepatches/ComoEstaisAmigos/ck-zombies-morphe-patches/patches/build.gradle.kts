group = "app.ckzombies"

patches {
    about {
        name = "CK Zombies Patches"
        description = "Morphe patches for Contract Killer: Zombies (NR) v3.1.0"
        source = "git@github.com:ComoEstaisAmigos/ck-zombies-morphe-patches.git"
        author = "ComoEstaisAmigos"
        contact = "na"
        website = "https://github.com/ComoEstaisAmigos/ck-zombies-morphe-patches"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)

    testImplementation(kotlin("test"))
    testRuntimeOnly("org.junit.platform:junit-platform-launcher")
}

tasks {
    test {
        useJUnitPlatform()
    }

    // buildAndroid adds classes.dex to the jar in place, so any later run of jar (the tests
    // depend on it) would rebuild the bundle without the dex that Morphe Manager needs.
    jar {
        finalizedBy("buildAndroid")
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
