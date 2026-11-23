extension { name = "extensions/deezer-auto.mpe" }

val carAppVersion = "1.9.0-alpha03"
val carAppApiArchive by configurations.creating {
    isCanBeConsumed = false
    isTransitive = false
}

android {
    namespace = "nl.johninnl.deezer.auto"
    defaultConfig { minSdk = 26 }
    buildTypes.getByName("release") {
        isMinifyEnabled = true
        proguardFiles("proguard-rules.pro")
    }
}

dependencies {
    testImplementation("junit:junit:4.13.2")
    testImplementation(libs.gson)
    implementation("androidx.car.app:app:$carAppVersion") {
        // The token crosses the host Binder boundary using Deezer's existing compat ABI.
        exclude(group = "androidx.media", module = "media")
    }
    compileOnly("androidx.media:media:1.6.0")
    add(carAppApiArchive.name, "androidx.car.app:app:$carAppVersion@aar")
}

// Morphe exports DEX only. Carry the matching linked resource table separately so the
// resource patch can allocate target IDs and the bytecode patch can relocate references.
val packageCarResources = tasks.register("packageCarResources") {
    dependsOn("assembleRelease")
    val apk = layout.buildDirectory.file("outputs/apk/release/deezer-auto-release-unsigned.apk")
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
    from(layout.buildDirectory.file("morphe-resources/resources.zip")) { into("deezer-auto") }
}
