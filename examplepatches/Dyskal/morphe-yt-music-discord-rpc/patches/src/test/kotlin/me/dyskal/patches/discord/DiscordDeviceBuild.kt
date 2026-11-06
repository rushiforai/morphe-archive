package me.dyskal.patches.discord

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.apk.ApkUtils.applyTo
import app.morphe.patcher.dex.SdkDexVerifier
import app.morphe.patcher.patch.loadPatchesFromJar
import kotlinx.coroutines.runBlocking
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import java.io.File
import java.nio.file.Files
import java.nio.ByteBuffer

/** Optional real-APK check, applying the official framework and this add-on together. */
fun main(arguments: Array<String>) {
    require(arguments.size in 2..3) { "Usage: DiscordDeviceBuildKt <input-apk> <official-morphe-bundle> [unsigned-output-apk]" }
    val input = File(arguments[0]).canonicalFile
    require(input.isFile) { "Input APK does not exist: $input" }
    val officialBundle = File(arguments[1]).canonicalFile
    require(officialBundle.isFile) { "Official Morphe bundle does not exist: $officialBundle" }
    val official = loadPatchesFromJar(setOf(officialBundle)).filter {
        it.name in setOf("GmsCore support", "Hide ads", "Remove background playback restrictions")
                && it.compatibility?.any { app -> app.packageName == "com.google.android.apps.youtube.music" } == true
    }.toSet()
    require(official.isNotEmpty()) { "Official bundle has no selected YouTube Music patches" }
    val output = arguments.getOrNull(2)?.let(::File)?.canonicalFile
    output?.let { require(it.parentFile.isDirectory) { "Output directory must exist: ${it.parent}" } }
    val sdk = System.getenv("ANDROID_HOME") ?: System.getenv("ANDROID_SDK_ROOT")
        ?: error("Set ANDROID_HOME for SDK DEX verification")
    val workspace = Files.createTempDirectory("discord-device-build")
    Patcher(PatcherConfig(input, workspace.toFile(), verifier = SdkDexVerifier(File(sdk)))).use { patcher ->
        patcher += official + discordRpcPatch
        runBlocking {
            patcher().collect { result ->
                result.exception?.let { throw it }
                println("Applied: ${result.patch.name}")
            }
        }
        val patched = patcher.get()
        // SDK hierarchy checks do not resolve XML classes or reflective dialog APIs.
        // Check the actual emitted host extension from the supplied official bundle.
        val uiTypes = setOf(MORPHE_TEXT_PREFERENCE, MORPHE_LIST_PREFERENCE, "app.morphe.extension.shared.ui.CustomDialog")
            .map { "L${it.replace('.', '/')};" }.toSet()
        val uiClasses = workspace.resolve("patched").toFile().walkTopDown().filter { it.extension == "dex" }
            .flatMap { DexBackedDexFile(Opcodes.getDefault(), ByteBuffer.wrap(it.readBytes())).classes.asSequence() }
            .filter { it.type in uiTypes }.associateBy { it.type }
        require(uiClasses.keys.containsAll(uiTypes)) { "Official Settings extension is missing themed Discord UI components" }
        val dialog = uiClasses.getValue("Lapp/morphe/extension/shared/ui/CustomDialog;")
        require(dialog.methods.any { it.name == "create" && it.parameterTypes.map(CharSequence::toString) == listOf(
            "Landroid/content/Context;", "Ljava/lang/CharSequence;", "Ljava/lang/CharSequence;", "Landroid/widget/EditText;",
            "Ljava/lang/CharSequence;", "Ljava/lang/Runnable;", "Ljava/lang/Runnable;", "Ljava/lang/CharSequence;", "Ljava/lang/Runnable;", "Z"
        ) && it.returnType == "Landroid/util/Pair;" }) { "Official Settings extension is missing the themed dialog API" }
        println("Morphe themed preference/dialog APIs verified")
        if (output == null) println("Discord patch applied and DEX verified: $workspace")
        else {
            patched.applyTo(output)
            println("Unsigned APK: $output")
        }
    }
}
