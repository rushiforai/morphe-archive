package app.tikkamasalla.stremio;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.ShortcutInfo;
import android.content.pm.ShortcutManager;
import android.content.res.Configuration;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.Icon;
import android.graphics.drawable.StateListDrawable;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.view.Gravity;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import app.tikkamasalla.stremio.introskip.IntroSkipPrefs;
import app.tikkamasalla.stremio.introskip.IntroSkipSettings;
import app.tikkamasalla.stremio.subs.SdhPrefs;

public class ModSettingsActivity extends Activity {

    private static final String TAG = "ModSettings";
    static final String ACTION_FORGET_PLAYER = "forget_player";
    /** Stremio's own switch key (SpoilerHide.KEY); a literal so this class never loads SpoilerHide (androidx.preference). */
    private static final String SPOILER_KEY = "prefs_hide_spoilers";
    /** FrameRateModes.KEY_NOTICE. */
    private static final String FRAME_RATE_NOTICE_KEY = "playertune_fr_notice";

    private final List<Runnable> refreshers = new ArrayList<Runnable>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        try {
            boolean isTv = (getResources().getConfiguration().uiMode & Configuration.UI_MODE_TYPE_MASK) == Configuration.UI_MODE_TYPE_TELEVISION;
            int hPad = dip(isTv ? 64 : 16);
            int rowMinH = dip(isTv ? 64 : 56);
            int titleSp = isTv ? 20 : 18;
            int sumSp = isTv ? 16 : 14;

            ScrollView scroll = new ScrollView(this);
            scroll.setFillViewport(true);
            scroll.setBackgroundColor(0xFF0C0B11);

            LinearLayout root = new LinearLayout(this);
            root.setOrientation(LinearLayout.VERTICAL);
            root.setPadding(hPad, hPad, hPad, hPad);
            scroll.addView(root);

            scroll.setOnApplyWindowInsetsListener(new View.OnApplyWindowInsetsListener() {
                @Override
                public WindowInsets onApplyWindowInsets(View v, WindowInsets insets) {
                    root.setPadding(
                            hPad + insets.getSystemWindowInsetLeft(),
                            hPad + insets.getSystemWindowInsetTop(),
                            hPad + insets.getSystemWindowInsetRight(),
                            hPad + insets.getSystemWindowInsetBottom()
                    );
                    return insets;
                }
            });

            setContentView(scroll);
            scroll.requestApplyInsets();

            try {
                if (Build.VERSION.SDK_INT >= 21) {
                    getWindow().setStatusBarColor(0xFF0C0B11);
                    getWindow().setNavigationBarColor(0xFF0C0B11);
                }
            } catch (Throwable ignored) {
            }

            TextView mainTitle = new TextView(this);
            mainTitle.setText("Mod settings");
            mainTitle.setTextSize(titleSp + 6);
            mainTitle.setTextColor(0xFFFFFFFF);
            mainTitle.setPadding(0, 0, 0, dip(16));
            root.addView(mainTitle);

            View firstFocusable = null;

            for (Row row : rows()) {
                if (row.type == Row.HEADER) {
                    TextView tv = new TextView(this);
                    tv.setText(row.title);
                    tv.setTextColor(0xFF7B5BF5);
                    tv.setTextSize(sumSp);
                    tv.setPadding(dip(8), dip(16), dip(8), dip(8));
                    root.addView(tv);
                } else {
                    LinearLayout rowView = new LinearLayout(this);
                    rowView.setOrientation(LinearLayout.HORIZONTAL);
                    rowView.setMinimumHeight(rowMinH);
                    rowView.setGravity(Gravity.CENTER_VERTICAL);
                    rowView.setPadding(dip(16), dip(8), dip(16), dip(8));
                    LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(-1, -2);
                    lp.setMargins(0, 0, 0, dip(8));
                    rowView.setLayoutParams(lp);
                    rowView.setBackground(createRowBg(false));

                    LinearLayout textCol = new LinearLayout(this);
                    textCol.setOrientation(LinearLayout.VERTICAL);
                    LinearLayout.LayoutParams tLp = new LinearLayout.LayoutParams(0, -2, 1f);
                    textCol.setLayoutParams(tLp);

                    TextView title = new TextView(this);
                    title.setText(row.title);
                    title.setTextColor(row.type == Row.INFO ? 0xFFAAAAAA : 0xFFFFFFFF);
                    title.setTextSize(titleSp);
                    textCol.addView(title);

                    // A choice row has no fixed summary; its refresher sets the one of the stored value.
                    TextView summary = new TextView(this);
                    summary.setTextColor(0xFF888888);
                    summary.setTextSize(sumSp);
                    if (row.summary != null) summary.setText(row.summary);
                    if (row.summary != null || row.type == Row.CHOICE) textCol.addView(summary);
                    rowView.addView(textCol);

                    TextView pill = new TextView(this);
                    pill.setTextSize(titleSp);
                    pill.setPadding(dip(16), 0, 0, 0);
                    rowView.addView(pill);

                    if (row.type == Row.ACTION) {
                        rowView.setFocusable(true);
                        rowView.setClickable(true);
                        rowView.setFocusableInTouchMode(false);
                        if (firstFocusable == null) firstFocusable = rowView;
                        rowView.setOnClickListener(new View.OnClickListener() {
                            @Override
                            public void onClick(View v) {
                                try {
                                    Toast.makeText(ModSettingsActivity.this,
                                            runAction(ModSettingsActivity.this, row), Toast.LENGTH_SHORT).show();
                                } catch (Throwable ignored) {
                                    // A toast is optional.
                                }
                            }
                        });
                    }
                    if (row.type == Row.SWITCH || row.type == Row.CHOICE) {
                        rowView.setFocusable(true);
                        rowView.setClickable(true);
                        rowView.setFocusableInTouchMode(false);
                        if (firstFocusable == null) firstFocusable = rowView;

                        Runnable refresh = new Runnable() {
                            @Override
                            public void run() {
                                if (row.type == Row.SWITCH) {
                                    boolean on = getBool(ModSettingsActivity.this, row);
                                    pill.setText(on ? "On" : "Off");
                                    pill.setTextColor(on ? 0xFF7B5BF5 : 0xFF888888);
                                } else {
                                    int idx = choiceIndex(ModSettingsActivity.this, row);
                                    pill.setText(row.labels[idx]);
                                    pill.setTextColor(0xFF7B5BF5);
                                    if (row.summaries != null) summary.setText(row.summaries[idx]);
                                }
                            }
                        };
                        refreshers.add(refresh);
                        refresh.run();

                        rowView.setOnClickListener(new View.OnClickListener() {
                            @Override
                            public void onClick(View v) {
                                if (row.type == Row.SWITCH) {
                                    setBool(ModSettingsActivity.this, row, !getBool(ModSettingsActivity.this, row));
                                } else {
                                    cycleChoice(ModSettingsActivity.this, row);
                                }
                                refresh.run();
                            }
                        });
                    }
                    root.addView(rowView);
                }
            }

            TextView hint = new TextView(this);
            hint.setText("Changes apply immediately. Back to return.");
            hint.setTextColor(0xFF555555);
            hint.setTextSize(sumSp);
            hint.setGravity(Gravity.CENTER);
            hint.setPadding(0, dip(16), 0, dip(16));
            root.addView(hint);

            if (firstFocusable != null) {
                final View f = firstFocusable;
                root.post(new Runnable() {
                    @Override
                    public void run() {
                        f.requestFocus();
                    }
                });
            }
        } catch (Throwable t) {
            Log.w(TAG, "Fail", t);
            finish();
        }
    }

    @Override
    protected void onResume() {
        super.onResume();
        for (Runnable r : refreshers) r.run();
    }

    private Drawable createRowBg(boolean isHostRow) {
        GradientDrawable normal = new GradientDrawable();
        normal.setColor(isHostRow ? 0x337B5BF5 : 0xFF1A1822);
        normal.setCornerRadius(dip(8));

        GradientDrawable focused = new GradientDrawable();
        focused.setColor(0xFF2B2840);
        focused.setCornerRadius(dip(8));
        focused.setStroke(dip(2), 0xFF7B5BF5);

        StateListDrawable sld = new StateListDrawable();
        sld.addState(new int[]{android.R.attr.state_focused}, focused);
        sld.addState(new int[]{android.R.attr.state_pressed}, focused);
        sld.addState(new int[]{}, normal);
        return sld;
    }

    private int dip(int dp) {
        return (int) (getResources().getDisplayMetrics().density * dp);
    }

    public static void open(Context context) {
        try {
            Intent i = new Intent(context, ModSettingsActivity.class);
            if (!(context instanceof Activity)) i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(i);
        } catch (Throwable t) {
            Log.w(TAG, "Fail open", t);
        }
    }

    public static View wrapSettingsScreen(View view) {
        try {
            if (view == null || view instanceof SettingsHost) return view;
            SettingsHost host = new SettingsHost(view.getContext());
            ViewGroup.LayoutParams origLp = view.getLayoutParams();
            if (origLp != null) {
                if (origLp instanceof ViewGroup.MarginLayoutParams) {
                    // The side-menu margin moves to the host; the wrapped view gets fresh params below.
                    host.setLayoutParams(new ViewGroup.MarginLayoutParams((ViewGroup.MarginLayoutParams) origLp));
                } else {
                    host.setLayoutParams(new ViewGroup.LayoutParams(origLp));
                }
            }

            Context ctx = view.getContext();
            float density = ctx.getResources().getDisplayMetrics().density;
            LinearLayout row = new LinearLayout(ctx);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setMinimumHeight((int) (density * 64));
            row.setGravity(Gravity.CENTER_VERTICAL);
            row.setPadding((int) (density * 16), 0, (int) (density * 16), 0);

            GradientDrawable normal = new GradientDrawable();
            normal.setColor(0x337B5BF5);
            normal.setCornerRadius(density * 8);

            GradientDrawable focused = new GradientDrawable();
            focused.setColor(0xFF2B2840);
            focused.setCornerRadius(density * 8);
            focused.setStroke((int) (density * 2), 0xFF7B5BF5);

            StateListDrawable sld = new StateListDrawable();
            sld.addState(new int[]{android.R.attr.state_focused}, focused);
            sld.addState(new int[]{android.R.attr.state_pressed}, focused);
            sld.addState(new int[]{}, normal);
            row.setBackground(sld);

            row.setFocusable(true);
            row.setClickable(true);
            row.setFocusableInTouchMode(false);
            row.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    open(ctx);
                }
            });

            LinearLayout textCol = new LinearLayout(ctx);
            textCol.setOrientation(LinearLayout.VERTICAL);
            textCol.setLayoutParams(new LinearLayout.LayoutParams(0, -2, 1f));

            TextView title = new TextView(ctx);
            title.setText("Mod settings");
            title.setTextColor(0xFFFFFFFF);
            title.setTextSize(18);
            textCol.addView(title);

            TextView summary = new TextView(ctx);
            summary.setText("Intro skip, auto-pick, tracks, subtitles, spoilers, external player");
            summary.setTextColor(0xFF888888);
            summary.setTextSize(14);
            textCol.addView(summary);

            row.addView(textCol);

            TextView arrow = new TextView(ctx);
            arrow.setText(">");
            arrow.setTextColor(0xFF7B5BF5);
            arrow.setTextSize(20);
            row.addView(arrow);

            LinearLayout.LayoutParams rowLp = new LinearLayout.LayoutParams(-1, -2);
            rowLp.setMargins(0, 0, 0, (int) (density * 8));
            row.setLayoutParams(rowLp);

            host.addView(row);
            host.addView(view, new LinearLayout.LayoutParams(-1, 0, 1f));
            return host;
        } catch (Throwable t) {
            Log.w(TAG, "Fail wrap", t);
            return view;
        }
    }

    public static void installShortcut(Activity activity) {
        try {
            if (Build.VERSION.SDK_INT < 25) return;
            boolean isTv = (activity.getResources().getConfiguration().uiMode & Configuration.UI_MODE_TYPE_MASK) == Configuration.UI_MODE_TYPE_TELEVISION;
            if (isTv) return;

            ShortcutManager sm = activity.getSystemService(ShortcutManager.class);
            if (sm == null) return;

            for (ShortcutInfo si : sm.getDynamicShortcuts()) {
                if ("modsettings".equals(si.getId())) return;
            }

            Intent i = new Intent(activity, ModSettingsActivity.class).setAction(Intent.ACTION_MAIN);
            ShortcutInfo.Builder b = new ShortcutInfo.Builder(activity, "modsettings")
                    .setShortLabel("Mod settings")
                    .setLongLabel("Stremio mod settings")
                    .setIntent(i);

            if (activity.getApplicationInfo().icon != 0) {
                b.setIcon(Icon.createWithResource(activity, activity.getApplicationInfo().icon));
            }

            sm.addDynamicShortcuts(Collections.singletonList(b.build()));
        } catch (Throwable t) {
            Log.w(TAG, "Fail shortcut", t);
        }
    }

    private static class SettingsHost extends LinearLayout {
        public SettingsHost(Context context) {
            super(context);
            setOrientation(VERTICAL);
        }

        @Override
        public boolean dispatchKeyEvent(KeyEvent event) {
            if (event.getAction() == KeyEvent.ACTION_DOWN &&
                    (event.getKeyCode() == KeyEvent.KEYCODE_MENU || event.getKeyCode() == KeyEvent.KEYCODE_BUTTON_Y)) {
                ModSettingsActivity.open(getContext());
                return true;
            }
            return super.dispatchKeyEvent(event);
        }
    }

    // ---------------------------------------------------------------- row model (no UI types)

    /** One line of the screen. Plain data: unit-tested off device. */
    static final class Row {
        static final int HEADER = 0;
        static final int SWITCH = 1;
        static final int CHOICE = 2;
        static final int INFO = 3;
        /** A tap runs an action named by key (see runAction); no stored value. */
        static final int ACTION = 4;

        final int type;
        /** SharedPreferences file name; null = Stremio's default file (packageName + "_preferences"). */
        final String file;
        final String key;
        final String title;
        final String summary;
        final boolean defBool;
        final String[] values;
        final String[] labels;
        final String[] summaries;
        final String defValue;

        Row(int type, String file, String key, String title, String summary, boolean defBool,
            String[] values, String[] labels, String[] summaries, String defValue) {
            this.type = type;
            this.file = file;
            this.key = key;
            this.title = title;
            this.summary = summary;
            this.defBool = defBool;
            this.values = values;
            this.labels = labels;
            this.summaries = summaries;
            this.defValue = defValue;
        }

        static Row header(String title) {
            return new Row(HEADER, null, null, title, null, false, null, null, null, null);
        }

        static Row info(String title, String summary) {
            return new Row(INFO, null, null, title, summary, false, null, null, null, null);
        }

        static Row action(String id, String title, String summary) {
            return new Row(ACTION, null, id, title, summary, false, null, null, null, null);
        }

        static Row sw(String file, String key, String title, String summary, boolean def) {
            return new Row(SWITCH, file, key, title, summary, def, null, null, null, null);
        }

        static Row choice(String file, String key, String title, String[] values, String[] labels,
                          String[] summaries, String def) {
            return new Row(CHOICE, file, key, title, null, false, values, labels, summaries, def);
        }
    }

    /** By name, like SPOILER_KEY: this class stays free of the player tuning classes. */
    private static boolean silentFrameRateSwitch() {
        try {
            return Boolean.TRUE.equals(Class.forName("app.tikkamasalla.stremio.tuning.FrameRateModes")
                    .getMethod("supported").invoke(null));
        } catch (Throwable ignored) {
            return false;
        }
    }

    /** Every setting the patches read today, with the exact file, key and default their code uses. */
    static List<Row> rows() {
        final String intro = IntroSkipPrefs.FILE;
        final String sdh = SdhPrefs.FILE;
        List<Row> rows = new ArrayList<Row>();
        rows.add(Row.header("Intro skip"));
        rows.add(Row.sw(intro, IntroSkipPrefs.KEY_ENABLED, IntroSkipSettings.T_ENABLED,
                IntroSkipSettings.S_ENABLED, true));
        rows.add(Row.sw(intro, IntroSkipPrefs.KEY_ANIME, IntroSkipSettings.T_ANIME,
                IntroSkipSettings.S_ANIME, true));
        rows.add(Row.choice(intro, IntroSkipPrefs.KEY_MODE, IntroSkipSettings.T_MODE,
                new String[]{IntroSkipPrefs.MODE_AUTO, IntroSkipPrefs.MODE_MANUAL},
                new String[]{"Auto", "Manual"},
                new String[]{IntroSkipSettings.S_MODE_AUTO, IntroSkipSettings.S_MODE_MANUAL},
                IntroSkipPrefs.MODE_AUTO));
        rows.add(Row.sw(intro, IntroSkipPrefs.KEY_RECAPS, IntroSkipSettings.T_RECAPS,
                IntroSkipSettings.S_RECAPS, true));
        rows.add(Row.choice(intro, IntroSkipPrefs.KEY_CREDITS, IntroSkipSettings.T_CREDITS,
                new String[]{IntroSkipPrefs.CREDITS_AUTO, IntroSkipPrefs.CREDITS_BUTTON,
                        IntroSkipPrefs.CREDITS_OFF},
                new String[]{"Auto", "Button", "Off"},
                new String[]{IntroSkipSettings.S_CREDITS_AUTO, IntroSkipSettings.S_CREDITS_BUTTON,
                        IntroSkipSettings.S_CREDITS_OFF},
                IntroSkipPrefs.CREDITS_BUTTON));
        rows.add(Row.sw(intro, IntroSkipPrefs.KEY_PREVIEWS, IntroSkipSettings.T_PREVIEWS,
                IntroSkipSettings.S_PREVIEWS, false));
        rows.add(Row.sw(intro, IntroSkipPrefs.KEY_SEEKMARKS, IntroSkipSettings.T_SEEKMARKS,
                IntroSkipSettings.S_SEEKMARKS, true));
        rows.add(Row.info("Debug log", "A patch option (Enable debug mode), fixed when the patch is applied"));
        rows.add(Row.header("Streams"));
        rows.add(Row.sw(intro, IntroSkipPrefs.KEY_AUTOPICK, IntroSkipSettings.T_AUTOPICK,
                IntroSkipSettings.S_AUTOPICK, true));
        rows.add(Row.sw(intro, IntroSkipPrefs.KEY_SHOWLIST, IntroSkipSettings.T_SHOWLIST,
                IntroSkipSettings.S_SHOWLIST, false));
        rows.add(Row.sw(intro, IntroSkipPrefs.KEY_PREPARE_NEXT, IntroSkipSettings.T_PREPARE,
                IntroSkipSettings.S_PREPARE, true));
        rows.add(Row.header("Tracks and subtitles"));
        rows.add(Row.sw(intro, IntroSkipPrefs.KEY_TRACKMEM, IntroSkipSettings.T_TRACKMEM,
                IntroSkipSettings.S_TRACKMEM, true));
        rows.add(Row.sw(sdh, SdhPrefs.KEY_AVOID, "Avoid SDH/CC subtitles",
                "Pick full dialogue subtitles instead of hearing-impaired tracks", true));
        rows.add(Row.sw(sdh, SdhPrefs.KEY_CLEAN, "Clean SDH text when no other subtitles",
                "Strip sound notes and speaker labels from the shown cues", true));
        rows.add(Row.header("Library"));
        rows.add(Row.sw(null, SPOILER_KEY, "Hide unwatched spoilers",
                "Hide thumbnails and synopses for unwatched episodes", false));
        rows.add(Row.header("Playback"));
        boolean silent = silentFrameRateSwitch();
        rows.add(Row.choice(intro, IntroSkipPrefs.KEY_MATCH_FPS, "Match frame rate",
                new String[]{IntroSkipPrefs.MATCH_SEAMLESS, IntroSkipPrefs.MATCH_ALWAYS, IntroSkipPrefs.MATCH_OFF},
                new String[]{"Seamless only", "Always", "Off"},
                new String[]{"Seamless only: never shows the TV's switch screen",
                        silent
                                ? "Always: switches the TV to the video's frame rate during the loading screen"
                                : "Always: switches the TV for every video (screen blinks)",
                        "Off: never changes the display frame rate"},
                silent ? IntroSkipPrefs.MATCH_ALWAYS : IntroSkipPrefs.MATCH_SEAMLESS));
        if (silent) {
            rows.add(Row.sw(intro, FRAME_RATE_NOTICE_KEY, "Show frame-rate notice",
                    "With Always, use Stremio's own switch and its on-screen notice", false));
        }
        rows.add(Row.sw(intro, IntroSkipPrefs.KEY_BIG_BUFFER, "Larger playback buffer",
                "Buffer up to 2 minutes of video ahead and wait longer after a stall, for fewer stutters on streamed files", true));
        rows.add(Row.header("External player"));
        rows.add(Row.sw(intro, IntroSkipPrefs.KEY_BINGE_EXTERNAL, IntroSkipSettings.T_BINGE,
                IntroSkipSettings.S_BINGE, true));
        rows.add(Row.action(ACTION_FORGET_PLAYER, IntroSkipSettings.T_FORGET, IntroSkipSettings.S_FORGET));
        rows.add(Row.header("Diagnostics"));
        rows.add(Row.sw(intro, IntroSkipPrefs.KEY_DIARY, IntroSkipSettings.T_DIARY, IntroSkipSettings.S_DIARY, true));
        rows.add(Row.info("Progress sync", "Watch position from the external player is sent back to Stremio; always on"));
        return rows;
    }

    /** Runs an ACTION row; returns the message to toast. */
    static String runAction(Context context, Row row) {
        if (ACTION_FORGET_PLAYER.equals(row.key)) {
            return IntroSkipPrefs.forgetExternalPlayer(context)
                    ? IntroSkipSettings.M_FORGET_DONE : IntroSkipSettings.M_FORGET_NONE;
        }
        return "";
    }

    /** The SharedPreferences a row lives in: the very file the feature code opens. */
    static SharedPreferences prefsFor(Context context, Row row) {
        String name = row.file != null ? row.file : context.getPackageName() + "_preferences";
        return context.getSharedPreferences(name, Context.MODE_PRIVATE);
    }

    static boolean getBool(Context context, Row row) {
        try {
            return prefsFor(context, row).getBoolean(row.key, row.defBool);
        } catch (Throwable ignored) {
            return row.defBool;
        }
    }

    static void setBool(Context context, Row row, boolean value) {
        try {
            prefsFor(context, row).edit().putBoolean(row.key, value).apply();
        } catch (Throwable ignored) {
            // The row keeps showing the stored value.
        }
    }

    /** Index into row.values of the stored choice; an unknown stored value reads as the default, like the feature code. */
    static int choiceIndex(Context context, Row row) {
        String stored = row.defValue;
        try {
            stored = prefsFor(context, row).getString(row.key, row.defValue);
        } catch (Throwable ignored) {
            // Default.
        }
        for (int i = 0; i < row.values.length; i++) {
            if (row.values[i].equals(stored)) return i;
        }
        for (int i = 0; i < row.values.length; i++) {
            if (row.values[i].equals(row.defValue)) return i;
        }
        return 0;
    }

    /** Stores the next value (wrapping) and returns its index. */
    static int cycleChoice(Context context, Row row) {
        int next = (choiceIndex(context, row) + 1) % row.values.length;
        try {
            prefsFor(context, row).edit().putString(row.key, row.values[next]).apply();
        } catch (Throwable ignored) {
            return choiceIndex(context, row);
        }
        return next;
    }
}
