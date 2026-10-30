package app.mightymorphing.extension.joey;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.os.Build;
import android.view.KeyEvent;
import android.view.View;
import android.view.WindowInsets;
import android.view.WindowInsetsController;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;

/**
 * Joey's homepage search dialog asks for the keyboard implicitly, which current
 * Android ignores. Comment search never asks. Both fields get an explicit request.
 */
public final class SearchKeyboard {
    private SearchKeyboard() {
    }

    public static void onSearchDialog(Object dialog) {
        try {
            EditText field = (EditText) dialog.getClass().getMethod("i").invoke(dialog);
            if (field == null || !isSearchHint(field)) return;
            if (dialog instanceof Dialog) {
                Dialog window = (Dialog) dialog;
                if (window.getWindow() != null) {
                    window.getWindow().setSoftInputMode(
                            android.view.WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_VISIBLE);
                }
            }
            bindSearchAction(field, dialog);
            reveal(field);
        } catch (Throwable ignored) {
        }
    }

    private static void bindSearchAction(EditText field, Object dialog) {
        field.setImeOptions(EditorInfo.IME_ACTION_SEARCH);
        field.setOnEditorActionListener((v, actionId, event) -> {
            if (event != null && (event.getKeyCode() == KeyEvent.KEYCODE_ENTER
                    || event.getKeyCode() == KeyEvent.KEYCODE_NUMPAD_ENTER)) {
                if (event.getAction() == KeyEvent.ACTION_DOWN) {
                    submitSearchDialog(dialog);
                }
                return true;
            }
            if (actionId == EditorInfo.IME_ACTION_SEARCH
                    || actionId == EditorInfo.IME_ACTION_DONE
                    || actionId == EditorInfo.IME_ACTION_GO
                    || actionId == EditorInfo.IME_ACTION_SEND
                    || actionId == EditorInfo.IME_ACTION_NEXT) {
                return submitSearchDialog(dialog);
            }
            return false;
        });
    }

    private static boolean submitSearchDialog(Object dialog) {
        try {
            View positive = null;
            if (dialog instanceof Dialog) {
                Dialog d = (Dialog) dialog;
                Context context = d.getContext();
                int id = context.getResources().getIdentifier(
                        "md_buttonDefaultPositive", "id", context.getPackageName());
                if (id != 0) {
                    positive = d.findViewById(id);
                }
            }
            if (positive == null) {
                java.lang.reflect.Field rField = dialog.getClass().getDeclaredField("r");
                rField.setAccessible(true);
                Object btn = rField.get(dialog);
                if (btn instanceof View) {
                    positive = (View) btn;
                }
            }
            if (positive != null && positive.getVisibility() == View.VISIBLE && positive.isEnabled()) {
                return positive.performClick();
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    public static void onCommentSearch(Activity activity) {
        try {
            int id = activity.getResources().getIdentifier(
                    "searchbox_comment_search", "id", activity.getPackageName());
            if (id == 0) return;
            android.view.View view = activity.findViewById(id);
            if (!(view instanceof EditText)) return;
            activity.getWindow().setSoftInputMode(
                    android.view.WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_VISIBLE);
            reveal((EditText) view);
        } catch (Throwable ignored) {
        }
    }

    private static boolean isSearchHint(EditText field) {
        CharSequence hint = field.getHint();
        if (hint == null) return false;
        Context context = field.getContext();
        int id = context.getResources().getIdentifier("search_hint", "string", context.getPackageName());
        return id != 0 && context.getString(id).contentEquals(hint);
    }

    private static void reveal(EditText field) {
        field.requestFocus();
        field.post(() -> {
            field.requestFocus();
            if (Build.VERSION.SDK_INT >= 30) {
                WindowInsetsController controller = field.getWindowInsetsController();
                if (controller != null) controller.show(WindowInsets.Type.ime());
            }
            InputMethodManager manager = (InputMethodManager) field.getContext()
                    .getSystemService(Context.INPUT_METHOD_SERVICE);
            if (manager != null) manager.showSoftInput(field, 0);
        });
    }
}
