group = "app.nicoid"

repositories {
    maven {
        name = "GitHubPackages"
        url = uri("https://maven.pkg.github.com/MorpheApp/registry")
        credentials {
            username = providers.gradleProperty("gpr.user").orNull ?: System.getenv("GITHUB_ACTOR")
            password = providers.gradleProperty("gpr.key").orNull ?: System.getenv("GITHUB_TOKEN")
        }
    }
    maven { url = uri("https://jitpack.io") }
    google()
    mavenCentral()
}

patches {
    // TODO: Update this section with your project details.
    about {
        name = "nicoid Re Patches"
        description = "nicoid Re 6.49 modernization patches"
        source = "https://github.com/chikuwadon/nicoid-re-patches"
        author = "chikuwadon"
        contact = "na"
        website = "na"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")
val nicoidD8 = configurations.create("nicoidD8")
val nicoidSmali = configurations.create("nicoidSmali")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
    add(nicoidD8.name, "com.android.tools:r8:9.4.28")
    add(nicoidSmali.name, "org.smali:smali:2.5.2")
}

val androidJar = providers.provider {
    val sdk = System.getenv("ANDROID_HOME") ?: System.getenv("ANDROID_SDK_ROOT")
        ?: error("Android SDK was not found")
    val platforms = file("$sdk/platforms").listFiles { f -> f.isDirectory && f.name.startsWith("android-") }
        ?.sortedByDescending { it.name.removePrefix("android-").toIntOrNull() ?: 0 }.orEmpty()
    platforms.firstOrNull()?.resolve("android.jar")?.takeIf { it.isFile }
        ?: error("Android SDK platform android.jar was not found")
}
val modernShortsSource = rootProject.file("extensions/extension/src/main/java/e/e/a/ModernShorts.java")
val generateNicoidVersion = tasks.register("generateNicoidVersion") {
    inputs.property("patchVersion", providers.gradleProperty("version").orElse(project.version.toString()))
    outputs.file(modernShortsSource)
    doLast {
        val version = providers.gradleProperty("version").orElse(project.version.toString()).get()
        val source = modernShortsSource.readText(Charsets.UTF_8)
        val marker = Regex("    private static final String PATCH_VERSION = \"[^\"]*\";")
        check(marker.containsMatchIn(source)) { "Patch version marker is missing from ModernShorts.java" }
        modernShortsSource.writeText(marker.replace(source, "    private static final String PATCH_VERSION = \"v$version @chikuwadon\";"), Charsets.UTF_8)
    }
}
val compileNicoidHelpers = tasks.register<JavaCompile>("compileNicoidHelpers") {
    dependsOn(generateNicoidVersion)
    source(fileTree(rootProject.file("extensions/extension/src/main/java")) { include("**/*.java") })
    classpath = files(androidJar)
    destinationDirectory.set(layout.buildDirectory.dir("nicoid/helper-classes"))
    options.encoding = "UTF-8"
    options.release.set(8)
}
val nicoidHelpersJar = tasks.register<Jar>("nicoidHelpersJar") {
    dependsOn(compileNicoidHelpers)
    archiveFileName.set("nicoid-helpers.jar")
    destinationDirectory.set(layout.buildDirectory.dir("nicoid"))
    from(compileNicoidHelpers.flatMap { it.destinationDirectory })
}
val nicoidHelpersDex = tasks.register<JavaExec>("nicoidHelpersDex") {
    dependsOn(nicoidHelpersJar)
    classpath = nicoidD8
    mainClass.set("com.android.tools.r8.D8")
    val output = layout.buildDirectory.dir("nicoid/helper-dex")
    doFirst {
        output.get().asFile.deleteRecursively()
        check(output.get().asFile.mkdirs()) { "Could not create D8 output directory" }
    }
    args("--min-api", "21", "--lib", androidJar.get().absolutePath,
        "--lib", System.getProperty("java.home"), "--output", output.get().asFile.absolutePath,
        nicoidHelpersJar.get().archiveFile.get().asFile.absolutePath)
}
val prepareNicoidSmali = tasks.register("prepareNicoidSmali") {
    val sources = rootProject.file("porting/helpers-smali")
    val staged = layout.buildDirectory.dir("nicoid/override-smali")
    inputs.dir(sources)
    inputs.property("patchVersion", providers.gradleProperty("version").orElse(project.version.toString()))
    outputs.dir(staged)
    doLast {
        val version = providers.gradleProperty("version").orElse(project.version.toString()).get()
        staged.get().asFile.deleteRecursively()
        sources.walkTopDown().filter { it.isFile && it.extension == "smali" }.forEach { source ->
            val target = staged.get().asFile.resolve(source.relativeTo(sources))
            target.parentFile.mkdirs()
            target.writeText(source.readText(Charsets.UTF_8).replace("@NICOID_PATCH_VERSION@", version), Charsets.UTF_8)
        }
    }
}
val assembleNicoidSmali = tasks.register<JavaExec>("assembleNicoidSmali") {
    dependsOn(prepareNicoidSmali)
    classpath = nicoidSmali
    mainClass.set("org.jf.smali.Main")
    val output = layout.buildDirectory.file("nicoid/overrides.dex")
    inputs.dir(layout.buildDirectory.dir("nicoid/override-smali"))
    outputs.file(output)
    doFirst { output.get().asFile.parentFile.mkdirs() }
    args("assemble", "--api", "35", "--output", output.get().asFile.absolutePath,
        layout.buildDirectory.dir("nicoid/override-smali").get().asFile.absolutePath)
}

val compileNicoidDexMerger = tasks.register<JavaCompile>("compileNicoidDexMerger") {
    source(file("src/buildHelpers/java/NicoidDexMerger.java"))
    classpath = sourceSets["main"].compileClasspath
    destinationDirectory.set(layout.buildDirectory.dir("nicoid/dex-merger-classes"))
    options.encoding = "UTF-8"
    options.release.set(8)
}
val mergeNicoidHelpersDex = tasks.register<JavaExec>("mergeNicoidHelpersDex") {
    dependsOn(nicoidHelpersDex, compileNicoidDexMerger, assembleNicoidSmali)
    classpath = files(compileNicoidDexMerger.flatMap { it.destinationDirectory }) + sourceSets["main"].compileClasspath
    mainClass.set("app.nicoid.patches.NicoidDexMerger")
    val generated = layout.buildDirectory.file("nicoid/helper-dex/classes.dex")
    val original = rootProject.file("patches/src/main/resources/nicoid/helpers.mpe")
    val output = layout.buildDirectory.file("nicoid/merged-helper-dex/classes.dex")
    doFirst {
        output.get().asFile.parentFile.mkdirs()
        output.get().asFile.delete()
    }
    args(generated.get().asFile.absolutePath, original.absolutePath,
        layout.buildDirectory.file("nicoid/overrides.dex").get().asFile.absolutePath, output.get().asFile.absolutePath)
}
val compileDialogVerification = tasks.register<JavaCompile>("compileDialogVerification") {
    source(rootProject.file("porting/tests/VerifyDialogArguments.java"), rootProject.file("porting/tests/VerifyListClickRouting.java"))
    classpath = sourceSets["main"].compileClasspath
    destinationDirectory.set(layout.buildDirectory.dir("nicoid/dialog-verification-classes"))
    options.release.set(8)
}
val verifyDialogArguments = tasks.register<JavaExec>("verifyDialogArguments") {
    dependsOn(mergeNicoidHelpersDex, compileDialogVerification)
    classpath = files(compileDialogVerification.flatMap { it.destinationDirectory }) + sourceSets["main"].compileClasspath
    mainClass.set("VerifyDialogArguments")
    args(layout.buildDirectory.file("nicoid/merged-helper-dex/classes.dex").get().asFile.absolutePath,
        androidJar.get().absolutePath)
}
val verifyListClickRouting = tasks.register<JavaExec>("verifyListClickRouting") {
    dependsOn(mergeNicoidHelpersDex, compileDialogVerification)
    classpath = files(compileDialogVerification.flatMap { it.destinationDirectory }) + sourceSets["main"].compileClasspath
    mainClass.set("VerifyListClickRouting")
    args(layout.buildDirectory.file("nicoid/merged-helper-dex/classes.dex").get().asFile.absolutePath)
}
val prepareNicoidHelpers = tasks.register("prepareNicoidHelpers") {
    dependsOn(verifyDialogArguments, verifyListClickRouting)
    doLast {
        val dex = layout.buildDirectory.file("nicoid/merged-helper-dex/classes.dex").get().asFile
        check(dex.isFile && dex.readBytes().take(4).toByteArray().contentEquals(byteArrayOf(0x64, 0x65, 0x78, 0x0a))) {
            "Merged nicoid helper DEX is missing or invalid"
        }
        val version = providers.gradleProperty("version").orElse(project.version.toString()).get()
        val dexText = String(dex.readBytes(), Charsets.ISO_8859_1)
        check(dexText.contains("v$version")) { "Patch version is missing from the compiled settings helper" }
        listOf("setMeasureBasedOnAspectRatioEnabled", "CENTER_CROP", "@chikuwadon",
            "nvapi.nicovideo.jp/v2/search/video", "selectContentType", "shortUrl", "controlsTapped", "postDelayed").forEach { marker ->
            check(dexText.contains(marker)) { "Compiled helpers are missing expected Shorts/settings behavior: $marker" }
        }
        listOf("DynamicTheme", "ModernDebug").forEach { marker ->
            check(dexText.contains(marker)) { "Merged helpers are missing the existing support class: $marker" }
        }
        dex.copyTo(rootProject.file("patches/src/main/resources/nicoid/helpers.mpe"), overwrite = true)
    }
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build)
        dependsOn(prepareNicoidHelpers)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}

tasks.named("buildAndroid") { dependsOn(prepareNicoidHelpers) }
tasks.named("build") { dependsOn(prepareNicoidHelpers) }
tasks.named("processResources") { dependsOn(prepareNicoidHelpers) }

val patchesProject = project
gradle.projectsEvaluated {
    val versionTask = patchesProject.tasks.named("generateNicoidVersion")
    patchesProject.rootProject.findProject(":extensions:extension")?.tasks?.matching { it.name.contains("JavaWithJavac") }
        ?.configureEach { dependsOn(versionTask) }
}
