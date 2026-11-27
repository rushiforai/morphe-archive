package dev.srwi.gintype.extension.settings;

import android.content.Context;
import android.content.ContextWrapper;
import android.inputmethodservice.InputMethodService;
import android.text.InputType;
import android.view.inputmethod.EditorInfo;

/**
 * Shared {@link EditorInfo#inputType} classification helper so plugins can safely bypass
 * password fields and non-text inputs without leaking sensitive text or interfering with
 * numeric/terminal fields.
 */
public final class GboardInputTypeGuard {
    private GboardInputTypeGuard() {
    }

    public static EditorInfo resolveCurrentEditorInfo(Context context) {
        Context cur = context;
        int depth = 0;
        while (cur != null && depth < 16) {
            if (cur instanceof InputMethodService ims) {
                return ims.getCurrentInputEditorInfo();
            }
            if (cur instanceof ContextWrapper wrapper) {
                Context base = wrapper.getBaseContext();
                if (base == cur) {
                    break;
                }
                cur = base;
            } else {
                break;
            }
            depth++;
        }
        return null;
    }

    public static boolean isPasswordEditorInfo(EditorInfo info) {
        if (info == null) {
            return false;
        }
        int inputType = info.inputType;
        int cls = inputType & InputType.TYPE_MASK_CLASS;
        int variation = inputType & InputType.TYPE_MASK_VARIATION;
        if (cls == InputType.TYPE_CLASS_TEXT) {
            return variation == InputType.TYPE_TEXT_VARIATION_PASSWORD
                    || variation == InputType.TYPE_TEXT_VARIATION_VISIBLE_PASSWORD
                    || variation == InputType.TYPE_TEXT_VARIATION_WEB_PASSWORD;
        }
        if (cls == InputType.TYPE_CLASS_NUMBER) {
            return variation == InputType.TYPE_NUMBER_VARIATION_PASSWORD;
        }
        return false;
    }

    public static boolean isPasswordInput(Context context) {
        return isPasswordEditorInfo(resolveCurrentEditorInfo(context));
    }

    /**
     * Returns true when Thicc Top Bar should step aside (password fields and raw TYPE_NULL inputs
     * such as terminals).
     */
    public static boolean isThiccTopBarBlockedInput(Context context) {
        EditorInfo info = resolveCurrentEditorInfo(context);
        if (info == null) {
            return false;
        }
        return isPasswordEditorInfo(info) || info.inputType == InputType.TYPE_NULL;
    }

    /**
     * Returns true when MultiGlide should bypass and stay on stock Gboard (password fields and
     * non-text numeric/phone/datetime/TYPE_NULL fields). Intentionally does not block
     * TYPE_TEXT_FLAG_NO_SUGGESTIONS so chat/search bars continue working.
     */
    public static boolean isMultiGlideBlockedInput(Context context) {
        EditorInfo info = resolveCurrentEditorInfo(context);
        if (info == null) {
            return false;
        }
        if (isPasswordEditorInfo(info) || info.inputType == InputType.TYPE_NULL) {
            return true;
        }
        int cls = info.inputType & InputType.TYPE_MASK_CLASS;
        return cls == InputType.TYPE_CLASS_NUMBER
                || cls == InputType.TYPE_CLASS_PHONE
                || cls == InputType.TYPE_CLASS_DATETIME;
    }
}
