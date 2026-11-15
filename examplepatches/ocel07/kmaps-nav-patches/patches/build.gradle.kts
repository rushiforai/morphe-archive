group = "app.kmaps"

patches {
    about {
        name = "kmaps-nav-patches"
        description = "High-rate GNSS (u-blox 10 Hz) patches for NAVER Map and KakaoMap car navigation"
        source = "git@github.com:ocel07/kmaps-nav-patches.git"
        author = "ocel07"
        contact = "https://github.com/ocel07/kmaps-nav-patches/issues"
        website = "https://github.com/ocel07/kmaps-nav-patches"
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
