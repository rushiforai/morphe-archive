package patches.videoland

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import patches.atv.exact

@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = "Hide ads",
    description = "Suppresses inspected video, banner and pause-ad requests and uses a supplied live fallback when available. Ad-supported playback and stitched streams require runtime feedback.",
    default = true,
) {
    compatibleWith(videolandMobile)
    dependsOn(originalInput)
    execute {
        // Mobile e() is the ad loader. d() is Picture-in-Picture and must remain unchanged.
        exact("Lcom/bedrockstreaming/feature/player/data/config/PlayerConfigImpl;",
            "e()Z", 3, 6)
            .addInstructions(0, "const/4 v0, 0x0\nreturn v0")

        exact("Lcom/bedrockstreaming/feature/adengine/domain/requester/AdEngineAdRequester;",
            "a(Lwy/c;)Ljava/lang/Object;", 6, 8)
            .addInstructions(0, "sget-object v0, Lry/K;->d:Lry/K;\nreturn-object v0")

        exact("Lcom/bedrockstreaming/feature/adengine/domain/requester/AdEngineAdRequester;",
            "b(JLYe/n;)Ljava/lang/Object;", 11, 10)
            .addInstructions(0, "sget-object v0, Lry/K;->d:Lry/K;\nreturn-object v0")

        exact("Lcom/bedrockstreaming/feature/adengine/domain/lbanner/LBannerAdRequester;",
            "a(Lwy/c;)Ljava/lang/Object;", 2, 8)
            .addInstructions(0, "sget-object p1, Lry/K;->d:Lry/K;\nreturn-object p1")

        exact("Lcom/bedrockstreaming/feature/adengine/domain/lbanner/LBannerAdRequester;",
            "b(JLYe/n;)Ljava/lang/Object;", 4, 6)
            .addInstructions(0, "const/4 p1, 0x0\nreturn-object p1")

        exact("Lcom/bedrockstreaming/feature/adengine/data/config/AdEngineConfigImpl;",
            "a()Ls9/n;", 5, 24)
            .addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")

        // This mobile coroutine completes with nullable d.b, not the TV Empty singleton.
        exact("Lcom/bedrockstreaming/feature/adengine/domain/pausead/usecase/GetFirstPlayablePauseAdItemUseCaseImpl;",
            "a(Lcom/bedrockstreaming/feature/adengine/domain/pausead/requester/PauseAdAdRequestUrlData;Lwy/c;)Ljava/lang/Object;", 7, 67)
            .addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")

        exact("Lcom/bedrockstreaming/feature/player/presentation/mobile/control/MobileReplayControl;",
            "g0()V", 11, 78)
            .addInstructions(0, "return-void")

        // LiveQueueItem.v() selects the supplied fallback on null; preserve its DAI predicate and DRM.
        exact("Lcom/bedrockstreaming/plugin/yospace/YospaceDaiResourceCreator;",
            "a(LOf/a;)LUf/c;", 22, 96)
            .addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")

    }
}
