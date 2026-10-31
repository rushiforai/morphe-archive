import java.net.URI
import java.nio.file.Files
import java.nio.file.StandardCopyOption
import java.security.MessageDigest
import java.util.zip.ZipFile
import org.gradle.api.attributes.Attribute
import org.gradle.api.attributes.Category
import org.gradle.api.attributes.Usage

plugins { `java-library` }
require(JavaVersion.current().isCompatibleWith(JavaVersion.VERSION_21)) {
    "LiteRT-LM 0.18.1 ships Java 21 class files; run Gradle with JDK 21 or newer."
}
java { sourceCompatibility = JavaVersion.VERSION_1_8; targetCompatibility = JavaVersion.VERSION_1_8 }
val androidSdk = providers.environmentVariable("ANDROID_HOME").orElse(providers.environmentVariable("ANDROID_SDK_ROOT"))
val androidJar = androidSdk.map { file("$it/platforms/android-36/android.jar") }
val whisperCommit = "d1be6fde11ac6e0407606b4e42fe72d34add8037" // official v1.9.5
val whisperSourceSha256 = "645445da884df6dbd52b30f82d7be7c01d1767c938714e477e786b88d529e9f4"
val ndkVersion = "29.0.14206865"
val cmakeVersion = "3.22.1"
val engineAbis = listOf("arm64-v8a", "x86_64")
val whisperSource = layout.buildDirectory.dir("whisper-source/whisper.cpp-$whisperCommit")
val downloadWhisperSource = tasks.register("downloadWhisperSource") {
    val archive = layout.buildDirectory.file("downloads/whisper-$whisperCommit.tar.gz")
    inputs.property("commit", whisperCommit)
    inputs.property("sha256", whisperSourceSha256)
    outputs.file(archive)
    doLast {
        val target = archive.get().asFile
        target.parentFile.mkdirs()
        val pending = File(target.path + ".pending")
        try {
            val connection = URI("https://codeload.github.com/ggml-org/whisper.cpp/tar.gz/$whisperCommit").toURL().openConnection()
            connection.connectTimeout = 30_000
            connection.readTimeout = 60_000
            val digest = MessageDigest.getInstance("SHA-256")
            connection.getInputStream().use { input ->
                pending.outputStream().use { output ->
                    val buffer = ByteArray(64 * 1024)
                    while (true) {
                        val count = input.read(buffer)
                        if (count < 0) break
                        digest.update(buffer, 0, count)
                        output.write(buffer, 0, count)
                    }
                }
            }
            require(digest.digest().joinToString("") { "%02x".format(it.toInt() and 255) } == whisperSourceSha256) {
                "Whisper source archive digest does not match the pinned upstream commit"
            }
            Files.move(pending.toPath(), target.toPath(), StandardCopyOption.REPLACE_EXISTING)
        } finally { pending.delete() }
    }
}
val prepareWhisperSources = tasks.register("prepareWhisperSources") {
    dependsOn(downloadWhisperSource)
    val archive = layout.buildDirectory.file("downloads/whisper-$whisperCommit.tar.gz")
    inputs.file(archive)
    outputs.dir(whisperSource)
    doLast {
        val compressed = archive.get().asFile
        val digest = MessageDigest.getInstance("SHA-256")
        compressed.inputStream().use { input ->
            val buffer = ByteArray(64 * 1024)
            while (true) {
                val count = input.read(buffer)
                if (count < 0) break
                digest.update(buffer, 0, count)
            }
        }
        require(digest.digest().joinToString("") { "%02x".format(it.toInt() and 255) } == whisperSourceSha256) {
            "Cached Whisper source archive failed integrity verification"
        }
        val root = layout.buildDirectory.dir("whisper-source").get().asFile
        root.deleteRecursively()
        copy { from(tarTree(resources.gzip(compressed))); into(root) }
    }
}
// Header-only Khronos SDK dependencies; the Android loader and host glslc come from the pinned NDK.
val vulkanHeadersCommit = "b5c8f996196ba4aa6d8f97e52b5d3b6e70f7e4e2" // vulkan-sdk-1.4.341.0
val spirvHeadersCommit = "04f10f650d514df88b76d25e83db360142c7b174" // vulkan-sdk-1.4.341.0
val vulkanHeaders = layout.buildDirectory.dir("vulkan-headers/Vulkan-Headers-$vulkanHeadersCommit")
val spirvHeaders = layout.buildDirectory.dir("vulkan-headers/SPIRV-Headers-$spirvHeadersCommit")
val prepareVulkanHeaders = tasks.register("prepareVulkanHeaders") {
    val sources = listOf(
        Triple("Vulkan-Headers", vulkanHeadersCommit, "7937d8ec21785736436d9ff52564db7d55992070b5ac98324472cce6e425a7ba"),
        Triple("SPIRV-Headers", spirvHeadersCommit, "1b220e3eec1714f0451b0e3652979bd280edf10893f617837b88e6359a804ded")
    )
    inputs.property("sources", sources.map { it.toString() })
    outputs.dirs(vulkanHeaders, spirvHeaders)
    doLast {
        val destination = layout.buildDirectory.dir("vulkan-headers").get().asFile
        for ((repository, commit, expected) in sources) {
            val archive = layout.buildDirectory.file("downloads/$repository-$commit.tar.gz").get().asFile
            archive.parentFile.mkdirs()
            if (!archive.isFile) {
                val pending = File(archive.path + ".pending")
                try {
                    val connection = URI("https://codeload.github.com/KhronosGroup/$repository/tar.gz/$commit").toURL().openConnection()
                    connection.connectTimeout = 30_000
                    connection.readTimeout = 60_000
                    connection.getInputStream().use { input -> pending.outputStream().use { input.copyTo(it) } }
                    Files.move(pending.toPath(), archive.toPath(), StandardCopyOption.REPLACE_EXISTING)
                } finally { pending.delete() }
            }
            val digest = MessageDigest.getInstance("SHA-256")
            archive.inputStream().use { input ->
                val buffer = ByteArray(64 * 1024)
                while (true) {
                    val count = input.read(buffer)
                    if (count < 0) break
                    digest.update(buffer, 0, count)
                }
            }
            require(digest.digest().joinToString("") { "%02x".format(it.toInt() and 255) } == expected) {
                "$repository source archive failed integrity verification"
            }
            destination.resolve("$repository-$commit").deleteRecursively()
            copy { from(tarTree(resources.gzip(archive))); into(destination) }
        }
    }
}
val spirvPackage = layout.buildDirectory.dir("spirv-package")
val spirvConfigureDirectory = layout.buildDirectory.dir("spirv-cmake")
val configureSpirvHeaders = tasks.register<Exec>("configureSpirvHeaders") {
    dependsOn(prepareVulkanHeaders)
    inputs.dir(spirvHeaders)
    inputs.property("cmake", cmakeVersion)
    outputs.file(spirvConfigureDirectory.map { it.file("CMakeCache.txt") })
    outputs.file(spirvConfigureDirectory.map { it.file("cmake_install.cmake") })
    doFirst {
        commandLine("${androidSdk.get()}/cmake/$cmakeVersion/bin/cmake",
            "-S", spirvHeaders.get().asFile.absolutePath, "-B", spirvConfigureDirectory.get().asFile.absolutePath,
            "-G", "Ninja", "-DCMAKE_MAKE_PROGRAM=${androidSdk.get()}/cmake/$cmakeVersion/bin/ninja",
            "-DCMAKE_INSTALL_PREFIX=${spirvPackage.get().asFile.absolutePath}", "-DSPIRV_HEADERS_ENABLE_TESTS=OFF",
            "-DSPIRV_HEADERS_ENABLE_INSTALL=ON")
    }
}
val installSpirvHeaders = tasks.register<Exec>("installSpirvHeaders") {
    dependsOn(configureSpirvHeaders)
    inputs.dir(spirvHeaders)
    inputs.file(spirvConfigureDirectory.map { it.file("cmake_install.cmake") })
    outputs.dir(spirvPackage)
    doFirst {
        commandLine("${androidSdk.get()}/cmake/$cmakeVersion/bin/cmake", "--install",
            spirvConfigureDirectory.get().asFile.absolutePath)
    }
}
val hostOs = System.getProperty("os.name").lowercase()
val shaderHost = when {
    hostOs.contains("linux") -> "linux-x86_64"
    hostOs.contains("mac") -> "darwin-x86_64"
    hostOs.contains("windows") -> "windows-x86_64"
    else -> error("Unsupported NDK shader compiler host: $hostOs")
}
val shaderExecutable = if (hostOs.contains("windows")) "glslc.exe" else "glslc"
val whisperGlslc = providers.environmentVariable("WHISPER_GLSLC")
    .orElse(androidSdk.map { "$it/ndk/$ndkVersion/shader-tools/$shaderHost/$shaderExecutable" })
val whisperNativeBuilds = engineAbis.flatMap { abi ->
    listOf(false, true).map { vulkan ->
        val suffix = abi.replace("-", "_") + if (vulkan) "_vulkan" else ""
        val variant = if (vulkan) "vulkan" else "cpu"
        val target = if (vulkan) "ebpatcher_whisper_vulkan" else "ebpatcher_whisper"
        val directory = layout.buildDirectory.dir("native/$abi/$variant")
        val configure = tasks.register<Exec>("configureWhisper_$suffix") {
            dependsOn(prepareWhisperSources)
            inputs.dir("src/main/cpp")
            inputs.dir(whisperSource)
            inputs.property("ndk", ndkVersion)
            inputs.property("cmake", cmakeVersion)
            inputs.property("abi", abi)
            inputs.property("vulkan", vulkan)
            if (vulkan) {
                dependsOn(installSpirvHeaders)
                inputs.dir(vulkanHeaders)
                inputs.dir(spirvPackage)
                inputs.file(whisperGlslc)
            }
            outputs.file(directory.map { it.file("CMakeCache.txt") })
            outputs.file(directory.map { it.file("build.ninja") })
            doFirst {
                // Never inherit this enclosing repository's commit/dirty state into upstream build info.
                environment("GIT_CEILING_DIRECTORIES", whisperSource.get().asFile.parentFile.absolutePath)
                environment("SOURCE_DATE_EPOCH", "0")
                val sdkRoot = androidSdk.get()
                val cmake = "$sdkRoot/cmake/$cmakeVersion/bin/cmake"
                val ndk = "$sdkRoot/ndk/$ndkVersion"
                require(file(cmake).isFile && file("$ndk/build/cmake/android.toolchain.cmake").isFile) {
                    "Install SDK packages ndk;$ndkVersion and cmake;$cmakeVersion"
                }
                val arguments = mutableListOf(cmake, "-S", file("src/main/cpp").absolutePath, "-B", directory.get().asFile.absolutePath,
                    "-G", "Ninja", "-DCMAKE_MAKE_PROGRAM=$sdkRoot/cmake/$cmakeVersion/bin/ninja",
                    "-DCMAKE_TOOLCHAIN_FILE=$ndk/build/cmake/android.toolchain.cmake",
                    "-DANDROID_ABI=$abi", "-DANDROID_PLATFORM=android-29", "-DANDROID_STL=c++_static",
                    "-DCMAKE_BUILD_TYPE=Release", "-DWHISPER_SOURCE_DIR=${whisperSource.get().asFile.absolutePath}",
                    "-DEBPATCHER_VULKAN=${if (vulkan) "ON" else "OFF"}",
                    "-DCMAKE_LIBRARY_OUTPUT_DIRECTORY=${directory.get().asFile.absolutePath}")
                if (vulkan) {
                    require(file(whisperGlslc.get()).canExecute()) { "Install the pinned NDK host glslc or set WHISPER_GLSLC to a host executable" }
                    arguments.addAll(listOf(
                        "-DVulkan_GLSLC_EXECUTABLE=${file(whisperGlslc.get()).absolutePath}",
                        "-DVulkan_INCLUDE_DIR=${vulkanHeaders.get().asFile.absolutePath}/include",
                        "-DSPIRV-Headers_DIR=${spirvPackage.get().asFile.absolutePath}/share/cmake/SPIRV-Headers"))
                }
                commandLine(arguments)
            }
        }
        tasks.register<Exec>("buildWhisper_$suffix") {
            dependsOn(configure)
            inputs.dir("src/main/cpp")
            inputs.dir(whisperSource)
            inputs.file(directory.map { it.file("CMakeCache.txt") })
            inputs.file(directory.map { it.file("build.ninja") })
            if (vulkan) {
                inputs.dir(vulkanHeaders)
                inputs.dir(spirvPackage)
                inputs.file(whisperGlslc)
            }
            outputs.file(directory.map { it.file("lib$target.so") })
            doFirst {
                environment("GIT_CEILING_DIRECTORIES", whisperSource.get().asFile.parentFile.absolutePath)
                environment("SOURCE_DATE_EPOCH", "0")
                commandLine("${androidSdk.get()}/cmake/$cmakeVersion/bin/cmake", "--build",
                    directory.get().asFile.absolutePath, "--target", target, "--parallel", "2")
            }
        }
    }
}
val sdk = configurations.create("engineSdk") {
    isCanBeConsumed = false
    attributes {
        attribute(Usage.USAGE_ATTRIBUTE, objects.named(Usage.JAVA_RUNTIME))
        attribute(Category.CATEGORY_ATTRIBUTE, objects.named(Category.LIBRARY))
        attribute(Attribute.of("org.jetbrains.kotlin.platform.type", String::class.java), "jvm")
    }
}
val dexCompiler = configurations.create("dexCompiler") { isTransitive = false }
dependencies {
    add(sdk.name, "com.google.ai.edge.litertlm:litertlm-android:0.18.1")
    add(dexCompiler.name, "com.android.tools:r8:9.1.57")
    compileOnly(files(androidJar))
    testImplementation(libs.junit)
    testImplementation("org.json:json:20240303")
}
tasks.test { useJUnit() }
val unpackSdk = tasks.register("unpackSdk") {
    inputs.files(sdk)
    outputs.dir(layout.buildDirectory.dir("sdk"))
    doLast {
        val root = layout.buildDirectory.dir("sdk").get().asFile
        root.deleteRecursively(); root.mkdirs()
        fun writeEntry(zip: ZipFile, entry: java.util.zip.ZipEntry, target: File) {
            require(target.canonicalPath.startsWith(root.canonicalPath + File.separator)) { "Unsafe SDK archive path" }
            target.parentFile.mkdirs()
            if (target.exists()) {
                val incoming = zip.getInputStream(entry).use { MessageDigest.getInstance("SHA-256").digest(it.readBytes()) }
                require(incoming.contentEquals(MessageDigest.getInstance("SHA-256").digest(target.readBytes()))) { "Conflicting SDK entry: $target" }
            } else zip.getInputStream(entry).use { input -> target.outputStream().use { input.copyTo(it) } }
        }
        sdk.files.sortedBy { it.name }.forEachIndexed { index, artifact ->
            val id = "$index-${artifact.nameWithoutExtension}"
            when (artifact.extension) {
                "aar" -> ZipFile(artifact).use { zip ->
                    zip.entries().asSequence().filterNot { it.isDirectory }.forEach { entry ->
                        val name = entry.name
                        when {
                            name == "classes.jar" || (name.startsWith("libs/") && name.endsWith(".jar")) ->
                                writeEntry(zip, entry, root.resolve("jars/$id-${name.replace('/', '-') }"))
                            name.startsWith("jni/") && name.endsWith(".so") ->
                                writeEntry(zip, entry, root.resolve("lib/" + name.removePrefix("jni/")))
                            name.contains("LICENSE", true) || name.contains("NOTICE", true) ->
                                writeEntry(zip, entry, root.resolve("notices/$id/$name"))
                            name.startsWith("res/") || name.startsWith("assets/") ->
                                error("Engine dependency requires Android resources/assets: ${artifact.name}:$name")
                        }
                    }
                }
                "jar" -> { root.resolve("jars").mkdirs(); artifact.copyTo(root.resolve("jars/$id.jar")) }
                else -> error("Unsupported SDK dependency: $artifact")
            }
        }
        root.resolve("jars").listFiles()!!.sortedBy { it.name }.forEach { jar ->
            ZipFile(jar).use { zip ->
                zip.entries().asSequence().filterNot { it.isDirectory }.forEach { entry ->
                    val name = entry.name
                    if (name.contains("LICENSE", true) || name.contains("NOTICE", true)) {
                        writeEntry(zip, entry, root.resolve("notices/${jar.name}/$name"))
                    }
                    // Kotlin reflection/builtins and service loading require non-class JAR resources.
                    if (!name.endsWith(".class") && !name.startsWith("META-INF/versions/") &&
                        !name.startsWith("META-INF/proguard/") && !name.startsWith("META-INF/com.android.tools/proguard/") &&
                        name != "META-INF/MANIFEST.MF" && !name.endsWith(".SF") && !name.endsWith(".RSA") && !name.endsWith(".DSA")) {
                        val target = root.resolve("resources/$name")
                        if (name.startsWith("META-INF/services/")) {
                            require(target.canonicalPath.startsWith(root.canonicalPath + File.separator))
                            target.parentFile.mkdirs()
                            val lines = if (target.exists()) target.readLines().toMutableSet() else linkedSetOf()
                            lines.addAll(zip.getInputStream(entry).bufferedReader().use { it.readLines() })
                            target.writeText(lines.joinToString("\n", postfix = "\n"))
                        } else if (!name.contains("LICENSE", true) && !name.contains("NOTICE", true)) {
                            writeEntry(zip, entry, target)
                        }
                    }
                }
            }
        }
        root.resolve("dependencies.txt").writeText(sdk.resolvedConfiguration.resolvedArtifacts.sortedBy { it.moduleVersion.id.toString() }
            .joinToString("\n", postfix = "\n") { "${it.moduleVersion.id} (${it.type})" })
    }
}
val sdkJars = fileTree(layout.buildDirectory.dir("sdk/jars")) { include("*.jar") }
dependencies { compileOnly(files(sdkJars).builtBy(unpackSdk)) }
tasks.compileJava { dependsOn(unpackSdk); options.encoding = "UTF-8" }
tasks.withType<Jar>().configureEach { isPreserveFileTimestamps = false; isReproducibleFileOrder = true }
val engineDex = tasks.register<JavaExec>("engineDex") {
    mainClass.set("com.android.tools.r8.D8")
    classpath = dexCompiler
    maxHeapSize = "2g"
    dependsOn(tasks.jar, unpackSdk)
    inputs.files(tasks.jar, sdk, dexCompiler)
    outputs.dir(layout.buildDirectory.dir("dex"))
    doFirst {
        val destination = layout.buildDirectory.dir("dex").get().asFile
        destination.deleteRecursively(); destination.mkdirs()
        args = listOf("--release", "--min-api", "29", "--lib",
            androidJar.get().absolutePath, "--output", destination.absolutePath,
            tasks.jar.get().archiveFile.get().asFile.absolutePath) + sdkJars.files.sortedBy { it.name }.map { it.absolutePath }
    }
}
val engineArchive = tasks.register<Zip>("engineArchive") {
    dependsOn(engineDex)
    archiveFileName.set("engine.zip")
    destinationDirectory.set(layout.buildDirectory.dir("engine"))
    from(layout.buildDirectory.dir("dex")) { include("*.dex") }
    from(layout.buildDirectory.dir("sdk/resources"))
    isPreserveFileTimestamps = false; isReproducibleFileOrder = true
}
tasks.register<Sync>("payload") {
    dependsOn(engineArchive, whisperNativeBuilds)
    into(layout.buildDirectory.dir("payload"))
    from(engineArchive)
    from(layout.buildDirectory.dir("sdk/lib")) { into("lib") }
    engineAbis.forEach { abi ->
        from(layout.buildDirectory.file("native/$abi/cpu/libebpatcher_whisper.so")) { into("lib/$abi") }
        from(layout.buildDirectory.file("native/$abi/vulkan/libebpatcher_whisper_vulkan.so")) { into("lib/$abi") }
    }
    from(whisperSource.map { it.file("LICENSE") }) { into("notices/whisper.cpp") }
    from(whisperSource.map { it.file("AUTHORS") }) { into("notices/whisper.cpp") }
    from(vulkanHeaders.map { it.dir("LICENSES") }) { into("notices/Vulkan-Headers") }
    from(vulkanHeaders.map { it.file("LICENSE.md") }) { into("notices/Vulkan-Headers") }
    from(spirvHeaders.map { it.file("LICENSE") }) { into("notices/SPIRV-Headers") }
    from(spirvHeaders.map { it.dir("LICENSES") }) { into("notices/SPIRV-Headers") }
    from(layout.buildDirectory.dir("sdk/notices")) { into("notices") }
    from(layout.buildDirectory.file("sdk/dependencies.txt")) { into("notices") }
    from(rootProject.file("LICENSES/Apache-2.0.txt")) { into("notices") }
    from("THIRD-PARTY-NOTICES.txt", "model.json", "whisper-model.json", "ENGINE.txt")
    doLast {
        val root = layout.buildDirectory.dir("payload").get().asFile
        val files = fileTree(root) { include("engine.zip", "lib/**/*.so") }.files
            .sortedBy { it.relativeTo(root).invariantSeparatorsPath }
        require(files.any { it.name == "engine.zip" }) { "Missing isolated engine archive" }
        require(files.any { it.extension == "so" }) { "Missing engine native libraries" }
        engineAbis.forEach { abi ->
            listOf("libebpatcher_whisper.so", "libebpatcher_whisper_vulkan.so").forEach { name ->
                require(root.resolve("lib/$abi/$name").isFile) { "Missing Whisper $abi payload: $name" }
            }
        }
        val buffer = ByteArray(64 * 1024)
        val entries = files.map { artifact ->
            val digest = MessageDigest.getInstance("SHA-256")
            artifact.inputStream().buffered().use { input ->
                while (true) {
                    val count = input.read(buffer)
                    if (count < 0) break
                    digest.update(buffer, 0, count)
                }
            }
            mapOf(
                "path" to artifact.relativeTo(root).invariantSeparatorsPath,
                "sha256" to digest.digest().joinToString("") { "%02x".format(it.toInt() and 0xff) },
                "size" to artifact.length()
            )
        }
        root.resolve("engine-files.json").writeText(
            groovy.json.JsonOutput.prettyPrint(groovy.json.JsonOutput.toJson(entries)) + "\n"
        )
        val paths = root.walkTopDown().filter { it.isFile && it.name != "payload-files.json" }
            .map { it.relativeTo(root).invariantSeparatorsPath }.sorted().toList()
        root.resolve("payload-files.json").writeText(
            groovy.json.JsonOutput.prettyPrint(groovy.json.JsonOutput.toJson(paths)) + "\n"
        )
    }
}
