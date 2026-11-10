group = "app.modprod"

patches {
    about {
        name = "ModProd APK Creator"
        description = "Patches pour créer des applis Android à partir de l'APK de base ModProd"
        source = "git@github.com:MOD-PROD/modprod-apk-creator.git"
        author = "Gonzo (MOD-PROD)"
        contact = "https://github.com/MOD-PROD/modprod-apk-creator/issues"
        website = "https://github.com/MOD-PROD/modprod-apk-creator"
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
