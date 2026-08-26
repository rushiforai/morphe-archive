package morningentree.morphe.patches.google.gboard.misc.nags

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import morningentree.morphe.patches.google.gboard.detection.signature.bypassSignaturePatch
import morningentree.morphe.patches.google.gboard.featureflags.featureFlagFingerprint
import morningentree.morphe.patches.google.gboard.shared.COMPATIBILITY_GBOARD
import java.util.logging.Logger

private val PROMO_BANNER_FLAGS = listOf(
    "access_point_feature_promote_banner",
    "access_points_customization_banner",
    "agentic_dictation_promo_banner",
    "agentic_dictation_enable_promo_banner",
    "apostrophe_behavior_promo_banner",
    "auto_translate_banner",
)

@Suppress("unused")
val removePromoBannersPatch = bytecodePatch(
    name = "Remove promotional banners",
    description = "Hides Gboard's in-keyboard promotional / \"try this feature\" banners by forcing " +
        "their promo flags off. Does not disable the underlying features, only their nag banners.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(bypassSignaturePatch)

    val logger = Logger.getLogger(this::class.java.name)

    execute {
        PROMO_BANNER_FLAGS.forEach { flag ->
            val fingerprint = featureFlagFingerprint(flag)
            runCatching {
                fingerprint.method.apply {
                    val index = fingerprint.instructionMatches.last().index
                    val register = getInstruction<OneRegisterInstruction>(index).registerA
                    replaceInstruction(index, "const/4 v$register, 0x0")
                }
            }.onSuccess {
                logger.info("[Found] Promo banner \"$flag\" disabled.")
            }.onFailure {
                logger.info("[Skipped] Promo banner \"$flag\" not found.")
            }
        }
    }
}
