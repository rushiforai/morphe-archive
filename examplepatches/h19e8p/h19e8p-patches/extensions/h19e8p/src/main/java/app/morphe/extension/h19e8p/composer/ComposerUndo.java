/*
 * h19e8p Patches
 * Copyright (C) 2026 h19e8p
 *
 * This program is free software: you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option) any later
 * version. See the LICENSE file.
 */

package app.morphe.extension.h19e8p.composer;

import android.content.Context;
import android.os.SystemClock;
import android.text.Editable;
import android.text.Selection;
import android.text.SpannableStringBuilder;
import android.text.TextWatcher;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ImageView;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

import app.morphe.extension.h19e8p.Text;

/**
 * 投稿画面の「元に戻す」「やり直す」。
 *
 * <p>本文の入力欄ごとに、文字の履歴を持つ (スレッドでは投稿ごとに別の欄になる)。続けて打った文字は
 * {@link #MERGE_MS} ミリ秒以内ならひとまとめにする。投稿画面の下のボタンの列に、2つのボタンを足す。
 */
public final class ComposerUndo {
    private static final String TAG = "h19e8p";
    private static final long MERGE_MS = 600;
    private static final int MAX_STATES = 200;
    private static final float DISABLED_ALPHA = 0.3f;

    private static final Map<EditText, History> histories = new WeakHashMap<>();
    private static WeakReference<EditText> current = new WeakReference<>(null);
    private static WeakReference<ImageButton> undoButton = new WeakReference<>(null);
    private static WeakReference<ImageButton> redoButton = new WeakReference<>(null);

    private ComposerUndo() {
    }

    /** 1つの入力欄の履歴。 */
    private static final class History implements TextWatcher {
        final WeakReference<EditText> editor;
        final List<CharSequence> texts = new ArrayList<>();
        final List<Integer> cursors = new ArrayList<>();
        int index = -1;
        long lastChange;
        boolean restoring;

        History(EditText editText) {
            editor = new WeakReference<>(editText);
            reset(editText);
        }

        void reset(EditText editText) {
            texts.clear();
            cursors.clear();
            texts.add(new SpannableStringBuilder(editText.getText()));
            cursors.add(editText.getSelectionEnd());
            index = 0;
            lastChange = 0;
        }

        @Override
        public void beforeTextChanged(CharSequence s, int start, int count, int after) {
        }

        @Override
        public void onTextChanged(CharSequence s, int start, int before, int count) {
        }

        @Override
        public void afterTextChanged(Editable s) {
            if (restoring) return;
            try {
                CharSequence latest = texts.isEmpty() ? null : texts.get(index);
                if (latest != null && latest.toString().contentEquals(s)) return;
                // やり直せる分は、新しく打った時点で捨てる。
                while (texts.size() > index + 1) {
                    texts.remove(texts.size() - 1);
                    cursors.remove(cursors.size() - 1);
                }
                long now = SystemClock.uptimeMillis();
                EditText editText = editor.get();
                int cursor = editText == null ? s.length() : editText.getSelectionEnd();
                if (index > 0 && now - lastChange < MERGE_MS) {
                    // 続けて打った文字は、直前の分にまとめる。
                    texts.set(index, new SpannableStringBuilder(s));
                    cursors.set(index, cursor);
                } else {
                    texts.add(new SpannableStringBuilder(s));
                    cursors.add(cursor);
                    index = texts.size() - 1;
                    if (texts.size() > MAX_STATES) {
                        texts.remove(0);
                        cursors.remove(0);
                        index--;
                    }
                }
                lastChange = now;
            } catch (Throwable ex) {
                Log.e(TAG, "ComposerUndo history", ex);
            }
            updateButtons();
        }

        boolean canUndo() {
            return index > 0;
        }

        boolean canRedo() {
            return index < texts.size() - 1;
        }

        void move(int step) {
            EditText editText = editor.get();
            if (editText == null) return;
            int target = index + step;
            if (target < 0 || target >= texts.size()) return;
            index = target;
            restoring = true;
            try {
                Editable editable = editText.getText();
                editable.replace(0, editable.length(), texts.get(index));
                int cursor = Math.min(cursors.get(index), editable.length());
                Selection.setSelection(editable, Math.max(cursor, 0));
                // 変換中の文字があった時のため、キーボードの入力をやり直させる。
                InputMethodManager input =
                        (InputMethodManager) editText.getContext().getSystemService(Context.INPUT_METHOD_SERVICE);
                if (input != null) input.restartInput(editText);
            } finally {
                restoring = false;
                lastChange = 0;
            }
            updateButtons();
        }
    }

    /** 差し込み口: 本文の入力欄の入れ物 (TweetBox) ができた時。 */
    public static void onTweetBox(View tweetBox) {
        try {
            EditText editText = findEditor(tweetBox);
            if (editText == null) return;
            History history = histories.get(editText);
            if (history == null) {
                history = new History(editText);
                histories.put(editText, history);
                editText.addTextChangedListener(history);
            }
            if (current.get() == null || editText.hasFocus()) current = new WeakReference<>(editText);
            updateButtons();
        } catch (Throwable ex) {
            Log.e(TAG, "ComposerUndo onTweetBox", ex);
        }
    }

    /** 入力欄が選ばれたら、そこを「元に戻す」の対象にする。 */
    private static void onFocusMoved(View newFocus) {
        if (newFocus instanceof EditText && histories.containsKey(newFocus)) {
            current = new WeakReference<>((EditText) newFocus);
            updateButtons();
        }
    }

    private static EditText findEditor(View tweetBox) {
        int id = tweetBox.getResources().getIdentifier("tweet_text", "id", tweetBox.getContext().getPackageName());
        View view = id == 0 ? null : tweetBox.findViewById(id);
        if (view instanceof EditText) return (EditText) view;
        if (tweetBox instanceof ViewGroup) return firstEditor((ViewGroup) tweetBox);
        return null;
    }

    private static EditText firstEditor(ViewGroup group) {
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (child instanceof EditText) return (EditText) child;
            if (child instanceof ViewGroup) {
                EditText found = firstEditor((ViewGroup) child);
                if (found != null) return found;
            }
        }
        return null;
    }

    /** 差し込み口: 投稿画面の下のボタンの列ができた時。2つのボタンを足す。 */
    public static void onFooter(View footer) {
        try {
            Context context = footer.getContext();
            int containerId = context.getResources().getIdentifier("main_buttons_container", "id", context.getPackageName());
            View found = containerId == 0 ? null : footer.findViewById(containerId);
            if (!(found instanceof ViewGroup)) return;
            ViewGroup container = (ViewGroup) found;
            if (container.findViewWithTag(TAG + ":undo") != null) return;

            ImageView sample = firstImage(container);
            ImageButton undo = button(context, sample, Text.of("元に戻す", "Undo"), false);
            undo.setTag(TAG + ":undo");
            undo.setOnClickListener(view -> step(-1));
            ImageButton redo = button(context, sample, Text.of("やり直す", "Redo"), true);
            redo.setOnClickListener(view -> step(1));
            container.addView(undo);
            container.addView(redo);
            undoButton = new WeakReference<>(undo);
            redoButton = new WeakReference<>(redo);
            // どの入力欄が選ばれているかを、画面全体の知らせで追う (入力欄そのものの設定は X が使うため触らない)。
            footer.getViewTreeObserver().addOnGlobalFocusChangeListener((oldFocus, newFocus) -> onFocusMoved(newFocus));
            updateButtons();
        } catch (Throwable ex) {
            Log.e(TAG, "ComposerUndo onFooter", ex);
        }
    }

    private static ImageView firstImage(ViewGroup group) {
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (child instanceof ImageView && child.getVisibility() == View.VISIBLE) return (ImageView) child;
        }
        return null;
    }

    /** 列のほかのボタンと同じ大きさ・色のボタンを作る。やり直すは、元に戻すの矢印を左右反転して使う。 */
    private static ImageButton button(Context context, ImageView sample, String label, boolean mirrored) {
        ImageButton button = new ImageButton(context);
        int icon = context.getResources().getIdentifier("ic_vector_undo", "drawable", context.getPackageName());
        if (icon != 0) button.setImageResource(icon);
        button.setContentDescription(label);
        if (mirrored) button.setScaleX(-1f);
        if (sample != null) {
            button.setBackground(sample.getBackground() == null ? null
                    : sample.getBackground().getConstantState() == null ? null
                    : sample.getBackground().getConstantState().newDrawable());
            button.setImageTintList(sample.getImageTintList());
            button.setScaleType(sample.getScaleType());
            button.setPadding(sample.getPaddingLeft(), sample.getPaddingTop(), sample.getPaddingRight(), sample.getPaddingBottom());
            ViewGroup.LayoutParams params = sample.getLayoutParams();
            if (params != null) {
                button.setLayoutParams(params instanceof ViewGroup.MarginLayoutParams
                        ? new ViewGroup.MarginLayoutParams((ViewGroup.MarginLayoutParams) params)
                        : new ViewGroup.LayoutParams(params));
            }
        } else {
            button.setBackground(null);
        }
        return button;
    }

    private static void step(int direction) {
        EditText editText = current.get();
        if (editText == null) return;
        History history = histories.get(editText);
        if (history != null) history.move(direction);
    }

    private static void updateButtons() {
        EditText editText = current.get();
        History history = editText == null ? null : histories.get(editText);
        set(undoButton.get(), history != null && history.canUndo());
        set(redoButton.get(), history != null && history.canRedo());
    }

    private static void set(ImageButton button, boolean enabled) {
        if (button == null) return;
        button.setEnabled(enabled);
        button.setAlpha(enabled ? 1f : DISABLED_ALPHA);
    }
}
