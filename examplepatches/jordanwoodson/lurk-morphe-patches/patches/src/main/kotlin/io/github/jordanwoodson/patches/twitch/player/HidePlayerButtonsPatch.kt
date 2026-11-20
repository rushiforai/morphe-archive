package io.github.jordanwoodson.patches.twitch.player

import io.github.jordanwoodson.patches.twitch.shared.addInstructions
import io.github.jordanwoodson.patches.twitch.shared.addInstructionsWithLabels
import io.github.jordanwoodson.patches.twitch.shared.requireNotBranchTarget
import io.github.jordanwoodson.patches.twitch.chat.instructionList
import io.github.jordanwoodson.patches.twitch.chat.methodRef
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
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
private const val CHAT_MODE_POPUP = "hide_chat_mode_popup"

@Suppress("unused")
val hidePlayerButtonsPatch = bytecodePatch(
    name = "Hide player buttons",
    description = "Hides the player's Clip, Cast and Share buttons and the pop-up after a landscape chat mode " +
        "change, each with its own switch. Cast stays visible by default. Other ways to clip and share, such as " +
        "the channel page, are unchanged.",
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
        hideChatModeSnackbar()
        twitchHermes.hidePlayerButtons()

        twitchSettings.add(
            SwitchSetting(CLIP, "Hide Clip button", "The player's Create Clip button.", Section.INTERFACE, restart = true),
            SwitchSetting(CAST, "Hide Cast button", "The player's Chromecast button.", Section.INTERFACE,
                default = false, restart = true),
            SwitchSetting(SHARE, "Hide Share button", "The player's Share button.", Section.INTERFACE, restart = true),
            SwitchSetting(CHAT_MODE_POPUP, "Hide chat mode pop-up",
                "The \"Changed to Column Chat\" notice with Next Mode after you change the landscape chat mode.",
                Section.INTERFACE, restart = true),
        )
    }
}

/**
 * The native snackbar after a landscape chat mode change (issue 85): built, kept for a later dismiss, then shown as
 * the method's last call. While the switch is on, the show is skipped; a later dismiss of a snackbar never shown
 * does nothing.
 */
private fun BytecodePatchContext.hideChatModeSnackbar() {
    val method = ChatModeSnackbarFingerprint.twitchMatch("chat mode snackbar").method
    val instructions = method.instructionList()
    val created = instructions.filter { it.opcode == Opcode.NEW_INSTANCE }
        .map { ((it as ReferenceInstruction).reference as TypeReference).type }.toSet()
    // `snackbar.show(); return`: a no-argument call on a type the method creates, as its last act.
    val show = instructions.indices.singleOrNull { index ->
        val call = instructions[index].methodRef
        instructions[index].opcode == Opcode.INVOKE_VIRTUAL && call != null && call.definingClass in created &&
            call.parameterTypes.isEmpty() && call.returnType == "V" &&
            instructions.getOrNull(index + 1)?.opcode == Opcode.RETURN_VOID
    } ?: throw PatchException("Twitch: unexpected chat mode snackbar")
    // Nothing is read after the show: any register but the snackbar's is free.
    val temp = if ((instructions[show] as FiveRegisterInstruction).registerC == 0) 1 else 0
    method.requireNotBranchTarget(show, "chat mode snackbar")
    method.addInstructionsWithLabels(show, """
        invoke-static {}, $HIGHLIGHTS_CLASS->hideChatModePopup()Z
        move-result v$temp
        if-nez v$temp, :lurk_skip
    """, ExternalLabel("lurk_skip", instructions[show + 1]))
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
    // The registers are the compiler's for the supported version (onShare r35, props object r85, IconButton r86,
    // jsx r87).
    replace("PlayerControlsOverlay", SHARE, hex("17 05 23 03 52 55 05 04 52 55 23 05 6f 55 57 03 56 55"),
        hex("17 05 23 03 52 55 05 04 52 55 23 05 94 55 94 55 94 55"))
    // SkylineControlsOverlay only renders it when onShare is set.
    falseProperty("SkylineControlsOverlay", "onShare", SHARE)
    // useChatModeCycle's cycle callback ends `ref.current = addSnackbar({ ..., action: Next Mode })`; its Call2 becomes
    // undefined in the same register. The callback removes the previous snackbar only when the ref holds one.
    val cycle = matchingFunction(hex("52 02 05 05 6e 02 04 00 02 4a 03 02 00 ${id16("current")} 76 00"))
    replace(cycle, CHAT_MODE_POPUP, hex("6e 02 04 00 02 4a 03 02 00 ${id16("current")}"),
        hex("10 02 02 93 02 4a 03 02 00 ${id16("current")}"))
}
