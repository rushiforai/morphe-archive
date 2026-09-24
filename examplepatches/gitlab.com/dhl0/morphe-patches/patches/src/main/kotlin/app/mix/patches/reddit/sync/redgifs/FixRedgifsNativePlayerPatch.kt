/*
 * Copyright 2026 IMXEren.
 * https://gitlab.com/IMXEren/mix-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.mix.patches.reddit.sync.redgifs

import app.mix.patches.reddit.sync.shared.Constants.COMPATIBILITY_SYNC
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

private const val NATIVE_PLAYER_EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/mix/extension/syncforreddit/FixRedgifsNativePlayerPatch;"

/**
 * Sync's click-to-play Redgifs flow never goes through the app's shared OkHttp client that
 * [fixRedgifsApi] patches. Instead it runs its own hand-written Volley request chain
 * (OAuthRedgifTokenRequest -> GrabIpRequest -> GrabRedgifRequest) that calls the same two
 * endpoints Redgifs has removed (`/v2/oauth/client` and `/info`). That chain fails on its very
 * first request, independent of the OkHttp fix, which is why Redgifs previews (loaded through
 * Sync's own image proxy) work while tapping a post to play it always shows
 * "Error connecting to Redgifs".
 *
 * This patch replaces that chain's single entry point (OAuthRequestManager's dispatch method)
 * with a call into [FixRedgifsNativePlayerPatch], which reuses the already-working anonymous
 * token flow from [fixRedgifsApi] and delivers the result back through Sync's own Volley
 * listeners.
 */
@Suppress("unused")
val fixRedgifsNativePlayer = bytecodePatch(
    name = "Fix Redgifs native playback",
    description = "Replaces Sync's dead legacy Redgifs OAuth/IP Volley request chain with a " +
        "working token fetch, so tapping a Redgifs post plays natively instead of showing " +
        "\"Error connecting to Redgifs\".",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SYNC)
    dependsOn(fixRedgifsApi)

    execute {
        val wrapperType = redgifRequestWrapperFingerprint.originalClassDef.type

        // RedgifRequestWrapper's constructor assigns its 4 constructor-parameter fields in
        // declaration order: the raw post url (a), a force-HD flag (b), the Volley success
        // listener (e), and the Volley error listener (f). Verified against this exact build's
        // decompiled output. The wrapper also has two more String fields (c, d) that are only
        // populated later by the original OAuth token / IP responses, so they are deliberately
        // not read here - the replacement flow below never needs them.
        oAuthRequestManagerEntryFingerprint.method.addInstructions(
            0,
            """
            iget-object v0, p0, $wrapperType->a:Ljava/lang/String;
            iget-boolean v1, p0, $wrapperType->b:Z
            iget-object v2, p0, $wrapperType->e:Lcom/android/volley/Response${'$'}Listener;
            iget-object v3, p0, $wrapperType->f:Lcom/android/volley/Response${'$'}ErrorListener;
            invoke-static { v0, v1, v2, v3 }, $NATIVE_PLAYER_EXTENSION_CLASS_DESCRIPTOR->fetchRedgif(Ljava/lang/String;ZLcom/android/volley/Response${'$'}Listener;Lcom/android/volley/Response${'$'}ErrorListener;)V
            return-void
            """
        )
    }
}
