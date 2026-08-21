group = "app.morphe"

patches {
    about {
        name = "Apos Morphe Patches"
        description = "Unofficial Morphe patches"
        source = "https://github.com/Apostolique/apos-morphe-patches.git"
        author = "Apostolique"
        // A URL rather than an email, since the bundle metadata is public.
        contact = "https://github.com/Apostolique"
        website = "https://github.com/Apostolique/apos-morphe-patches"
        // The patcher and extension libraries this links against are GPL-3.0.
        license = "GPL-3.0"
    }
}

dependencies {
    // Required by smali, or the build fails.
    implementation(libs.guava)
    implementation(libs.morphe.patches.library)

    // For compiling PatchListGenerator, and only that. The patches library
    // already brings gson along at runtime, so the generator finds it there
    // and nothing needs a configuration of its own -- but that dependency is
    // runtime-only, so the compiler still has to be told.
    compileOnly(libs.gson)
}

tasks {
    // Writes patches-list.json from the bundle that was just built: every patch
    // name, what it is compatible with, and which of those versions are
    // experimental. The README's patch table is generated from that file, and
    // third-party tools read it, so it is not hand-maintained.
    //
    // Reads the version out of the bundle's own manifest, which is why this
    // depends on buildAndroid rather than running beside it.
    register<JavaExec>("generatePatchesList") {
        description = "Write patches-list.json from the built bundle"
        group = "build"

        dependsOn("buildAndroid")

        classpath = sourceSets["main"].runtimeClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }
}

kotlin {
    compilerOptions {
        // The patcher API uses Kotlin context parameters (e.g. Fingerprint.method).
        freeCompilerArgs = listOf("-Xcontext-parameters")
    }
}
