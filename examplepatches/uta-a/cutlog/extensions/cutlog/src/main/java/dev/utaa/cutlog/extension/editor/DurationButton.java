package dev.utaa.cutlog.extension.editor;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Color;
import android.graphics.Typeface;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.widget.TextView;
import dev.utaa.cutlog.extension.pref.Feature;
import dev.utaa.cutlog.extension.pref.Prefs;

/**
 * 撮影画面のフラッシュの左に置く、撮影する長さのボタン。押すたびに 2 → 3 → 5 → 10 → 15 秒と切り替わる。
 * 公式と違う長さを選んでいる間は、ピンクの縁取りで目立たせる。
 */
@SuppressLint({"ViewConstructor", "AppCompatCustomView"})
public final class DurationButton extends TextView {
    private static final String TAG = "cutlog-duration-button";

    private DurationButton(Context context) {
        super(context);
        setGravity(Gravity.CENTER);
        setTextColor(Color.WHITE);
        setTypeface(Typeface.DEFAULT_BOLD);
        setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        setIncludeFontPadding(false);
        setClickable(true);
        setOnClickListener(v -> next());
        refresh();
    }

    public static void attach(View cameraRoot) {
        Context context = cameraRoot.getContext();
        CameraChrome.place(cameraRoot, new DurationButton(context), TAG, -2f,
                () -> Prefs.isEnabled(context, Feature.RECORD_DURATION));
    }

    private void next() {
        if (dev.utaa.cutlog.extension.record.RecordDuration.isRecording()) {
            return;
        }
        int current = Prefs.recordSeconds(getContext());
        int[] choices = Prefs.RECORD_SECONDS_CHOICES;
        int next = choices[0];
        for (int i = 0; i < choices.length; i++) {
            if (choices[i] == current) {
                next = choices[(i + 1) % choices.length];
                break;
            }
        }
        Prefs.setRecordSeconds(getContext(), next);
        refresh();
    }

    private void refresh() {
        int seconds = Prefs.recordSeconds(getContext());
        setText(seconds + "秒");
        setContentDescription("撮影する長さ " + seconds + "秒");
        // 公式の長さではフラッシュと同じく背景なし。変えている間だけピンクの縁取りを付ける。
        if (seconds == Prefs.RECORD_SECONDS_CHOICES[0]) {
            setBackground(null);
        } else {
            android.graphics.drawable.GradientDrawable background = Ui.circle(Ui.SCRIM);
            background.setStroke(Ui.dp(getContext(), 2), Ui.ACCENT);
            setBackground(background);
        }
    }
}
