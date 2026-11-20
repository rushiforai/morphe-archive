import java.util.Properties
group = "app.aidan"

patches {
    about {
        name = "Aidan's Patches"
        description = "My Morphe patches; mainly focused on financial and productivity/utility apps"
        source = "git@github.com:ihatenodejs/aidans-patches.git"
        author = "Aidan"
        contact = "https://github.com/ihatenodejs/aidans-patches/issues"
        website = "https://github.com/ihatenodejs/aidans-patches"
        license = "WTFPL"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

val pdfboxConfig = configurations.create("pdfboxConfig") {
    isCanBeConsumed = false
    isCanBeResolved = true
    isTransitive = false
}

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
    pdfboxConfig(libs.pdfbox.android)
}
val emojiFontDir = layout.buildDirectory.dir("generated/resources/emojiFont")
val outputFontFile = emojiFontDir.map { it.file("fonts/AppleColorEmoji.ttf") }

val prepareEmojiFont = tasks.register<Exec>("prepareEmojiFont") {
    description = "Downloads and transforms Apple Color Emoji font for Fizz"
    outputs.file(outputFontFile)

    val fontCacheDir = File(gradle.gradleUserHomeDir, "caches/aidans-patches/fonts")
    val scriptFile = rootProject.file(".github/scripts/prepare_emoji_font.py")

    inputs.file(scriptFile)
    inputs.property("scriptVersion", "1.0.1")

    workingDir = rootDir
    doFirst {
        fontCacheDir.mkdirs()
        outputFontFile.get().asFile.parentFile.mkdirs()
    }

    commandLine(
        "python3",
        scriptFile.absolutePath,
        "--output",
        outputFontFile.get().asFile.absolutePath,
        "--cache-dir",
        fontCacheDir.absolutePath,
    )
}

val nhlAdblockNativeDir = layout.buildDirectory.dir("generated/resources/nhlAdblockNative")
val outputNhlAdblockSo = nhlAdblockNativeDir.map { it.file("nhl/adblock/libnhladblock.so") }
val REQUIRED_NDK_VERSION = "28.2.13676358"

fun resolveSdkDir(): File? {
    val envSdk = System.getenv("ANDROID_HOME") ?: System.getenv("ANDROID_SDK_ROOT")
    if (!envSdk.isNullOrBlank()) {
        return File(envSdk)
    }
    val localProps = rootProject.file("local.properties")
    if (localProps.exists()) {
        val props = Properties().apply { localProps.inputStream().use { load(it) } }
        val dir = props.getProperty("sdk.dir")
        if (!dir.isNullOrBlank()) return File(dir)
    }
    return null
}

fun resolveHostTag(): String {
    val osName = System.getProperty("os.name").lowercase()
    return when {
        osName.contains("mac") || osName.contains("darwin") -> "darwin-x86_64"
        osName.contains("linux") -> "linux-x86_64"
        osName.contains("windows") -> "windows-x86_64"
        else -> throw GradleException("Unsupported host operating system for NDK toolchain: $osName")
    }
}

fun getNdkRevision(dir: File): String? {
    val propsFile = File(dir, "source.properties")
    if (!propsFile.exists()) return null
    return runCatching {
        val props = Properties().apply { propsFile.inputStream().use { load(it) } }
        props.getProperty("Pkg.Revision")?.trim()
    }.getOrNull()
}

fun resolveNdkDir(sdkDir: File?): File {
    val candidates = mutableListOf<File>()

    val ndkHomeEnv = System.getenv("ANDROID_NDK_HOME")
    if (!ndkHomeEnv.isNullOrBlank()) {
        val f = File(ndkHomeEnv)
        if (f.exists()) candidates.add(f)
    }

    val localProps = rootProject.file("local.properties")
    if (localProps.exists()) {
        val props = Properties().apply { localProps.inputStream().use { load(it) } }
        val dir = props.getProperty("ndk.dir")
        if (!dir.isNullOrBlank()) {
            val f = File(dir)
            if (f.exists()) candidates.add(f)
        }
    }

    if (sdkDir != null && sdkDir.exists()) {
        val d = File(sdkDir, "ndk/$REQUIRED_NDK_VERSION")
        if (d.exists()) candidates.add(d)
    }

    for (candidate in candidates) {
        val rev = getNdkRevision(candidate)
        if (rev == REQUIRED_NDK_VERSION || (rev == null && candidate.name == REQUIRED_NDK_VERSION)) {
            return candidate
        }
    }

    for (candidate in candidates) {
        val rev = getNdkRevision(candidate)
        if (rev != null && rev != REQUIRED_NDK_VERSION) {
            throw GradleException(
                "Android NDK version mismatch at ${candidate.absolutePath}: found revision $rev, but REQUIRED_NDK_VERSION is $REQUIRED_NDK_VERSION. Install NDK $REQUIRED_NDK_VERSION."
            )
        }
    }

    val baseSdk = sdkDir ?: throw GradleException("Could not resolve Android SDK path for NDK compilation. Set ANDROID_HOME or local.properties.")
    val d = File(baseSdk, "ndk/$REQUIRED_NDK_VERSION")
    throw GradleException("Required Android NDK $REQUIRED_NDK_VERSION not found at ${d.absolutePath}. Install NDK $REQUIRED_NDK_VERSION.")
}

val buildNhlAdblockNative = tasks.register<Exec>("buildNhlAdblockNative") {
    description = "Compiles native Rust adblock engine for arm64-v8a"
    val nativeDir = rootProject.file("extensions/nhl-adblock-native")
    inputs.dir(File(nativeDir, "src"))
    inputs.file(File(nativeDir, "Cargo.toml"))
    if (File(nativeDir, "Cargo.lock").exists()) {
        inputs.file(File(nativeDir, "Cargo.lock"))
    }
    outputs.file(outputNhlAdblockSo)

    workingDir = nativeDir

    doFirst {
        val sdkDir = resolveSdkDir()
        val ndkDir = resolveNdkDir(sdkDir)
        val hostTag = resolveHostTag()
        val clangFile = File(ndkDir, "toolchains/llvm/prebuilt/$hostTag/bin/aarch64-linux-android29-clang")
        if (!clangFile.exists()) {
            throw GradleException("NDK clang compiler not found at ${clangFile.absolutePath}")
        }

        environment("CARGO_TARGET_AARCH64_LINUX_ANDROID_LINKER", clangFile.absolutePath)
        environment("RUSTFLAGS", "-C link-arg=-Wl,-z,max-page-size=16384")
    }

    commandLine(
        "cargo",
        "build",
        "--release",
        "--target",
        "aarch64-linux-android",
        "--manifest-path",
        File(nativeDir, "Cargo.toml").absolutePath,
    )

    doLast {
        val builtSo = File(nativeDir, "target/aarch64-linux-android/release/libnhladblock.so")
        if (!builtSo.exists()) {
            throw GradleException("Cargo succeeded but output binary not found at ${builtSo.absolutePath}")
        }
        val dest = outputNhlAdblockSo.get().asFile
        dest.parentFile.mkdirs()
        builtSo.copyTo(dest, overwrite = true)
    }
}
val adobeScanPdfNativeDir = layout.buildDirectory.dir("generated/resources/adobeScanPdfNative")
val outputAdobeScanPdfSo = adobeScanPdfNativeDir.map { it.file("adobescan/pdf/arm64-v8a/libaidanscanpdf.so") }


val buildAdobeScanPdfNative = tasks.register<Exec>("buildAdobeScanPdfNative") {
    description = "Compiles native qpdf/jpeg engine for Adobe Scan arm64-v8a"
    val nativeDir = rootProject.file("extensions/adobescan-pdf-native")
    inputs.dir(File(nativeDir, "src"))
    inputs.dir(File(nativeDir, "cmake"))
    inputs.file(File(nativeDir, "CMakeLists.txt"))
    outputs.file(outputAdobeScanPdfSo)

    workingDir = nativeDir

    doFirst {
        val sdkDir = resolveSdkDir()
        val ndkDir = resolveNdkDir(sdkDir)

        fun findExecutable(name: String): String {
            val pathEnv = System.getenv("PATH") ?: ""
            for (p in pathEnv.split(File.pathSeparator)) {
                val candidate = File(p, name)
                if (candidate.canExecute()) {
                    return candidate.absolutePath
                }
            }
            if (sdkDir != null && sdkDir.exists()) {
                val cmakeParent = File(sdkDir, "cmake")
                if (cmakeParent.exists()) {
                    val versions = cmakeParent.listFiles()?.filter { it.isDirectory }?.sortedDescending()
                    if (versions != null) {
                        for (vDir in versions) {
                            val bin = File(vDir, "bin/$name")
                            if (bin.canExecute()) {
                                return bin.absolutePath
                            }
                        }
                    }
                }
            }
            throw GradleException(
                "Required build tool '$name' not found in PATH or Android SDK cmake directory. " +
                "Please install $name (e.g. via Android SDK Manager or your system package manager)."
            )
        }

        val cmakeBin = findExecutable("cmake")
        val ninjaBin = findExecutable("ninja")

        val cmakeToolchain = File(ndkDir, "build/cmake/android.toolchain.cmake")
        if (!cmakeToolchain.exists()) {
            throw GradleException("Android CMake toolchain not found at ${cmakeToolchain.absolutePath}")
        }

        val buildDir = File(nativeDir, "build/android-arm64-v8a")
        buildDir.mkdirs()

        val configProcess = ProcessBuilder(
            cmakeBin,
            "-S", nativeDir.absolutePath,
            "-B", buildDir.absolutePath,
            "-G", "Ninja",
            "-DCMAKE_MAKE_PROGRAM=${File(ninjaBin).absolutePath}",
            "-DCMAKE_TOOLCHAIN_FILE=${cmakeToolchain.absolutePath}",
            "-DANDROID_ABI=arm64-v8a",
            "-DANDROID_PLATFORM=android-32",
            "-DCMAKE_BUILD_TYPE=Release",
            "-DCMAKE_DISABLE_FIND_PACKAGE_PkgConfig=ON",
            "-DPKG_CONFIG_EXECUTABLE=PKG_CONFIG_EXECUTABLE-NOTFOUND"
        ).directory(nativeDir).inheritIO().start()
        val configExit = configProcess.waitFor()
        if (configExit != 0) {
            throw GradleException("CMake configure failed with exit code $configExit")
        }

        setCommandLine(ninjaBin, "-C", buildDir.absolutePath, "aidanscanpdf")
    }

    commandLine("ninja", "-C", File(nativeDir, "build/android-arm64-v8a").absolutePath, "aidanscanpdf")

    doLast {
        val builtSo = File(nativeDir, "build/android-arm64-v8a/libaidanscanpdf.so")
        if (!builtSo.exists()) {
            throw GradleException("Ninja succeeded but output binary not found at ${builtSo.absolutePath}")
        }
        val dest = outputAdobeScanPdfSo.get().asFile
        dest.parentFile.mkdirs()
        builtSo.copyTo(dest, overwrite = true)

        val sdkDir = resolveSdkDir()
        val ndkDir = resolveNdkDir(sdkDir)
        val hostTag = resolveHostTag()
        val exeSuffix = if (System.getProperty("os.name").lowercase().contains("windows")) ".exe" else ""
        val stripTool = File(ndkDir, "toolchains/llvm/prebuilt/$hostTag/bin/llvm-strip$exeSuffix")
        if (!stripTool.exists()) {
            throw GradleException("llvm-strip binary not found at ${stripTool.absolutePath}")
        }
        val stripExit = ProcessBuilder(stripTool.absolutePath, "--strip-unneeded", dest.absolutePath)
            .inheritIO().start().waitFor()
        if (stripExit != 0) {
            throw GradleException("llvm-strip failed with exit code $stripExit")
        }
    }
}
val outputAdobeScanOcrModel = adobeScanPdfNativeDir.map { it.file("adobescan/pdf/ocr/eng.traineddata") }
val prepareAdobeScanOcrModel = tasks.register<Exec>("prepareAdobeScanOcrModel") {
    description = "Downloads and caches verified tessdata_fast eng.traineddata for Adobe Scan"
    outputs.file(outputAdobeScanOcrModel)

    val ocrCacheDir = File(gradle.gradleUserHomeDir, "caches/aidans-patches/ocr")
    val scriptFile = rootProject.file(".github/scripts/prepare_ocr_model.py")

    inputs.file(scriptFile)
    inputs.property("modelVersion", "4.1.0-65727574")

    workingDir = rootDir
    doFirst {
        ocrCacheDir.mkdirs()
        outputAdobeScanOcrModel.get().asFile.parentFile.mkdirs()
    }

    commandLine(
        "python3",
        scriptFile.absolutePath,
        "--output",
        outputAdobeScanOcrModel.get().asFile.absolutePath,
        "--cache-dir",
        ocrCacheDir.absolutePath,
    )
}

val outputPdfBoxAssetsZip = adobeScanPdfNativeDir.map { it.file("adobescan/pdf/assets/pdfbox-assets.zip") }
val preparePdfBoxAssets = tasks.register<Exec>("preparePdfBoxAssets") {
    description = "Extracts and packages PDFBox assets into a zip for Adobe Scan"
    outputs.file(outputPdfBoxAssetsZip)

    val scriptFile = rootProject.file(".github/scripts/prepare_pdfbox_assets.py")
    inputs.file(scriptFile)
    inputs.property("pdfBoxVersion", libs.versions.pdfbox.android.get())
    inputs.files(pdfboxConfig)

    workingDir = rootDir
    doFirst {
        outputPdfBoxAssetsZip.get().asFile.parentFile.mkdirs()
        val aarFile = pdfboxConfig.files.firstOrNull { it.name.endsWith(".aar") }
            ?: throw GradleException("Could not resolve pdfbox-android AAR dependency from pdfboxConfig configuration.")
        commandLine(
            "python3",
            scriptFile.absolutePath,
            "--output",
            outputPdfBoxAssetsZip.get().asFile.absolutePath,
            "--gradle-home",
            gradle.gradleUserHomeDir.absolutePath,
            "--version",
            libs.versions.pdfbox.android.get(),
            "--aar",
            aarFile.absolutePath,
        )
    }

    commandLine(
        "python3",
        scriptFile.absolutePath,
        "--output",
        outputPdfBoxAssetsZip.get().asFile.absolutePath,
        "--gradle-home",
        gradle.gradleUserHomeDir.absolutePath,
        "--version",
        libs.versions.pdfbox.android.get(),
    )
}



sourceSets["main"].resources.srcDir(emojiFontDir)
sourceSets["main"].resources.srcDir(nhlAdblockNativeDir)
sourceSets["main"].resources.srcDir(adobeScanPdfNativeDir)

tasks {
    clean {
        doLast {
            rootProject.file("extensions/adobescan-pdf-native/build").deleteRecursively()
        }
    }
    named("processResources") {
        dependsOn(prepareEmojiFont)
        dependsOn(buildNhlAdblockNative)
        dependsOn(buildAdobeScanPdfNative)
        dependsOn(prepareAdobeScanOcrModel)
        dependsOn(preparePdfBoxAssets)
    }
    named("sourcesJar") {
        dependsOn(prepareEmojiFont)
        dependsOn(buildNhlAdblockNative)
        dependsOn(buildAdobeScanPdfNative)
        dependsOn(prepareAdobeScanOcrModel)
        dependsOn(preparePdfBoxAssets)
    }

    named("build") {
        finalizedBy("buildAndroid")
    }

    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn("buildAndroid")

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}
