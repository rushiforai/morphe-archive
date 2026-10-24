import com.android.build.api.dsl.ApplicationExtension

plugins {
    id("org.jetbrains.kotlin.plugin.compose") version "2.3.21"
}

dependencies {
    implementation("androidx.media3:media3-exoplayer:1.5.1")
    implementation("androidx.activity:activity-compose:1.10.1")
    implementation("androidx.window:window:1.3.0")
    implementation("androidx.compose.ui:ui:1.8.3")
    implementation("androidx.compose.foundation:foundation:1.8.3")
    // Expressive is publicly available in the alpha API (hidden in 1.4 stable).
    implementation("androidx.compose.material3:material3:1.4.0-alpha18")
    implementation("androidx.compose.material:material-icons-core:1.7.8")
    implementation(files(rootProject.file("vpn/image-stack/prebuilt/image-stack.aar")))
    implementation(libs.hiddenapi)
    implementation("org.mozilla:rhino:1.8.0")
    implementation("dev.carlsen.mega:mega:1.0.0-beta08")
    implementation("io.ktor:ktor-client-core:3.3.2")
    implementation("io.ktor:ktor-client-okhttp:3.3.2")
    implementation("io.ktor:ktor-client-content-negotiation:3.3.2")
    implementation("io.ktor:ktor-serialization-kotlinx-json:3.3.2")
    implementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.10.2")
    implementation("org.jetbrains.kotlinx:kotlinx-coroutines-android:1.10.2")
    implementation("org.jetbrains.kotlinx:kotlinx-io-core:0.8.0")
    implementation("org.jetbrains.kotlinx:kotlinx-serialization-json:1.9.0")
}

configure<ApplicationExtension> {
    namespace = "app.morphe.extension.chmate"
    compileSdk = 36

    buildTypes {
        getByName("release") {
            proguardFiles("proguard-rules.pro")
            // MPE ships DEX without META-INF/services. Keep the Android fast
            // loader instead of consumer rules that force ServiceLoader.
            optimization.keepRules {
                ignoreFrom("org.jetbrains.kotlinx:kotlinx-coroutines-core",
                    "org.jetbrains.kotlinx:kotlinx-coroutines-core-jvm",
                    "org.jetbrains.kotlinx:kotlinx-coroutines-android")
            }
        }
    }

    defaultConfig {
        minSdk = 21
        buildConfigField("String", "HAIAGARU_VERSION", "\"${providers.gradleProperty("version").get()}\"")
    }

    buildFeatures.buildConfig = true
    buildFeatures.compose = true
    // Keep UI resource IDs separate from ChMate's 0x7f resource table.
    androidResources.additionalParameters.addAll(listOf("--package-id", "0x7d", "--allow-reserved-package-id"))

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}

// The upstream plugin renames every DEX to chmate.mpe. Preserve all R8 shards
// with distinct names instead of dropping classes when the extension grows.
tasks.named<Sync>("syncExtension") {
    eachFile {
        val dexName = file.name
        require(dexName.matches(Regex("classes(\\d+)?\\.dex"))) { "Unexpected extension DEX: $dexName" }
        name = if (dexName == "classes.dex") "chmate.mpe"
            else "chmate-${dexName.removePrefix("classes").removeSuffix(".dex")}.mpe"
    }
}

// The extension contributes bytecode; Compose also needs its strings and view tags.
// Ship a resource-only APK with a separate package ID, never host resource IDs.
val composeResourceArchive = tasks.register<Zip>("composeResourceArchive") {
    dependsOn("assembleRelease")
    from({ zipTree(layout.buildDirectory.file("outputs/apk/release/chmate-release-unsigned.apk")) }) {
        include("AndroidManifest.xml", "resources.arsc", "res/**")
    }
    entryCompression = ZipEntryCompression.STORED
    archiveFileName.set("haiagaru-ui-res-unaligned.apk")
    destinationDirectory.set(layout.buildDirectory.dir("compose-resources"))
}

val composeSdk = extensions.getByType<com.android.build.api.variant.ApplicationAndroidComponentsExtension>().sdkComponents.sdkDirectory
val composeBuildTools = extensions.getByType<ApplicationExtension>().buildToolsVersion
tasks.register<Exec>("composeResources") {
    dependsOn(composeResourceArchive)
    val source = composeResourceArchive.flatMap { it.archiveFile }
    val target = layout.buildDirectory.file("compose-resources/haiagaru-ui-res.apk")
    inputs.file(source)
    outputs.file(target)
    doFirst {
        val suffix = if (System.getProperty("os.name").startsWith("Windows")) ".exe" else ""
        val zipalign = composeSdk.get().file("build-tools/$composeBuildTools/zipalign$suffix").asFile
        commandLine(zipalign, "-f", "4", source.get().asFile, target.get().asFile)
    }
}
