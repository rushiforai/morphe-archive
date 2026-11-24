package app.voidhack.patches.applemusic

import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch

private val singRuntimeDex = bytecodePatch {
    extendWith("extensions/sing-runtime.mpe")
}

internal val singRuntimeResources = resourcePatch {
    dependsOn(singRuntimeDex)

    execute {
        val abi = "arm64-v8a"
        check(listApkEntries("lib/$abi/").isNotEmpty()) {
            "Vocal separation requires the Apple Music APK merged with its arm64-v8a split."
        }

        listOf("libonnxruntime.so", "libonnxruntime4j_jni.so").forEach { name ->
            copySingResource("jni/$abi/$name", "lib/$abi/$name")
        }
        listOf(
            "LICENSE-ONNXRuntime.txt",
            "ThirdPartyNotices-ONNXRuntime.txt",
            "NOTICE-UVR-MDX-NET.txt",
        ).forEach { name ->
            copySingResource("notices/$name", "assets/voidhack/sing/$name")
        }
    }
}

private fun ResourcePatchContext.copySingResource(source: String, target: String) {
    val destination = this[target, false]
    val resource = "/applemusic/sing-runtime/$source"
    checkNotNull(SingResources::class.java.getResourceAsStream(resource)) {
        "Missing bundled Sing resource $resource."
    }.use { input ->
        destination.outputStream().use { output -> input.copyTo(output) }
    }
}

private object SingResources
