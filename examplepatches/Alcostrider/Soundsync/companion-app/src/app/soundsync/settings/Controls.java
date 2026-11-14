package app.soundsync.settings;

import android.content.Context;
import android.graphics.Typeface;
import android.os.Handler;
import android.os.Looper;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.SeekBar;
import android.widget.TextView;

/** The delay and mode controls, shared by the main screen and the quick panel. */
final class Controls {
    private final Context ctx;
    private final Handler main = new Handler(Looper.getMainLooper());
    private TextView value;
    private SeekBar bar;
    private RadioGroup modes;
    private boolean updating;

    Controls(Context ctx) {
        this.ctx = ctx;
    }

    /** Big number, -/+ buttons and, optionally, the slider. */
    View delayView(boolean withSlider) {
        LinearLayout col = new LinearLayout(ctx);
        col.setOrientation(LinearLayout.VERTICAL);

        TextView caption = new TextView(ctx);
        caption.setText("Video held back by:");
        caption.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        caption.setGravity(Gravity.CENTER);
        col.addView(caption, match());

        value = new TextView(ctx);
        value.setTextSize(TypedValue.COMPLEX_UNIT_SP, 40);
        value.setTypeface(Typeface.DEFAULT_BOLD);
        value.setGravity(Gravity.CENTER);
        col.addView(value, match());

        LinearLayout row = new LinearLayout(ctx);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER);
        row.addView(stepButton("−50", -50));
        row.addView(stepButton("−10", -10));
        row.addView(stepButton("+10", 10));
        row.addView(stepButton("+50", 50));
        col.addView(row, match());

        if (withSlider) {
            bar = new SeekBar(ctx);
            bar.setMax((Settings.MAX_DELAY - Settings.MIN_DELAY) / 10);
            bar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
                @Override
                public void onProgressChanged(SeekBar s, int p, boolean fromUser) {
                    if (fromUser && !updating) {
                        Settings.setDelay(ctx, Settings.MIN_DELAY + p * 10);
                        refresh();
                    }
                }

                @Override
                public void onStartTrackingTouch(SeekBar s) {
                }

                @Override
                public void onStopTrackingTouch(SeekBar s) {
                }
            });
            LinearLayout.LayoutParams lp = match();
            lp.topMargin = dp(8);
            col.addView(bar, lp);
        }
        return col;
    }

    View modeView() {
        modes = new RadioGroup(ctx);
        modes.setOrientation(RadioGroup.VERTICAL);
        addMode(Settings.MODE_ANDROID_AUTO, "Only while connected to Android Auto");
        addMode(Settings.MODE_ALWAYS, "Always (any speaker)");
        addMode(Settings.MODE_OFF, "Off");
        modes.setOnCheckedChangeListener(new RadioGroup.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(RadioGroup g, int id) {
                if (!updating && id != View.NO_ID) {
                    Settings.setMode(ctx, id - 1);
                    refresh();
                }
            }
        });
        return modes;
    }

    private void addMode(int mode, String label) {
        RadioButton b = new RadioButton(ctx);
        b.setId(mode + 1); // view ids must be positive
        b.setText(label);
        b.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        modes.addView(b);
    }

    void refresh() {
        updating = true;
        int d = Settings.delay(ctx);
        if (value != null) value.setText(d + " ms");
        if (bar != null) bar.setProgress((d - Settings.MIN_DELAY) / 10);
        if (modes != null) modes.check(Settings.mode(ctx) + 1);
        updating = false;
    }

    private Button stepButton(String label, final int step) {
        final Button b = new Button(ctx);
        b.setText(label);
        b.setAllCaps(false);
        b.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        // Tap for one step; hold to keep going
        b.setOnTouchListener(new View.OnTouchListener() {
            private final Runnable repeat = new Runnable() {
                @Override
                public void run() {
                    nudge(step);
                    main.postDelayed(this, 90);
                }
            };

            @Override
            public boolean onTouch(View v, MotionEvent ev) {
                switch (ev.getActionMasked()) {
                    case MotionEvent.ACTION_DOWN:
                        v.setPressed(true);
                        nudge(step);
                        main.postDelayed(repeat, 450);
                        return true;
                    case MotionEvent.ACTION_UP:
                    case MotionEvent.ACTION_CANCEL:
                        v.setPressed(false);
                        main.removeCallbacks(repeat);
                        return true;
                    default:
                        return true;
                }
            }
        });
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        lp.leftMargin = dp(2);
        lp.rightMargin = dp(2);
        b.setLayoutParams(lp);
        return b;
    }

    private void nudge(int step) {
        Settings.changeDelay(ctx, step);
        refresh();
    }

    private LinearLayout.LayoutParams match() {
        return new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
    }

    int dp(int v) {
        return Math.round(v * ctx.getResources().getDisplayMetrics().density);
    }
}
