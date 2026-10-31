group = "app.zeekradapt"

patches {
    about {
        name = "zeekr-adapt Patches"
        description = "Morphe port of zeekr-adapt: adapts phone apps to automotive head units (Zeekr DHU) with non-standard DPI"
        source = "git@github.com:mormislaw/zeekr-adapt-morphe-patches.git"
        author = "zeekr-adapt (nobleKr), Morphe port"
        contact = "na"
        website = "https://github.com/mormislaw/zeekr-adapt-morphe-patches"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

// The Pine AAR, only to take its native libpine.so. The patch writes it into the
// patched APK as an asset; the extension's AssetLibLoader loads it at runtime.
val pineNative = configurations.create("pineNative") {
    isTransitive = false
}

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
    pineNative(variantOf(libs.pine) { artifactType("aar") })

    testImplementation(libs.kotlinx.coroutines.core)
}

val extractPineNative = tasks.register<Sync>("extractPineNative") {
    from({ pineNative.map { zipTree(it) } }) {
        include("jni/*/libpine.so")
        eachFile { path = "dhuadapter/lib/" + path.removePrefix("jni/") }
    }
    includeEmptyDirs = false
    into(layout.buildDirectory.dir("generated/pine-native"))
}

sourceSets.main {
    resources.srcDir(extractPineNative)
}

tasks {
    // The test source set only holds the patchApk tool.
    test {
        failOnNoDiscoveredTests = false
    }

    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }

    register<JavaExec>("patchApk") {
        description = "Applies a DHU adapter patch to a local APK/APKM (unsigned output), for testing"

        dependsOn("testClasses")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("app.zeekradapt.patches.dhu.DhuPatchApkKt")

        val apk = providers.gradleProperty("apk")
        val out = providers.gradleProperty("out")
        val pkg = providers.gradleProperty("pkg").orElse("any")
        val opts = providers.gradleProperty("opts").orElse("")
        doFirst {
            val input = apk.orNull ?: throw GradleException("patchApk requires -Papk=/path/to/app.apk")
            val output = out.orNull ?: throw GradleException("patchApk requires -Pout=/path/to/out.apk")
            setArgs(listOf(input, output, pkg.get()) + opts.get().split(',').filter { it.isNotBlank() })
        }
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}
