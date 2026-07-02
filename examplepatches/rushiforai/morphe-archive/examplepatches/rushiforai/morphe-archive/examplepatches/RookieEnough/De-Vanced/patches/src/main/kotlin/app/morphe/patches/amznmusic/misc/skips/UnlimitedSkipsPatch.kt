/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/amznmusic/misc/skips/UnlimitedSkipsPatch.kt
 */
package app.morphe.patches.amznmusic.misc.skips

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities

private const val UNLIMITED_SKIPS_RULES_CLASS =
    "Lcom/amazon/music/freetier/featuregating/FMPMFeatureGating\$STATION_UNLIMITED_SKIPS;"

internal object StationUnlimitedSkipsGetRuleFingerprint : Fingerprint(
    definingClass = UNLIMITED_SKIPS_RULES_CLASS,
    name = "getRule",
    custom = { method, _ ->
        method.name == "getRule"
    },
)

@Suppress("unused")
val unlimitedSkipsPatch = bytecodePatch(
    name = "Unlimited track skipping",
    description = "Unlocks the ability to skip tracks without restriction.",
) {
    compatibleWith(AppCompatibilities.AMAZON_MUSIC)

    execute {
        StationUnlimitedSkipsGetRuleFingerprint.method.addInstructions(
            0,
            """
                new-instance p0, Lcom/amazon/music/platform/featuregate/rules/TrueRule;
                invoke-direct {p0}, Lcom/amazon/music/platform/featuregate/rules/TrueRule;-><init>()V
                return-object p0
            """,
        )
    }
}

