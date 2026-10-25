package app.template.patches.football433.misc.telemetry

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_FOOTBALL433_EXPERIMENTAL
import app.template.patches.shared.addInstructionChecked
import app.template.patches.shared.addInstructionsChecked
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.w3c.dom.Element

// Sentry Android's documented manifest kill switch. sentry_flutter starts the Android SDK from
// Dart (through JNI, SentryAndroid.init with an options callback); the SDK reads the manifest
// before that callback runs, Dart never calls setEnabled, and Sentry.init stops when isEnabled()
// is false. Dart's Sentry hub sends its envelopes through the native SDK, so they are dropped too.
// The app ships no SentryInitProvider. SentryPerformanceProvider and SentryNdkPreloadProvider
// stay in the manifest: they only record app-start timing and preload the NDK library, and send
// nothing on their own once the SDK is disabled.
internal const val SENTRY_ENABLED_KEY = "io.sentry.enabled"

// Dart's value for "no Branch data collection": only deterministic deep linking is left, the
// SDK's own replacement for disableTracking(true).
internal const val BRANCH_ATTRIBUTION_NONE = "NONE"

private const val BRANCH_ATTRIBUTION_ARGUMENT = "branchAttributionLevel"

/** Sets io.sentry.enabled=false under `<application>`. */
private val disableSentryManifestPatch = resourcePatch {
    compatibleWith(COMPATIBILITY_FOOTBALL433_EXPERIMENTAL)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val applications = doc.getElementsByTagName("application")
            if (applications.length == 0) throw PatchException("AndroidManifest.xml has no <application>")
            val application = applications.item(0) as Element

            // Overwrite in place should a later build ship the key; only direct children count.
            val metas = application.getElementsByTagName("meta-data")
            val meta = (0 until metas.length)
                .mapNotNull { metas.item(it) as? Element }
                .firstOrNull { it.parentNode == application && it.getAttribute("android:name") == SENTRY_ENABLED_KEY }
                ?: doc.createElement("meta-data").also {
                    it.setAttribute("android:name", SENTRY_ENABLED_KEY)
                    application.appendChild(it)
                }
            meta.setAttribute("android:value", "false")
        }
    }
}

private fun Instruction.methodRef(): MethodReference? =
    (this as? ReferenceInstruction)?.reference as? MethodReference

private fun Instruction.stringRef(): String? =
    ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables analytics, session recording and crash reporting.",
) {
    compatibleWith(COMPATIBILITY_FOOTBALL433_EXPERIMENTAL)

    // 1. Sentry, through its manifest switch.
    dependsOn(disableSentryManifestPatch)

    execute {
        // 2. UXCam: the plugin's startWithConfiguration handler answers false (its own failure
        // answer) before it registers the verification listener or starts the SDK, so the Dart
        // future completes and no session is recorded or uploaded.
        val uxcamMatches = UxcamStartWithConfigurationFingerprint.matchAllOrNull().orEmpty()
        val uxcamStart = uxcamMatches.singleOrNull()?.method ?: throw PatchException(
            "Disable telemetry: expected one UXCam startWithConfiguration handler, found " +
                uxcamMatches.map { "${it.classDef.type}->${it.method.name}" },
        )
        // Result.success(Object), as the handler's catch block calls it.
        val success = uxcamStart.implementation!!.instructions.mapNotNull { it.methodRef() }.firstOrNull {
            it.definingClass == METHOD_RESULT && it.returnType == "V" &&
                it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/Object;")
        } ?: throw PatchException("Disable telemetry: the UXCam handler never calls Result.success(Object)")
        // p2 is the Result: an instance method with (Map, Result) parameters.
        uxcamStart.addInstructionsChecked(
            0,
            """
                sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                invoke-interface {p2, v0}, $METHOD_RESULT->${success.name}(Ljava/lang/Object;)V
                return-void
            """.trimIndent(),
        )

        // 3. UXCam's own static start API (every startWithKey / startWithConfiguration /
        // startNewSession overload, including the plugin's startWithKey path) returns at once.
        val uxcamStatics = mutableClassDefBy(UXCAM).methods.filter { method ->
            AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" &&
                method.name.startsWith("start") && method.implementation != null
        }
        for (required in listOf("startWithConfigurationCrossPlatform", "startApplicationWithKeyForCordova", "startWithKey")) {
            if (uxcamStatics.none { it.name == required }) {
                throw PatchException("Disable telemetry: no concrete static void $UXCAM->$required")
            }
        }
        uxcamStatics.forEach { it.returnEarly() }

        // 4. Airship: the config builder's analyticsEnabled getter answers false, the SDK's
        // documented analyticsEnabled = false. Events are no longer stored or uploaded and the
        // event feed for in-app automation triggers stays empty; channel registration and push
        // are separate and keep working.
        val analyticsGetter = mutableClassDefBy(AIRSHIP_CONFIG_BUILDER).methods.singleOrNull {
            it.name == "getAnalyticsEnabled" && it.parameterTypes.isEmpty() && it.returnType == "Z" &&
                it.implementation != null
        } ?: throw PatchException("Disable telemetry: no $AIRSHIP_CONFIG_BUILDER->getAnalyticsEnabled()Z")
        analyticsGetter.returnEarly(false)

        // 5. Branch: both readers of the Dart "branchAttributionLevel" argument get "NONE", so
        // Branch disables tracking before the plugin lets the session start (notifyNativeToInit)
        // and a later Dart call cannot raise the level again.
        val branchReaders = BranchAttributionLevelFingerprint.matchAllOrNull().orEmpty()
        if (branchReaders.size != 2) {
            throw PatchException(
                "Disable telemetry: expected 2 Branch \"$BRANCH_ATTRIBUTION_ARGUMENT\" readers (init and " +
                    "setConsumerProtectionAttributionLevel), found ${branchReaders.map { "${it.classDef.type}->${it.method.name}" }}",
            )
        }
        branchReaders.forEach { match ->
            val method = match.method
            val insns = method.implementation!!.instructions.toList()
            val sites = insns.indices.filter { insns[it].stringRef() == BRANCH_ATTRIBUTION_ARGUMENT }
            val site = sites.singleOrNull() ?: throw PatchException(
                "Disable telemetry: ${match.classDef.type}->${method.name} reads \"$BRANCH_ATTRIBUTION_ARGUMENT\" ${sites.size} times",
            )
            // const-string vK, "branchAttributionLevel"; invoke-virtual {call, vK}, MethodCall->argument(String)Object;
            // move-result-object vR. "NONE" goes into vR right after.
            val keyRegister = (insns[site] as OneRegisterInstruction).registerA
            val call = insns.getOrNull(site + 1)
            val ref = call?.methodRef()
            val result = insns.getOrNull(site + 2)
            if (call !is FiveRegisterInstruction || call.opcode != Opcode.INVOKE_VIRTUAL || ref == null ||
                ref.definingClass != METHOD_CALL || ref.returnType != "Ljava/lang/Object;" ||
                ref.parameterTypes.map(CharSequence::toString) != listOf("Ljava/lang/String;") ||
                call.registerCount != 2 || call.registerD != keyRegister ||
                result?.opcode != Opcode.MOVE_RESULT_OBJECT
            ) {
                throw PatchException(
                    "Disable telemetry: ${match.classDef.type}->${method.name} does not read \"$BRANCH_ATTRIBUTION_ARGUMENT\" " +
                        "with MethodCall.argument(String) into a register; found ${call?.opcode} $ref, ${result?.opcode}",
                )
            }
            val valueRegister = (result as OneRegisterInstruction).registerA
            method.addInstructionChecked(site + 3, "const-string v$valueRegister, \"$BRANCH_ATTRIBUTION_NONE\"")
        }
    }
}
