package patches.tvgids

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.smali.ExternalLabel
import org.w3c.dom.Element

internal val sentryResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("AndroidManifest.xml").use { doc ->
            val ns = "http://schemas.android.com/apk/res/android"
            val names = setOf("io.sentry.android.core.SentryPerformanceProvider", "io.sentry.ndk.SentryNdkPreloadProvider")
            val providers = doc.getElementsByTagName("provider")
            val found = (0 until providers.length).map { providers.item(it) as Element }
                .filter { it.getAttributeNS(ns, "name") in names }
            check(found.size == 2 && found.map { it.getAttributeNS(ns, "name") }.toSet() == names &&
                found.none { it.hasAttributeNS(ns, "enabled") }) { "TVgids original Sentry providers changed" }
            found.forEach { it.setAttributeNS(ns, "android:enabled", "false") }
        }
    }
}

/** Direct JNI/native SDK paths remain guarded when Dart integration is disabled. */
internal val sentryTracking = bytecodePatch {
    dependsOn(originalInput, trackingNative, sentryResources)
    execute {
        exact("Lio/sentry/android/core/SentryAndroid;",
            "init(Landroid/content/Context;Lio/sentry/ILogger;Lio/sentry/Sentry\$OptionsConfiguration;)V", 9, 8, 74)
            .addInstructions(0, "return-void")
        exact("Lio/sentry/Sentry;", "preInitConfigurations(Lio/sentry/SentryOptions;)Z", 10, 4, 30).apply {
            // Reuse the SDK's real disabled branch and close operation. Do not
            // merge external configuration or construct a client/transport.
            addInstructionsWithLabels(0, """
                const/4 v0, 0x0
                invoke-virtual {p0, v0}, Lio/sentry/SentryOptions;->setEnabled(Z)V
                const/4 v2, 0x0
                goto/32 :disabled
            """.trimIndent(), ExternalLabel("disabled", getInstruction(28)))
        }
        for ((owner, registers, count) in listOf(
            Triple("Lio/sentry/android/core/SentryPerformanceProvider;", 3, 8),
            Triple("Lio/sentry/ndk/SentryNdkPreloadProvider;", 5, 30),
        )) exact(owner, "onCreate()Z", 1, registers, count)
            .addInstructions(0, "const/4 v0, 0x0\nreturn v0")
    }
}
