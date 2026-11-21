package io.github.jordanwoodson.patches.twitch.mature

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import io.github.jordanwoodson.patches.shared.Locators
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting
import io.github.jordanwoodson.patches.shared.settings.requireLocals
import io.github.jordanwoodson.patches.twitch.settings.twitchSettings
import io.github.jordanwoodson.patches.twitch.settings.twitchSettingsPatch
import io.github.jordanwoodson.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import io.github.jordanwoodson.patches.twitch.shared.addInstructionsWithLabels
import io.github.jordanwoodson.patches.twitch.shared.twitchMatch
import io.github.jordanwoodson.patches.twitch.tipping.INTERFACE_CLASS

private const val KEY = "hide_content_label"
private const val BASE_VIEW_DELEGATE = "Ltv/twitch/android/core/mvp/viewdelegate/BaseViewDelegate;"

@Suppress("unused")
val hideContentLabelPatch = bytecodePatch(
    name = "Hide content label",
    description = "Hides the \"Intended for certain audiences\" label at the top of the player on streams with content " +
        "labels. It doesn't skip the content warning; Hide mature content warning does that. Starts off. Turn it on " +
        "in Lurk settings > Interface.",
) {
    compatibleWith(COMPATIBILITY_TWITCH)
    dependsOn(twitchSettingsPatch)
    execute {
        hideContentLabel()
        twitchSettings.add(SwitchSetting(KEY, "Hide content label",
            "The \"Intended for certain audiences\" label at the top of the player.", Section.INTERFACE,
            default = false, restart = true))
    }
}

/**
 * The label is a view delegate that renders the label's state: MatureContent (show the label, fading it in), an error
 * variant, or NotShowing (fade it out). Before the render, a MatureContent state goes to TwitchInterface.hideContentLabel:
 * with the switch on it hides the delegate's view and the render is skipped, so the label never shows. The delegate
 * class draws other views for other states, which pass through.
 */
private fun BytecodePatchContext.hideContentLabel() {
    val render = ContentLabelRenderFingerprint.twitchMatch("content label render").method
    val showing = ContentLabelShowingFingerprint.twitchMatch("content label MatureContent state").method.definingClass
    Locators.record("twitch.hide_content_label.render", render)
    var type = classDefBy(render.definingClass)
    while (type.type != BASE_VIEW_DELEGATE) {
        type = classDefByOrNull(type.superclass ?: "") ?: throw PatchException("Twitch: content label isn't a view delegate")
    }
    val view = type.fields.singleOrNull { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == "Landroid/view/View;" }
        ?: throw PatchException("Twitch: view delegate has no unique view")
    render.requireLocals(1)
    render.addInstructionsWithLabels(0, """
        move-object/from16 v0, p1
        instance-of v0, v0, $showing
        if-eqz v0, :lurk_show_label
        move-object/from16 v0, p0
        iget-object v0, v0, ${view.definingClass}->${view.name}:${view.type}
        invoke-static { v0 }, $INTERFACE_CLASS->hideContentLabel(Landroid/view/View;)Z
        move-result v0
        if-eqz v0, :lurk_show_label
        return-void
    """, ExternalLabel("lurk_show_label", render.getInstruction(0)))
}
