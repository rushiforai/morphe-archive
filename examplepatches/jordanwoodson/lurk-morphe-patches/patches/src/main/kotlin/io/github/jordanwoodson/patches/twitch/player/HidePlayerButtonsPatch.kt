package io.github.jordanwoodson.patches.twitch.player

import io.github.jordanwoodson.patches.twitch.shared.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resource.resourceId
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting
import io.github.jordanwoodson.patches.twitch.shared.addInstructionsIfEnabled
import io.github.jordanwoodson.patches.twitch.highlights.HIGHLIGHTS_CLASS
import io.github.jordanwoodson.patches.twitch.settings.twitchSettings
import io.github.jordanwoodson.patches.twitch.settings.twitchSettingsPatch
import io.github.jordanwoodson.patches.shared.invokeStatic
import io.github.jordanwoodson.patches.shared.parameterRegister
import io.github.jordanwoodson.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import io.github.jordanwoodson.patches.twitch.shared.HermesBundle
import io.github.jordanwoodson.patches.twitch.shared.hex
import io.github.jordanwoodson.patches.twitch.shared.twitchHermes
import io.github.jordanwoodson.patches.twitch.shared.twitchHermesPatch
import io.github.jordanwoodson.patches.twitch.shared.twitchMatch
import io.github.jordanwoodson.patches.twitch.tipping.filterUiFlag

private const val CLIP = "hide_clip_button"
private const val CAST = "hide_cast_button"
private const val SHARE = "hide_share_button"

@Suppress("unused")
val hidePlayerButtonsPatch = bytecodePatch(
    name = "Hide player buttons",
    description = "Hides the player's Clip, Cast and Share buttons, each with its own switch. Cast stays " +
        "visible by default. Other ways to clip and share, such as the channel page, are unchanged.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_TWITCH)
    dependsOn(twitchSettingsPatch, twitchHermesPatch)
    execute {
        // Clip: one state class feeds every native player surface; the live overlay also has an option.
        filterUiFlag(ClipButtonStateFingerprint, "ClipButtonUiState(isClipButtonVisible=", "$HIGHLIGHTS_CLASS->clipButtonVisible(Z)Z")
        filterUiFlag(PlayerOverlayOptionsFingerprint, ", isClipOptionVisible=", "$HIGHLIGHTS_CLASS->clipButtonVisible(Z)Z")
        // Share: the live overlay's option, the VOD/clip overlay's view and vertical theatre's action.
        filterUiFlag(PlayerOverlayOptionsFingerprint,
            "PlayerOverlayOptions(isInfoOptionVisible=false, infoOptionContentDescription=null, isShareOptionVisible=",
            "$HIGHLIGHTS_CLASS->shareButtonVisible(Z)Z")
        hideSeekableOverlayShare()
        VerticalShareActionFingerprint.twitchMatch("vertical theatre share action").method
            .addInstructionsIfEnabled(SHARE, "return-void")
        // Cast: every native cast button is an AndroidX MediaRouteButton.
        CastButtonVisibilityFingerprint.twitchMatch("cast button setVisibility").method.apply {
            addInstructions(0, """
                ${invokeStatic("$HIGHLIGHTS_CLASS->castVisibility(I)I", parameterRegister(1))}
                move-result p1
            """)
        }
        CastButtonAttachedFingerprint.twitchMatch("cast button onAttachedToWindow").method.apply {
            addInstructions(0, invokeStatic("$HIGHLIGHTS_CLASS->hideCastButton(Landroid/view/View;)V", parameterRegister(0)))
        }
        twitchHermes.hidePlayerButtons()

        twitchSettings.add(
            SwitchSetting(CLIP, "Hide Clip button", "The player's Create Clip button.", Section.INTERFACE, restart = true),
            SwitchSetting(CAST, "Hide Cast button", "The player's Chromecast button.", Section.INTERFACE,
                default = false, restart = true),
            SwitchSetting(SHARE, "Hide Share button", "The player's Share button.", Section.INTERFACE, restart = true),
        )
    }
}

private fun BytecodePatchContext.hideSeekableOverlayShare() {
    val method = SeekableOverlayFingerprint.twitchMatch("VOD/clip player overlay").method
    val instructions = method.implementation!!.instructions.toList()
    val id = resourceId(ResourceType.ID, "share_button")
    val lookup = instructions.indices.single { (instructions[it] as? WideLiteralInstruction)?.wideLiteral == id }
    val cast = (lookup + 1 until instructions.size).first { instructions[it].opcode == Opcode.CHECK_CAST }
    val store = cast + 1
    if (((instructions[cast] as ReferenceInstruction).reference as TypeReference).type != "Landroid/widget/ImageView;" ||
        instructions[store].opcode != Opcode.IPUT_OBJECT ||
        (instructions[store] as TwoRegisterInstruction).registerA != (instructions[cast] as OneRegisterInstruction).registerA) {
        throw PatchException("Twitch: unexpected VOD overlay share button setup")
    }
    val register = (instructions[store] as TwoRegisterInstruction).registerA
    method.addInstructions(store + 1, """
        invoke-static/range { v$register .. v$register }, $HIGHLIGHTS_CLASS->hideShareButton(Landroid/view/View;)V
    """)
}

/** RN Ultralight theatre: the clip and cast components, and the share button in both control overlays. */
internal fun HermesBundle.hidePlayerButtons() {
    returnNull("TheatreClipButtonImpl", CLIP)
    returnNull("ChromecastButton", CAST, defaultEnabled = false)
    // PlayerControlsOverlay always renders the share IconButton (disabled without onShare), so its JSX
    // call becomes null in the same register: `onShare !== undefined`, the two props, then Call3.
    // The registers are the compiler's for the supported version (onShare r32, props object r88, IconButton r89,
    // jsx r90).
    replace("PlayerControlsOverlay", SHARE, hex("17 04 20 02 52 58 04 04 52 58 20 05 6f 58 5a 02 59 58"),
        hex("17 04 20 02 52 58 04 04 52 58 20 05 94 58 94 58 94 58"))
    // SkylineControlsOverlay only renders it when onShare is set.
    falseProperty("SkylineControlsOverlay", "onShare", SHARE)
}
