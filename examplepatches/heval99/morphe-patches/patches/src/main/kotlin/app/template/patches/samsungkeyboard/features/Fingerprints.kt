package app.template.patches.samsungkeyboard.features

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

internal const val SKIP_SUGGESTIONS_LOG = "Cursor is not at first position, skipping suggestions"
internal const val FLOATING_CURSOR_KEY = "SEC_FLOATING_FEATURE_SIP_SUPPORT_CURSOR_CONTROL"
internal const val FLOATING_ONEHAND_KEY = "SEC_FLOATING_FEATURE_COMMON_CONFIG_ONEHAND_MODE_POLICY"

private const val CLIP = "Lcom/samsung/android/honeyboard/icecone/clipboard/data/entity/Clip;"

/*
 * Anchors are Samsung/Android names the keyboard keeps (its clipboard data classes, floating-feature keys, a log line),
 * never the R8 names of the classes they sit in.
 */

/** Trims the clipboard history: drops the oldest unpinned clip while there are more clips than the cap. */
internal object ClipEnforcerFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("L", CLIP),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    filters = listOf(
        methodCall(definingClass = CLIP, name = "getOrigin"),
        methodCall(definingClass = CLIP, name = "getUserId"),
        methodCall(definingClass = CLIP, name = "getPinned"),
        methodCall(definingClass = "Ljava/util/ArrayList;", name = "get", parameters = listOf("I")),
    ),
)

/** The number of columns of the clipboard panel. */
internal object ClipboardColCountFingerprint : Fingerprint(
    definingClass = "Lcom/samsung/android/honeyboard/icecone/clipboard/viewmodel/ClipboardViewModel;",
    name = "getColCount",
    returnType = "I",
    parameters = listOf(),
)

/** The class initializer that reads the phone's floating features (cursor control, one-handed mode, key vibration). */
internal object FeaturesClinitFingerprint : Fingerprint(
    name = "<clinit>",
    strings = listOf(FLOATING_CURSOR_KEY, FLOATING_ONEHAND_KEY),
)

/** How many toolbar items show in the top row: a switch over the keyboard mode that answers 7 or 8 (4 in the small modes). */
internal object ToolbarCapFingerprint : Fingerprint(
    returnType = "I",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    filters = listOf(
        opcode(Opcode.PACKED_SWITCH),
        literal(8),
        literal(4),
        literal(7),
    ),
)

/** Loads the user's saved toolbar order and trims it to the cap; used to confirm the cap method. */
internal object ToolbarUserSetLoaderFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    strings = listOf("loadUserSet", "edit_toolbar"),
)

/** Receives the inline autofill suggestions and skips them when the field already has text before the cursor. */
internal object InlineSuggestionsResponseFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/view/inputmethod/InlineSuggestionsResponse;"),
    filters = listOf(string(SKIP_SUGGESTIONS_LOG)),
)

/** Plays a key-tap vibration unless the "vibration" feature flag says the phone has none. */
internal object KeyVibrationGateFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("I"),
    filters = listOf(string("vib is off")),
)
