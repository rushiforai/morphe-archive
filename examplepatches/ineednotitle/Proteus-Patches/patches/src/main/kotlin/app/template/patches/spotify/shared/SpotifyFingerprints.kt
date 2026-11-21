package app.template.patches.spotify.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

// Fingerprint anchors for Spotify 9.1.94.1929.
//
// Every anchor is a build shape (class outline, string set or call site), not a
// full signature pin, so minor app updates keep matching while unrelated code
// does not. If an anchor disappears, the owning patch fails loudly at patch
// time; nothing is guessed at runtime.

// region Ads

internal val ContextMenuViewModelToStringFingerprint = Fingerprint(
    strings = listOf("ContextMenuViewModel(header="),
)

/**
 * Used when the view model has no generated toString().
 */
internal val ContextMenuViewModelConstructorFingerprint = Fingerprint(
    name = "<init>",
    parameters = listOf("L", "Ljava/util/List;", "Z"),
    strings = listOf("ContextMenuViewModel cannot contain items with duplicate itemResId. id="),
)

/**
 * Builds the storage key of a signalling tag ("Premium", "New", ...) shown
 * next to a context menu item. The first parameter is the signal attached to
 * the item, which holds the tag type.
 */
internal val SignallingStorageKeyFingerprint = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("L", "Ljava/lang/String;"),
    strings = listOf("signalling_", "_"),
)

/**
 * Returns the view model of a context menu item. Only exists on older
 * versions, where the name is not obfuscated.
 */
internal val GetViewModelFingerprint = Fingerprint(
    name = "getViewModel",
    returnType = "L",
    parameters = listOf(),
)

/**
 * Constructor of the base class of all esperanto clients, which takes the
 * esperanto transport. Every ads/settings client passes through it.
 */
internal val CoroutineClientBaseConstructorFingerprint = Fingerprint(
    definingClass = "Lcom/spotify/esperanto/esperanto/CoroutineClientBase;",
    name = "<init>",
    parameters = listOf("Lcom/spotify/esperanto/esperanto/CoroutineTransport;"),
)

internal val HomeStructureGetSectionsFingerprint = Fingerprint(
    definingClass = "homeapi/proto/HomeStructure;",
    filters = listOf(fieldAccess(name = "sections_", opcode = Opcode.IGET_OBJECT)),
)

internal val CasitaHomeStructureGetSectionsFingerprint = Fingerprint(
    definingClass = "casita/v1/resolved/HomeStructure;",
    filters = listOf(fieldAccess(name = "sections_", opcode = Opcode.IGET_OBJECT)),
)

internal val BrowseStructureGetSectionsFingerprint = Fingerprint(
    definingClass = "browsita/v1/resolved/BrowseStructure;",
    filters = listOf(fieldAccess(name = "sections_", opcode = Opcode.IGET_OBJECT)),
)

internal val PendragonFetchMessageRequestFingerprint = Fingerprint(
    name = "apply",
    filters = listOf(methodCall(definingClass = "FetchMessageRequest;", name = "<init>")),
)

internal val PendragonFetchMessageListRequestFingerprint = Fingerprint(
    name = "apply",
    filters = listOf(methodCall(definingClass = "FetchMessageListRequest;", name = "<init>")),
)

// endregion

// region Layout

/**
 * Static initializer of the bottom navigation tab enum.
 */
internal val NavigationTabEnumFingerprint = Fingerprint(
    name = "<clinit>",
    strings = listOf("HOME", "SEARCH", "YOUR_LIBRARY", "PREMIUM", "CREATE"),
    custom = { _, classDef -> classDef.superclass == "Ljava/lang/Enum;" },
)

// endregion

// region Misc

internal val CanBindAppWidgetPermissionFingerprint = Fingerprint(
    returnType = "Z",
    strings = listOf("android.permission.BIND_APPWIDGET"),
    filters = listOf(opcode(Opcode.AND_INT_LIT8)),
)

/**
 * Newer versions no longer check the system app flag in the same method.
 */
internal val CanBindAppWidgetPermissionNoFlagsFingerprint = Fingerprint(
    returnType = "Z",
    strings = listOf("android.permission.BIND_APPWIDGET"),
)

// endregion

// region Privacy

internal val ShareCopyUrlFingerprint = Fingerprint(
    name = "invokeSuspend",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    strings = listOf("clipboard", "Spotify Link"),
)

internal val OldShareCopyUrlFingerprint = Fingerprint(
    name = "apply",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    strings = listOf("clipboard", "createNewSession failed"),
)

internal val FormatAndroidShareSheetUrlFingerprint = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Ljava/lang/String;",
    parameters = listOf("L", "Ljava/lang/String;"),
    filters = listOf(literal('\n'.code.toLong())),
)

/**
 * Newer app versions join the share message with a "\n" string instead of a
 * char literal.
 */
internal val FormatAndroidShareSheetUrlStringFingerprint = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Ljava/lang/String;",
    parameters = listOf("L", "Ljava/lang/String;"),
    filters = listOf(string("\n")),
)

internal val OldFormatAndroidShareSheetUrlFingerprint = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Ljava/lang/String;",
    parameters = listOf("Lcom/spotify/share/social/sharedata/ShareData;", "Ljava/lang/String;"),
    filters = listOf(literal('\n'.code.toLong())),
)

// endregion
