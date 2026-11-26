/*
 * Copyright 2026 Nyandex contributors.
 *
 * Nyandex: Yandex Music patches for Morphe Patcher.
 * Licensed under the GNU General Public License v3.0; see LICENSE and NOTICE.
 */

package app.nyandex.patches.yandexmusic

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.nyandex.patches.yandexmusic.misc.account.isolatePassportAccountPatch
import app.nyandex.patches.yandexmusic.misc.billing.disablePlayBillingPatch
import app.nyandex.patches.yandexmusic.misc.lyrics.lyricsFallbackPatch
import app.nyandex.patches.yandexmusic.misc.settings.hideBottomBarTabsPatch
import app.nyandex.patches.yandexmusic.misc.settings.nyandexSettingsPatch
import app.nyandex.patches.yandexmusic.misc.theme.monetThemePatch
import app.nyandex.patches.yandexmusic.misc.network.blockPlusEventsPatch
import app.nyandex.patches.yandexmusic.misc.network.removeTrackingHeadersPatch
import app.nyandex.patches.yandexmusic.misc.signature.spoofAppSignaturePatch
import app.nyandex.patches.yandexmusic.misc.signature.spoofFirebaseCertPatch
import app.nyandex.patches.yandexmusic.misc.telemetry.disableTelemetryPatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import kotlinx.coroutines.flow.toList
import kotlinx.coroutines.runBlocking
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import java.io.File
import kotlin.test.assertEquals
import kotlin.test.assertTrue

class YandexMusicSignatureSpoofTest {
    @Test
    fun `universal signature spoof hooks the relay certificate check`() {
        val apkPath = System.getenv("YM_APK")
        assumeTrue(apkPath != null, "Set YM_APK to a stock Yandex Music base.apk to run this test")
        val apk = File(apkPath!!)
        assertTrue(apk.isFile, "Test APK not found: $apk")

        val output = File(System.getProperty("java.io.tmpdir"), "ym-patched-with-signature-spoof.apk")
        Patcher(
            PatcherConfig(
                apkFile = apk,
                temporaryFilesPath = File(System.getProperty("java.io.tmpdir"), "ym-spoof-run"),
                validate = true,
            ),
        ).use { patcher ->
            patcher += setOf(
                disablePlayBillingPatch,
                disableTelemetryPatch,
                blockPlusEventsPatch,
                removeTrackingHeadersPatch,
                spoofFirebaseCertPatch,
                isolatePassportAccountPatch,
                lyricsFallbackPatch,
                nyandexSettingsPatch,
                hideBottomBarTabsPatch,
                monetThemePatch,
                spoofAppSignaturePatch,
            )
            val results = runBlocking { patcher().toList() }
            results.forEach { result ->
                result.exception?.let { throw AssertionError("${result.patch.name} failed", it) }
            }
            patcher.writeApk(output)
        }

        assertTrue(output.isFile && output.length() > 0, "Patched APK was not written")
        val dexFiles = loadDexFiles(output)

        // RelayService's certificate allow-list. The class is Lb14; in 2026.11.1 and
        // y74; in 2026.11.2, so locate the policy method by its signature and patched call.
        val relayParameterTypes =
            "Landroid/content/pm/PackageManager;ILjava/util/List;"
        val relayMethod = dexFiles.asSequence()
            .flatMap { it.classes.asSequence() }
            .flatMap { classDef -> classDef.methods.asSequence() }
            .firstOrNull { method ->
                method.name == "g" &&
                    method.parameterTypes.joinToString("") == relayParameterTypes &&
                    method.implementation?.instructions?.any { instruction ->
                        val reference =
                            (instruction as? ReferenceInstruction)?.reference as? MethodReference
                        instruction.opcode == Opcode.INVOKE_STATIC &&
                            reference?.definingClass ==
                            "Lapp/morphe/extension/signature/SignatureSpoof;" &&
                            reference.name == "getPackageInfo"
                    } == true
            }
            ?: throw AssertionError("Relay certificate policy method was not found")

        val relayInstructions = relayMethod.implementation!!.instructions.toList()
        val directGetPackageInfo = relayInstructions.count { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                reference?.definingClass == "Landroid/content/pm/PackageManager;" &&
                reference.name == "getPackageInfo"
        }
        val hookedGetPackageInfo = relayInstructions.count { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            instruction.opcode == Opcode.INVOKE_STATIC &&
                reference?.definingClass == "Lapp/morphe/extension/signature/SignatureSpoof;" &&
                reference.name == "getPackageInfo"
        }
        assertEquals(0, directGetPackageInfo, "Relay check still calls PackageManager directly")
        assertTrue(hookedGetPackageInfo > 0, "Relay check was not hooked to SignatureSpoof")

        // The extension must know the stock package name; the signature itself is checked by the patch.
        val spoofClass = dexFiles.asSequence().flatMap { it.classes.asSequence() }
            .first { it.type == "Lapp/morphe/extension/signature/SignatureSpoof;" }
        val packageNameField = spoofClass.staticFields.first { it.name == "PACKAGE_NAME" }
        val packageName = (packageNameField.initialValue as? StringEncodedValue)?.value
            ?: spoofClass.methods.first { it.name == "<clinit>" }.let { clinit ->
                clinit.implementation!!.instructions.mapNotNull { instruction ->
                    val reference = (instruction as? ReferenceInstruction)?.reference
                    (reference as? com.android.tools.smali.dexlib2.iface.reference.StringReference)?.string
                }.firstOrNull { it == "ru.yandex.music" }
            }
        assertEquals("ru.yandex.music", packageName, "SignatureSpoof package name was not set")

        val signatureField = spoofClass.staticFields.first { it.name == "SIGNATURE" }
        val signatureValue = (signatureField.initialValue as? StringEncodedValue)?.value
            ?: spoofClass.methods.first { it.name == "<clinit>" }.let { clinit ->
                clinit.implementation!!.instructions.mapNotNull { instruction ->
                    val reference = (instruction as? ReferenceInstruction)?.reference
                    (reference as? com.android.tools.smali.dexlib2.iface.reference.StringReference)?.string
                }.firstOrNull { it.length > 500 }
            }
        assertTrue(
            !signatureValue.isNullOrBlank() && signatureValue != "SIGNATURE_PLACEHOLDER",
            "SignatureSpoof certificate was not embedded",
        )
    }
}
