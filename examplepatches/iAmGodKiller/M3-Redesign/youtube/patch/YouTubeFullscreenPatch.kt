package app.morphe.patches.youtube.layout.fullscreen

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.patch
import app.morphe.patches.youtube.shared.Constants.COMPATIBILITY_YOUTUBE
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

private const val EXTENSION_CLASS =
    "Lapp/morphe/extension/youtube/patches/fullscreen/YouTubeFullscreenFilter;"

private const val YOUTUBE_MAIN_ACTIVITY_CLASS =
    "Lcom/google/android/apps/youtube/app/watchwhile/MainActivity;"

private object YtFullscreenMainActivityOnCreateFingerprint : Fingerprint(
    definingClass = YOUTUBE_MAIN_ACTIVITY_CLASS,
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;")
)

private object YtFullscreenPlayerStableInsetsFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;", "Ljava/lang/Object;"),
    filters = listOf(
        fieldAccess(opcode = Opcode.IGET_OBJECT),
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            type = "Landroid/graphics/Rect;",
            location = MatchAfterImmediately()
        ),
        methodCall(name = "isInMultiWindowMode"),
        methodCall(smali = "Landroid/graphics/Rect;-><init>(IIII)V")
    )
)

private object YtFullscreenSystemWindowInsetsFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        methodCall(smali = "Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V"),
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            definingClass = "this",
            type = "Landroid/view/View;",
            location = MatchAfterImmediately()
        )
    )
)

private object YtFullscreenStatusBarBackgroundShowFingerprint : Fingerprint(
    classFingerprint = Fingerprint(
        accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
        returnType = "V",
        parameters = listOf(),
        filters = listOf(
            methodCall(smali = "Landroid/view/View;->bringToFront()V"),
            methodCall(smali = "Landroid/view/View;->getParent()Landroid/view/ViewParent;"),
            methodCall(smali = "Landroid/view/View;->bringToFront()V")
        )
    ),
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("I"),
    filters = listOf(
        methodCall(smali = "Landroid/view/View;->setVisibility(I)V"),
        methodCall(smali = "Landroid/view/View;->setBackgroundColor(I)V")
    )
)

private val COMPATIBILITY_YOUTUBE_ANY = Compatibility(
    name = "YouTube",
    packageName = "com.google.android.youtube",
    apkFileType = ApkFileType.APK_REQUIRED,
    appIconColor = 0xFF0033,
    signatures = COMPATIBILITY_YOUTUBE.signatures,
    targets = listOf(
        AppTarget(
            version = null,
            minSdk = 26
        )
    )
)

@Suppress("unused")
val removeTopBlackBarPatch = patch(
    name = "Remove top black bar",
    description = "Removes the black status-bar gap above YouTube videos in portrait full screen (especially on tablets) when hiding the status bar, allowing true edge-to-edge playback.",
    default = false
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_ANY)
    extendWith("extensions/ytfullscreen.mpe")

    finalize {
        // 1. Register activity lifecycle + window/insets edge-to-edge configuration on MainActivity.
        YtFullscreenMainActivityOnCreateFingerprint.let {
            it.clearMatch()
            it.method.addInstruction(
                0,
                "invoke-static/range { p0 .. p0 }, " +
                    "$EXTENSION_CLASS->onMainActivityCreated(Landroid/app/Activity;)V"
            )
        }

        // 2. Unconditionally strip top stable inset for the video player (runs after official
        //    Morphe's HideStatusBarPatch.getPlayerStableInsets if both patches are applied).
        YtFullscreenPlayerStableInsetsFingerprint.clearMatch()
        YtFullscreenPlayerStableInsetsFingerprint.matchOrNull()?.let { match ->
            match.method.apply {
                val rectIndex = match.instructionMatches[1].index
                val rectRegister = getInstruction<TwoRegisterInstruction>(rectIndex).registerA

                var insertIndex = rectIndex + 1
                val instructions = implementation?.instructions?.toList()
                if (instructions != null && insertIndex + 1 < instructions.size) {
                    val nextOp = instructions[insertIndex].opcode
                    val afterNextOp = instructions[insertIndex + 1].opcode
                    if ((nextOp == Opcode.INVOKE_STATIC || nextOp == Opcode.INVOKE_STATIC_RANGE)
                        && afterNextOp == Opcode.MOVE_RESULT_OBJECT
                    ) {
                        insertIndex += 2
                    }
                }

                addInstructions(
                    insertIndex,
                    """
                        invoke-static/range { v$rectRegister .. v$rectRegister }, $EXTENSION_CLASS->stripPlayerTopInset(Landroid/graphics/Rect;)Landroid/graphics/Rect;
                        move-result-object v$rectRegister
                    """
                )
            }
        }

        // 3. Unconditionally strip top system window inset delivered to YouTube's top-anchored
        //    containers (runs after official Morphe's setSystemWindowInsetTop if present).
        YtFullscreenSystemWindowInsetsFingerprint.clearMatch()
        YtFullscreenSystemWindowInsetsFingerprint.matchOrNull()?.let { match ->
            match.method.apply {
                val insetsRegister = match.instructionMatches.first()
                    .getInstruction<FiveRegisterInstruction>().registerC
                val viewIndex = match.instructionMatches.last().index
                val viewRegister = getInstruction<TwoRegisterInstruction>(viewIndex).registerA

                var insertIndex = viewIndex + 1
                val instructions = implementation?.instructions?.toList()
                if (instructions != null && insertIndex < instructions.size) {
                    val nextOp = instructions[insertIndex].opcode
                    if (nextOp == Opcode.INVOKE_STATIC || nextOp == Opcode.INVOKE_STATIC_RANGE) {
                        insertIndex += 1
                    }
                }

                addInstruction(
                    insertIndex,
                    "invoke-static { v$insetsRegister, v$viewRegister }, " +
                        "$EXTENSION_CLASS->stripSystemWindowInsetTop(Landroid/graphics/Rect;Landroid/view/View;)V"
                )
            }
        }

        // 4. Collapse YouTube's internal status bar background overlay view (View.GONE + height 0)
        //    instead of merely marking it INVISIBLE.
        YtFullscreenStatusBarBackgroundShowFingerprint.clearMatch()
        YtFullscreenStatusBarBackgroundShowFingerprint.matchOrNull()?.let { match ->
            match.method.apply {
                val lastIndex = match.instructionMatches.last().index
                val viewRegister = getInstruction<FiveRegisterInstruction>(lastIndex).registerC

                var insertIndex = lastIndex + 1
                val instructions = implementation?.instructions?.toList()
                if (instructions != null && insertIndex < instructions.size) {
                    val nextOp = instructions[insertIndex].opcode
                    if (nextOp == Opcode.INVOKE_STATIC || nextOp == Opcode.INVOKE_STATIC_RANGE) {
                        insertIndex += 1
                    }
                }

                addInstruction(
                    insertIndex,
                    "invoke-static { v$viewRegister }, " +
                        "$EXTENSION_CLASS->collapseStatusBarBackground(Landroid/view/View;)V"
                )
            }
        }
    }
}

@Suppress("unused")
val scrollAwayHomeToolbarPatch = patch(
    name = "Scroll away home toolbar",
    description = "Makes the YouTube Home screen top toolbar act like the top of the page so it scrolls away cleanly with the feed instead of staying persistent or popping back mid-page.",
    default = false
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_ANY)
    extendWith("extensions/ytfullscreen.mpe")

    finalize {
        YtFullscreenMainActivityOnCreateFingerprint.let {
            it.clearMatch()
            it.method.addInstruction(
                0,
                "invoke-static/range { p0 .. p0 }, " +
                    "$EXTENSION_CLASS->onHomeScrollToolbarEnabled(Landroid/app/Activity;)V"
            )
        }
    }
}
