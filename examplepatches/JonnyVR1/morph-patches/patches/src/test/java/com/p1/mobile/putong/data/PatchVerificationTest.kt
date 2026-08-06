package com.p1.mobile.putong.data

import app.morphe.PatchRegistry
import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import kotlinx.coroutines.runBlocking
import java.io.File
import kotlin.test.Test
import kotlin.test.assertTrue
import kotlin.test.assertNull

class PatchVerificationTest {

    private val apkFile = File("../tantan-7.3.3-original-signed.apk")

    private val allPatches = PatchRegistry.allPatches

    @Test
    fun `all patches apply successfully to Tantan APK`() {
        assertTrue(apkFile.exists(), "APK file must exist at ${apkFile.absolutePath}")

        val results = mutableMapOf<String, Throwable?>()

        Patcher(PatcherConfig(apkFile = apkFile)).use { patcher ->
            patcher += allPatches

            runBlocking {
                patcher().collect { result ->
                    val patchName = result.patch.name ?: "unknown"
                    results[patchName] = result.exception
                    if (result.exception != null) {
                        System.err.println("=== PATCH FAILED: $patchName ===")
                        System.err.println("Exception: ${result.exception?.message}")
                        result.exception?.printStackTrace(System.err)
                    }
                }
            }
        }

        results.forEach { (name, exception) ->
            assertNull(exception, "Patch '$name' should succeed but failed: ${exception?.message}")
        }

        assertTrue(results.size == allPatches.size, "Expected ${allPatches.size} results but got ${results.size}")
    }
}
