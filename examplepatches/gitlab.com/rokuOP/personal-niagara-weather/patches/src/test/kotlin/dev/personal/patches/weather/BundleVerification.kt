package dev.personal.patches.weather

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.apk.ApkUtils.applyTo
import app.morphe.patcher.dex.BytecodeMode
import app.morphe.patcher.patch.loadPatchesFromJar
import kotlinx.coroutines.runBlocking
import java.io.File
import java.security.MessageDigest
import java.util.zip.ZipFile

/** Applies the built MPP to the real original artifact, not to source-level patch objects. */
fun main(args: Array<String>) = runBlocking {
    require(args.size == 3) { "Usage: input-original.apk bundle.mpp output-unsigned.apk" }
    val input = File(args[0]).canonicalFile
    val bundle = File(args[1]).canonicalFile
    val output = File(args[2]).canonicalFile
    val buildRoot = File("build").canonicalFile
    require(output.toPath().startsWith(buildRoot.toPath())) { "Output must stay in the project build directory." }
    val scratch = File(buildRoot, "verification/morphe-work").canonicalFile
    require(scratch.toPath().startsWith(buildRoot.toPath())) { "Unsafe temporary directory." }
    val digest = MessageDigest.getInstance("SHA-256").digest(input.readBytes()).joinToString("") { "%02x".format(it) }
    require(digest == "df7905da37ca1767137a99d6c78c6146fa376e3f6b50fdea1b1cf07e26362fee") { "Unsupported input SHA-256." }
    ZipFile(bundle).use {
        check(it.getEntry("classes.dex") != null) { "MPP lacks its Android patch code." }
        val extension = it.getInputStream(it.getEntry("extensions/weather.mpe")).use { stream -> stream.readBytes() }
        check(String(extension.copyOfRange(0, 3)) == "dex") { "Weather extension is not a DEX." }
    }
    val patches = loadPatchesFromJar(setOf(bundle))
    check(patches.map { it.name }.toSet() == setOf("Personal OpenWeather", "Install alongside Niagara"))
    println("Loaded actual MPP: ${patches.map { it.name }}")
    val config = PatcherConfig(input, scratch, useBytecodeMode = BytecodeMode.STRIP_FAST)
    Patcher(config).use { patcher ->
        patcher += patches
        patcher().collect { result ->
            println("${result.patch.name}: ${result.exception?.message ?: "passed"}")
            result.exception?.let { throw it }
        }
        val result = patcher.get()
        output.parentFile.mkdirs()
        input.copyTo(output, overwrite = true)
        result.applyTo(output)
    }
    check(output.length() > 1_000_000)
    println("MPP applied and rebuilt successfully: $output")
}
