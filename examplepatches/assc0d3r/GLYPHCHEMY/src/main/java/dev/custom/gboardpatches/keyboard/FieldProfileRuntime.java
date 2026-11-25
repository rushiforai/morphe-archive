package dev.custom.gboardpatches.keyboard;

import android.view.inputmethod.EditorInfo;

/**
 * Adapts Gboard's typing behaviour to the text field being edited.
 *
 * Gboard already reacts to some field types on its own, so a profile here only ever *restricts*
 * what the keyboard would do: it adds "no suggestions", clears auto-correct, or asks for no
 * personalised learning. Nothing is ever switched back on, so a wrong classification can only cost
 * a suggestion, never insert text the app did not ask for.
 *
 * Key geometry and glide sensitivity are deliberately not part of this: 18.6.3 keeps them in
 * obfuscated keyboard-parameter objects with no stable entry point, and rewriting them from an
 * EditorInfo hook would need per-version bindings this repo does not have.
 */
public final class FieldProfileRuntime {

    /** EditorInfo.IME_FLAG_NO_PERSONALIZED_LEARNING, absent from the API 16 compile stubs. */
    private static final int IME_FLAG_NO_PERSONALIZED_LEARNING = 0x1000000;

    private static final int PROFILE_DEFAULT = 0;
    private static final int PROFILE_SEARCH = 1;
    private static final int PROFILE_URL = 2;
    private static final int PROFILE_EMAIL = 3;
    private static final int PROFILE_PASSWORD = 4;
    private static final int PROFILE_CODE = 5;

    private FieldProfileRuntime() {
    }

    /**
     * Rewrites the field's editor metadata so Gboard picks the matching behaviour. Called for both
     * {@code onStartInput} and {@code onStartInputView}, because the keyboard caches the editor
     * before the view is created.
     */
    public static void adapt(EditorInfo info) {
        try {
            if (info == null) {
                return;
            }
            int profile = classify(info);
            if (profile == PROFILE_DEFAULT) {
                return;
            }

            int type = info.inputType;
            switch (profile) {
                case PROFILE_SEARCH:
                    // Keep suggestions, but stop learning from what people search for.
                    info.imeOptions |= IME_FLAG_NO_PERSONALIZED_LEARNING;
                    break;
                case PROFILE_URL:
                    type = restrict(type);
                    info.imeOptions |= IME_FLAG_NO_PERSONALIZED_LEARNING;
                    break;
                case PROFILE_EMAIL:
                    type = restrict(type);
                    break;
                case PROFILE_PASSWORD:
                    type = restrict(type);
                    break;
                case PROFILE_CODE:
                    type = restrict(type);
                    break;
                default:
                    break;
            }
            info.inputType = type;
        } catch (Throwable ignored) {
            // A field Gboard renders oddly is better than a keyboard that refuses to show.
        }
    }

    /** No suggestions, no auto-correct and no learning: the safe direction for every profile. */
    private static int restrict(int type) {
        int restricted = type | EditorInfo.TYPE_TEXT_FLAG_NO_SUGGESTIONS;
        restricted &= ~EditorInfo.TYPE_TEXT_FLAG_AUTO_CORRECT;
        return restricted;
    }

    private static int classify(EditorInfo info) {
        int type = info.inputType;
        int cls = type & EditorInfo.TYPE_MASK_CLASS;
        if (cls != EditorInfo.TYPE_CLASS_TEXT) {
            return PROFILE_DEFAULT;
        }
        int variation = type & EditorInfo.TYPE_MASK_VARIATION;
        switch (variation) {
            case EditorInfo.TYPE_TEXT_VARIATION_URI:
                return PROFILE_URL;
            case EditorInfo.TYPE_TEXT_VARIATION_EMAIL_ADDRESS:
            case EditorInfo.TYPE_TEXT_VARIATION_WEB_EMAIL_ADDRESS:
                return PROFILE_EMAIL;
            case EditorInfo.TYPE_TEXT_VARIATION_PASSWORD:
            case EditorInfo.TYPE_TEXT_VARIATION_VISIBLE_PASSWORD:
            case EditorInfo.TYPE_TEXT_VARIATION_WEB_PASSWORD:
                return PROFILE_PASSWORD;
            default:
                break;
        }
        // A field that already refuses suggestions is a code or identifier field.
        if ((type & EditorInfo.TYPE_TEXT_FLAG_NO_SUGGESTIONS) != 0) {
            return PROFILE_CODE;
        }
        if ((info.imeOptions & EditorInfo.IME_MASK_ACTION) == EditorInfo.IME_ACTION_SEARCH) {
            return PROFILE_SEARCH;
        }
        return PROFILE_DEFAULT;
    }
}
