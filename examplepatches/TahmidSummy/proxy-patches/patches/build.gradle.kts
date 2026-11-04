group = "app.proxypatches"

patches {
    about {
        name = "Proxy Patches"
        description = "Route an app's traffic through your own HTTP or HTTPS proxy, with optional login"
        source = "git@github.com:TahmidSummy/proxy-patches.git"
        author = "TahmidSummy"
        contact = "https://github.com/TahmidSummy/proxy-patches/issues"
        website = "https://github.com/TahmidSummy/proxy-patches"
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
