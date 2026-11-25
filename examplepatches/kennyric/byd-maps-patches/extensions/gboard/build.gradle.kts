import java.io.File
import java.net.URI
import java.security.MessageDigest

extension { name = "extensions/gboard.mpe" }

android {
    namespace = "nl.johninnl.gboard"
    // Gboard 18.5 supports Android 8.0 and newer.
    defaultConfig { minSdk = 26 }
    testOptions { unitTests.isReturnDefaultValues = true }
}

// sherpa-onnx's plain-Java API (no Kotlin runtime). Its classes and field layout match
// the JNI library the settings screen downloads from the same 1.13.3 release, so the
// extension needs no native code of its own. Fetched once and pinned by SHA-256.
val sherpaVersion = "1.13.3"
val sherpaJarSha256 = "4a1fabf547d5e3bb5c9b0ddfc767142692cabe658da84f16adfafd519149b082"
val sherpaJar = layout.buildDirectory.file("vendor/sherpa-onnx-v$sherpaVersion.jar")
val fetchSherpaJar = tasks.register("fetchSherpaJar") {
    outputs.file(sherpaJar)
    inputs.property("sha256", sherpaJarSha256)
    doLast {
        val target = sherpaJar.get().asFile
        fun digest(file: File) = MessageDigest.getInstance("SHA-256").digest(file.readBytes())
            .joinToString("") { "%02x".format(it.toInt() and 0xff) }
        if (target.isFile && digest(target) == sherpaJarSha256) return@doLast
        target.parentFile.mkdirs()
        val url = "https://github.com/k2-fsa/sherpa-onnx/releases/download/v$sherpaVersion/sherpa-onnx-v$sherpaVersion.jar"
        val partial = File(target.path + ".part")
        URI(url).toURL().openStream().use { input -> partial.outputStream().use { input.copyTo(it) } }
        check(digest(partial) == sherpaJarSha256) { "sherpa-onnx $sherpaVersion jar checksum mismatch" }
        check(partial.renameTo(target) || (target.delete() && partial.renameTo(target))) { "Cannot store $target" }
    }
}

dependencies {
    implementation(files(sherpaJar).builtBy(fetchSherpaJar))
    testImplementation("junit:junit:4.13.2")
}

configurations.matching { it.name == "releaseRuntimeClasspath" || it.name == "debugRuntimeClasspath" }
    .configureEach { exclude(group = "org.jetbrains.kotlin") }
