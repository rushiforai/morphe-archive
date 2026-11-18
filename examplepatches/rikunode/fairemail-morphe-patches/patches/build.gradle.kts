group = "dev.rikunode.fairemail"
patches {
    about {
        name = "FairEmail Patches"
        description = "FairEmail privacy-focused patch set: built-in clone, hidden banners and changelog, opt-in OAuth, local Pro and settings export"
        source = "https://github.com/rikunode/fairemail-morphe-patches"
        author = "rikunode"
        contact = "https://github.com/rikunode"
        website = "https://github.com/rikunode/fairemail-morphe-patches"
        license = "GPLv3"
    }
}
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")
dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
}
tasks {
    register<JavaExec>("generatePatchesList") {
        // This task produces a metadata index AND the distributable Android .mpp.
        // Plain 'build' only emits JVM .class entries. Morphe Manager requires
        // classes.dex and rejects that JVM-only bundle as corrupted.
        dependsOn("buildAndroid")
        systemProperty("patchesVersion", project.version.toString())
        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }
    publish { dependsOn("generatePatchesList") }
}
