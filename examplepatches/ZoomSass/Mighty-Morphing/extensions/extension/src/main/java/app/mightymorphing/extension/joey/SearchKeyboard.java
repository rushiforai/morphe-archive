package app.mightymorphing.extension.joey;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.os.Build;
import android.view.WindowInsets;
import android.view.WindowInsetsController;
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
            reveal(field);
        } catch (Throwable ignored) {
        }
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
