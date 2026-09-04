group = "app.template"

patches {
    // Disable the Morphe extension project integration.
    // The extension DEX is assembled from smali sources by the assembleExtension task
    // and included in the patches JAR as a pre-built resource.
    extensionsProjectPath = null

    about {
        name = "Steam Link GalaxyXR Patches"
        description = "Patches for Steam Link to support Samsung Galaxy XR hardware"
        source = "https://github.com/AngelDark92/steamlink-patches"
        author = "AngelDark92"
        contact = "na"
        website = "na"
        license = "GPLv3"
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs.add("-Xcontext-parameters")
    }
}

// ---------------------------------------------------------------------------
// Smali assembler: build extension.mpe from smali sources without Android SDK.
// The smali library is a transitive dependency of morphe-patcher (already on
// the runtime classpath via the Morphe plugin). We declare it explicitly here
// so it is available on the buildscript classpath for the assembleExtension task.
// ---------------------------------------------------------------------------

val smaliAssembler: Configuration = configurations.create("smaliAssembler") {
    isTransitive = true
}

dependencies {
    smaliAssembler("com.github.MorpheApp.smali:smali:${libs.versions.smali.get()}")

    // Separate configuration so gson is available at runtime for the
    // generatePatchesList task but never bundled into the APK.
    compileOnly(libs.gson)
    compileOnly("org.jetbrains.kotlinx:kotlinx-coroutines-core-jvm:1.10.2")
    runtimeOnly("org.jetbrains.kotlinx:kotlinx-coroutines-core-jvm:1.10.2")
    testImplementation(kotlin("test-junit"))
}

val patchListGeneratorClasspath: Configuration =
    configurations.create("patchListGeneratorClasspath")

dependencies {
    patchListGeneratorClasspath(libs.gson)
}

// Output directory for the assembled extension DEX, included in the JAR.
val extensionOutputDir = layout.buildDirectory.dir("generated/extension-resources")
val minimalExtensionOutputDir = layout.buildDirectory.dir("generated/minimal-extension-resources")

// Assemble GxrSdlBridge + GalaxyXRPermissionActivity smali files into extension.mpe.
val assembleExtension by tasks.registering(JavaExec::class) {
    group = "build"
    description = "Assemble extension smali files to extension.mpe (no Android SDK required)"

    val smaliSrcDir = file("src/main/resources/steamlink/androidxr/smali")
    val smaliSources =
        fileTree(smaliSrcDir) {
            // The dependency graph is static in Morphe, so this extension may also be merged when
            // an allowed patch is applied to a native-XR build. Include only brand-new helper classes: all
            // edits to Valve's existing SDL/controller classes stay in build-aware Kotlin code.
            include("org/libsdl/app/GxrSdlBridge.smali")
            // Exclude test variants that redefine production classes.
            exclude("test_variants/**")
        }
    val outputFile = extensionOutputDir.map { it.file("extensions/extension.mpe") }

    inputs.files(smaliSources)
    outputs.file(outputFile)

    classpath = smaliAssembler
    mainClass.set("com.android.tools.smali.smali.Main")
    doFirst {
        val out = outputFile.get().asFile
        out.parentFile.mkdirs()
        args(
            "a",
            "-a", "33",
            "-o", out.absolutePath,
            *smaliSources.files.map { it.absolutePath }.sorted().toTypedArray(),
        )
    }
}

// Native-XR builds already have SDL/controller/hand routing. Their surviving permission/settings
// patches need only new helper classes, never the legacy SDL class fragments from extension.mpe.
val assembleMinimalExtension by tasks.registering(JavaExec::class) {
    group = "build"
    description = "Assemble the native-XR-safe permission/overlay helper extension"

    val smaliSrcDir = file("src/main/resources/steamlink/androidxr/smali")
    val smaliSources = fileTree(smaliSrcDir) {
        include("com/valvesoftware/steamlink/GalaxyXRPermissionActivity.smali")
        include("com/valvesoftware/steamlink/GxrOverlayBridge.smali")
        include("com/valvesoftware/steamlink/GxrResolutionProbe.smali")
    }
    val outputFile = minimalExtensionOutputDir.map { it.file("extensions/minimal-extension.mpe") }

    inputs.files(smaliSources)
    outputs.file(outputFile)

    classpath = smaliAssembler
    mainClass.set("com.android.tools.smali.smali.Main")
    doFirst {
        val out = outputFile.get().asFile
        out.parentFile.mkdirs()
        args(
            "a",
            "-a", "33",
            "-o", out.absolutePath,
            *smaliSources.files.map { it.absolutePath }.sorted().toTypedArray(),
        )
    }
}

// Include the assembled extension.mpe in the patches JAR.
sourceSets.main {
    resources.srcDir(extensionOutputDir)
    resources.srcDir(minimalExtensionOutputDir)
}

tasks.named("processResources") {
    dependsOn(assembleExtension, assembleMinimalExtension)
}

tasks.named("sourcesJar") {
    dependsOn(assembleExtension, assembleMinimalExtension)
}

tasks {
    register<JavaExec>("auditDecodedSteamLinkPatches") {
        group = "verification"
        description = "Audit compatible 5001712 patches, high resolution on 6 bases, Visual Delay on 5 bases, and 4 recommendation fixtures"

        dependsOn(classes)
        classpath = sourceSets["main"].runtimeClasspath
        mainClass.set("util.DecodedSteamLinkPatchAudit")
        val auditArgs = mutableListOf(
            rootProject.layout.buildDirectory.dir("decoded-fixture-apks").get().asFile.absolutePath,
            rootProject.layout.buildDirectory.dir("decoded-patch-audit").get().asFile.absolutePath,
        )
        project.findProperty("decodedAuditKind")?.toString()?.let { kind ->
            auditArgs += kind
            auditArgs += requireNotNull(project.findProperty("decodedAuditIndex")) {
                "-PdecodedAuditIndex is required with -PdecodedAuditKind"
            }.toString()
        }
        args(auditArgs)
    }

    register<JavaExec>("generateVideoOutputAb") {
        group = "verification"
        description = "Generate guarded srgb8-highp and rgb10-a2 decoded 5002244 A/B derivatives"

        dependsOn(classes)
        classpath = sourceSets["main"].runtimeClasspath
        mainClass.set("util.VideoOutputAbGeneratorKt")
        args(
            project.layout.projectDirectory.dir("../android-steamlinkvr-release-base-2.0.22-5002244").asFile.absolutePath,
            rootProject.layout.buildDirectory.dir("video-output-ab-5002244").get().asFile.absolutePath,
        )
    }

    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")

        val releaseChannel = project.findProperty("releaseChannel")?.toString()?.trim()
        if (!releaseChannel.isNullOrEmpty()) {
            args(releaseChannel)
        }
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}
