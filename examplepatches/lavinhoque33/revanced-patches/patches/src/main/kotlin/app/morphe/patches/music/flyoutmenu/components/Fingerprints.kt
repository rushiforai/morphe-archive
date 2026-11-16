package app.morphe.patches.music.flyoutmenu.components

import app.morphe.patcher.util.getReference
import app.morphe.patches.music.utils.resourceid.endButtonsContainer
import app.morphe.patches.music.utils.resourceid.touchOutside
import app.morphe.patches.music.utils.resourceid.trimSilenceSwitch
import app.morphe.util.fingerprint.legacyFingerprint
import app.morphe.util.indexOfFirstInstructionReversed
import app.morphe.util.or
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal val endButtonsContainerFingerprint = legacyFingerprint(
    name = "endButtonsContainerFingerprint",
    returnType = "V",
    literals = listOf(endButtonsContainer)
)

internal val menuItemFingerprint = legacyFingerprint(
    name = "menuItemFingerprint",
    returnType = "V",
    accessFlags = AccessFlags.PUBLIC or AccessFlags.FINAL,
    parameters = emptyList(),
    strings = listOf("toggleMenuItemMutations"),
    customFingerprint = { method, _ ->
        method.indexOfFirstInstructionReversed {
            opcode == Opcode.IGET_OBJECT &&
                    getReference<FieldReference>()?.type == "Landroid/widget/FrameLayout;"
        } >= 0
    }
)

// From 9.44, the text and icon binding is a separate method of the same presenter.
internal val menuItemIconFingerprint = legacyFingerprint(
    name = "menuItemIconFingerprint",
    returnType = "V",
    accessFlags = AccessFlags.PUBLIC or AccessFlags.FINAL,
    parameters = emptyList(),
    opcodes = listOf(
        Opcode.IGET_OBJECT,
        Opcode.INVOKE_STATIC,
        Opcode.MOVE_RESULT_OBJECT,
        Opcode.IGET,
        Opcode.INVOKE_STATIC,
        Opcode.MOVE_RESULT_OBJECT
    ),
    customFingerprint = { method, _ ->
        method.indexOfFirstInstructionReversed {
            getReference<MethodReference>()?.let {
                it.definingClass == "Landroid/widget/TextView;" && it.name == "setText"
            } == true
        } >= 0 && method.indexOfFirstInstructionReversed {
            getReference<MethodReference>()?.let {
                it.definingClass == "Landroid/widget/ImageView;" && it.name == "setImageResource"
            } == true
        } >= 0
    }
)

internal val screenWidthFingerprint = legacyFingerprint(
    name = "screenWidthFingerprint",
    returnType = "Z",
    parameters = listOf("L"),
    opcodes = listOf(Opcode.IF_LT),
    literals = listOf(600L)
)

internal val screenWidthParentFingerprint = legacyFingerprint(
    name = "screenWidthParentFingerprint",
    returnType = "Landroid/graphics/Bitmap;",
    accessFlags = AccessFlags.PUBLIC or AccessFlags.STATIC,
    customFingerprint = { method, _ ->
        method.indexOfFirstInstructionReversed {
            opcode == Opcode.INVOKE_VIRTUAL &&
                    getReference<MethodReference>()?.name == "destroyDrawingCache"
        } >= 0
    }
)

internal val sleepTimerFingerprint = legacyFingerprint(
    name = "sleepTimerFingerprint",
    returnType = "Z",
    parameters = emptyList(),
    literals = listOf(45372767L)
)

internal val touchOutsideFingerprint = legacyFingerprint(
    name = "touchOutsideFingerprint",
    returnType = "Landroid/view/View;",
    literals = listOf(touchOutside)
)

internal const val TRIM_SILENCE_FEATURE_FLAG = 45619123L

internal val trimSilenceConfigFingerprint = legacyFingerprint(
    name = "trimSilenceConfigFingerprint",
    returnType = "Z",
    literals = listOf(TRIM_SILENCE_FEATURE_FLAG)
)

internal val trimSilenceSwitchFingerprint = legacyFingerprint(
    name = "trimSilenceSwitchFingerprint",
    returnType = "Landroid/view/View;",
    accessFlags = AccessFlags.PUBLIC or AccessFlags.FINAL,
    literals = listOf(trimSilenceSwitch)
)