import java.io.File
import java.io.FileOutputStream
import java.util.zip.CRC32
import java.util.zip.ZipEntry
import java.util.zip.ZipFile
import java.util.zip.ZipOutputStream

plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
    id("org.jetbrains.kotlin.plugin.compose")
    id("org.jetbrains.kotlin.plugin.serialization")
}

android {
    namespace = "app.sadmod.client"
    compileSdk = 35

    defaultConfig {
        applicationId = "app.sadmod.client"
        minSdk = 26
        targetSdk = 35
        versionCode = 1
        versionName = "1.0.0"

        testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
    }

    dependenciesInfo {
        includeInApk = false
        includeInBundle = false
    }

    packaging {
        resources {
            excludes += setOf(
                "META-INF/*.version",
                "kotlin-tooling-metadata.json",
                "DebugProbesKt.bin"
            )
        }
    }

    buildTypes {
        release {
            isMinifyEnabled = true
            isShrinkResources = false
            signingConfig = signingConfigs.getByName("debug")
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                rootProject.file("extensions/proguard-rules.pro")
            )
        }
        debug {
            applicationIdSuffix = ".debug"
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
    kotlinOptions {
        jvmTarget = "17"
    }
    buildFeatures {
        compose = true
    }
}

dependencies {
    implementation("androidx.core:core-ktx:1.15.0")
    implementation("androidx.activity:activity-compose:1.9.3")
    implementation("androidx.lifecycle:lifecycle-runtime-ktx:2.8.7")
    implementation("androidx.lifecycle:lifecycle-viewmodel-compose:2.8.7")

    implementation(platform("androidx.compose:compose-bom:2024.12.01"))
    implementation("androidx.compose.ui:ui")
    implementation("androidx.compose.ui:ui-graphics")
    implementation("androidx.compose.ui:ui-tooling-preview")
    implementation("androidx.compose.material3:material3:1.3.1")
    implementation("androidx.compose.material:material-icons-extended")
    implementation("androidx.navigation:navigation-compose:2.8.5")

    implementation("com.squareup.okhttp3:okhttp:4.12.0")
    implementation("com.squareup.okhttp3:okhttp-dnsoverhttps:4.12.0")
    implementation("org.jetbrains.kotlinx:kotlinx-serialization-json:1.7.3")
    implementation("io.coil-kt.coil3:coil-compose:3.0.4")
    implementation("io.coil-kt.coil3:coil-network-okhttp:3.0.4")
    implementation("com.android.tools.build:apksig:8.7.3")

    testImplementation("junit:junit:4.13.2")
    testImplementation("com.android.tools.build:apksig:8.7.3")
}

val prepareMorpheArtifacts by tasks.registering {
    dependsOn("assembleRelease")

    val apkDir = layout.buildDirectory.dir("outputs/apk/release")
    val outDir = layout.buildDirectory.dir("morphe-out")
    val assetsDir = layout.projectDirectory.dir("src/main/assets")

    inputs.dir(apkDir)
    inputs.dir(assetsDir)
    outputs.dir(outDir)

    doLast {
        val releaseApk = apkDir.get().asFile.listFiles()
            ?.firstOrNull { it.extension == "apk" && !it.name.contains("unsigned") }
            ?: apkDir.get().asFile.listFiles()?.firstOrNull { it.extension == "apk" }
            ?: error("Release APK not found in ${apkDir.get().asFile}")

        val destRoot = outDir.get().asFile
        destRoot.deleteRecursively()
        val extDir = File(destRoot, "extensions").apply { mkdirs() }
        val sadmodResDir = File(destRoot, "sadmod").apply { mkdirs() }

        val resApkFile = File(sadmodResDir, "sadmod_res.apk")
        ZipFile(releaseApk).use { zf ->
            val dexEntries = zf.entries().asSequence()
                .filter { !it.isDirectory && it.name.matches(Regex("classes\\d*\\.dex")) }
                .toList()
            require(dexEntries.size == 1 && dexEntries.first().name == "classes.dex") {
                "Expected single classes.dex in extension APK, found: ${dexEntries.map { it.name }}"
            }

            // 1. Export raw extension DEX for Morphe extendWith("extensions/sadmod.mpe")
            zf.getInputStream(dexEntries.first()).use { ins ->
                File(extDir, "sadmod.mpe").outputStream().use { out -> ins.copyTo(out) }
            }

            // 2. Export native libs & isolated Compose/Material3 resource APK
            ZipOutputStream(FileOutputStream(resApkFile)).use { zos ->
                val entries = zf.entries()
                while (entries.hasMoreElements()) {
                    val entry = entries.nextElement()
                    val name = entry.name
                    if (entry.isDirectory) continue

                    if (name.startsWith("lib/") && name.endsWith(".so")) {
                        val libOut = File(sadmodResDir, name).apply { parentFile?.mkdirs() }
                        zf.getInputStream(entry).use { ins ->
                            libOut.outputStream().use { out -> ins.copyTo(out) }
                        }
                        continue
                    }

                    if (name.startsWith("classes") && name.endsWith(".dex")) continue
                    if (name.startsWith("META-INF/")) continue
                    if (name == "kotlin-tooling-metadata.json" || name == "DebugProbesKt.bin") continue
                    if (name.startsWith("lib/")) continue

                    val data = zf.getInputStream(entry).use { it.readBytes() }
                    val outEntry = ZipEntry(name).apply {
                        time = 0L
                        if (name == "resources.arsc") {
                            method = ZipEntry.STORED
                            size = data.size.toLong()
                            compressedSize = data.size.toLong()
                            crc = CRC32().apply { update(data) }.value
                        } else {
                            method = ZipEntry.DEFLATED
                        }
                    }
                    zos.putNextEntry(outEntry)
                    zos.write(data)
                    zos.closeEntry()
                }
            }
        }

        // 3. Copy embedded local permission-editor signing assets
        listOf("patch_signer.pk8", "patch_signer.der").forEach { assetName ->
            val src = assetsDir.file(assetName).asFile
            require(src.exists()) { "Missing asset: ${src.absolutePath}" }
            src.copyTo(File(sadmodResDir, assetName), overwrite = true)
        }
    }
}
