package morningentree.morphe.patches.google.gboard.privacy

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import morningentree.morphe.patches.google.gboard.detection.signature.bypassSignaturePatch
import morningentree.morphe.patches.google.gboard.featureflags.featureFlagFingerprint
import morningentree.morphe.patches.google.gboard.shared.COMPATIBILITY_GBOARD
import java.util.logging.Logger

private val TELEMETRY_FLAGS = listOf(
    "brella",
    "brella_clearcut_log",
    "enable_training_cache_metrics_processors",
)

@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry & federated learning",
    description = "Forces Gboard's \"Improve Gboard\" / usage-statistics and federated-learning " +
        "flags off at startup, regardless of the in-app settings, so your typing is not used for " +
        "training or metrics. Best combined with the \"Network privacy\" patch.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(bypassSignaturePatch)

    val logger = Logger.getLogger(this::class.java.name)

    execute {
        TELEMETRY_FLAGS.forEach { flag ->
            val fingerprint = featureFlagFingerprint(flag)
            runCatching {
                fingerprint.method.apply {
                    val index = fingerprint.instructionMatches.last().index
                    val register = getInstruction<OneRegisterInstruction>(index).registerA
                    replaceInstruction(index, "const/4 v$register, 0x0")
                }
            }.onSuccess {
                logger.info("[Found] \"$flag\" forced off.")
            }.onFailure {
                logger.info("[Skipped] \"$flag\" not found. No changes applied.")
            }
        }
    }
}
