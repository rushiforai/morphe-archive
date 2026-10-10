package app.twoeno.patches.spotify

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

// region Ads

internal object ContextMenuViewModelToStringFingerprint : Fingerprint(
    strings = listOf("ContextMenuViewModel(header="),
)

/**
 * Used if the view model has no generated toString().
 */
internal object ContextMenuViewModelConstructorFingerprint : Fingerprint(
    name = "<init>",
    parameters = listOf("L", "Ljava/util/List;", "Z"),
    strings = listOf("ContextMenuViewModel cannot contain items with duplicate itemResId. id="),
)

/**
 * Returns the view model of a context menu item.
 */
internal object GetViewModelFingerprint : Fingerprint(
    name = "getViewModel",
    returnType = "L",
    parameters = listOf(),
)

internal object HomeStructureGetSectionsFingerprint : Fingerprint(
    definingClass = "homeapi/proto/HomeStructure;",
    filters = listOf(fieldAccess(name = "sections_", opcode = Opcode.IGET_OBJECT)),
)

internal object CasitaHomeStructureGetSectionsFingerprint : Fingerprint(
    definingClass = "casita/v1/resolved/HomeStructure;",
    filters = listOf(fieldAccess(name = "sections_", opcode = Opcode.IGET_OBJECT)),
)

internal object BrowseStructureGetSectionsFingerprint : Fingerprint(
    definingClass = "browsita/v1/resolved/BrowseStructure;",
    filters = listOf(fieldAccess(name = "sections_", opcode = Opcode.IGET_OBJECT)),
)

internal object PendragonFetchMessageRequestFingerprint : Fingerprint(
    name = "apply",
    filters = listOf(methodCall(definingClass = "FetchMessageRequest;", name = "<init>")),
)

internal object PendragonFetchMessageListRequestFingerprint : Fingerprint(
    name = "apply",
    filters = listOf(methodCall(definingClass = "FetchMessageListRequest;", name = "<init>")),
)

// endregion

// region Layout

/**
 * Static initializer of the bottom navigation tab enum.
 */
internal object NavigationTabEnumFingerprint : Fingerprint(
    name = "<clinit>",
    strings = listOf("HOME", "SEARCH", "YOUR_LIBRARY", "PREMIUM", "CREATE"),
    custom = { _, classDef -> classDef.superclass == "Ljava/lang/Enum;" },
)

// endregion

// region Misc

internal object CanBindAppWidgetPermissionFingerprint : Fingerprint(
    returnType = "Z",
    strings = listOf("android.permission.BIND_APPWIDGET"),
    filters = listOf(opcode(Opcode.AND_INT_LIT8)),
)

/**
 * Newer versions no longer check the system app flag in the same method.
 */
internal object CanBindAppWidgetPermissionNoFlagsFingerprint : Fingerprint(
    returnType = "Z",
    strings = listOf("android.permission.BIND_APPWIDGET"),
)

// endregion

// region Privacy

internal object ShareCopyUrlFingerprint : Fingerprint(
    name = "invokeSuspend",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    strings = listOf("clipboard", "Spotify Link"),
)

internal object OldShareCopyUrlFingerprint : Fingerprint(
    name = "apply",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    strings = listOf("clipboard", "createNewSession failed"),
)

internal object FormatAndroidShareSheetUrlFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Ljava/lang/String;",
    parameters = listOf("L", "Ljava/lang/String;"),
    filters = listOf(literal('\n'.code.toLong())),
)

internal object OldFormatAndroidShareSheetUrlFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Ljava/lang/String;",
    parameters = listOf("Lcom/spotify/share/social/sharedata/ShareData;", "Ljava/lang/String;"),
    filters = listOf(literal('\n'.code.toLong())),
)

// endregion
