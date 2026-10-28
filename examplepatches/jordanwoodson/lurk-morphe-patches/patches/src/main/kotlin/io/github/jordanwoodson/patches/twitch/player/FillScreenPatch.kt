package io.github.jordanwoodson.patches.twitch.player

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import io.github.jordanwoodson.patches.shared.Locators
import io.github.jordanwoodson.patches.shared.invoke
import io.github.jordanwoodson.patches.shared.invokeStatic
import io.github.jordanwoodson.patches.shared.parameterRegister
import io.github.jordanwoodson.patches.shared.requireLowRegisters
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting
import io.github.jordanwoodson.patches.twitch.settings.twitchSettings
import io.github.jordanwoodson.patches.twitch.settings.twitchSettingsPatch
import io.github.jordanwoodson.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import io.github.jordanwoodson.patches.twitch.shared.addInstructions
import io.github.jordanwoodson.patches.twitch.shared.freeRegister
import io.github.jordanwoodson.patches.twitch.shared.requireNotBranchTarget
import io.github.jordanwoodson.patches.twitch.shared.twitchMatch

private const val KEY = "fill_screen"
private const val FILL = "Lio/github/jordanwoodson/extension/shared/twitch/TwitchFillScreen;"
private const val DELEGATE_VIEW_OWNER = "Ltv/twitch/android/core/mvp/viewdelegate/BaseViewDelegate;"
private const val RESIZE_MODE = "Lcom/amazonaws/ivs/player/ResizeMode;"
private const val SURFACE = "Lcom/twitchrn/player/PlaybackSurface;"

@Suppress("unused")
val fillScreenPatch = bytecodePatch(
    name = "Fill screen",
    description = "Zooms streams and videos to fill the screen in landscape, the strip beside the camera cutout " +
        "included, cropping their top and bottom instead of showing black bars at the sides, on phones taller " +
        "than 16:9. The player's buttons and the stream's details stay clear of the cutout. Vertical videos, the " +
        "player next to the chat and picture-in-picture keep their bars. Works in the native theatre and in the " +
        "React Native one Twitch can use while Use native player is off. Starts off. Turn it on in Lurk settings " +
        "> Playback.",
) {
    compatibleWith(COMPATIBILITY_TWITCH)
    dependsOn(twitchSettingsPatch)

    execute {
        hookNativePlayer()
        hookFullscreenInsets()
        hookReactNativePlayer()

        twitchSettings.add(
            SwitchSetting(
                KEY,
                "Fill screen",
                "Zoom streams and videos to fill the screen in landscape instead of showing bars at the sides, " +
                    "the strip beside the camera included, cropping their top and bottom. Not for vertical videos, " +
                    "next to the chat or in picture-in-picture.",
                Section.PLAYBACK,
                default = false,
            ),
        )
    }
}

/**
 * The native theatre's player view delegate fits its video container into the player on every layout of the
 * player, by its display type (AspectRatio, ForceCrop for Twitch's pinch to zoom, or MatchWidth). Its start
 * hands the extension the player and the video's size. The extension leaves Twitch's fitting alone and scales
 * the video inside the container afterwards, so the container's size, which Twitch also reads for the
 * picture-in-picture window, stays Twitch's.
 */
context(context: BytecodePatchContext)
private fun hookNativePlayer() {
    val displayType = PlayerDisplayTypeFingerprint.twitchMatch("player display type").originalClassDef.type
    Locators.record("twitch.fill_screen.display_type", displayType)
    val delegate = PlayerViewDelegateFingerprint.twitchMatch("player view delegate").originalClassDef.type
    Locators.record("twitch.fill_screen.view_delegate", delegate)
    val match = Fingerprint(
        definingClass = delegate, accessFlags = listOf(AccessFlags.PUBLIC), returnType = "V", parameters = listOf("I", "I"),
        filters = listOf(
            fieldAccess(definingClass = DELEGATE_VIEW_OWNER, type = "Landroid/view/View;", opcode = Opcode.IGET_OBJECT),
            methodCall(definingClass = "Landroid/view/View;", name = "getWidth"),
            methodCall(definingClass = "this", returnType = displayType, parameters = emptyList()),
            methodCall(definingClass = "Ljava/lang/Enum;", name = "ordinal"),
            methodCall(definingClass = "Landroid/view/View;", name = "requestLayout"),
        ),
    ).twitchMatch("player video size")
    val method = match.method
    Locators.record("twitch.fill_screen.video_size", match.originalMethod)

    // The start: the delegate's root view (the field the method reads its size from) and the video's size.
    val field = (match.instructionMatches[0].instruction as ReferenceInstruction).reference
    if ((match.instructionMatches[0].instruction as TwoRegisterInstruction).registerB != method.parameterRegister(0)) {
        throw PatchException("Twitch: the player video size reads its view from elsewhere")
    }
    val self = method.parameterRegister(0)
    val width = method.parameterRegister(1)
    val height = method.parameterRegister(2)
    val player = method.freeRegister(0, listOf(self, width, height), "player video size")
    method.requireNotBranchTarget(0, "player video size")
    method.requireLowRegisters("player video size", self, player)
    method.addInstructions(0, """
        iget-object v$player, v$self, $field
        ${invokeStatic("$FILL->measure(Landroid/view/View;II)V", player, width, height)}
    """)
}

/**
 * Twitch pads its full-screen containers (the theatre's among them) by the system bars, keyboard and display
 * cutout. The types it pads by go through the extension, which leaves the cutout out for a player that fills the
 * screen.
 */
context(context: BytecodePatchContext)
private fun hookFullscreenInsets() {
    val match = FullscreenInsetsFingerprint.twitchMatch("full-screen container insets")
    Locators.record("twitch.fill_screen.container_insets", match.originalMethod)
    val method = match.method
    val types = match.instructionMatches[0]
    val register = (types.instruction as OneRegisterInstruction).registerA
    val view = method.parameterRegister(1)
    method.requireUnwritten(view, types.index, "insets listener view")
    method.requireNotBranchTarget(types.index + 1, "insets listener types")
    method.addInstructions(types.index + 1, """
        ${invokeStatic("$FILL->insetTypes(Landroid/view/View;I)I", view, register)}
        move-result v$register
    """)
}

/**
 * The React Native player (used while Use native player is off and Twitch's server routes a channel to it)
 * sizes its surface in one default method of its surface interface, by an IVS resize mode: FIT, or ZOOM for
 * "cover". The mode goes through the extension first.
 */
context(context: BytecodePatchContext)
private fun hookReactNativePlayer() {
    val match = RNSurfaceMeasureFingerprint.twitchMatch("React Native surface measure")
    Locators.record("twitch.fill_screen.rn_surface_measure", match.originalMethod)
    val method = match.method
    val self = method.parameterRegister(0)
    val width = method.parameterRegister(1)
    val height = method.parameterRegister(2)
    val aspect = method.parameterRegister(3)
    val mode = method.parameterRegister(4)
    val surface = method.freeRegister(0, listOf(self, width, height, aspect, mode), "React Native surface measure")
    method.requireNotBranchTarget(0, "React Native surface measure")
    method.addInstructions(0, """
        ${invoke("invoke-interface", "$SURFACE->getView()Landroid/view/View;", self)}
        move-result-object v$surface
        ${invokeStatic("$FILL->surfaceResizeMode(Landroid/view/View;Ljava/lang/Object;IIF)Ljava/lang/Object;",
            surface, mode, width, height, aspect)}
        move-result-object v$mode
        check-cast v$mode, $RESIZE_MODE
    """)
}
