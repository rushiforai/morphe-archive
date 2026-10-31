import java.util.zip.ZipFile
plugins { `java-library` }
java { sourceCompatibility = JavaVersion.VERSION_1_8; targetCompatibility = JavaVersion.VERSION_1_8 }
val androidSdk = providers.environmentVariable("ANDROID_HOME").orElse(providers.environmentVariable("ANDROID_SDK_ROOT"))
val androidJar = androidSdk.map { file("$it/platforms/android-36/android.jar") }
val shizuku = configurations.create("shizuku") { isTransitive = false }
dependencies {
    compileOnly(files(androidJar))
    listOf("api", "provider", "aidl", "shared").forEach { add("shizuku", "dev.rikka.shizuku:$it:13.1.5@aar") }
    compileOnly("androidx.annotation:annotation:1.3.0")
}

// JVM behavioral tests run the real Android SQLite implementation. These dependencies never
// enter the recorder jar, DEX, or release payload.
val testAndroidAars = configurations.create("testAndroidAars") { isTransitive = false }
dependencies {
    testImplementation("junit:junit:4.13.2")
    testImplementation("org.robolectric:android-all:10-robolectric-5803371")
    testImplementation("org.robolectric:robolectric:4.14.1") {
        exclude(group = "androidx.test", module = "monitor")
        exclude(group = "androidx.test.espresso", module = "espresso-idling-resource")
    }
    add("testAndroidAars", "androidx.test:monitor:1.7.2@aar")
    add("testAndroidAars", "androidx.test.espresso:espresso-idling-resource:3.6.1@aar")
}
val unpackTestAndroidAars = tasks.register("unpackTestAndroidAars") {
    inputs.files(testAndroidAars)
    val directory = layout.buildDirectory.dir("test-android-aars")
    outputs.dir(directory)
    doLast {
        directory.get().asFile.mkdirs()
        testAndroidAars.files.sortedBy { it.name }.forEach { artifact ->
            ZipFile(artifact).use { zip ->
                zip.getInputStream(zip.getEntry("classes.jar") ?: error("Missing test classes.jar")).use { input ->
                    directory.get().file(artifact.nameWithoutExtension + ".jar").asFile.outputStream().use { input.copyTo(it) }
                }
            }
        }
    }
}
dependencies { testRuntimeOnly(fileTree(layout.buildDirectory.dir("test-android-aars")) { include("*.jar") }) }
tasks.test {
    dependsOn(unpackTestAndroidAars)
    systemProperty("robolectric.dependency.repo.url", "https://repo.maven.apache.org/maven2")
}
val unpackShizuku = tasks.register("unpackShizuku") {
    inputs.files(shizuku)
    val directory = layout.buildDirectory.dir("shizuku")
    outputs.dir(directory)
    doLast {
        directory.get().asFile.mkdirs()
        shizuku.files.sortedBy { it.name }.forEach { artifact ->
            ZipFile(artifact).use { zip ->
                zip.getInputStream(zip.getEntry("classes.jar") ?: error("Missing Shizuku classes.jar")).use { input ->
                    directory.get().file(artifact.nameWithoutExtension + ".jar").asFile.outputStream().use { input.copyTo(it) }
                }
            }
        }
    }
}
val shizukuJars = fileTree(layout.buildDirectory.dir("shizuku")) { include("*.jar") }
dependencies { compileOnly(shizukuJars) }
tasks.compileJava { dependsOn(unpackShizuku) }
tasks.withType<Jar>().configureEach { isPreserveFileTimestamps = false; isReproducibleFileOrder = true }
val runtimeDex = tasks.register<Exec>("runtimeDex") {
    dependsOn(tasks.jar, unpackShizuku)
    inputs.files(tasks.jar, shizuku)
    outputs.dir(layout.buildDirectory.dir("dex"))
    doFirst {
        val destination = layout.buildDirectory.dir("dex").get().asFile; destination.mkdirs()
        commandLine(listOf("${androidSdk.get()}/build-tools/36.0.0/d8", "--release", "--min-api", "29", "--lib", androidJar.get().absolutePath,
            "--output", destination.absolutePath, tasks.jar.get().archiveFile.get().asFile.absolutePath) + shizukuJars.files.sortedBy { it.name }.map { it.absolutePath })
    }
}
val compileManifest = tasks.register<Exec>("compileManifest") {
    inputs.file("src/main/AndroidManifest.xml")
    outputs.file(layout.buildDirectory.file("manifest.apk"))
    doFirst {
        layout.buildDirectory.get().asFile.mkdirs()
        commandLine("${androidSdk.get()}/build-tools/36.0.0/aapt2", "link", "--manifest", file("src/main/AndroidManifest.xml").absolutePath,
            "-I", androidJar.get().absolutePath, "--min-sdk-version", "29", "--target-sdk-version", "36", "-o", layout.buildDirectory.file("manifest.apk").get().asFile.absolutePath)
    }
}
tasks.register("payload") {
    dependsOn(runtimeDex, compileManifest)
    inputs.files(layout.buildDirectory.file("dex/classes.dex"), layout.buildDirectory.file("manifest.apk"), "THIRD-PARTY-NOTICES.txt")
    outputs.dir(layout.buildDirectory.dir("payload"))
    doLast {
        val destination = layout.buildDirectory.dir("payload").get().asFile; destination.mkdirs()
        layout.buildDirectory.file("dex/classes.dex").get().asFile.copyTo(destination.resolve("recorder.dex"), overwrite = true)
        ZipFile(layout.buildDirectory.file("manifest.apk").get().asFile).use { zip ->
            zip.getInputStream(zip.getEntry("AndroidManifest.xml")).use { input -> destination.resolve("manifest.axml").outputStream().use { input.copyTo(it) } }
        }
        file("THIRD-PARTY-NOTICES.txt").copyTo(destination.resolve("THIRD-PARTY-NOTICES.txt"), overwrite = true)
    }
}
