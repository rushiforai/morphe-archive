package app.starkist.patches.newyorker

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.starkist.patches.newyorker.NewYorkerConstants.COMPATIBILITY_NEW_YORKER
import app.starkist.patches.newyorker.settings.starSettingsPatch
import app.starkist.patches.shared.sharedExtensionPatch
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction

private const val ARTICLE_EXTENSION_CLASS = "Lapp/starkist/extension/newyorker/ArticleFontPatch;"
private const val APP_EXTENSION_CLASS = "Lapp/starkist/extension/newyorker/AppTextPatch;"

@Suppress("unused")
val fontAndTextSizePatch = bytecodePatch(
    name = "Font and text size",
    description = "Adds font and text size options for the whole app to Star settings, including your own font files.",
    default = true
) {
    compatibleWith(COMPATIBILITY_NEW_YORKER)

    dependsOn(sharedExtensionPatch, starSettingsPatch)

    execute {
        // region Articles (web pages)

        // p1 is the method's first parameter: the article's WebView.
        ArticleOnPageStartedFingerprint.method.addInstruction(
            0,
            "invoke-static { p1 }, $ARTICLE_EXTENSION_CLASS->onPageStarted(Landroid/webkit/WebView;)V"
        )

        ArticleOnPageFinishedFingerprint.method.addInstruction(
            0,
            "invoke-static { p1 }, $ARTICLE_EXTENSION_CLASS->onPageFinished(Landroid/webkit/WebView;)V"
        )

        // p1 is the WebView and p2 the request. If the extension returns a response
        // (the custom font, or the stylesheet with our CSS), return it right away.
        ArticleShouldInterceptRequestFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { p1, p2 }, $ARTICLE_EXTENSION_CLASS->interceptRequest(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
                    move-result-object v0
                    if-eqz v0, :star_continue
                    return-object v0
                """,
                ExternalLabel("star_continue", getInstruction(0))
            )
        }

        // endregion

        // region Rest of the app (native screens)

        // Text size: just before the base activity applies its configuration,
        // replace the fontScale it forced to 1.0. p0 is the activity.
        BaseActivityAttachBaseContextFingerprint.let { fingerprint ->
            val applyConfiguration = fingerprint.instructionMatches.last()
            val configurationRegister = applyConfiguration.getInstruction<FiveRegisterInstruction>().registerD

            fingerprint.method.addInstruction(
                applyConfiguration.index,
                "invoke-static { p0, v$configurationRegister }, $APP_EXTENSION_CLASS->" +
                    "applyTextScale(Landroid/content/Context;Landroid/content/res/Configuration;)V"
            )
        }

        // Font: right after a font file is turned into a Typeface, swap it for the chosen font
        // before the app caches it and hands it to any screen.
        ResourcesCompatLoadFontFingerprint.let { fingerprint ->
            val (_, createTypeface, moveResult) = fingerprint.instructionMatches
            val contextRegister = firstArgumentRegister(createTypeface.instruction)
            val typefaceRegister = moveResult.getInstruction<OneRegisterInstruction>().registerA

            fingerprint.method.addInstructions(
                moveResult.index + 1,
                """
                    invoke-static { v$contextRegister, v$typefaceRegister }, $APP_EXTENSION_CLASS->overrideTypeface(Landroid/content/Context;Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
                    move-result-object v$typefaceRegister
                """
            )
        }

        // endregion
    }
}

/**
 * Register holding the first argument of an instance method call,
 * which comes right after the register holding the object it's called on.
 */
private fun firstArgumentRegister(call: Instruction) = when (call) {
    is RegisterRangeInstruction -> call.startRegister + 1
    is FiveRegisterInstruction -> call.registerD
    else -> error("Unexpected call instruction: $call")
}
