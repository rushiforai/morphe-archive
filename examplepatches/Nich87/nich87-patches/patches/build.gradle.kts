group = "app.voidhack"

patches {
    about {
        name = "Nich87 Patches"
        description = "Custom patches by Nich87 for use with Morphe."
        source = "https://github.com/Nich87/nich87-patches"
        author = "Nich87"
        contact = "https://github.com/Nich87/nich87-patches/issues"
        website = "https://github.com/Nich87/nich87-patches"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")
val singRuntimeAar = configurations.create("singRuntimeAar") {
    isCanBeConsumed = false
    isTransitive = false
}

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
    testImplementation(libs.junit)
    testImplementation(libs.json)

    val onnxRuntime = libs.onnxruntime.android.get()
    add(singRuntimeAar.name, "${onnxRuntime.group}:${onnxRuntime.name}:${onnxRuntime.versionConstraint.requiredVersion}@aar")
}

val singRuntimeLibraries by tasks.registering(Sync::class) {
    from(singRuntimeAar.elements.map { zipTree(it.single().asFile) }) {
        include("jni/arm64-v8a/libonnxruntime.so", "jni/arm64-v8a/libonnxruntime4j_jni.so")
        into("applemusic/sing-runtime")
    }
    into(layout.buildDirectory.dir("generated/singRuntimeResources"))
}
sourceSets["main"].resources.srcDir(singRuntimeLibraries)

sourceSets["test"].java.srcDir(project(":extensions:extension").file("src/test/java"))
tasks.named<JavaCompile>("compileTestJava") {
    options.release.set(11)
    source(project(":extensions:extension").fileTree("src/main/java/app/voidhack/extension/applemusic") {
        include("GlassSpring.java", "GlassPlayerGesture.java", "GlassPlayerMorph.java")
    })
    source(project(":extensions:extension").fileTree("src/main/java/app/voidhack/extension/applemusic/library") {
        include("LibraryBackup.java", "LibraryImportPlan.java", "LibraryFailure.java", "DaapCodec.java",
            "LibraryDaap.java", "MusicReflection.java", "MusicLibrary.java", "MetadataField.java", "MetadataCatalog.java", "LibraryMetadata.java")
    })
    source(project(":extensions:extension").fileTree("src/main/java/app/voidhack/extension/applemusic/lyrics") {
        include("LrclibModels.java", "LrclibMatcher.java", "LrclibParser.java", "LrclibApiClient.java")
    })
    source(project(":extensions:extension").fileTree("src/main/java/app/voidhack/extension/applemusic/font") {
        include("FontInspector.java")
    })
    source(project(":extensions:extension").fileTree("src/main/java/app/voidhack/extension/twitter/spaces/mute") {
        include("SpaceLocalMuteLogic.java")
    })
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
