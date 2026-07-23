package io.github.ilikeadofai.vocacolle.patches

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.apk.ApkUtils.applyTo
import app.morphe.patcher.dex.BytecodeMode
import app.morphe.patcher.dex.NoOpDexVerifier
import app.morphe.patcher.patch.Patch
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import java.io.BufferedInputStream
import java.io.File
import java.util.zip.ZipFile
import kotlinx.coroutines.flow.toList
import kotlinx.coroutines.runBlocking
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertNotNull
import kotlin.test.assertTrue

class VocaColleV11ApkMatrixTest {
    @Test
    fun `full dex rebuild matrix applies every v1_1 combination`() {
        val outputPath = System.getProperty("vocacolle.matrix.output")
        assumeTrue(
            outputPath != null,
            "vocacolle.matrix.output is required for APK matrix verification"
        )
        val outputRoot = File(outputPath!!)
        val sourceApk = System.getProperty("vocacolle.apk")
            ?.let(::File)
            ?: error("-Dvocacolle.apk is required with -Dvocacolle.matrix.output")
        require(sourceApk.isFile) { "Missing source APK: $sourceApk" }
        outputRoot.mkdirs()

        val settings = setOf<Patch<*>>(vocacolleMorpheSettingsPatch)
        val localization = setOf<Patch<*>>(
            vocacolleKoreanUiPatch,
            vocacolleEnglishUiPatch
        )
        val variants = linkedMapOf(
            "settings-only" to settings,
            "localization-only" to localization,
            "full-default" to settings + localization
        )

        variants.forEach { (name, patches) ->
            val temporaryFiles = File(outputRoot, "work-$name").apply {
                deleteRecursively()
                mkdirs()
            }
            val outputApk = File(outputRoot, "$name-unsigned.apk")
            sourceApk.copyTo(outputApk, overwrite = true)
            val config = PatcherConfig(
                sourceApk,
                temporaryFiles,
                null,
                null,
                true,
                emptySet(),
                BytecodeMode.FULL,
                NoOpDexVerifier
            )

            Patcher(config).use { patcher ->
                patcher += patches
                val results = runBlocking { patcher().toList() }
                val failures = results.filter { it.exception != null }
                assertTrue(
                    failures.isEmpty(),
                    failures.joinToString(separator = "\n") {
                        "${it.patch.name}: ${it.exception?.stackTraceToString()}"
                    }
                )
                patcher.get().applyTo(outputApk)
            }

            temporaryFiles.deleteRecursively()
            assertTrue(outputApk.isFile, "Matrix output was not created: $outputApk")
            assertTrue(outputApk.length() > 10_000_000L, "Matrix output is unexpectedly small: $outputApk")
            if (vocacolleMorpheSettingsPatch in patches) {
                assertNativeMorpheSettingsRow(outputApk)
            }
            println("MATRIX_OK $name ${outputApk.absolutePath} ${outputApk.length()}")
        }
    }

    private fun assertNativeMorpheSettingsRow(apk: File) {
        val settingScreenMethod = ZipFile(apk).use { zip ->
            zip.entries().asSequence()
                .filter { it.name.matches(Regex("classes(?:\\d+)?\\.dex")) }
                .mapNotNull { entry ->
                    val dexFile = zip.getInputStream(entry).use { input ->
                        DexBackedDexFile.fromInputStream(
                            Opcodes.getDefault(),
                            BufferedInputStream(input)
                        )
                    }
                    dexFile.classes.firstOrNull { it.type == "Llj/j0;" }
                        ?.methods
                        ?.firstOrNull { it.name == "c" && it.returnType == "V" }
                }
                .firstOrNull()
        }
        val method = assertNotNull(settingScreenMethod, "Patched settings Compose method is missing")
        val methodReferences = method.implementation!!.instructions
            .filterIsInstance<ReferenceInstruction>()
            .mapNotNull { it.reference as? MethodReference }
            .toList()

        assertEquals(
            9,
            methodReferences.count { it.definingClass == "Llj/a0;" && it.name == "s" },
            "Morphe settings must add exactly one native settings row"
        )
        assertTrue(methodReferences.any {
            it.definingClass.endsWith("/MorpheSettingsLauncher;") && it.name == "menuTitle"
        })
        assertTrue(methodReferences.any {
            it.definingClass.endsWith("/MorpheSettingsLauncher;") && it.name == "createClickCallback"
        })
    }
}
