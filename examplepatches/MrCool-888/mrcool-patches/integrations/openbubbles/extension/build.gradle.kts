import java.net.URI
import java.security.KeyStore
import java.security.MessageDigest
import java.util.Properties
import java.util.zip.ZipEntry
import java.util.zip.ZipFile
import java.util.zip.ZipOutputStream

plugins {
    java
    kotlin("jvm")
}

group = "com.openbubbles.wear"

// The official Desktop release contains Patcher 2.0.1 and its provided dependencies.
// Using it as compileOnly avoids requiring GitHub Packages credentials on local builds.
val morpheCli = layout.buildDirectory.file("tools/morphe-desktop-1.19.1-all.jar")
val downloadMorphe by tasks.registering {
    val url = "https://github.com/MorpheApp/morphe-desktop/releases/download/v1.19.1/morphe-desktop-1.19.1-all.jar"
    val sha256 = "a51472252cd63b2eac635dbb5a154ff918bfc15268da89679feb3d760230c573"
    inputs.property("url", url)
    inputs.property("sha256", sha256)
    outputs.file(morpheCli)
    doLast {
        val output = morpheCli.get().asFile
        output.parentFile.mkdirs()
        val temporary = File(output.parentFile, "${output.name}.part")
        try {
            URI(url).toURL().openStream().use { input ->
                temporary.outputStream().use(input::copyTo)
            }
            check(temporary.sha256() == sha256) { "Morphe CLI SHA-256 mismatch" }
            temporary.copyTo(output, overwrite = true)
        } finally {
            temporary.delete()
        }
    }
}

val providedMorphe = files(morpheCli).builtBy(downloadMorphe)
val d8 by configurations.creating
dependencies {
    testImplementation(providedMorphe)
    testImplementation("org.robolectric:robolectric:4.14.1")
    testImplementation("com.google.guava:guava:32.0.1-android")
    testRuntimeOnly("com.google.guava:guava:32.0.1-android")
    testImplementation(kotlin("test-junit"))
    // SDK 35's D8 cannot preserve the Kotlin 2.4 metadata needed by Android patch loaders.
    add(d8.name, "com.android.tools:r8:9.1.31")
}
afterEvaluate {
    configurations.getByName<org.gradle.api.artifacts.Configuration>("testRuntimeClasspath")
        .resolutionStrategy.force("com.google.guava:guava:32.0.1-android")
}

// The injected service compiles against the stock app's classes. The jar is
// produced from the app's own DEX (d2j-dex2jar) and is used only as a classpath:
// it is never packaged into the patch or the final APK.
val appClassesJar = providers.gradleProperty("appClassesJar").map { file(it) }
    .orElse(provider { file("../work/openbubbles-classes-v52.jar") })
val embeddedBridgeJar = file("../bridge/build/embedded/embedded-bridge.jar")
val buildEmbeddedBridge by tasks.registering {
    dependsOn(":bridge:exportEmbeddedPayload")
    outputs.file(embeddedBridgeJar)
}
val sdk = providers.environmentVariable("ANDROID_HOME")
    .orElse(providers.environmentVariable("ANDROID_SDK_ROOT"))
val androidJar = sdk.map { "$it/platforms/android-35/android.jar" }

sourceSets.test { java.srcDir("src/extension/java") }
dependencies {
    testCompileOnly(files(androidJar))
    testImplementation(files(androidJar))
    testImplementation(files(appClassesJar))
    testImplementation(files(embeddedBridgeJar).builtBy(buildEmbeddedBridge))
    testImplementation("com.google.android.gms:play-services-wearable:19.0.0")
    testImplementation("org.robolectric:robolectric:4.14.1")
}
tasks.named<JavaCompile>("compileTestJava") {
    sourceCompatibility = "17"
    targetCompatibility = "17"
}
tasks.test {
    maxHeapSize = "2g"
    doFirst {
        // This JVM build must expose the classes inside Robolectric's Android AARs.
        // The DEX-derived host fixture is compile-only evidence, not executable GMS bytecode.
        val googleRuntime = classpath.filter { it.path.contains("play-services-") }
        classpath = files((googleRuntime + classpath).map {
            if (it.extension == "aar") zipTree(it).matching { include("classes.jar") } else it
        })
        // The stock/CLI fat jars embed older Guava classes that break Robolectric.
        classpath = classpath.filter { it.name.startsWith("guava-") } + classpath
    }
}

val extensionClasses by tasks.registering(JavaCompile::class) {
    dependsOn(buildEmbeddedBridge)
    source = fileTree("src/extension/java") { include("**/*.java") }
    classpath = files(androidJar, appClassesJar, embeddedBridgeJar)
    destinationDirectory.set(layout.buildDirectory.dir("extension-classes"))
    sourceCompatibility = "11"
    targetCompatibility = "11"
    options.encoding = "UTF-8"
    options.compilerArgs.addAll(listOf("-Xlint:deprecation", "-Xlint:unchecked"))
    doFirst {
        check(androidJar.get().let(::file).isFile) {
            "Set ANDROID_HOME to an Android SDK with android-35"
        }
        check(appClassesJar.get().isFile) {
            "Missing Stock app classes: ${appClassesJar.get()} (run d2j-dex2jar on work/com.openbubbles.messaging.apk)"
        }
    }
}

tasks.named<org.jetbrains.kotlin.gradle.tasks.KotlinCompile>("compileTestKotlin") {
    dependsOn(extensionClasses)
    // Compile tests against Java 11 extension classes, keeping that production task's target unchanged.
    // The Kotlin 2.1 test compiler cannot read the fat CLI's Kotlin 2.3/2.4 metadata.
    libraries.setFrom(
        configurations.getByName("testCompileClasspath").filter {
            it.canonicalFile != morpheCli.get().asFile.canonicalFile &&
                it.canonicalFile != appClassesJar.get().canonicalFile
        },
        extensionClasses.map { it.destinationDirectory },
    )
    compilerOptions.jvmTarget.set(org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17)
}

val extensionClassJar by tasks.registering(Jar::class) {
    dependsOn(extensionClasses)
    archiveFileName.set("openbubbles-wear-extension.jar")
    destinationDirectory.set(layout.buildDirectory.dir("extension"))
    from(extensionClasses.map { it.destinationDirectory })
    from(provider { zipTree(embeddedBridgeJar) }) { include("**/*.class") }
}

val extensionDexDirectory = layout.buildDirectory.dir("extension-dex")
val compileExtensionDex by tasks.registering(JavaExec::class) {
    dependsOn(extensionClassJar)
    mainClass.set("com.android.tools.r8.D8")
    classpath = d8
    inputs.file(extensionClassJar.flatMap { it.archiveFile })
    inputs.files(androidJar, appClassesJar, providedMorphe)
    outputs.dir(extensionDexDirectory)
    doFirst {
        extensionDexDirectory.get().asFile.mkdirs()
        args(
            "--release", "--min-api", "32",
            "--lib", androidJar.get(),
            "--classpath", appClassesJar.get().absolutePath,
            "--classpath", morpheCli.get().asFile.absolutePath,
            "--output", extensionDexDirectory.get().asFile.absolutePath,
            extensionClassJar.get().archiveFile.get().asFile.absolutePath,
        )
    }
}


tasks.register<Copy>("buildExtension") {
    dependsOn(compileExtensionDex)
    from(extensionDexDirectory) { include("classes.dex"); rename { "openbubbles-wear.mpe" } }
    into(layout.buildDirectory.dir("morphe"))
}

fun File.sha256(): String = MessageDigest.getInstance("SHA-256")
    .digest(readBytes()).joinToString("") { "%02x".format(it) }
