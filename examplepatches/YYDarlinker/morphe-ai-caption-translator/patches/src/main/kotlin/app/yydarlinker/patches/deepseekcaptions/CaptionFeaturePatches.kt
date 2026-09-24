package app.yydarlinker.patches.deepseekcaptions

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.yydarlinker.patches.shared.Constants.YOUTUBE

/** Selection is reset for every patching session, then finalized once for all selected roots. */
internal object CaptionFeatures { var ai=false; var simplified=false; var memory=false }
internal val captionSupportPatch = bytecodePatch {
    dependsOn(captionLocalizationPatch)
    extendWith("extensions/extension.mpe")
    execute {
        CaptionFeatures.ai=false;CaptionFeatures.simplified=false;CaptionFeatures.memory=false
        YouTubeActivityOnCreateFingerprint.method.addInstruction(0,
            "invoke-static/range {p0 .. p0}, Lapp/yydarlinker/deepseekcaptions/CaptionAddonSupport;->initialize(Landroid/app/Activity;)V")
    }
    finalize { installNativeCaptionBridge(CaptionFeatures.ai,CaptionFeatures.simplified,CaptionFeatures.memory) }
}

@Suppress("unused")
val simplifiedCaptionLanguagePatch=bytecodePatch(
    name="Add Simplified Chinese to auto-translate",
    description="Adds Simplified Chinese using the app's localized language ordering. Works with native YouTube captions without AI.",
    default=false,
) {
    compatibleWith(YOUTUBE)
    dependsOn(captionSupportPatch)
    execute { CaptionFeatures.simplified=true }
}

@Suppress("unused")
val rememberCaptionSelectionPatch=bytecodePatch(
    name="Remember caption selection",
    description="Remembers caption language, source/translation mode and on/off selection across videos for this app session, with or without AI.",
    default=false,
) {
    compatibleWith(YOUTUBE)
    dependsOn(captionSupportPatch)
    execute { CaptionFeatures.memory=true }
}
