package app.tiktoktweaks;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.SeekBar;
import android.widget.Switch;
import android.widget.TextView;

/** The patch settings page, hosted in TikTok's ad settings activity when opened with an extra. */
public final class SettingsUi {
    private static final String EXTRA = "tiktok_tweaks_settings";
    private static final String HOST =
        "com.bytedance.ies.ugc.aweme.commercialize.compliance.personalization.AdPersonalizationActivity";

    private SettingsUi() {}

    public static boolean isSettings(Activity activity) {
        Intent intent = activity.getIntent();
        return intent != null && intent.getBooleanExtra(EXTRA, false);
    }

    /** Adds the Tweaks button over the top of the main settings page. */
    public static void attachButton(View page) {
        page.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
            private View button;

            @Override public void onViewAttachedToWindow(View view) {
                if (button != null || !(view.getParent() instanceof FrameLayout)) return;
                FrameLayout parent = (FrameLayout) view.getParent();
                button = createButton(view.getContext());
                FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(-2, -2, Gravity.TOP | Gravity.END);
                params.rightMargin = dp(view.getContext(), 16);
                parent.addView(button, params);
                parent.post(() -> place(parent, button, params));
            }

            @Override public void onViewDetachedFromWindow(View view) {
                if (button != null && button.getParent() instanceof ViewGroup) {
                    ((ViewGroup) button.getParent()).removeView(button);
                }
                button = null;
            }
        });
    }

    private static void place(FrameLayout parent, View button, FrameLayout.LayoutParams params) {
        int[] location = new int[2];
        parent.getLocationInWindow(location);
        int id = parent.getResources().getIdentifier("status_bar_height", "dimen", "android");
        int status = id > 0 ? parent.getResources().getDimensionPixelSize(id) : 0;
        params.topMargin = Math.max(status - location[1], 0) + dp(parent.getContext(), 8);
        button.setLayoutParams(params);
    }

    private static View createButton(Context context) {
        TextView button = new TextView(context);
        button.setText("Tweaks");
        button.setTextColor(Color.WHITE);
        button.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        int x = dp(context, 14);
        int y = dp(context, 7);
        button.setPadding(x, y, x, y);
        GradientDrawable shape = new GradientDrawable();
        shape.setColor(Color.rgb(254, 44, 85));
        shape.setCornerRadius(dp(context, 18));
        button.setBackground(shape);
        button.setOnClickListener(view -> launch(context));
        return button;
    }

    private static void launch(Context context) {
        try {
            Intent intent = new Intent(context, Class.forName(HOST));
            intent.putExtra(EXTRA, true);
            context.startActivity(intent);
        } catch (Throwable t) {
            Log.w("TikTokCustom", "open settings failed", t);
        }
    }

    public static void open(Activity activity) {
        Prefs.init(activity);
        boolean night = (activity.getResources().getConfiguration().uiMode
            & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
        int background = night ? Color.rgb(18, 18, 18) : Color.WHITE;
        int foreground = night ? Color.WHITE : Color.rgb(22, 24, 35);
        int pad = dp(activity, 16);

        LinearLayout list = new LinearLayout(activity);
        list.setOrientation(LinearLayout.VERTICAL);
        list.setPadding(pad, pad, pad, pad);

        list.addView(text(activity, "TikTok Tweaks", 22, foreground));

        toggle(activity, list, "Remove feed ads", Prefs.ADS, true, foreground);
        toggle(activity, list, "No Shop (feed videos and Shop tab)", Prefs.SHOP, true, foreground);
        toggle(activity, list, "Hide livestreams", Prefs.LIVE, true, foreground);
        toggle(activity, list, "Hide stories", Prefs.STORY, true, foreground);
        toggle(activity, list, "Hide image videos", Prefs.IMAGE, false, foreground);
        toggle(activity, list, "Disable offline videos", Prefs.OFFLINE, true, foreground);
        toggle(activity, list, "Hide Tako AI (feed and inbox)", Prefs.TAKO, true, foreground);
        toggle(activity, list, "Hide comment sticker suggestions", Prefs.COMMENT_STICKERS, true, foreground);
        toggle(activity, list, "Show re-mute button (with Start on mute)", Prefs.REMUTE, true, foreground);
        toggle(activity, list, "Open Activity on Comments", Prefs.ACTIVITY_COMMENTS, true, foreground);
        toggle(activity, list, "Remove download watermark", Prefs.WATERMARK, false, foreground);

        toggle(activity, list, "Add smaller stops to TikTok's text size slider", Prefs.SMALLER_TEXT, true, foreground);
        slider(activity, list, "UI size", Prefs.UI_SCALE, 60, foreground);

        list.addView(text(activity, "Download folder", 16, foreground));
        EditText path = new EditText(activity);
        path.setSingleLine(true);
        path.setTextColor(foreground);
        path.setText(Prefs.rawPath());
        path.addTextChangedListener(new TextWatcher() {
            @Override public void beforeTextChanged(CharSequence s, int a, int b, int c) {}
            @Override public void onTextChanged(CharSequence s, int a, int b, int c) {}
            @Override public void afterTextChanged(Editable s) { Prefs.put(Prefs.PATH, s.toString()); }
        });
        list.addView(path);

        list.addView(text(activity, "Restart TikTok to apply changes.", 14, foreground));
        Button restart = new Button(activity);
        restart.setText("Restart now");
        restart.setOnClickListener(view -> restart(activity));
        list.addView(restart);

        ScrollView scroll = new ScrollView(activity);
        scroll.setFitsSystemWindows(true);
        scroll.setBackgroundColor(background);
        scroll.addView(list, new ViewGroup.LayoutParams(-1, -2));
        activity.setContentView(scroll);
    }

    private static void toggle(Activity activity, LinearLayout list, String label, String key, boolean fallback, int color) {
        Switch row = new Switch(activity);
        row.setText(label);
        row.setTextColor(color);
        row.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setMinHeight(dp(activity, 56));
        row.setChecked(Prefs.bool(key, fallback));
        row.setOnCheckedChangeListener((view, checked) -> Prefs.put(key, checked));
        list.addView(row);
    }

    private static void slider(Activity activity, LinearLayout list, String label, String key, int min, int color) {
        int value = Math.max(min, Math.min(100, Prefs.number(key, 100)));
        TextView title = text(activity, label + ": " + value + "%", 16, color);
        list.addView(title);
        SeekBar bar = new SeekBar(activity);
        bar.setMax((100 - min) / 5);
        bar.setProgress((value - min) / 5);
        bar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                int current = min + progress * 5;
                title.setText(label + ": " + current + "%");
                Prefs.put(key, current);
            }
            @Override public void onStartTrackingTouch(SeekBar seekBar) {}
            @Override public void onStopTrackingTouch(SeekBar seekBar) {}
        });
        list.addView(bar);
    }

    private static TextView text(Activity activity, String value, int size, int color) {
        TextView view = new TextView(activity);
        view.setText(value);
        view.setTextColor(color);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, size);
        int pad = dp(activity, 8);
        view.setPadding(0, pad, 0, pad);
        return view;
    }

    private static int dp(Context context, int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }

    private static void restart(Activity activity) {
        Intent intent = activity.getPackageManager().getLaunchIntentForPackage(activity.getPackageName());
        if (intent != null) {
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
            activity.startActivity(intent);
        }
        Runtime.getRuntime().exit(0);
    }
}
