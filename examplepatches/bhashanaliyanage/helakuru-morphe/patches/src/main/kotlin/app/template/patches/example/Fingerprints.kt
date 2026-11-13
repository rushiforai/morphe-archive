package app.template.patches.example

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/** Helakuru Lite's keyboard lifecycle callback, called whenever the IME is shown. */
object HelakuruLiteKeyboardWindowFingerprint : Fingerprint(
    definingClass = "Llk/bhasha/helakuru/lite/keyboard/KeyboardService;",
    name = "onStartInputView",
    parameters = listOf("Landroid/view/inputmethod/EditorInfo;", "Z"),
    returnType = "V"
)

/** SettingsActivity callback after its preference XML has been inflated. */
object HelakuruLiteSettingsCreateFingerprint : Fingerprint(
    definingClass = "Llk/bhasha/helakuru/lite/setting/SettingsActivity;",
    name = "onCreate",
    parameters = listOf("Landroid/os/Bundle;"),
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = "Landroid/preference/PreferenceActivity;",
            name = "addPreferencesFromResource"
        )
    )
)

/** Lite keypress event, invoked once for each keyboard key press. */
object HelakuruLiteKeypressFingerprint : Fingerprint(
    definingClass = "Llk/bhasha/helakuru/lite/keyboard/KeyboardService;",
    name = "onPress",
    parameters = listOf("I"),
    returnType = "V"
)

/** Lite key delivery callback, called after a key is released. */
object HelakuruLiteKeyDeliveryFingerprint : Fingerprint(
    definingClass = "Llk/bhasha/helakuru/lite/keyboard/KeyboardService;",
    name = "onKey",
    parameters = listOf("I", "[I"),
    returnType = "V"
)

/** Keyboard state callbacks that refresh Lite's toolbar or active layout. */
object HelakuruLiteRefreshLayoutFingerprint : Fingerprint(
    definingClass = "Llk/bhasha/helakuru/lite/keyboard/KeyboardService;",
    name = "refreshLayout",
    parameters = listOf("Z"),
    returnType = "V"
)

object HelakuruLiteSwitchLayoutFingerprint : Fingerprint(
    definingClass = "Llk/bhasha/helakuru/lite/keyboard/KeyboardService;",
    name = "switchLayout",
    parameters = emptyList(),
    returnType = "V"
)

object HelakuruLiteSwitchMainFingerprint : Fingerprint(
    definingClass = "Llk/bhasha/helakuru/lite/keyboard/KeyboardService;",
    name = "switchMain",
    parameters = emptyList(),
    returnType = "V"
)

object HelakuruLiteSwitchNumbersFingerprint : Fingerprint(
    definingClass = "Llk/bhasha/helakuru/lite/keyboard/KeyboardService;",
    name = "switchNumbers",
    parameters = emptyList(),
    returnType = "V"
)

object HelakuruLiteSwitchSymbolsFingerprint : Fingerprint(
    definingClass = "Llk/bhasha/helakuru/lite/keyboard/KeyboardService;",
    name = "switchSymbols",
    parameters = emptyList(),
    returnType = "V"
)

object HelakuruLiteUpdateKeyboardLayoutFingerprint : Fingerprint(
    definingClass = "Llk/bhasha/helakuru/lite/keyboard/KeyboardService;",
    name = "updateKeyboardLayout",
    parameters = emptyList(),
    returnType = "V"
)

object HelakuruLiteEnglishClickFingerprint : Fingerprint(
    definingClass = "Llk/bhasha/helakuru/lite/keyboard/KeyboardService;",
    name = "onEnglishClick",
    parameters = emptyList(),
    returnType = "V"
)

object HelakuruLiteSinhalaClickFingerprint : Fingerprint(
    definingClass = "Llk/bhasha/helakuru/lite/keyboard/KeyboardService;",
    name = "onSinhalaClick",
    parameters = emptyList(),
    returnType = "V"
)

/** Theme customization view containing Lite's existing Key border switch. */
object HelakuruLiteThemeEditorViewFingerprint : Fingerprint(
    definingClass = "Llk/bhasha/helakuru/lite/theme/fragment/ThemeCustomizeFragment;",
    name = "u",
    parameters = listOf("Landroid/view/LayoutInflater;", "Landroid/view/ViewGroup;"),
    returnType = "Landroid/view/View;",
    filters = listOf(
        methodCall(
            definingClass = "Landroid/widget/CompoundButton;",
            name = "setOnCheckedChangeListener"
        )
    )
)

/** Intercept picker results before Lite creates a subscription-gated photo model. */
object HelakuruLitePersonalPhotoResultFingerprint : Fingerprint(
    definingClass = "Llk/bhasha/helakuru/lite/theme/custom/l;",
    name = "q",
    parameters = listOf("I", "I", "Landroid/content/Intent;"),
    returnType = "V"
)

/** Keyboard root surface after Lite finishes applying its ordinary theme. */
object HelakuruLitePhotoRootThemeFingerprint : Fingerprint(
    definingClass = "Llk/bhasha/helakuru/lite/keyboard/view/KeyboardViewGroup;",
    name = "setTheme",
    parameters = listOf("Lt5/d;"),
    returnType = "V"
)

/** The permission check before Lite opens its personal-photo picker. */
object HelakuruLitePersonalPhotoPickerFingerprint : Fingerprint(
    definingClass = "Llk/bhasha/helakuru/lite/theme/ThemesActivity;",
    name = "m",
    parameters = emptyList(),
    returnType = "V",
    filters = listOf(string("android.permission.READ_EXTERNAL_STORAGE"))
)

/** Lite's legacy gallery launcher and its package-visibility preflight. */
object HelakuruLitePersonalPhotoLaunchFingerprint : Fingerprint(
    definingClass = "Llk/bhasha/helakuru/lite/theme/custom/l;",
    name = "T",
    parameters = emptyList(),
    returnType = "V",
    filters = listOf(string("No supported application found."))
)

/** Lite's theme confirmation callback, where custom themes currently enter the Pro gate. */
object HelakuruLiteThemeConfirmationFingerprint : Fingerprint(
    definingClass = "Llk/bhasha/helakuru/lite/theme/ThemesActivity;",
    name = "q",
    parameters = listOf("Lt5/f;"),
    returnType = "V"
)

/** The dimension-derived inset used solely for drawing key backgrounds. */
object HelakuruLiteKeyboardViewInsetFingerprint : Fingerprint(
    definingClass = "Llk/bhasha/helakuru/lite/keyboard/KeyboardView;",
    name = "onDraw",
    parameters = listOf("Landroid/graphics/Canvas;"),
    returnType = "V",
    filters = listOf(literal(25))
)

/** Key iteration hook for giving action keys their own rounded shape. */
object HelakuruLiteKeyboardViewDrawFingerprint : Fingerprint(
    definingClass = "Llk/bhasha/helakuru/lite/keyboard/KeyboardView;",
    name = "onDraw",
    parameters = listOf("Landroid/graphics/Canvas;"),
    returnType = "V"
)

// Retained for the template's internal example patch.
object AdLoaderFingerprint : Fingerprint(
    definingClass = "Lcom/some/app/ads/AdsLoader;",
    name = "showAds",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;", "I", "L"),
    filters = listOf(
        fieldAccess(opcode = Opcode.IGET, definingClass = "this", type = "Ljava/util/Map;"),
        string("showBannerAds"),
        methodCall(definingClass = "Ljava/lang/String;", name = "equals"),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
        literal(1337),
        opcode(Opcode.IF_EQ)
    )
)
