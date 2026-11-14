package patches.soundcloud

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import patches.shared.uniqueMatch

/** V4n1X's local feature/plan overrides, using the existing ad/upsell patch once. */
@Suppress("unused")
val enableSoundCloudGoPatch = bytecodePatch(
    name = "Enable SoundCloud Go+ (experimental)",
    description = "Enables client-side Go+ UI flags and standard-quality (SQ) offline track/playlist caching. " +
        "High-quality audio streaming (HQ / 256kbps AAC) and high-quality downloads do NOT work because stream quality entitlements are enforced server-side.",
    default = true,
) {
    compatibleWith(soundcloud)
    dependsOn(originalInput, removeAdsPatch)
    extendWith("extensions/soundcloud.mpe")
    execute {
        val root = "Lcom/soundcloud/android/"
        val feature = Fingerprint(
            definingClass = "${root}configuration/plans/Feature;", name = "<init>",
            parameters = listOf("Ljava/lang/String;", "Z", "Ljava/util/List;"), returnType = "V",
        ).uniqueMatch().method
        // Same three flags as V4n1X. A helper avoids allocating/aliasing constructor registers.
        feature.addInstructions(0, """
            invoke-static/range {p1 .. p2}, Lnl/johninnl/soundcloud/GoFeatures;->enabled(Ljava/lang/String;Z)Z
            move-result p2
        """.trimIndent())
        Fingerprint(
            definingClass = "${root}configuration/plans/UserConsumerPlan;", name = "<init>", returnType = "V",
            parameters = listOf("Ljava/lang/String;", "Z", "Ljava/lang/String;", "Ljava/util/List;", "Ljava/lang/String;", "Ljava/lang/String;"),
        ).uniqueMatch().method.addInstructions(0, """
            const-string p1, "high_tier"
            const-string p5, "go-plus"
            const-string p6, "SoundCloud Go+"
        """.trimIndent())
        Fingerprint(
            definingClass = "${root}configuration/data/ConfigurationSettingsStorage;",
            strings = listOf("pending_plan_downgrade"), returnType = "${root}configuration/plans/Tier;",
        ).uniqueMatch().method.addInstructions(0, """
            sget-object v0, ${root}configuration/plans/Tier;->HIGH:${root}configuration/plans/Tier;
            return-object v0
        """.trimIndent())
    }
}
