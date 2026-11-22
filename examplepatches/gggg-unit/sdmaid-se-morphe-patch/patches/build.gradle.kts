import org.gradle.language.jvm.tasks.ProcessResources

group = "local.sdmaidse.morphe"

kotlin {
    compilerOptions {
        freeCompilerArgs.add("-Xcontext-parameters")
    }
}

patches {
    about {
        name = "gggg-unit SD Maid SE FOSS Patches"
        description = "Independent local-feature-state patch for SD Maid SE FOSS, compatible with Morphe"
        source = "https://github.com/gggg-unit/sdmaid-se-morphe-patch"
        author = "gggg-unit"
        contact = "https://github.com/gggg-unit/sdmaid-se-morphe-patch/issues"
        website = "https://github.com/gggg-unit/sdmaid-se-morphe-patch/releases"
        license = "GPLv3"
    }
}

tasks.named<ProcessResources>("processResources") {
    from(rootProject.file("LICENSE"))
    from(rootProject.file("NOTICE"))
    from(rootProject.file("licenses")) { into("licenses") }
}
