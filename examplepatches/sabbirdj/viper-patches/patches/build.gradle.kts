group = "app.template"

patches {
    about {
        name = "Viper Patches"
        description = "Patches for apps I like: SAI Premium unlock, APKS Installer ad removal, Shohay Pregnancy Health (MicroG RE Google Sign-In + Premium unlock), Bangladesh VPN VIP unlock, and AmberIT location-gate removal."
        source = "git@github.com:sabbirdj/viper-patches.git"
        author = "Viper"
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
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }

    // Used by gradle-semantic-release-plugin.
    //
    // buildAndroid MUST stay a dependency: the Morphe plugin wires
    // `publish.dependsOn(buildAndroid)` so that the DEX merge and the
    // Ed25519 signing of the .mpp happen at all. Calling
    // `dependsOn("generatePatchesList")` on its own replaced that
    // dependency, which silently shipped an unsigned, jar-only .mpp.
    //
    // NOTE: inside `tasks { }`, `publish { }` is the TaskContainer helper and
    // its receiver is NOT the existing `publish` task, so the dependency was
    // silently dropped. Configure the named task instead.
    named("publish") {
        dependsOn("buildAndroid")
        dependsOn("generatePatchesList")
    }

    named("generatePatchesList") {
        mustRunAfter("buildAndroid")
    }
}
