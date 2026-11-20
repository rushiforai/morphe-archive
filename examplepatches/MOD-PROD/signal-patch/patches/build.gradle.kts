group = "app.modprod"
version = "1.0.0"

patches {
    about {
        name = "Signals Auto Trading Patches"
        description = "Patches for Signals (com.zyncas.signals) 14.3.1 — Auto Trading tab instead of Launchpad. Compatible with Morphe."
        source = "git@github.com:MOD-PROD/signal-patch.git"
        author = "ModProd"
        contact = "https://github.com/MOD-PROD/signal-patch/issues"
        website = "https://github.com/MOD-PROD/signal-patch"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for generatePatchesList
// but never bundled into the .mpp file.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    implementation(libs.morphe.patches.library)

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
