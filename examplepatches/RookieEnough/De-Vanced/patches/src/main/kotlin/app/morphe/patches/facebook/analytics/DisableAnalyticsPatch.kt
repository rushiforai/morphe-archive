/*
* Copyright 2026 De-Vanced
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
*/

package app.morphe.patches.facebook.analytics

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.shared.Constants
import app.morphe.patches.facebook.shared.FacebookTargets
import app.morphe.patches.shared.misc.extension.sharedExtensionPatch
import app.morphe.util.findFreeRegister
import app.morphe.util.registersUsed

private val extensionPatch = sharedExtensionPatch("facebook", false)

private const val SETTINGS =
    "Lapp/morphe/extension/facebook/settings/DeVancedSettings;"

private fun MutableMethod.findGuardRegister(index: Int = 0): Int {
    return try {
        findFreeRegister(index)
    } catch (_: IllegalStateException) {
        val instructions = implementation!!.instructions.toList()
        val fallbackIndex = (index + 1).coerceAtMost(instructions.lastIndex)
        findFreeRegister(
            fallbackIndex,
            *instructions[index].registersUsed.toIntArray(),
        )
    }
}

private fun MutableMethod.returnVoidIfAnalyticsDisabled(label: String) {
    val register = findGuardRegister()
    addInstructions(
        0,
        """
            invoke-static {}, $SETTINGS->isAnalyticsDisabled()Z
            move-result v$register
            if-eqz v$register, :$label
            return-void
            :$label
            nop
        """.trimIndent(),
    )
}

private fun MutableMethod.returnFalseIfAnalyticsDisabled(label: String) {
    val register = findGuardRegister()
    addInstructions(
        0,
        """
            invoke-static {}, $SETTINGS->isAnalyticsDisabled()Z
            move-result v$register
            if-eqz v$register, :$label
            const/4 v$register, 0x0
            return v$register
            :$label
            nop
        """.trimIndent(),
    )
}

private fun MutableMethod.returnStartNotStickyIfAnalyticsDisabled(label: String) {
    val register = findGuardRegister()
    addInstructions(
        0,
        """
            invoke-static {}, $SETTINGS->isAnalyticsDisabled()Z
            move-result v$register
            if-eqz v$register, :$label
            const/4 v$register, 0x2
            return v$register
            :$label
            nop
        """.trimIndent(),
    )
}

private fun MutableMethod.returnEmptyQplIfAnalyticsDisabled(label: String) {
    val register = findGuardRegister()
    addInstructions(
        0,
        """
            invoke-static {}, $SETTINGS->isAnalyticsDisabled()Z
            move-result v$register
            if-eqz v$register, :$label
            const-string v$register, "{}"
            return-object v$register
            :$label
            nop
        """.trimIndent(),
    )
}

@Suppress("unused")
val disableAnalyticsPatch = bytecodePatch(
    name = "Disable analytics and telemetry",
    description = "Blocks Facebook Analytics2, Falco, Papaya, QPL, XAnalytics, crash/trace uploads, and attribution trackers.",
) {
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(extensionPatch)

    execute {
        if (packageMetadata.versionName == FacebookTargets.V580) {
            var componentHooks = 0
            var missingComponentClasses = 0
            telemetryComponentClassFingerprints.forEachIndexed { classIndex, fingerprint ->
                if (fingerprint.methodOrNull == null) {
                    missingComponentClasses++
                    return@forEachIndexed
                }
                fingerprint.classDef.methods.forEach { method ->
                    if (method.implementation == null) return@forEach
                    when {
                        method.name == "onStartJob" && method.returnType == "Z" -> {
                            method.returnFalseIfAnalyticsDisabled(
                                "telemetry_580_start_${classIndex}_$componentHooks",
                            )
                            componentHooks++
                        }

                        method.name == "onStopJob" && method.returnType == "Z" -> {
                            method.returnFalseIfAnalyticsDisabled(
                                "telemetry_580_stop_${classIndex}_$componentHooks",
                            )
                            componentHooks++
                        }

                        method.name == "onReceive" && method.returnType == "V" -> {
                            method.returnVoidIfAnalyticsDisabled(
                                "telemetry_580_receiver_${classIndex}_$componentHooks",
                            )
                            componentHooks++
                        }

                        (method.name == "onHandleIntent" ||
                            method.name == "onHandleWork") &&
                            method.returnType == "V" -> {
                            method.returnVoidIfAnalyticsDisabled(
                                "telemetry_580_work_${classIndex}_$componentHooks",
                            )
                            componentHooks++
                        }

                        method.name == "onStartCommand" && method.returnType == "I" -> {
                            method.returnStartNotStickyIfAnalyticsDisabled(
                                "telemetry_580_command_${classIndex}_$componentHooks",
                            )
                            componentHooks++
                        }
                    }
                }
            }
            check(componentHooks > 0) {
                "No 580 telemetry component entrypoints were patched"
            }
            println(
                "[DisableAnalytics] 580 componentEntrypoints=$componentHooks " +
                    "missingComponents=$missingComponentClasses",
            )
            return@execute
        }

        if (packageMetadata.versionName == FacebookTargets.V578) {
            Facebook578AnalyticsHttpFingerprint.method.returnFalseIfAnalyticsDisabled(
                "analytics_http_578_continue",
            )
            Facebook578AnalyticsUploadFingerprint.method.returnVoidIfAnalyticsDisabled(
                "analytics_upload_578_continue",
            )
            Facebook578AnalyticsEventFingerprint.method.returnVoidIfAnalyticsDisabled(
                "analytics_event_578_continue",
            )
        } else {
            FbHttpUploaderFingerprint.method.returnVoidIfAnalyticsDisabled(
                "analytics_http_continue",
            )
            FalcoJobStartFingerprint.method.returnFalseIfAnalyticsDisabled(
                "falco_start_continue",
            )
            FalcoJobStopFingerprint.method.returnFalseIfAnalyticsDisabled(
                "falco_stop_continue",
            )
            PapayaJobStartFingerprint.method.returnFalseIfAnalyticsDisabled(
                "papaya_start_continue",
            )
            PapayaJobStopFingerprint.method.returnFalseIfAnalyticsDisabled(
                "papaya_stop_continue",
            )
            LacrimaUploadFingerprint.method.returnVoidIfAnalyticsDisabled(
                "lacrima_upload_continue",
            )
            QplDataProviderFingerprint.method.returnEmptyQplIfAnalyticsDisabled(
                "qpl_data_continue",
            )
            XAnalyticsUploadRunnableFingerprint.method.returnVoidIfAnalyticsDisabled(
                "xanalytics_upload_continue",
            )
        }

        var componentHooks = 0
        var skippedRegisterlessEntrypoints = 0
        var missingComponentClasses = 0
        telemetryComponentClassFingerprints.forEachIndexed { classIndex, fingerprint ->
            if (fingerprint.methodOrNull == null) {
                missingComponentClasses++
                return@forEachIndexed
            }
            fingerprint.classDef.methods.forEach { method ->
                if (method.implementation == null) return@forEach
                try {
                    when {
                        method.name == "onStartJob" && method.returnType == "Z" -> {
                            method.returnFalseIfAnalyticsDisabled(
                                "telemetry_start_${classIndex}_$componentHooks",
                            )
                            componentHooks++
                        }

                        method.name == "onStopJob" && method.returnType == "Z" -> {
                            method.returnFalseIfAnalyticsDisabled(
                                "telemetry_stop_${classIndex}_$componentHooks",
                            )
                            componentHooks++
                        }

                        method.name == "onReceive" && method.returnType == "V" -> {
                            method.returnVoidIfAnalyticsDisabled(
                                "telemetry_receiver_${classIndex}_$componentHooks",
                            )
                            componentHooks++
                        }

                        (method.name == "onHandleIntent" ||
                            method.name == "onHandleWork") &&
                            method.returnType == "V" -> {
                            method.returnVoidIfAnalyticsDisabled(
                                "telemetry_work_${classIndex}_$componentHooks",
                            )
                            componentHooks++
                        }

                        method.name == "onStartCommand" && method.returnType == "I" -> {
                            method.returnStartNotStickyIfAnalyticsDisabled(
                                "telemetry_command_${classIndex}_$componentHooks",
                            )
                            componentHooks++
                        }
                    }
                } catch (_: IllegalArgumentException) {
                    skippedRegisterlessEntrypoints++
                } catch (_: IllegalStateException) {
                    skippedRegisterlessEntrypoints++
                }
            }
        }
        check(componentHooks > 0) {
            "No telemetry component entrypoints were patched"
        }

        println(
            "[DisableAnalytics] uploadSinks=8 componentEntrypoints=$componentHooks " +
                "registerlessSkipped=$skippedRegisterlessEntrypoints " +
                "missingComponents=$missingComponentClasses",
        )
    }
}
