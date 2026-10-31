package patches.videolandatv

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import patches.atv.exact

@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = "Hide ads",
    description = "Suppresses client video, banner and pause-ad requests. Uses the supplied live fallback when Yospace resource creation is omitted. Ad-supported playback and server-side coverage need feedback.",
    default = true,
) {
    compatibleWith(videolandTv)
    dependsOn(originalInput)
    execute {
        // Pin the inspected optional loader off even if remote config changes.
        exact("Lcom/bedrockstreaming/feature/player/data/config/PlayerConfigImpl;",
            "d()Z", 3, 6).addInstructions(0, "const/4 v0, 0x0\nreturn v0")

        // Both legacy queue and optional Media3 loader consume these same requesters.
        // Complete synchronously with an empty list; never abandon their coroutine.
        val requester = "Lcom/bedrockstreaming/feature/adengine/domain/requester/AdEngineAdRequester;"
        exact(requester, "a(Lbv/c;)Ljava/lang/Object;", 6, 8)
            .addInstructions(0, "sget-object v0, LWu/K;->N:LWu/K;\nreturn-object v0")
        exact(requester, "b(JLze/n;)Ljava/lang/Object;", 11, 10)
            .addInstructions(0, "sget-object v0, LWu/K;->N:LWu/K;\nreturn-object v0")

        // Banner transform expects a nullable ad item, unlike the video transform's list.
        val banner = "Lcom/bedrockstreaming/feature/adengine/domain/lbanner/LBannerAdRequester;"
        exact(banner, "a(Lbv/c;)Ljava/lang/Object;", 2, 8)
            .addInstructions(0, "sget-object p1, LWu/K;->N:LWu/K;\nreturn-object p1")
        exact(banner, "b(JLze/n;)Ljava/lang/Object;", 4, 6)
            .addInstructions(0, "const/4 p1, 0x0\nreturn-object p1")

        // New VAST pause-ad configuration is optional; retain the typed Empty result
        // as a second boundary. U() only schedules/shows the legacy pause-ad overlay.
        exact("Lcom/bedrockstreaming/feature/adengine/data/config/AdEngineConfigImpl;",
            "a()LE9/n;", 5, 24).addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
        exact("Lcom/bedrockstreaming/feature/adengine/domain/pausead/usecase/GetFirstPlayablePauseAdItemUseCaseImpl;",
            "a(Lcom/bedrockstreaming/feature/adengine/domain/pausead/requester/PauseAdAdRequestUrlData;Lbv/c;)Ljava/lang/Object;",
            7, 90).addInstructions(0, "sget-object v0, LJ9/d;->a:LJ9/d;\nreturn-object v0")
        exact("Lcom/bedrockstreaming/feature/player/presentation/tv/control/TvReplayControl;",
            "U()V", 12, 88).addInstructions(0, "return-void")

        // LiveQueueItem.u explicitly selects FallbackableAssetContent's supplied
        // fallback on null. Keep the DAI predicate so that branch remains reachable.
        // A DAI-only asset may still contain stitched ads; do not invent origin URLs.
        exact("Lcom/bedrockstreaming/plugin/yospace/YospaceDaiResourceCreator;",
            "a(Lof/a;)Luf/a;", 22, 96).addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
    }
}
