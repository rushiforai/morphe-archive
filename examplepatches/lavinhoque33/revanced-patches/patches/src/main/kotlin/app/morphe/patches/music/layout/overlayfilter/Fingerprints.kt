package app.morphe.patches.music.layout.overlayfilter

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import app.morphe.patches.shared.mapping.ResourceType.ATTR
import app.morphe.patches.shared.mapping.ResourceType.LAYOUT
import app.morphe.patches.shared.mapping.resourceLiteral
import com.android.tools.smali.dexlib2.Opcode

internal object BottomSheetDialogFingerprint : Fingerprint(
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(resourceLiteral(LAYOUT, "design_bottom_sheet_dialog")),
    custom = { _, classDef ->
        classDef.fields.any { it.type == "Lcom/google/android/material/bottomsheet/BottomSheetBehavior;" }
    },
)

internal object BottomSheetDialogOnStartFingerprint : Fingerprint(
    name = "onStart",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(opcode(Opcode.INVOKE_SUPER)),
)

// Follow the tagged FragmentManager lookup to the concrete fragment, not the shared dialog class.
internal fun playerDialogLookupFingerprint(tag: String) = Fingerprint(
    strings = listOf(tag),
    filters = listOf(
        string(tag),
        methodCall(parameters = listOf("Ljava/lang/String;"), location = MatchAfterImmediately()),
        opcode(Opcode.MOVE_RESULT_OBJECT, MatchAfterImmediately()),
        opcode(Opcode.IF_EQZ, MatchAfterImmediately()),
        opcode(Opcode.CHECK_CAST, MatchAfterImmediately()),
    ),
)

internal object PlayerDialogShowFingerprint : Fingerprint(
    name = "onStart",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(methodCall(smali = "Landroid/app/Dialog;->show()V")),
)

// The menu scrim resolves this theme color into its own Paint, rather than a View background.
internal object ContextualMenuScrimConstructorFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    filters = listOf(
        resourceLiteral(ATTR, "ytOverlayBackgroundMedium"),
        methodCall(
            definingClass = "Landroid/graphics/Paint;",
            name = "setColor",
            parameters = listOf("I"),
        ),
    ),
)

internal object ContextualMenuScrimDrawFingerprint : Fingerprint(
    name = "onDraw",
    returnType = "V",
    parameters = listOf("Landroid/graphics/Canvas;"),
    filters = listOf(
        methodCall(
            definingClass = "Landroid/graphics/Canvas;",
            name = "drawPaint",
            parameters = listOf("Landroid/graphics/Paint;"),
        ),
    ),
)
