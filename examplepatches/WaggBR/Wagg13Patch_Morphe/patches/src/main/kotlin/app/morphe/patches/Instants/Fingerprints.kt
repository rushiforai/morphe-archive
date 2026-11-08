package app.morphe.patches.instants

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

// True when the method loads a string literal starting with [prefix]. Compose trace names end with
// ".kt:<line>)", and the line moves from version to version.
internal fun Method.hasStringStartingWith(prefix: String) = implementation?.instructions?.any { instruction ->
    (instruction.opcode == Opcode.CONST_STRING || instruction.opcode == Opcode.CONST_STRING_JUMBO) &&
        ((instruction as ReferenceInstruction).reference as? StringReference)?.string?.startsWith(prefix) == true
} == true

internal object MoonshotOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/instagram/moonshot/mainactivity/MoonshotActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

// Composable of the camera's round control buttons (flash, flip). It is composed only while the
// camera controls are on screen, which is the signal used to show the gallery button.
internal object CameraControlButtonFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        method.hasStringStartingWith("com.instagram.quicksnap.camera.ui.CameraControlButton (")
    },
)

// The About screen composable lives in an obfuscated switch lambda (LX/TjJ in 451.0.0.53.106).
// Anchored on its Compose trace string, which is not obfuscated; the line number is not matched
// because it changes between versions.
internal object AboutSettingsScreenFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;", "Ljava/lang/Object;"),
    custom = { method, _ ->
        method.hasStringStartingWith(
            "com.instagram.moonshot.ui.settings.screen.MoonshotAboutSettingsScreen.<anonymous> (",
        )
    },
)


private const val CAMERA_VIEW_MODEL = "Lcom/instagram/quicksnap/camera/domain/QuickSnapCameraViewModel;"

// The camera's "photo captured" callback: a lambda whose first argument is the captured Bitmap. It
// is found by what it does with it: it builds the archive peek thumbnail through a static function
// of the camera ViewModel taking (Context, Bitmap, ViewModel).
internal object CapturedPhotoFingerprint : Fingerprint(
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    parameters = List(8) { "Ljava/lang/Object;" },
    custom = { method, _ ->
        method.implementation?.instructions?.any { instruction ->
            instruction.opcode == Opcode.INVOKE_STATIC &&
                ((instruction as ReferenceInstruction).reference as? MethodReference).let { reference ->
                    reference != null && reference.definingClass == CAMERA_VIEW_MODEL &&
                        reference.parameterTypes.map { it.toString() } ==
                        listOf("Landroid/content/Context;", "Landroid/graphics/Bitmap;", CAMERA_VIEW_MODEL)
                }
        } == true
    },
)

private const val HOME_ROUTE = "Lcom/instagram/moonshot/navigation/route/MoonshotRoute\$Home;"

private fun Method.checksHomeRoute() = implementation?.instructions?.any { instruction ->
    instruction.opcode == Opcode.INSTANCE_OF &&
        ((instruction as ReferenceInstruction).reference as? TypeReference)?.type == HOME_ROUTE
} == true

private const val VIDEO_RECORDED_PREFIX = "Lcom/instagram/quicksnap/camera/domain/QuickSnapCameraViewModel\$onVideoRecorded\$"

// Constructor of the coroutine that runs when a video recording ends. It holds the recorded file,
// which the rest of the pipeline (thumbnail, archive peek, upload) works from; the video's size,
// duration and rotation are read from that file later.
internal object VideoRecordedFingerprint : Fingerprint(
    name = "<init>",
    custom = { method, classDef ->
        classDef.type.startsWith(VIDEO_RECORDED_PREFIX) &&
            method.parameterTypes.any { it.toString() == "Ljava/io/File;" }
    },
)

// The navigator wrapper (LX/coP in 451.0.0.53.106) forwards navigation to a delegate and logs it.
// Both methods are anchored on an unobfuscated string ("standalone_app" going forward, "back" going
// back) and on the Home route check.
internal object NavigateForwardFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("L"),
    strings = listOf("standalone_app"),
    custom = { method, _ -> method.checksHomeRoute() },
)

internal object NavigateBackFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    strings = listOf("back"),
    custom = { method, _ -> method.checksHomeRoute() },
)

// Builds the viewer's context menu items (Ver perfil, Pular, Silenciar, Deixar de seguir, Denunciar).
internal object ViewerMenuItemsFingerprint : Fingerprint(
    custom = { method, _ ->
        method.hasStringStartingWith(
            "com.instagram.quicksnap.viewer.compose.createQuickSnapContextMenuItems (",
        )
    },
)

// Factory of one menu item: (composer, action enum, text) -> item.
internal object ViewerMenuItemFactoryFingerprint : Fingerprint(
    custom = { method, _ ->
        method.hasStringStartingWith("com.instagram.quicksnap.viewer.compose.toMenuItem (")
    },
)

// Index of the instruction that reads the selected item's id inside the menu click handler:
//   check-cast vX, <event>; ...; iget vN, vX, <event>->id:I; sget-object vY, <enum>->entries:EnumEntries
// When [enumType] is given, the entries must belong to that enum (the one of the menu items).
internal fun List<Instruction>.selectedItemIdReadIndex(enumType: String? = null): Int {
    for (index in indices) {
        val instruction = this[index]
        if (instruction.opcode != Opcode.IGET) continue
        val field = (instruction as ReferenceInstruction).reference as? FieldReference ?: continue
        if (field.type != "I") continue
        val castBefore = (maxOf(0, index - 8) until index).any {
            this[it].opcode == Opcode.CHECK_CAST &&
                ((this[it] as ReferenceInstruction).reference as? TypeReference)?.type == field.definingClass
        }
        val entriesAfter = ((index + 1)..minOf(lastIndex, index + 3)).any {
            this[it].opcode == Opcode.SGET_OBJECT &&
                ((this[it] as ReferenceInstruction).reference as? FieldReference).let { entries ->
                    entries != null && entries.type == "Lkotlin/enums/EnumEntries;" &&
                        (enumType == null || entries.definingClass == enumType)
                }
        }
        if (castBefore && entriesAfter) return index
    }
    return -1
}

// Set by the patch, from the item factory's enum parameter, before the fingerprint below is resolved
// (fingerprints are matched lazily, on first access).
internal var viewerMenuEnumType: String = ""

// The menu click handler: code that maps the selected item's id to an entry of the menu items' enum.
// It is an "invoke" lambda in some versions and a case of a static switch dispatcher in others, so
// neither the name nor the parameters are matched; the enum is.
internal object ViewerMenuSelectionFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    custom = { method, _ ->
        viewerMenuEnumType.isNotEmpty() &&
            method.implementation?.instructions?.toList()?.selectedItemIdReadIndex(viewerMenuEnumType)?.let { it >= 0 } == true
    },
)

// The viewer's video player composable. Only used to find the class that holds the video helper
// (Media -> video source), which the extension calls on demand.
internal object ViewerVideoPlayerFingerprint : Fingerprint(
    custom = { method, _ ->
        method.hasStringStartingWith("com.instagram.quicksnap.common.ui.media.QuickSnapVideoPlayer (")
    },
)
