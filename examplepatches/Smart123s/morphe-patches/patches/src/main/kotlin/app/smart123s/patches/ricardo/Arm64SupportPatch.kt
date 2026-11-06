/*
 * Copyright (C) 2026 Ricardo ARM64 port contributors
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.smart123s.patches.ricardo

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import java.security.MessageDigest

internal object RicardoNativeLibraries {
    // These are the original libGDX 1.1.0 libraries shipped with version 2.077.
    // Check their identity before adding replacements for the same JNI interface.
    private val originalHashes = mapOf(
        "lib/armeabi-v7a/libgdx.so" to "0d96d37e76da01f26582cc7a8f4c5823f70b07fb61b9a9777a1cf88be7029e2f",
        "lib/armeabi-v7a/libgdx-box2d.so" to "30b0da9bc5664b9ac6e01c930ce6fc63a90bed79a832d68bf18342eae13b8b78",
        "lib/armeabi/libgdx.so" to "22406d7f1f346477b1f94423e6b228327dfef1802a58ef92d93697e1e9a5837d",
        "lib/armeabi/libgdx-box2d.so" to "23e9da166da1c55493b28b2e8dd8df16424e9a3e5ea78421fb37a67caa96113e",
    )

    val names = listOf("libgdx.so", "libgdx-box2d.so")

    fun validateOriginalLibraries(entries: List<String>, read: (String) -> ByteArray) {
        val present = entries.filter { it.startsWith("lib/") && it.endsWith(".so") }
        if (present.isEmpty() || present.any { it !in originalHashes }) {
            throw PatchException("Expected the original 32-bit Ricardo 2.077 native libraries")
        }
        names.forEach { name ->
            if (present.none { it.substringAfterLast('/') == name }) {
                throw PatchException("Missing original native library: $name")
            }
        }
        present.forEach { path ->
            val hash = MessageDigest.getInstance("SHA-256").digest(read(path))
                .joinToString("") { "%02x".format(it) }
            if (hash != originalHashes[path]) {
                throw PatchException("Unsupported native library: $path")
            }
        }
    }

    fun payload(name: String): ByteArray {
        val path = "/ricardo/arm64-v8a/$name"
        return (javaClass.getResourceAsStream(path)
            ?: throw PatchException("Missing bundled native library: $path"))
            .use { it.readBytes() }
    }
}

@Suppress("unused")
val arm64SupportPatch = rawResourcePatch(
    name = "ARM64 support",
    description = "Adds ARM64 builds of the game's libGDX 1.1.0 libraries for 64-bit-only Android devices.",
) {
    compatibleWith(ricardoCompatibility)

    // The input APK is 32-bit. Requiring ARM64 availability would hide this patch
    // from precisely the input that needs it. Keep the original 32-bit fallback.
    execute {
        RicardoNativeLibraries.validateOriginalLibraries(listApkEntries("lib/")) { get(it).readBytes() }
        RicardoNativeLibraries.names.forEach { name ->
            get("lib/arm64-v8a/$name", copy = false).apply {
                parentFile.mkdirs()
                writeBytes(RicardoNativeLibraries.payload(name))
            }
        }
    }
}
