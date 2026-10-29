plugins {
    kotlin("jvm") version "2.4.10"
}

group = "app.masajid"
version = "1.0.0"

repositories {
    // morphe-patcher is published here by `morphe-patcher: publishToMavenLocal`.
    mavenLocal()
    mavenCentral()
    google()
    maven {
        url = uri("https://jitpack.io")
        content {
            includeGroup("com.github.MorpheApp.smali")
            includeGroup("com.github.REAndroid")
        }
    }
}

dependencies {
    // Provided at runtime by Morphe Desktop / Manager. `implementation` (not compileOnly)
    // so its transitive deps (smali/dexlib2) resolve for compilation; the jar task only
    // packages this project's own classes, so nothing is bundled into the .mpp.
    implementation("app.morphe:morphe-patcher:1.14.0")
    // The patcher POM exposes smali (dexlib2) as runtime scope, so add it explicitly
    // for compilation — same coordinates the patcher itself uses.
    compileOnly("com.github.MorpheApp.smali:smali:d856bad65f")
}

kotlin {
    compilerOptions {
        jvmTarget.set(org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_11)
    }
}

java {
    sourceCompatibility = JavaVersion.VERSION_11
    targetCompatibility = JavaVersion.VERSION_11
}

// Intermediate JVM jar. Morphe Manager (Android) cannot load JVM .class files, so this is
// not the published bundle; `buildBundle` below adds the dex and produces the real .mpp.
tasks.jar {
    archiveFileName.set("masajid-patches-${project.version}-classes.jar")
}

// Locates the Android SDK pieces d8 needs (build-tools + a platform android.jar).
fun androidSdkDir(): File {
    val candidates = listOfNotNull(
        System.getenv("ANDROID_HOME"),
        System.getenv("ANDROID_SDK_ROOT"),
        "${System.getProperty("user.home")}/Library/Android/sdk",
        "${System.getProperty("user.home")}/Android/Sdk",
    )
    return candidates.map(::File).firstOrNull { File(it, "build-tools").isDirectory }
        ?: error("Android SDK not found; set ANDROID_HOME (needs build-tools and a platform)")
}

val dexOutputDir = layout.buildDirectory.dir("dex")

// Converts the compiled classes to classes.dex, the format Morphe Manager loads
// (it rejects a bundle with "Patch bundle is missing dex entries").
val dexBundle by tasks.registering(Exec::class) {
    val classesJar = tasks.jar.flatMap { it.archiveFile }
    dependsOn(tasks.jar)
    inputs.file(classesJar)
    outputs.dir(dexOutputDir)

    doFirst {
        val sdk = androidSdkDir()
        val d8 = File(sdk, "build-tools").listFiles()!!
            .filter { File(it, "d8").exists() && "rc" !in it.name }.maxByOrNull { it.name }
            ?.let { File(it, "d8") } ?: error("d8 not found in $sdk/build-tools")
        val androidJar = File(sdk, "platforms").listFiles()!!
            .filter { File(it, "android.jar").exists() }.maxByOrNull { it.name }
            ?.let { File(it, "android.jar") } ?: error("android.jar not found in $sdk/platforms")

        dexOutputDir.get().asFile.apply { deleteRecursively(); mkdirs() }

        val args = mutableListOf(d8.path, "--release", "--min-api", "26", "--lib", androidJar.path)
        configurations.compileClasspath.get().files.forEach { args += listOf("--classpath", it.path) }
        args += listOf("--output", dexOutputDir.get().asFile.path, classesJar.get().asFile.path)
        commandLine(args)
    }
}

// `./gradlew buildBundle` -> build/libs/masajid-patches-1.0.0.mpp (classes + classes.dex,
// the same layout as the official Morphe bundles).
tasks.register<Jar>("buildBundle") {
    dependsOn(dexBundle)
    archiveFileName.set("masajid-patches-${project.version}.mpp")
    destinationDirectory.set(layout.buildDirectory.dir("libs"))

    from(zipTree(tasks.jar.flatMap { it.archiveFile })) { exclude("META-INF/MANIFEST.MF") }
    from(dexOutputDir)

    manifest {
        attributes(
            "Name" to "Masajid Patches",
            "Description" to "Patches for sa.gov.moia.beneficiaryapp (Masajid)",
            "Version" to project.version.toString(),
            "Timestamp" to System.currentTimeMillis().toString(),
            "Source" to "https://github.com/loody227/masajid-patches",
            "Author" to "loody227",
            "Contact" to "https://github.com/loody227",
            "Website" to "https://github.com/loody227/masajid-patches",
            "License" to "GNU General Public License v3.0",
            // Lowest patcher the bundle needs; Desktop 1.16.0 ships a newer one.
            "Patcher-Version" to "1.10.0",
        )
    }
}
