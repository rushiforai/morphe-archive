group = "app.chmateuaspoof"
patches {
    about {
        name = "ChMate UA Spoof"
        description = "Optional full User-Agent spoofing add-on for ChMate 0.8.10.226 dev, designed to be used together with Haiagaru"
        source = "https://github.com/rikunode/chmate-ua-spoof-patches"
        author = "rikunode"
        contact = "https://github.com/rikunode"
        website = "https://github.com/rikunode/chmate-ua-spoof-patches"
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
