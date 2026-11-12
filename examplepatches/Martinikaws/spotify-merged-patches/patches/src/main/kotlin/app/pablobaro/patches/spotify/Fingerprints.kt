package app.pablobaro.patches.spotify

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
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

/**
 * Constructor of the base class of all esperanto clients, which takes the esperanto transport.
 */
internal object CoroutineClientBaseConstructorFingerprint : Fingerprint(
    definingClass = "Lcom/spotify/esperanto/esperanto/CoroutineClientBase;",
    name = "<init>",
    parameters = listOf("Lcom/spotify/esperanto/esperanto/CoroutineTransport;"),
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
