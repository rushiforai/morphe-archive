package io.github.sabopura.morphe.patches.youtube.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.OpcodesFilter
import app.morphe.patcher.checkCast
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

internal object PlayerControllerSetTimeReferenceFingerprint : Fingerprint(
    strings = listOf("Media progress reported outside media playback: %s"),
    filters = listOf(
        // 21.42 inserts a feature-flag check right after this call, so match the
        // media-progress constructor itself instead of the instruction that follows it.
        methodCall(
            opcode = Opcode.INVOKE_DIRECT_RANGE,
            name = "<init>",
            returnType = "V",
            parameters = listOf("J", "J", "J", "J", "J", "J", "J", "Z", "Ljava/lang/String;"),
        ),
    ),
)

internal object LegacyPlayerControllerSetTimeReferenceFingerprint : Fingerprint(
    strings = listOf("Media progress reported outside media playback: %s"),
    filters = OpcodesFilter.opcodesToFilters(
        Opcode.INVOKE_DIRECT_RANGE,
        Opcode.IGET_OBJECT,
    ),
)

private object LegacyLayoutConstructorFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    filters = listOf(
        literal(159962),
        literal(0x7f0b0e92), // player_control_previous_button_touch_area
        literal(0x7f0b0e8d), // player_control_next_button_touch_area
        methodCall(parameters = listOf("Landroid/view/View;", "I")),
    ),
)

private object StableLayoutConstructorFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    filters = listOf(
        literal(159962),
        // The button resource IDs shift between YouTube releases. The event id and
        // the view/id helper call identify the same player-layout constructor in
        // both 21.34.248 and 21.35.443 without depending on those generated IDs.
        methodCall(parameters = listOf("Landroid/view/View;", "I")),
    ),
)

internal object LegacyControlsOverlayFingerprint : Fingerprint(
    classFingerprint = LegacyLayoutConstructorFingerprint,
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        literal(0x7f0b09ae), // inset_overlay_view_layout
        checkCast("Landroid/widget/FrameLayout;"),
    ),
)

internal object StableControlsOverlayFingerprint : Fingerprint(
    classFingerprint = StableLayoutConstructorFingerprint,
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            smali = "Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;",
        ),
        checkCast(
            "Lcom/google/android/apps/youtube/app/player/overlay/SizeAdjustableOverlayWrapperLayout;",
        ),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            smali = "Lcom/google/android/apps/youtube/app/player/overlay/" +
                "SizeAdjustableOverlayWrapperLayout;->i()V",
        ),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            smali = "Lcom/google/android/apps/youtube/app/player/overlay/" +
                "SizeAdjustableOverlayWrapperLayout;->setClipChildren(Z)V",
        ),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            smali = "Lcom/google/android/apps/youtube/app/player/overlay/" +
                "SizeAdjustableOverlayWrapperLayout;->findViewById(I)Landroid/view/View;",
        ),
        app.morphe.patcher.opcode(
            Opcode.MOVE_RESULT_OBJECT,
            location = MatchAfterImmediately(),
        ),
        checkCast(
            "Landroid/widget/FrameLayout;",
            location = MatchAfterImmediately(),
        ),
    ),
)

internal object PlayerBottomSheetFlyoutFingerprint : Fingerprint(
    classFingerprint = Fingerprint(
        parameters = listOf("Landroid/os/Bundle;"),
        filters = listOf(
            // The retired useNewUi flag disappeared when Cairo became mandatory.
            // Match state restoration, not the separate Bundle-writing method.
            string("BaseBottomSheetDialogFragment.peekHeightEnabled"),
            methodCall(
                smali = "Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z",
                location = MatchAfterImmediately(),
            ),
            string("BaseBottomSheetDialogFragment.shouldSkipCollapsed"),
            methodCall(
                smali = "Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z",
                location = MatchAfterImmediately(),
            ),
            string("BaseBottomSheetDialogFragment.largeFormWidthDp"),
            methodCall(
                smali = "Landroid/os/Bundle;->getInt(Ljava/lang/String;)I",
                location = MatchAfterImmediately(),
            ),
        ),
    ),
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Landroid/app/Dialog;",
    parameters = listOf("Landroid/os/Bundle;"),
)

internal object PlayerPopupWindowFlyoutFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            smali = $$"Landroid/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V",
        ),
    ),
)
