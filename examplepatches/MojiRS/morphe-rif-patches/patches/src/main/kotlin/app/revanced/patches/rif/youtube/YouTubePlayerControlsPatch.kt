package app.revanced.patches.rif.youtube

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.revanced.patches.rif.settings.addRevancedPreferenceCategory
import app.revanced.patches.rif.settings.checkBoxPreference
import app.revanced.patches.rif.settings.revancedSettingsPatch
import app.revanced.patches.rif.settings.revancedSettingsResourcePatch
import app.revanced.patches.rif.shared.RIF_COMPATIBILITY
import app.revanced.patches.rif.shared.requireScratchRegister
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val EXTENSION = "Lapp/revanced/extension/rif/YouTubePlayerControls;"

// Adds the "YouTube" category to the ReVanced screen.
val youTubePlayerControlsSettingsResourcePatch = resourcePatch(
    description = "Adds the YouTube player controls settings.",
) {
    compatibleWith(*RIF_COMPATIBILITY)
    dependsOn(revancedSettingsResourcePatch)

    execute {
        addRevancedPreferenceCategory("YouTube") { doc, category ->
            category.appendChild(
                doc.checkBoxPreference(
                    "YOUTUBE_CAPTIONS_LANDSCAPE",
                    "Captions on by default: landscape",
                    default = false,
                ),
            )
            category.appendChild(
                doc.checkBoxPreference(
                    "YOUTUBE_CAPTIONS_VERTICAL",
                    "Captions on by default: vertical",
                    default = false,
                ),
            )
            category.appendChild(
                doc.checkBoxPreference(
                    "YOUTUBE_CAPTIONS_SHORTS",
                    "Captions on by default: Shorts",
                    default = false,
                ),
            )
        }
    }
}

// android-youtube-player's LegacyYouTubePlayerView.setCustomPlayerUi(View): rif passes it the
// library's default control overlay once per player. Class and method names are kept by R8 in
// both builds.
private val setCustomPlayerUiFingerprint = fingerprint {
    custom { method, classDef ->
        classDef.type ==
            "Lcom/pierfrancescosoffritti/androidyoutubeplayer/core/player/views/LegacyYouTubePlayerView;" &&
            method.name == "setCustomPlayerUi"
    }
}

// The JS bridge methods the page calls (kept by name: they are @JavascriptInterface). One hook
// each so the controls know the player state without polling.
private fun bridgeFingerprint(name: String) = fingerprint {
    custom { method, _ ->
        method.name == name && method.parameterTypes.map { it.toString() } == listOf("Ljava/lang/String;")
    }
}

private val sendStateChangeFingerprint = bridgeFingerprint("sendStateChange")
private val sendErrorFingerprint = bridgeFingerprint("sendError")

@Suppress("unused")
val youTubePlayerControlsPatch = bytecodePatch(
    name = "YouTube player controls",
    description = "Double-tap to seek, hold for 2x speed, and speed and captions controls in the YouTube player.",
) {
    compatibleWith(*RIF_COMPATIBILITY)
    dependsOn(youTubePlayerControlsSettingsResourcePatch, revancedSettingsPatch)
    extendWith("extensions/extension.mpe")

    execute {
        // Hook A: after the overlay is attached, add the gestures and the settings button.
        // p0 = the player view, p1 = the overlay.
        val setUi = setCustomPlayerUiFingerprint.method
        val lastReturn = setUi.instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
        if (lastReturn < 0) throw PatchException("return-void not found in setCustomPlayerUi")
        setUi.addInstructions(
            lastReturn,
            "invoke-static { p0, p1 }, $EXTENSION->onPlayerUi(Landroid/view/ViewGroup;Landroid/view/View;)V",
        )

        // Hook C: state and error callbacks from the page; p1 = the state/error string.
        sendStateChangeFingerprint.method.addInstructions(
            0,
            "invoke-static { p1 }, $EXTENSION->onState(Ljava/lang/String;)V",
        )
        sendErrorFingerprint.method.addInstructions(
            0,
            "invoke-static {}, $EXTENSION->onError()V",
        )

        // Hook B: the IFramePlayerOptions builder constructor fills the playerVars JSONObject;
        // hand it over before the constructor returns (v0 is a dead scratch local there).
        val init = iframePlayerOptionsBuilderFingerprint.method
        val jsonField = init.instructions.firstNotNullOfOrNull { insn ->
            if (insn.opcode != Opcode.IPUT_OBJECT) return@firstNotNullOfOrNull null
            ((insn as ReferenceInstruction).reference as? FieldReference)
                ?.takeIf { it.type == "Lorg/json/JSONObject;" }
        } ?: throw PatchException("playerVars JSONObject field not found")
        val end = init.instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
        if (end < 0) throw PatchException("return-void not found in IFramePlayerOptions builder")
        requireScratchRegister(init)
        init.addInstructions(
            end,
            """
                iget-object v0, p0, $jsonField
                invoke-static { v0 }, $EXTENSION->playerVars(Lorg/json/JSONObject;)V
            """,
        )
    }
}
