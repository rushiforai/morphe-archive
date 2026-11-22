package patches.videoland

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import patches.atv.exact

@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = "Hide ads ${patches.shared.platformTitleSuffix(videolandMobile)}",
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
            "a(Loz/d;)Ljava/lang/Object;", 6, 8)
            .addInstructions(0, "sget-object v0, Ljz/K;->d:Ljz/K;\nreturn-object v0")

        exact("Lcom/bedrockstreaming/feature/adengine/domain/requester/AdEngineAdRequester;",
            "b(JLnf/o;)Ljava/lang/Object;", 11, 10)
            .addInstructions(0, "sget-object v0, Ljz/K;->d:Ljz/K;\nreturn-object v0")

        exact("Lcom/bedrockstreaming/feature/adengine/domain/lbanner/LBannerAdRequester;",
            "a(Loz/d;)Ljava/lang/Object;", 2, 8)
            .addInstructions(0, "sget-object p1, Ljz/K;->d:Ljz/K;\nreturn-object p1")

        exact("Lcom/bedrockstreaming/feature/adengine/domain/lbanner/LBannerAdRequester;",
            "b(JLnf/o;)Ljava/lang/Object;", 4, 6)
            .addInstructions(0, "const/4 p1, 0x0\nreturn-object p1")

        exact("Lcom/bedrockstreaming/feature/adengine/data/config/AdEngineConfigImpl;",
            "a()LA9/n;", 5, 24)
            .addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")

        // The pause-ad coroutine completes with the native Empty result.
        exact("Lcom/bedrockstreaming/feature/adengine/domain/pausead/usecase/GetFirstPlayablePauseAdItemUseCaseImpl;",
            "a(Lcom/bedrockstreaming/feature/adengine/domain/pausead/requester/PauseAdAdRequestUrlData;Loz/d;)Ljava/lang/Object;", 7, 90)
            .addInstructions(0, "sget-object v0, LF9/d;->a:LF9/d;\nreturn-object v0")

        exact("Lcom/bedrockstreaming/feature/player/presentation/mobile/control/MobileReplayControl;",
            "h0()V", 13, 87)
            .addInstructions(0, "return-void")

        // LiveQueueItem.v() selects the supplied fallback on null; preserve its DAI predicate and DRM.
        exact("Lcom/bedrockstreaming/plugin/yospace/YospaceDaiResourceCreator;",
            "a(Lbg/a;)Lhg/c;", 22, 97)
            .addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")

    }
}
