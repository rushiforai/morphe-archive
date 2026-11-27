package org.ungoogled.car;

import android.text.TextUtils;
import android.util.Log;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputConnection;

import androidx.annotation.NonNull;
import androidx.car.app.CarContext;
import androidx.car.app.Screen;
import androidx.car.app.model.Action;
import androidx.car.app.model.SearchTemplate;
import androidx.car.app.model.Template;

/**
 * The host's keyboard for a text field of Maps' car UI (its search box). A Car App Library app gets a keyboard
 * only through a SearchTemplate: what is typed there is written into Maps' field as it changes, and the search
 * key runs the field's action (Maps' search), then this screen goes and Maps shows the results.
 */
final class MapsSearchScreen extends Screen {
    private static final String TAG = "UA-CAR";
    /** More than any search box holds. */
    private static final int ALL = 10_000;

    private final InputConnection field;
    private final EditorInfo info;
    private final String initial;

    MapsSearchScreen(@NonNull CarContext context, InputConnection field, EditorInfo info) {
        super(context);
        this.field = field;
        this.info = info;
        initial = text();
    }

    private String text() {
        try {
            CharSequence before = field.getTextBeforeCursor(ALL, 0);
            CharSequence after = field.getTextAfterCursor(ALL, 0);
            return (before == null ? "" : before.toString()) + (after == null ? "" : after.toString());
        } catch (RuntimeException e) {
            return "";
        }
    }

    /** Replaces the whole text of Maps' field. */
    private void setText(String text) {
        try {
            field.beginBatchEdit();
            CharSequence before = field.getTextBeforeCursor(ALL, 0);
            CharSequence after = field.getTextAfterCursor(ALL, 0);
            field.finishComposingText();
            field.deleteSurroundingText(before == null ? 0 : before.length(), after == null ? 0 : after.length());
            field.commitText(text, 1);
            field.endBatchEdit();
        } catch (RuntimeException e) {
            Log.w(TAG, "writing into Maps' text field", e);
        }
    }

    private int action() {
        int action = info.imeOptions & EditorInfo.IME_MASK_ACTION;
        return action == EditorInfo.IME_ACTION_NONE || action == EditorInfo.IME_ACTION_UNSPECIFIED
                ? EditorInfo.IME_ACTION_SEARCH : action;
    }

    @NonNull
    @Override
    public Template onGetTemplate() {
        SearchTemplate.Builder builder = new SearchTemplate.Builder(new SearchTemplate.SearchCallback() {
            @Override
            public void onSearchTextChanged(@NonNull String searchText) {
                setText(searchText);
            }

            @Override
            public void onSearchSubmitted(@NonNull String searchText) {
                setText(searchText);
                try {
                    field.performEditorAction(action());
                } catch (RuntimeException e) {
                    Log.w(TAG, "running the action of Maps' text field", e);
                }
                getScreenManager().pop();
            }
        })
                .setHeaderAction(Action.BACK)
                .setShowKeyboardByDefault(true);
        if (!TextUtils.isEmpty(initial)) builder.setInitialSearchText(initial);
        if (!TextUtils.isEmpty(info.hintText)) builder.setSearchHint(info.hintText.toString());
        return builder.build();
    }
}
