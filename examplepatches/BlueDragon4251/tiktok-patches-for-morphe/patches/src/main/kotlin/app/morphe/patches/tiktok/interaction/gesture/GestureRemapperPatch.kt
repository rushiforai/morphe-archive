package app.morphe.patches.tiktok.interaction.gesture

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tiktok.interaction.cleardisplay.rememberClearDisplayPatch
import app.morphe.patches.tiktok.interaction.quickactions.disableLongPressQuickSharePatch
import app.morphe.patches.tiktok.interaction.speed.longPressSpeedLockPatch
import app.morphe.patches.tiktok.misc.extension.sharedExtensionPatch
import app.morphe.patches.tiktok.misc.settings.SettingsStatusLoadFingerprint

private const val GESTURE_REMAPPER =
    "Lapp/morphe/extension/tiktok/interaction/gesture/GestureRemapper;"

@Suppress("unused")
val gestureRemapperPatch = bytecodePatch(
    name = "Gesture remapper",
    description = "Remaps TikTok feed single tap, double tap, left/right seek, and long-press gestures.",
    default = true,
) {
    dependsOn(
        sharedExtensionPatch,
        rememberClearDisplayPatch,
        longPressSpeedLockPatch,
        disableLongPressQuickSharePatch,
    )
    compatibleWith(*AppCompatibilities.tiktok4643())

    execute {
        SettingsStatusLoadFingerprint.method.addInstruction(
            0,
            "invoke-static {}, Lapp/morphe/extension/tiktok/settings/SettingsStatus;->enableGestureRemapper()V",
        )

        PortraitSingleTapFingerprint.method.apply {
            val original = getInstruction(0)
            addInstructionsWithLabels(
                0,
                """
                    invoke-static {}, $GESTURE_REMAPPER->singleTapAction()I
                    move-result v0
                    if-eqz v0, :blueit_single_default

                    add-int/lit8 v0, v0, -0x1
                    if-eqz v0, :blueit_single_consume

                    add-int/lit8 v0, v0, -0x1
                    if-eqz v0, :blueit_single_play_pause

                    invoke-static {}, $GESTURE_REMAPPER->showClearDisplay()Z
                    move-result v0
                    if-eqz v0, :blueit_single_default
                    const/4 v0, 0x1
                    return v0

                    :blueit_single_play_pause
                    iget-object v1, p0, LX/0QeR;->LLILLL:LX/0Qdk;
                    const/4 v0, 0x3
                    invoke-interface {v1, v0}, LX/0Qdk;->LIZ(I)V

                    :blueit_single_consume
                    const/4 v0, 0x1
                    return v0
                """,
                ExternalLabel("blueit_single_default", original),
            )
        }

        PortraitDoubleTapFingerprint.method.apply {
            val original = getInstruction(0)
            addInstructionsWithLabels(
                0,
                """
                    invoke-static {p1}, $GESTURE_REMAPPER->doubleTapAction(Landroid/view/MotionEvent;)I
                    move-result v0
                    if-eqz v0, :blueit_double_default

                    add-int/lit8 v0, v0, -0x1
                    if-eqz v0, :blueit_double_consume

                    add-int/lit8 v0, v0, -0x1
                    if-eqz v0, :blueit_double_like

                    add-int/lit8 v0, v0, -0x1
                    if-eqz v0, :blueit_double_play_pause

                    add-int/lit8 v0, v0, -0x1
                    if-eqz v0, :blueit_double_clear_display

                    iget-object v0, p0, LX/0QeR;->LL:LX/0Qqd;
                    invoke-static {v0, p1}, $GESTURE_REMAPPER->handleConfiguredSeek(Ljava/lang/Object;Landroid/view/MotionEvent;)Z
                    move-result v0
                    if-eqz v0, :blueit_double_default
                    const/4 v0, 0x1
                    return v0

                    :blueit_double_clear_display
                    invoke-static {}, $GESTURE_REMAPPER->showClearDisplay()Z
                    move-result v0
                    if-eqz v0, :blueit_double_default
                    const/4 v0, 0x1
                    return v0

                    :blueit_double_play_pause
                    iget-object v0, p0, LX/0QeR;->LLILLL:LX/0Qdk;
                    const/4 p1, 0x3
                    invoke-interface {v0, p1}, LX/0Qdk;->LIZ(I)V
                    const/4 v0, 0x1
                    return v0

                    :blueit_double_like
                    iget-object v0, p0, LX/0QeR;->LL:LX/0Qqd;
                    invoke-interface {v0, p1}, LX/0Qqd;->handleDoubleClick(Landroid/view/MotionEvent;)V

                    :blueit_double_consume
                    const/4 v0, 0x1
                    return v0
                """,
                ExternalLabel("blueit_double_default", original),
            )
        }

        PortraitLongPressFingerprint.method.apply {
            val original = getInstruction(0)
            addInstructionsWithLabels(
                0,
                """
                    invoke-static {}, $GESTURE_REMAPPER->longPressAction()I
                    move-result v0
                    if-eqz v0, :blueit_long_default

                    add-int/lit8 v0, v0, -0x1
                    if-eqz v0, :blueit_long_consume

                    add-int/lit8 v0, v0, -0x1
                    if-eqz v0, :blueit_long_default

                    invoke-static {}, $GESTURE_REMAPPER->showClearDisplay()Z

                    :blueit_long_consume
                    return-void
                """,
                ExternalLabel("blueit_long_default", original),
            )
        }
    }
}
