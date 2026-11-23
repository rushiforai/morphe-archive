package io.github.xxlc.patches.grok

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.resourceLiteral
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

// Obfuscated class names are pinned to the exact Grok version matched against smali.
internal object LicenseCheckFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "checkLicense",
    isStatic = true,
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(string("LicenseClient")),
)

internal object DownloadActionEqualsFingerprint : Fingerprint(
    definingClass = GrokNames.DOWNLOAD_ACTION,
    name = "equals",
    isStatic = false,
    returnType = "Z",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        opcode(Opcode.INSTANCE_OF),
        fieldAccess(definingClass = GrokNames.DOWNLOAD_ACTION, name = GrokNames.DOWNLOAD_ACTION_STATE_NAME, type = GrokNames.DOWNLOAD_STATE, opcode = Opcode.IGET_OBJECT),
    ),
)

internal object PostMenuFingerprint : Fingerprint(
    definingClass = GrokNames.POST_MENU,
    name = GrokNames.POST_MENU_METHOD,
    isStatic = true,
    returnType = "Ljava/util/List;",
    parameters = listOf(GrokNames.POST_STATE),
    filters = listOf(
        methodCall(definingClass = "Lkotlin/collections/CollectionsKt;", name = "listOfNotNull"),
        opcode(Opcode.MOVE_RESULT_OBJECT),
        opcode(Opcode.RETURN_OBJECT),
    ),
)

internal object PostMenuLabelFingerprint : Fingerprint(
    definingClass = GrokNames.POST_MENU_LABEL,
    name = GrokNames.POST_MENU_LABEL_METHOD,
    isStatic = true,
    returnType = GrokNames.MENU_LABEL,
    parameters = listOf(GrokNames.MENU_ACTION),
    filters = listOf(resourceLiteral(ResourceType.STRING, "grok_media_action_save")),
)

internal object PostActionFingerprint : Fingerprint(
    definingClass = GrokNames.POST_HANDLER,
    name = GrokNames.POST_ACTION_METHOD,
    isStatic = false,
    returnType = "Ljava/lang/Object;",
    parameters = listOf(GrokNames.MENU_ACTION, GrokNames.MEDIA_ID, GrokNames.POST_CONTINUATION),
    filters = listOf(
        string("VideoDownload"),
        fieldAccess(definingClass = GrokNames.POST_DOWNLOAD_REQUEST, name = GrokNames.POST_DOWNLOAD_SINGLETON_NAME, opcode = Opcode.SGET_OBJECT),
    ),
)

internal object LibraryClickFingerprint : Fingerprint(
    definingClass = GrokNames.LIBRARY_CLICK,
    name = "invoke",
    isStatic = false,
    returnType = "Ljava/lang/Object;",
    parameters = emptyList(),
    filters = listOf(
        opcode(Opcode.PACKED_SWITCH),
        fieldAccess(definingClass = GrokNames.LIBRARY_DOWNLOAD_ACTION, name = GrokNames.LIBRARY_DOWNLOAD_SINGLETON_NAME, opcode = Opcode.SGET_OBJECT),
    ),
)

internal object LibraryButtonsFingerprint : Fingerprint(
    definingClass = GrokNames.LIBRARY_BUTTONS,
    name = "invoke",
    isStatic = false,
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;"),
    filters = listOf(
        resourceLiteral(ResourceType.STRING, "grok_media_action_save"),
        methodCall(definingClass = GrokNames.LIBRARY_BUTTON_RENDERER, name = GrokNames.LIBRARY_BUTTON_METHOD, returnType = "V"),
    ),
)

internal object LibrarySelectionFingerprint : Fingerprint(
    definingClass = GrokNames.LIBRARY_SELECTION,
    name = GrokNames.LIBRARY_SELECTION_METHOD,
    isStatic = false,
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        fieldAccess(definingClass = GrokNames.SELECTED_POST, name = GrokNames.SELECTED_POST_VALUE_NAME, type = GrokNames.POST, opcode = Opcode.IGET_OBJECT),
        methodCall(definingClass = GrokNames.LIBRARY_DOWNLOAD_REQUEST, name = "<init>", parameters = listOf(GrokNames.POST_ID, GrokNames.MEDIA)),
        fieldAccess(definingClass = GrokNames.LIBRARY_HANDLER, name = GrokNames.LIBRARY_DOWNLOAD_PROCESSOR_NAME, type = GrokNames.DOWNLOAD_PROCESSOR, opcode = Opcode.IGET_OBJECT),
    ),
)
