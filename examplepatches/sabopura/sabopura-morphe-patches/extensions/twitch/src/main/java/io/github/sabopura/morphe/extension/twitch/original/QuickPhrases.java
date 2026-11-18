package io.github.sabopura.morphe.extension.twitch.original;

import android.content.Context;
import android.content.SharedPreferences;
import android.text.Editable;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.widget.EditText;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;

import io.github.sabopura.morphe.extension.twitch.Diagnostics;
import io.github.sabopura.morphe.extension.twitch.ui.Feature;
import io.github.sabopura.morphe.extension.twitch.ui.Features;
import io.github.sabopura.morphe.extension.twitch.ui.TwitchRes;
import io.github.sabopura.morphe.extension.twitch.ui.Ui;

/** Chips above the chat box that type a saved phrase into it. Sending stays with the user. */
public final class QuickPhrases extends HorizontalScrollView {
    public static final String KEY_ENABLED = "quick_phrases", KEY_LINES = "quick_phrases_lines";
    public static final String DEFAULT_LINES = "草\n8888\nwww\nGG";

    private final LinearLayout row;
    private EditText box;
    private final ViewTreeObserver.OnGlobalLayoutListener follow = this::followBox;

    public QuickPhrases(Context context, AttributeSet attrs) {
        super(context, attrs);
        setHorizontalScrollBarEnabled(false);
        setVisibility(GONE);
        row = new LinearLayout(context);
        row.setPadding(Ui.dp(context, 8), 0, Ui.dp(context, 8), 0);
        addView(row);
    }

    public static String[] phrases(SharedPreferences prefs) {
        String stored = prefs.getString(KEY_LINES, DEFAULT_LINES);
        return stored.trim().isEmpty() ? new String[0] : stored.trim().split("\\s*\\n\\s*");
    }

    private boolean enabled() {
        SharedPreferences prefs = Original.prefs();
        return Features.has(Feature.QUICK_PHRASES) && prefs != null && prefs.getBoolean(KEY_ENABLED, false);
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        try {
            box = null;
            if (!enabled()) return;
            Context context = getContext();
            int boxId = TwitchRes.id(context, "message_input", "id");
            ViewParent parent = getParent();
            View found = boxId != 0 && parent instanceof View ? ((View) parent).findViewById(boxId) : null;
            if (!(found instanceof EditText)) return;
            box = (EditText) found;
            row.removeAllViews();
            Ui ui = Ui.of(context);
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.WRAP_CONTENT, LinearLayout.LayoutParams.WRAP_CONTENT);
            lp.rightMargin = Ui.dp(context, 6);
            for (String phrase : phrases(Original.prefs())) row.addView(ui.chip(context, phrase, false, () -> insert(phrase)), lp);
            if (row.getChildCount() == 0) return;
            getViewTreeObserver().addOnGlobalLayoutListener(follow);
            followBox();
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("original.quick-phrases", e);
            setVisibility(GONE);
        }
    }

    @Override
    protected void onDetachedFromWindow() {
        getViewTreeObserver().removeOnGlobalLayoutListener(follow);
        super.onDetachedFromWindow();
    }

    /** The chips exist only while the chat box does. */
    private void followBox() {
        int wanted = box != null && box.isShown() ? VISIBLE : GONE;
        if (getVisibility() != wanted) setVisibility(wanted);
    }

    private void insert(String phrase) {
        if (box == null) return;
        Editable text = box.getText();
        int at = Math.max(box.getSelectionEnd(), 0);
        String joined = (at > 0 && !Character.isWhitespace(text.charAt(at - 1)) ? " " : "") + phrase + " ";
        text.insert(at, joined);
    }
}
