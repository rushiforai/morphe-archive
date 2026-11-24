group = "app.ckzombies"

patches {
    about {
        name = "Adebisi Patches"
        description = "Contract Killer: Zombies (NR) v3.1.0, Contract Killer: Zombies 2 Origins v2.0.1, and Dead Crossing v1.06."
        source = "git@github.com:ComoEstaisAmigos/morphe-patches.git"
        author = "ComoEstaisAmigos"
        contact = "na"
        website = "https://github.com/ComoEstaisAmigos/morphe-patches"
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

sourceSets {
    getByName("test") {
        java {
            srcDir(rootProject.projectDir.resolve("extensions/extension/src/main/java"))
            include("app/ckzombies/extension/ApkObbLayout.java")
        }
    }
}

tasks {
    test {
        useJUnitPlatform()
    }

    named<JavaCompile>("compileTestJava") {
        sourceCompatibility = JavaVersion.VERSION_11.toString()
        targetCompatibility = JavaVersion.VERSION_11.toString()
        options.release.set(11)
    }

    // buildAndroid adds classes.dex to the jar in place, so any later run of jar (the tests
    // depend on it) would rebuild the bundle without the dex that Morphe Manager needs.
    jar {
        finalizedBy("buildAndroid")
    }

    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(assemble)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}
