group = "app.lostprc"

patches {
    about {
        name = "QQ Lite Patches"
        description = "Morphe patches that slim down QQ (com.tencent.mobileqq)"
        source = "git@github.com:LostPRC/qq-lite-patches.git"
        author = "LostPRC"
        contact = "na"
        website = "https://github.com/LostPRC/qq-lite-patches"
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
