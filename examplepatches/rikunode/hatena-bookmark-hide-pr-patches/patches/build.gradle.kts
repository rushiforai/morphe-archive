group = "dev.rikunode.hatenabookmark"
patches {
    about {
        name = "Hatena Bookmark native ad filter"
        description = "Remove native PR entries from Hatena Bookmark feeds without hiding normal articles"
        source = "https://github.com/rikunode/hatena-bookmark-hide-pr-patches"
        author = "rikunode"
        contact = "https://github.com/rikunode"
        website = "https://github.com/rikunode/hatena-bookmark-hide-pr-patches"
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
