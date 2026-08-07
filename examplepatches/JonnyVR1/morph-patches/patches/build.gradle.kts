group = "app.tantan"

patches {
    about {
        name = "Morph Patches"
        description = "Custom Morphe patches for multiple apps"
        source = "git@github.com:JonnyVR1/morph-patches.git"
        author = "JonnyVR1"
        contact = "na"
        website = "https://github.com/JonnyVR1/morph-patches"
        license = "GPLv3"
    }
    extensionsProjectPath = ":extensions:signature"
}

kotlin {
    compilerOptions {
        freeCompilerArgs.add("-Xcontext-parameters")
        jvmTarget.set(org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17)
    }
}

java {
    sourceCompatibility = JavaVersion.VERSION_17
    targetCompatibility = JavaVersion.VERSION_17
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath: Configuration by configurations.creating

dependencies {
    compileOnly(libs.gson)
    compileOnly("com.google.android:android:4.1.1.4")
    patchListGeneratorClasspath(libs.gson)
    implementation("org.bouncycastle:bcpkix-jdk18on:1.78.1")
    implementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.10.2")
    testImplementation("org.jetbrains.kotlin:kotlin-test:2.2.21")
}

tasks {
    register<JavaExec>("extractApkSignature") {
        description = "Extract APK signature hash"
        classpath = sourceSets["main"].runtimeClasspath
        mainClass.set("util.ExtractApkSignatureKt")
        
        // Use command line argument if provided, otherwise default to tantan-7.3.6.apk
        val apkPath = if (project.hasProperty("apkPath")) {
            project.property("apkPath") as String
        } else {
            rootProject.file("tantan-7.3.6.apk").absolutePath
        }
        args = listOf(apkPath)
    }

    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }

    // Repack the .mpp to include patches-list.json at the root.
    // The Morphe Manager app reads patches-list.json from inside the .mpp
    // to discover available patches. Without this step, the app shows 0 patches.
    register("repackMppWithPatchList") {
        description = "Add patches-list.json into the .mpp bundle for Morphe Manager discovery"
        dependsOn("buildAndroid", "generatePatchesList")

        doLast {
            val mppFile = file("build/libs/patches-0.0.1-dev2.mpp")
            val patchListFile = rootProject.file("patches-list.json")

            if (!mppFile.exists()) throw GradleException("mpp file not found: ${mppFile.absolutePath}")
            if (!patchListFile.exists()) throw GradleException("patches-list.json not found: ${patchListFile.absolutePath}")

            // Use command-line zip to add patches-list.json at the root of the .mpp
            val tempFile = File.createTempFile("patches-repack-", ".mpp")
            try {
                // Copy original mpp
                mppFile.copyTo(tempFile, overwrite = true)
                // Use Runtime.exec to add patches-list.json with -j (junk paths, store at root)
                val process = Runtime.getRuntime().exec(arrayOf("zip", "-j", tempFile.absolutePath, patchListFile.absolutePath))
                process.waitFor()
                tempFile.renameTo(mppFile)
                println("Repacked ${mppFile.name} with patches-list.json (${mppFile.length()} bytes)")
            } finally {
                if (tempFile.exists()) tempFile.delete()
            }
        }
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("repackMppWithPatchList")
    }
}

tasks.register<JavaExec>("patchApk") {
    dependsOn("jar")
    classpath = sourceSets["main"].runtimeClasspath + files(tasks.jar.get().archiveFile)
    mainClass.set("app.morphe.PatcherMainKt")
    val apkFile = rootProject.file("tantan-tribe-extracted/com.tantantribe.tribe.apk")
    val outputApk = rootProject.file("tantan-premium-unlocked.apk")
    args = listOf(apkFile.absolutePath, outputApk.absolutePath)
}

tasks.register<JavaExec>("signApk") {
    dependsOn("jar")
    classpath = sourceSets["main"].runtimeClasspath + files(tasks.jar.get().archiveFile)
    mainClass.set("app.morphe.SignApkKt")
    val inputApk = rootProject.file("tantan-tribe-extracted/com.tantantribe.tribe.apk")
    val outputApk = rootProject.file("tantan-signed.apk")
    args = listOf(inputApk.absolutePath, outputApk.absolutePath)
}
