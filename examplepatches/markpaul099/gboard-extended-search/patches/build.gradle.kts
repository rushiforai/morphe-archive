group = "app.markpaul099"

patches {
    about {
        name = "Gboard Extended Search"
        description = "Patches that remove Gboard GIF search filters"
        source = "git@github.com:markpaul099/gboard-extended-search.git"
        author = "markpaul099"
        contact = "https://github.com/markpaul099/gboard-extended-search/issues"
        website = "https://github.com/markpaul099/gboard-extended-search"
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
