package app.southstar21.patches.spotify.layout.lyricsblur

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.southstar21.patches.spotify.misc.extension.spotifySharedExtensionPatch
import app.southstar21.patches.spotify.shared.Constants.COMPATIBILITY_SPOTIFY
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.formatter.DexFormatter
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS =
    "Lapp/southstar21/extension/spotify/lyricsblur/LyricsBlurPatch;"

/**
 * Spotify's own "blur this Modifier when the flag is true" (p.lxs1.k): a composed modifier that
 * animates a 12px blur in and out over 200 ms and does nothing below Android 12.
 */
private const val SPOTIFY_BLUR_MODIFIER = "Lp/lxs1;->k(Lp/xzo0;Z)Lp/xzo0;"

/** Inside the line composable: Modifier.fillMaxWidth(1f)-like call; v0 is the line's Modifier, v15 is 1.0f. */
private const val ANCHOR_CALL = "Lp/mtc1;->f(Lp/xzo0;F)Lp/xzo0;"

private fun extensionMethod(name: String, returnType: String) = Fingerprint(
    definingClass = EXTENSION_CLASS,
    name = name,
    returnType = returnType,
    parameters = listOf(),
)

@Suppress("unused")
val spotifyLyricsBlurPatch = bytecodePatch(
    name = "Lyrics blur",
    description = "Blurs the lyrics lines that aren't being sung and keeps the current line sharp. " +
            "The blur fades in and out; it needs Android 12+.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SPOTIFY)

    dependsOn(spotifySharedExtensionPatch)

    val requireSynced by booleanOption(
        key = "requireSynced",
        default = true,
        title = "Only for synced lyrics",
        description = "Blur only while the lyrics follow the song. Turn off if the blur never shows " +
                "on synced lyrics (then lyrics without timing are blurred as well).",
        required = true,
    )

    val debugLogging by booleanOption(
        key = "debugLogging",
        default = false,
        title = "Debug logging",
        description = "Writes what the hook sees to logcat under the tag LyricsBlur.",
        required = true,
    )

    execute {
        extensionMethod("requireSynced", "Z").method.addInstructions(
            0,
            """
                const/4 v0, ${if (requireSynced == true) 1 else 0}
                return v0
            """
        )
        extensionMethod("debugLogging", "Z").method.addInstructions(
            0,
            """
                const/4 v0, ${if (debugLogging == true) 1 else 0}
                return v0
            """
        )

        val method = LyricsLineFingerprint.method

        // The one call of ANCHOR_CALL in the method, with exactly (v0, v15) as arguments.
        // DexFormatter produces the same "Lclass;->name(params)return" string as the deprecated
        // ReferenceUtil.getMethodDescriptor, which this replaces.
        val anchors = method.implementation!!.instructions.withIndex().filter { (_, instruction) ->
            instruction.opcode == Opcode.INVOKE_STATIC &&
                    ((instruction as ReferenceInstruction).reference as? MethodReference)
                        ?.let { DexFormatter.INSTANCE.getMethodDescriptor(it) == ANCHOR_CALL } == true
        }
        if (anchors.size != 1) {
            error("Lyrics blur: expected one call of $ANCHOR_CALL, found ${anchors.size}")
        }
        val (index, anchor) = anchors.single()
        val call = anchor as FiveRegisterInstruction
        if (call.registerC != 0 || call.registerD != 15) {
            error(
                "Lyrics blur: the call of $ANCHOR_CALL uses v${call.registerC}, v${call.registerD}, " +
                        "expected v0, v15. Spotify's code changed."
            )
        }

        // smali pN is 0-based: p0 = v62 = psh0 (reference), p1 = v63 (first Z), p2 = v64
        // (second Z). v63 is believed to be "this line is the active one"
        // (p.sit1.v(syncState, index)); v64 the synced-mode flag (p.tzh0#b).
        // v2 is free at the anchor: the next instruction after the anchor's result
        // overwrites it (`iget v2, ...`) before anything reads it.
        // { p1 .. p2 } = the two Z params (v63, v64) — never p0 (the reference).
        method.addInstructions(
            index,
            """
                invoke-static/range { p1 .. p2 }, $EXTENSION_CLASS->shouldBlur(ZZ)Z
                move-result v2
                invoke-static { v0, v2 }, $SPOTIFY_BLUR_MODIFIER
                move-result-object v0
            """
        )

        // Anchor tracker (diagnostic): fires per call at the blur insertion point, capped at
        // 200. Together with the once-per-process "LB: enter ksh0.a" marker it distinguishes
        // "composable entered but Compose skipped the body" from "body ran". Debug-only.
        method.addInstructions(
            index,
            """
                invoke-static/range { p1 .. p2 }, $EXTENSION_CLASS->anchor(ZZ)V
            """
        )

        // Marker (a): at method entry — confirms this composable runs at all — and the entry
        // tracker: logs (p1, p2) on EVERY call, so we see composition activity even if the
        // body exits before the anchor. { p1 .. p2 }: the two Z params (v63, v64). v0 is free on entry.
        method.addInstructions(
            0,
            """
                const-string v0, "LB: enter ksh0.a"
                invoke-static { v0 }, $EXTENSION_CLASS->marker(Ljava/lang/String;)V
                invoke-static/range { p1 .. p2 }, $EXTENSION_CLASS->entry(ZZ)V
            """
        )

        // Diagnostic: probe the translate-mode wrapper composable p.ksh0.b — possibly the one
        // that actually renders the full-screen lyrics surface. Its own call of ANCHOR_CALL
        // (modifier + 1.0f, modifier in v1) is tracked with a per-call anchor tracker; no blur
        // is injected there yet: the (p5, p6) booleans' semantics are unknown. If the on-device
        // log shows bAnchor firing and the a-anchor silent, the blur hook belongs in b.
        // b params (0-based): p5 = v17 (Z), p6 = v18 (Z) -> { p5 .. p6 }.
        // Optional: if the wrapper's shape changes, the a-path stays patched.
        val wrapper = runCatching { LyricsLineWrapperFingerprint.method }.getOrNull()
        if (wrapper != null) {
            wrapper.addInstructions(
                0,
                """
                    const-string v0, "LB: enter ksh0.b"
                    invoke-static { v0 }, $EXTENSION_CLASS->marker(Ljava/lang/String;)V
                """
            )
            val bAnchors = wrapper.implementation!!.instructions.withIndex().filter { (_, instruction) ->
                instruction.opcode == Opcode.INVOKE_STATIC &&
                        ((instruction as ReferenceInstruction).reference as? MethodReference)
                            ?.let { DexFormatter.INSTANCE.getMethodDescriptor(it) == ANCHOR_CALL } == true
            }
            if (bAnchors.size == 1) {
                val (bIndex, bAnchorInstruction) = bAnchors.single()
                val bCall = bAnchorInstruction as FiveRegisterInstruction
                if (bCall.registerC == 1 && bCall.registerD == 2) {
                    wrapper.addInstructions(
                        bIndex,
                        """
                            invoke-static/range { p5 .. p6 }, $EXTENSION_CLASS->anchorB(ZZ)V
                        """
                    )
                } else {
                    wrapper.addInstructions(
                        0,
                        """
                            const-string v0, "LB: b anchor regs != v1,v2 (see b smali)"
                            invoke-static { v0 }, $EXTENSION_CLASS->marker(Ljava/lang/String;)V
                        """
                    )
                }
            } else {
                wrapper.addInstructions(
                    0,
                    """
                        const-string v0, "LB: b anchors=${bAnchors.size} (see b smali)"
                        invoke-static { v0 }, $EXTENSION_CLASS->marker(Ljava/lang/String;)V
                    """
                )
            }
        }
    }
}
