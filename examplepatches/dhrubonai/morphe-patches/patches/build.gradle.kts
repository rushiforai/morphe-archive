group = "app.hxreborn"

patches {
    about {
        name = "Dhrubo Patches"
        description = "hxreborn's patches with MovieBox extras: Telegram popup, coffee button and fixed downloads"
        source = "git@github.com:dhrubonai/morphe-patches.git"
        author = "dhrubonai"
        contact = "https://github.com/dhrubonai/morphe-patches/issues"
        website = "https://github.com/dhrubonai/morphe-patches"
        license = "GPLv3"
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs.add("-Xcontext-parameters")
    }
}

// Matches the plugin's targetCompatibility 11 for this module's Java sources
java {
    sourceCompatibility = JavaVersion.VERSION_11
}

val patchListGeneratorClasspath: Configuration by configurations.creating

dependencies {
    compileOnly(libs.gson)
    implementation(libs.morphe.patches.library)
    patchListGeneratorClasspath(libs.gson)
    testImplementation(kotlin("test"))
}

tasks {
    withType<Test> {
        useJUnitPlatform()
    }

    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }

    publish {
        dependsOn("generatePatchesList")
    }
}
