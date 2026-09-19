/*
 * Copyright 2026 icysymmetra/tiktok-patches-for-morphe contributors
 * https://github.com/icysymmetra/tiktok-patches-for-morphe
 */

package app.morphe.extension.tiktok.settings.preference;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.drawable.Drawable;
import android.preference.Preference;
import android.text.InputType;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import app.morphe.extension.tiktok.settings.L10n;

/** An inline search field used by the settings index. */
@SuppressWarnings("deprecation")
public final class SettingsSearchInputPreference extends Preference {
    public interface QueryListener {
        void onQueryChanged(String query);
    }

    private final QueryListener queryListener;
    /** The page is entered once; a recreation with a query in the box keeps the box. */
    private boolean focusedOnEntry;
    private EditText editText;
    private View clearButton;
    private TextView resultCount;
    private int shownResults = -1;

    public SettingsSearchInputPreference(Context context, QueryListener queryListener) {
        super(context);
        this.queryListener = queryListener;
        setSelectable(false);
        setOrder(-800);
    }

    @Override
    protected View onCreateView(ViewGroup parent) {
        Context context = getContext();
        LinearLayout root = new LinearLayout(context);
        root.setOrientation(LinearLayout.VERTICAL);
        LinearLayout row = new LinearLayout(context);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(0, SettingsUi.dp(context, 8), 0, SettingsUi.dp(context, 8));

        editText = new EditText(context);
        editText.setTag("settings_search_input");
        editText.setSingleLine(true);
        editText.setTextSize(16);
        editText.setHint(L10n.t(context, "Search settings"));
        // No content description on a search box. On an editable view it replaces what was
        // typed in the announcement, so "cats" came back as the label. The hint names it.
        editText.setMinimumHeight(SettingsUi.dp(context, 48));
        editText.setPadding(0, 0, 0, 0);
        SettingsUi.styleEditText(editText);
        // Every native search flow lands with the field focused, the keyboard up and the action
        // key searching. This one made the reader tap the box first, showed a generic action
        // key, and let autocorrect rewrite a setting's name into another word.
        editText.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        editText.setSingleLine(true);
        editText.setImeOptions(EditorInfo.IME_ACTION_SEARCH);
        editText.setOnEditorActionListener((view, actionId, event) -> {
            if (actionId != EditorInfo.IME_ACTION_SEARCH) return false;
            // The results sit under the keyboard; the search key brings them into view.
            InputMethodManager manager = (InputMethodManager) view.getContext()
                    .getSystemService(Context.INPUT_METHOD_SERVICE);
            if (manager != null) manager.hideSoftInputFromWindow(view.getWindowToken(), 0);
            return true;
        });
        editText.addTextChangedListener(new TextWatcher() {
            @Override public void beforeTextChanged(CharSequence text, int start, int count, int after) {
            }

            @Override public void onTextChanged(CharSequence text, int start, int before, int count) {
                updateClearButton();
                if (queryListener != null) {
                    queryListener.onQueryChanged(text == null ? "" : text.toString());
                }
            }

            @Override public void afterTextChanged(Editable text) {
            }
        });
        row.addView(editText, new LinearLayout.LayoutParams(0, -2, 1));

        ImageView clear = new ImageView(context);
        clear.setTag("settings_search_clear");
        clear.setImageDrawable(new ClearDrawable(context));
        clear.setScaleType(ImageView.ScaleType.CENTER);
        clear.setBackground(SettingsUi.roundedSurface(context, SettingsUi.RADIUS_CONTROL, false));
        clear.setContentDescription(L10n.t(context, "Clear search"));
        SettingsUi.markAsButton(clear);
        clear.setFocusable(true);
        clear.setClickable(true);
        int clearSize = SettingsUi.dp(context, 48);
        clear.setMinimumWidth(clearSize);
        clear.setMinimumHeight(clearSize);
        clear.setOnClickListener(view -> editText.setText(""));
        clearButton = clear;
        row.addView(clear, new LinearLayout.LayoutParams(clearSize, clearSize));
        updateClearButton();
        root.addView(row, new LinearLayout.LayoutParams(-1, -2));

        resultCount = SettingsUi.resultCount(context, "settings_search_result_count");
        resultCount.setPadding(0, 0, 0, SettingsUi.dp(context, 6));
        root.addView(resultCount, new LinearLayout.LayoutParams(-1, -2));
        updateResultCount();
        return root;
    }

    private void updateClearButton() {
        if (clearButton != null) {
            clearButton.setVisibility(editText != null && editText.length() > 0 ? View.VISIBLE : View.GONE);
        }
    }

    public String getQuery() {
        return editText == null ? "" : editText.getText().toString();
    }

    public void setQuery(String query) {
        if (editText != null && query != null && !query.isEmpty()) {
            editText.setText(query);
            editText.setSelection(query.length());
        }
    }

    @Override
    protected void onBindView(View view) {
        super.onBindView(view);
        if (focusedOnEntry || editText == null || editText.length() > 0) return;
        focusedOnEntry = true;
        // After the list has laid the row out; a request on a view not yet in the window lands
        // nowhere, and the keyboard needs the focused view to be in the window as well.
        editText.post(() -> {
            editText.requestFocus();
            InputMethodManager manager = (InputMethodManager) editText.getContext()
                    .getSystemService(Context.INPUT_METHOD_SERVICE);
            if (manager != null) manager.showSoftInput(editText, InputMethodManager.SHOW_IMPLICIT);
        });
    }

    public void showResultCount(int count) {
        shownResults = Math.max(0, count);
        updateResultCount();
    }

    public void hideResultCount() {
        shownResults = -1;
        updateResultCount();
    }

    private void updateResultCount() {
        if (resultCount == null) return;
        resultCount.setVisibility(shownResults < 0 ? View.GONE : View.VISIBLE);
        if (shownResults >= 0) SettingsUi.setResultCount(resultCount, shownResults);
    }

    static final class ClearDrawable extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);

        ClearDrawable(Context context) {
            paint.setColor(SettingsUi.accent());
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(SettingsUi.strokePx(context, 2.1f));
            paint.setStrokeCap(Paint.Cap.ROUND);
        }

        @Override
        public void draw(Canvas canvas) {
            float cx = getBounds().exactCenterX();
            float cy = getBounds().exactCenterY();
            float size = Math.min(getBounds().width(), getBounds().height()) * 0.16f;
            canvas.drawLine(cx - size, cy - size, cx + size, cy + size, paint);
            canvas.drawLine(cx + size, cy - size, cx - size, cy + size, paint);
        }

        @Override public void setAlpha(int alpha) { paint.setAlpha(alpha); }
        @Override public void setColorFilter(ColorFilter filter) { paint.setColorFilter(filter); }
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }
}
