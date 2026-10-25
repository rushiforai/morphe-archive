import java.util.UUID

group = "app.template"

// Verify-Build.ps1 owns this fresh workspace and cleans it after preserving results.
// Retained fixture/tool inputs live separately from Gradle's cleanable output.
val verificationWorkDirectory = providers.gradleProperty("verificationWorkDirectory")
    .orNull?.let { rootProject.file(it) }
verificationWorkDirectory?.let { layout.buildDirectory.set(it.resolve("patches")) }
val auditOutputDirectory = verificationWorkDirectory ?: rootProject.layout.buildDirectory.get().asFile
val retainedBuildDirectory = rootProject.file("../builds/steamlink-patches/build")

patches {
    // Disable the Morphe extension project integration.
    // The extension DEX is assembled from smali sources by the assembleExtension task
    // and included in the patches JAR as a pre-built resource.
    extensionsProjectPath = null

    about {
        name = "XR Porting Hub"
        description = "Morphe patches that run Meta Quest / Pico apps on Android XR (Steam Link VR, 4XVR), starting with the Samsung Galaxy XR headset"
        source = "https://github.com/AngelDark92/xr-porting-hub"
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
    testImplementation(libs.gson)
}

// Morphe's D8 task unions compile and runtime classpaths, which resolve separately.
// Follow runtime versions so that the union cannot contain 2 versions of a library.
configurations.named("compileClasspath") {
    shouldResolveConsistentlyWith(configurations.getByName("runtimeClasspath"))
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
val assembleExtension: TaskProvider<JavaExec> = tasks.register("assembleExtension", JavaExec::class) {
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
val assembleMinimalExtension: TaskProvider<JavaExec> = tasks.register("assembleMinimalExtension", JavaExec::class) {
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

val batteryExtensionOutputDir = layout.buildDirectory.dir("generated/battery-extension-resources")
val assembleBatteryExtension: TaskProvider<JavaExec> = tasks.register("assembleBatteryExtension", JavaExec::class) {
    group = "build"
    description = "Assemble battery-only settings helper without launcher or runtime permission changes"
    val source = file("src/main/resources/steamlink/androidxr/smali/com/valvesoftware/steamlink/GxrBatterySettings.smali")
    val outputFile = batteryExtensionOutputDir.map { it.file("extensions/battery-extension.mpe") }
    inputs.file(source)
    outputs.file(outputFile)
    classpath = smaliAssembler
    mainClass.set("com.android.tools.smali.smali.Main")
    doFirst {
        val out = outputFile.get().asFile
        out.parentFile.mkdirs()
        args("a", "-a", "33", "-o", out.absolutePath, source.absolutePath)
    }
}

// 4XVR Galaxy XR helper classes (cn.vr4p.patch.*, dev.eni.hdrdirect.*, frame/render dispatch).
// Only brand-new classes are assembled here; edits to 4XVR's existing classes stay in
// build-aware Kotlin patch code (typed dexlib2 builders, no raw smali strings).
val fourXvrExtensionOutputDir = layout.buildDirectory.dir("generated/fourxvr-extension-resources")
val assembleFourXvrExtension: TaskProvider<JavaExec> = tasks.register("assembleFourXvrExtension", JavaExec::class) {
    group = "build"
    description = "Assemble the 4XVR Galaxy XR helper classes to fourxvr-extension.mpe (no Android SDK required)"
    val smaliSrcDir = file("src/main/resources/fourxvr/smali")
    val smaliSources = fileTree(smaliSrcDir) {
        include("**/*.smali")
    }
    val outputFile = fourXvrExtensionOutputDir.map { it.file("extensions/fourxvr-extension.mpe") }
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
    resources.srcDir(batteryExtensionOutputDir)
    resources.srcDir(fourXvrExtensionOutputDir)
}

tasks.named("processResources") {
    dependsOn(assembleExtension, assembleMinimalExtension, assembleBatteryExtension, assembleFourXvrExtension)
}

tasks.named("sourcesJar") {
    dependsOn(assembleExtension, assembleMinimalExtension, assembleBatteryExtension, assembleFourXvrExtension)
}

tasks {
    register<JavaExec>("auditOledDecodedCompatibility") {
        group = "verification"
        description = "Read-only OLED option audit across the 2 exact supported bases (5001712, 5002363); a missing decoded input reports BLOCKED"
        dependsOn(classes)
        classpath = sourceSets["main"].runtimeClasspath
        mainClass.set("util.OledDecodedCompatibilityAudit")
        args(rootProject.projectDir.absolutePath)
    }

    register<JavaExec>("auditSdr10ShaderAssemble") {
        group = "verification"
        description = "Assemble the complete opaque/masked video shaders (production common prefix + each base's actual native suffixes) for the 2 exact color-supported bases; a missing decoded input reports BLOCKED; writes .glsl files and a report to a fresh output directory"
        dependsOn(classes)
        classpath = sourceSets["main"].runtimeClasspath
        mainClass.set("util.Sdr10ShaderAssembleAudit")
        // The audit requires its output directory to be absent or empty, so give it a fresh one.
        val assembleOutput = auditOutputDirectory.resolve("sdr10-shader-assemble-${UUID.randomUUID()}")
        args(rootProject.projectDir.absolutePath, assembleOutput.absolutePath)
    }

    register<JavaExec>("auditDecodedSteamLinkPatches") {
        group = "verification"
        description = "Audit public 5001712/5002363 patches, high resolution and Visual Delay on 2 bases"

        dependsOn(classes)
        classpath = sourceSets["main"].runtimeClasspath
        mainClass.set("util.DecodedSteamLinkPatchAudit")
        val auditArgs = mutableListOf(
            retainedBuildDirectory.resolve("decoded-fixture-apks").absolutePath,
            auditOutputDirectory.resolve("decoded-patch-audit").absolutePath,
        )
        project.findProperty("decodedAuditKind")?.toString()?.let { kind ->
            auditArgs += kind
            auditArgs += requireNotNull(project.findProperty("decodedAuditIndex")) {
                "-PdecodedAuditIndex is required with -PdecodedAuditKind"
            }.toString()
        }
        args(auditArgs)
    }

    register<JavaExec>("auditSteamLink2363Native") {
        group = "verification"
        description = "Exercise exact 5002363 native helpers, option transitions and patch ordering on decoded bytes"
        dependsOn(classes)
        classpath = sourceSets["main"].runtimeClasspath
        mainClass.set("util.SteamLink2363NativeAudit")
        args(rootProject.projectDir.absolutePath)
    }

    register<JavaExec>("auditSteamLink2395Native") {
        group = "verification"
        description = "Exercise exact 5002395 native helpers, option transitions and pinned scene contracts on decoded bytes"
        dependsOn(classes)
        classpath = sourceSets["main"].runtimeClasspath
        mainClass.set("util.SteamLink2395NativeAudit")
        args(rootProject.projectDir.absolutePath)
    }

    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        // Validate Android DEX packaging before release preparation updates catalogs.
        // The graph ends here and at :patches:buildAndroid: unit tests are a local
        // end-of-task step (see AGENTS.md) and never part of the CI or release graph.
        dependsOn("buildAndroid")

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
        systemProperty("morphe.patchArchiveDirectory", layout.buildDirectory.dir("libs").get().asFile.absolutePath)

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
