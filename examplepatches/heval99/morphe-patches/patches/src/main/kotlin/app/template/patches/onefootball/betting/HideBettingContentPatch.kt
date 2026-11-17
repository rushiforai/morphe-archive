package app.template.patches.onefootball.betting

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.template.patches.shared.Constants.COMPATIBILITY_ONEFOOTBALL
import app.template.patches.shared.addInstructionsWithLabelsChecked

@Suppress("unused")
val hideBettingContentPatch = bytecodePatch(
    name = "Hide betting content",
    description = "Hides the betting cards.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ONEFOOTBALL)

    execute {
        // 1. The two betting card flags read as off everywhere the app asks for them. The Flutter
        // side reads them through the registry's key lookup (v0 is its only free register, so the
        // key is compared twice); the native readers go through AbstractFeatureFlag.getValue(),
        // which every flag class inherits: the boolean flag gets Boolean.FALSE, the string-wrapped
        // legacy flag "false" (its isEnabled() compares the raw string with "enabled"). Other
        // keys fall through to the stock body.
        val lookup = FeatureFlagValueByKeyFingerprint.method
        lookup.addInstructionsWithLabelsChecked(
            0,
            """
                const-string v0, "betting_card_enabled"
                invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v0
                if-nez v0, :force
                const-string v0, "legacy_betting_card_enabled"
                invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :stock
                :force
                const-string v0, "false"
                return-object v0
            """,
            ExternalLabel("stock", lookup.getInstruction(0)),
        )

        val getValue = FeatureFlagGetValueFingerprint.method
        getValue.addInstructionsWithLabelsChecked(
            0,
            """
                invoke-virtual {p0}, Lcom/onefootball/opt/featureflag/AbstractFeatureFlag;->getKey()Ljava/lang/String;
                move-result-object v0
                const-string v1, "betting_card_enabled"
                invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v1
                if-eqz v1, :legacy
                sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                return-object v0
                :legacy
                const-string v1, "legacy_betting_card_enabled"
                invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :stock
                const-string v0, "false"
                return-object v0
            """,
            ExternalLabel("stock", getValue.getInstruction(0)),
        )
    }
}
