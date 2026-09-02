group = "com.autocat.morphe.smartlauncher"
version = "1.8.0"

base {
    archivesName.set("smartlauncher-morphe-patches")
}

patches {
    about {
        name = "Smart Launcher 6 Morphe Patches"
        description = "Custom patches for Smart Launcher 6 (Anti-Tamper Signature Bypass, Dedicated Popup Archive Entry, Settings UI Integration, App Archiving, Privileged Shizuku Integration)."
        source = "git@github.com:thejaustin/smartlauncher-morphe-patches.git"
        author = "thejaustin"
        contact = "na"
        website = "https://github.com/thejaustin/smartlauncher-morphe-patches"
        license = "GPLv3"
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs.add("-Xcontext-parameters")
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath: Configuration by configurations.creating

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Regenerate patches-list.json from the built patch bundle"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }
}
