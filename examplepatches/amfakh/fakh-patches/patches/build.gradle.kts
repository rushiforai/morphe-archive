group = "app.fakh"

patches {
    about {
        name = "Fakh Patches"
        description = "Material You, ad and tracker removal, and premium unlocks for Android apps."
        source = "git@github.com:amfakh/fakh-patches.git"
        author = "amfakh"
        contact = "na"
        website = "na"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

val aircompressorSource = configurations.create("aircompressorSource") { isTransitive = false }

// Morphe Manager loads every class of the bundle, and aircompressor's Hadoop codecs need classes Android does not
// have. Only the Zstd compressor and its helpers go into the bundle.
val aircompressorZstd = tasks.register<Zip>("aircompressorZstd") {
    archiveExtension.set("jar")
    archiveBaseName.set("aircompressor-zstd")
    from(provider { aircompressorSource.map { zipTree(it) } }) {
        include("io/airlift/compress/zstd/**", "io/airlift/compress/*.class")
        exclude("**/*Codec*", "**/*Hadoop*")
    }
}

dependencies {
    compileOnly(libs.gson)
    aircompressorSource(libs.aircompressor)
    compileOnly(files(aircompressorZstd.flatMap { it.archiveFile }))
    patchListGeneratorClasspath(libs.gson)
}

tasks {
    // GPLv3 Section 7b requires the NOTICE text to ship with binaries, not only the source.
    named<Jar>("jar") {
        from(aircompressorZstd.map { zipTree(it.archiveFile) })
        from(rootProject.files("NOTICE", "LICENSE")) {
            into("META-INF")
        }
    }

    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn("buildAndroid")

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }
}
