group = "app.riky"

patches {
    about {
        name = "riky's patches"
        description = "Personal Morphe patch bundle (ad removal, unlocks, and experiments)"
        source = "git@github.com:riky-dev/morphe-patches.git"
        author = "riky-dev"
        contact = "na"
        website = "https://morphe.software/add-source?github=riky-dev/morphe-patches"
        license = "GPLv3"
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs.add("-Xcontext-parameters")
    }
}

// ExtensionPlugin exports DEX only. Package WireGuard natives as patch resources.
val wireguardNative = configurations.create("wireguardNative") {
    isTransitive = false
}
dependencies {
    add(wireguardNative.name, libs.wireguard)
}
val wireguardResources = tasks.register<Sync>("wireguardResources") {
    from(provider { zipTree(wireguardNative.singleFile) }) {
        include("jni/*/libwg-go.so")
        eachFile { path = "wireguard/native/" + path.removePrefix("jni/") }
        includeEmptyDirs = false
    }
    into(layout.buildDirectory.dir("generated/wireguard-resources"))
}
sourceSets.main {
    resources.srcDir(wireguardResources)
}
tasks.processResources { dependsOn(wireguardResources) }
tasks.named("sourcesJar") { dependsOn(wireguardResources) }

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
