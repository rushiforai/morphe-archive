import java.util.zip.ZipFile

plugins { `java-library` }
java { sourceCompatibility = JavaVersion.VERSION_11; targetCompatibility = JavaVersion.VERSION_11 }
dependencies {
    compileOnly(files(rootProject.extra["androidJar"]))
    testImplementation("junit:junit:4.13.2")
    testImplementation("org.robolectric:robolectric:4.16.1")
    testCompileOnly(files(rootProject.extra["androidJar"]))
    testRuntimeOnly("org.robolectric:android-all:15-robolectric-12650502")
}
// This is a plain JVM module. AndroidX test dependencies are AARs, whose classes
// need extracting for Robolectric without applying the Android Gradle plugin.
val testAarDir = layout.buildDirectory.dir("test-aar-jars")
val extractTestAars = tasks.register("extractTestAars") {
    inputs.files(configurations.testRuntimeClasspath); outputs.dir(testAarDir)
    doLast {
        val destination = testAarDir.get().asFile.also { it.mkdirs() }
        configurations.testRuntimeClasspath.get().files.filter { it.extension == "aar" }.forEach { aar ->
            ZipFile(aar).use { zip ->
                zip.getEntry("classes.jar")?.let { entry ->
                    zip.getInputStream(entry).use { input ->
                        destination.resolve(aar.nameWithoutExtension + ".jar").outputStream().use { output -> input.copyTo(output) }
                    }
                }
            }
        }
    }
}
tasks.test {
    dependsOn(extractTestAars); maxHeapSize = "1536m"
    classpath += files(testAarDir.map { fileTree(it) { include("*.jar") } })
}
tasks.withType<JavaCompile>().configureEach { options.encoding = "UTF-8" }
val dexDir = layout.buildDirectory.dir("dex")
val dex by tasks.registering(JavaExec::class) {
    dependsOn(tasks.jar)
    classpath = files(rootProject.extra["d8Jar"])
    mainClass = "com.android.tools.r8.D8"
    inputs.file(tasks.jar.flatMap { it.archiveFile }); outputs.dir(dexDir)
    doFirst {
        dexDir.get().asFile.mkdirs()
        args = listOf("--release", "--min-api", "26", "--lib", rootProject.extra["androidJar"].toString(),
            "--output", dexDir.get().asFile.path, tasks.jar.get().archiveFile.get().asFile.path)
    }
}
tasks.register<Copy>("bundle") {
    dependsOn(dex); from(dexDir.map { it.file("classes.dex") })
    rename { "swiftkey.mpe" }; into(layout.buildDirectory.dir("bundle"))
}
