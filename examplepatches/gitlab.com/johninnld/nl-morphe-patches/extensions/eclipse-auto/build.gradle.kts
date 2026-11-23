import com.android.build.api.variant.ApplicationAndroidComponentsExtension

extension { name = "extensions/eclipse-auto.mpe" }

val carAppVersion = "1.9.0-alpha03"
val carAppApiArchive by configurations.creating {
    isCanBeConsumed = false
    isTransitive = false
}

android {
    namespace = "nl.johninnl.eclipse.auto"
    defaultConfig { minSdk = 26 }
    buildTypes.getByName("release") {
        isMinifyEnabled = true
        proguardFiles("proguard-rules.pro")
    }
    testOptions { unitTests.isIncludeAndroidResources = true }
}

// Typed stand-ins for the app's obfuscated classes (see stubs/ and the patch's link check).
// They compile against the SDK only, are never packaged and are never seen by R8: the patch
// rewrites every reference to the app's real class and verifies it against the app's dex.
val sdk = extensions.getByType<ApplicationAndroidComponentsExtension>().sdkComponents
val compileEclipseStubs = tasks.register<JavaCompile>("compileEclipseStubs") {
    source(fileTree("stubs/src") { include("**/*.java") })
    classpath = files(sdk.bootClasspath)
    destinationDirectory.set(layout.buildDirectory.dir("eclipse-stubs/classes"))
    options.release.set(11)
}
// AGP only accepts jars on a compile-only file dependency, so the stub classes are jarred.
val eclipseStubsJar = tasks.register<Jar>("eclipseStubsJar") {
    from(compileEclipseStubs)
    archiveFileName.set("eclipse-stubs.jar")
    destinationDirectory.set(layout.buildDirectory.dir("eclipse-stubs"))
}

dependencies {
    testImplementation("junit:junit:4.13.2")
    testImplementation("org.robolectric:robolectric:4.16.1")
    implementation("androidx.car.app:app:$carAppVersion") {
        // The token crosses the host Binder boundary as the app's own compat class.
        exclude(group = "androidx.media", module = "media")
    }
    compileOnly(files(eclipseStubsJar))
    // Unit tests run the extension's own code against the stubs (the app's classes are absent).
    testImplementation(files(eclipseStubsJar))
    add(carAppApiArchive.name, "androidx.car.app:app:$carAppVersion@aar")
}

// Morphe exports DEX only. Carry the matching linked resource table separately so the
// resource patch can allocate target IDs and the bytecode patch can relocate references.
val packageCarResources = tasks.register("packageCarResources") {
    dependsOn("assembleRelease")
    val apk = layout.buildDirectory.file("outputs/apk/release/eclipse-auto-release-unsigned.apk")
    val output = layout.buildDirectory.file("morphe-resources/resources.zip")
    inputs.file(apk)
    inputs.file("package_resources.py")
    inputs.files(carAppApiArchive)
    outputs.file(output)
    doLast {
        providers.exec {
            commandLine("python3", project.file("package_resources.py"), apk.get().asFile, output.get().asFile,
                "--pinned-aar", carAppApiArchive.singleFile)
        }.result.get().assertNormalExitValue()
    }
}
project(":patches").tasks.withType<org.gradle.language.jvm.tasks.ProcessResources>().configureEach {
    dependsOn(packageCarResources)
    from(layout.buildDirectory.file("morphe-resources/resources.zip")) { into("eclipse-auto") }
}
