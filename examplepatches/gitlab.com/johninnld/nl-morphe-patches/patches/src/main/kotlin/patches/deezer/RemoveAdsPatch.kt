package patches.deezer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

private const val ADS_CONFIG = "Lcom/deezer/feature/ads/config/model/AdsConfigDataModel;"
private const val EMPTY_MAP =
    "new-instance v0, Ljava/util/HashMap;\n" +
        "invoke-direct {v0}, Ljava/util/HashMap;-><init>()V\n" +
        "return-object v0"

/**
 * Deezer's ad placements are driven by the gateway-provided AdsConfigDataModel.
 * Returning an empty configuration turns every placement off at its own decision
 * point: the banner section test, the audio/preroll gate, the audio-ad scheduler and
 * the SmartAdServer setup all treat "no config" as "nothing to show".
 */
@Suppress("unused")
val deezerRemoveAdvertising = bytecodePatch(
    name = "Remove advertising",
    description = "Disables Deezer's banner, native, audio and preroll advertising: no ad configuration " +
        "is exposed to the placement logic, playback continues without an ad break, and the audio-ad " +
        "launcher cannot receive its ad payload. Playback, catalogue and account services are unchanged.",
    default = true,
) {
    compatibleWith(deezer)
    dependsOn(originalInput, deezerKeepSessionOnColdStart)

    execute {
        exact(ADS_CONFIG, "getConfig", "Ljava/util/HashMap;").method.addInstructions(0, EMPTY_MAP)
        exact(ADS_CONFIG, "getSections", "Ljava/util/HashMap;").method.addInstructions(0, EMPTY_MAP)

        // Banner placement: no "banner" section means no AdView is ever requested.
        exact("LlIIlIlllIllIlI;", "IllIIIlIIII", "Z").method.addInstructions(
            0,
            "const/4 v0, 0x0\nreturn v0",
        )

        // Audio and preroll gate: run the caller's continuation immediately instead of
        // preparing an ad break or an interstitial.
        exact("LlllIlllIllIIl;", "IllIIllIllIIII", "V", "Ljava/lang/Runnable;", "Z", "Z").method
            .addInstructions(
                0,
                """
                    invoke-interface/range {p1 .. p1}, Ljava/lang/Runnable;->run()V
                    return-void
                """,
            )

        // The audio ad launcher normally copies its ad into the intent. Without the
        // extra, AudioAdsActivity takes its existing no-ad path (resume + finish).
        exact("LlllIIlllIIlIlIl;", "lIllllIIIIII", "V", "Landroid/content/Intent;").method
            .addInstructions(0, "return-void")

        // Last guard for the in-player audio ad controller: drop the pending ad and
        // return before it starts the ad activity.
        exact("LIIIIlllIllllIlI;", "IllIIIlIIII", "V").method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                iput-object v0, p0, LIIIIlllIllllIlI;->IIlllIIIlIIIII:LIlIIIIIIIllllIl;
                return-void
            """,
        )

        // If a video-ad activity is reached through another path, close it instead of
        // loading VAST or IMA content.
        closeAfterSuperOnCreate("Lcom/deezer/feature/ads/audio/model/video/VideoAdsActivity;")
        closeAfterSuperOnCreate("Lcom/deezer/feature/ads/audio/model/vast/VastVideoAdsActivity;")
    }
}
