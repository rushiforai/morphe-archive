package patches.deezer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

private const val POLICY = "Lcom/deezer/core/data/model/policy/IllIlIlIIlIllIll;"
private const val FEATURE = "LlIlIIIllIlIlll;"
private const val AD_KIND = "LllIIIllIIIIlIll;"
private const val TRACK = "LlllIIllIIllIlII;"
private const val RIGHTS_HELPER = "LIIlIIlIllllIIllI;"

/**
 * Deezer's effective licence is a set of feature bits, not the raw gateway JSON:
 * `IIIIlIIIIIIIIlll(feature)` answers playback rights (preview, device limit,
 * offline, radio) and `llIIIllIlIllIII(kind)` answers audio/display advertising.
 * The Milkbeat Deezer plugin streams full tracks from the same account using
 * song.getData + media.deezer.com/v1/get_url; these hooks keep the native client
 * from turning that same stream into a preview, a device-limit refusal or a
 * subscription requirement.
 */
@Suppress("unused")
val deezerEnableFullStreaming = bytecodePatch(
    name = "Enable full streaming",
    description = "Keeps full-track playback enabled for the signed-in account: removes the preview and " +
        "device-limit blocks, keeps offline/radio rights, disables the streaming time limit and leaves " +
        "unlicensed catalogue entries playable through Deezer's own media service. Account, catalogue " +
        "and playback transport are unchanged.",
    default = true,
) {
    compatibleWith(deezer)
    dependsOn(deezerBase, deezerKeepSessionOnColdStart)

    execute {
        // Only PREVIEW (0x20) and DEVICE_LIMITATION (0x40) stay denied. MOD,
        // OFFLINE, CHROMECAST, RADIO and QUEUELIST_EDITION remain available.
        exact(POLICY, "lIIIIlllIlllll", "Z", FEATURE).method.addInstructions(
            0,
            """
                iget v0, p1, $FEATURE->IIllllllllIlll:I
                const/16 v1, 0x20
                if-eq v0, v1, :deny
                const/16 v1, 0x40
                if-eq v0, v1, :deny
                const/4 v0, 0x1
                return v0
                :deny
                const/4 v0, 0x0
                return v0
            """,
        )

        // Audio and display advertising are not an entitlement requirement here.
        exact(POLICY, "IlIIlIlIlllIII", "Z", AD_KIND).method.addInstructions(
            0,
            "const/4 v0, 0x0\nreturn v0",
        )

        // A zero duration is the "no streaming limit" value the licence exposes.
        exact(POLICY, "IIlIlIlIlIllllll", "I").method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")

        // The licence stays active; the app rechecks it through the gateway itself.
        exact(POLICY, "llIllllIllIIlIl", "Z").method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")

        // Per-track rights: the native player uses the same helper for the old and
        // new catalogue entries. A signed-in free account still receives a track
        // token and a full media stream from Deezer, so the client-side verdict is
        // what has to stop rejecting the track before playback starts.
        exact(
            RIGHTS_HELPER,
            "IIIIlIllIllIlIII",
            "Z",
            TRACK,
            "Lcom/deezer/core/data/model/policy/IllIlIlIIlIllIll;",
            "J",
        ).method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
    }
}
