package dev.twitchpatches.patches.twitch.diagnostics

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import dev.twitchpatches.patches.twitch.shared.*

private const val TRACE = "Ldev/twitchpatches/extension/diagnostics/PlaybackTrace;"

@Suppress("unused")
val inspectPlaybackPatch = bytecodePatch(
    name = "Playback diagnostics",
    description = "Records playlist structure and playback frame counters. Disabled by default.",
    default = false,
) {
    compatibleWith(TwitchTarget.candidateCompatibility)
    dependsOn(twitchExtensionPatch)
    execute {
        val factory = resolveIvsHttp()
        val response = classDefBy("${IVS_NET}Response;")
        if (!AccessFlags.PUBLIC.isSet(response.accessFlags) || AccessFlags.FINAL.isSet(response.accessFlags))
            throw PatchException("Playback trace needs a public extensible IVS Response")
        listOf("readContent", "getHeader").forEach { name ->
            if (response.methods.filter { it.name == name }.uniqueHook("IVS response $name").let {
                    AccessFlags.FINAL.isSet(it.accessFlags)
                }) throw PatchException("Playback trace cannot override final IVS response $name")
        }
        val cue = classDefBy("Lcom/twitchrn/player/AdMetadataCueRouter;").methods.filter {
            it.isInstance(listOf("Ljava/lang/String;"), "V") &&
                it.hasStrings("twitch-stitched-ad", "twitch-maf-ad", "twitch-stream-source")
        }.uniqueHook("React Native ad metadata router")
        applyIvsHttp(factory, "$TRACE->wrap(${IVS_NET}HttpClient;)${IVS_NET}HttpClient;")
        applyFrameTrace()
        applyFrameSnapshot()
        mutableClassDefBy(cue.definingClass).methods.filter { it.reference == cue.reference }
            .uniqueHook("resolved native cue observer")
            .addInstruction(0, "invoke-static/range {p1 .. p1}, $TRACE->cue(Ljava/lang/String;)V")
    }
}
