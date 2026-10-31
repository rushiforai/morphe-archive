package patches.videolandatv

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import patches.atv.exact

@Suppress("unused")
val disableTrackingPatch = bytecodePatch(
    name = "Disable tracking",
    description = "Disables inspected Tealium, Snowplow, NPAW, advertising-ID, New Relic and automatic Google/Facebook measurement paths, including queued CCT uploads. Functional services remain; full traffic acceptance is pending.",
    default = true,
) {
    compatibleWith(videolandTv)
    dependsOn(originalInput, trackingResources)
    execute {
        // Evaluate at consumption, so cached and remotely refreshed values are covered.
        // Constant.equals accepts null. Scratch v0 is initialized again by the original
        // body; p0/p1 and unknown configuration keys retain the original behavior.
        val keys = listOf("activateTealium", "playerNPAWv7Enabled", "playerSnowplowMediaTrackingEnabled")
        val guards = keys.joinToString("\n") { key -> """
            const-string v0, "$key"
            invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v0
            if-nez v0, :videoland_disabled
        """.trimIndent() }
        exact("Lcom/bedrockstreaming/component/config/domain/ConfigImpl;",
            "g(Ljava/lang/String;)Z", 4, 11).addInstructions(0, guards + """

            goto :videoland_original
            :videoland_disabled
            const/4 v0, 0x0
            return v0
            :videoland_original
            nop
        """.trimIndent())

        val tealium = "Lcom/bedrockstreaming/plugin/tealium/TealiumTaggingPlan;"
        exact(tealium, "o0(Ljava/lang/String;Ljava/util/Map;)V", 11, 18).addInstructions(0, "return-void")
        exact(tealium, "s0(Ljava/util/Map;)V", 5, 15).addInstructions(0, "return-void")

        // The constructor otherwise creates an emitter and sends InitEvent immediately,
        // before the player-session feature flag is read. Keep its initialized object
        // and three dependencies; nullable tracker/session fields remain null.
        val snowplow = "Lcom/bedrockstreaming/plugin/snowplow/SnowplowTracker;"
        exact(snowplow,
            "<init>(Landroid/content/Context;Lfp/c;LBj/a;Lcom/bedrockstreaming/feature/player/domain/mediaplayer/usecase/GetDeviceVolumeUseCase;Lcom/bedrockstreaming/plugin/snowplow/SnowplowEntityMapper;)V",
            15, 114).apply {
            val anchors = instructions.withIndex().filter { (_, instruction) ->
                val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                field?.definingClass == snowplow && field.name == "c" &&
                    field.type == "Lcom/bedrockstreaming/plugin/snowplow/SnowplowEntityMapper;"
            }
            check(anchors.size == 1) { "Changed Videoland Snowplow initialization" }
            addInstructions(anchors.single().index + 1, "return-void")
        }

        exact("Lcom/bedrockstreaming/plugin/advertisingid/google/data/GoogleAdvertisingIdSource;",
            "a()Lx6/a;", 4, 27).addInstructions(0, "sget-object v0, Lx6/b;->a:Lx6/b;\nreturn-object v0")
        exact("Lcom/newrelic/agent/android/NewRelic;",
            "start(Landroid/content/Context;)V", 7, 83).addInstructions(0, "return-void")

        // The inspected uploader maps local 403 to fatal, deletes the batch and
        // completes. No redirect, HTTP call or transient retry is introduced.
        // Other methods on this R8-merged class belong to media and stay intact.
        exact("LA3/T;", "e(LBr/h;)LA3/X;", 16, 184).addInstructions(0, """
            new-instance v0, LA3/X;
            const/16 v1, 0x193
            const/4 v2, 0x0
            const-wide/16 v3, 0x0
            invoke-direct {v0, v1, v2, v3, v4}, LA3/X;-><init>(ILjava/net/URL;J)V
            return-object v0
        """.trimIndent())
    }
}
