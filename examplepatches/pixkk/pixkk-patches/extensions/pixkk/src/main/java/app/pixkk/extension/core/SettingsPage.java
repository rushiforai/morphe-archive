package app.pixkk.extension.core;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.Typeface;
import android.content.res.ColorStateList;
import android.os.Build;
import android.text.InputType;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;

import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

/**
 * The bundle's settings as a page of their own, shown by a TikTok activity the patch lends it
 * (the one Hushfeed lends too, told apart by the intent's action).
 */
public final class SettingsPage {
    private static final String ACTION = "pixkk_settings";

    private static int BACKGROUND;
    private static int SURFACE;
    private static int BORDER;
    private static int DIVIDER;
    private static int TEXT;
    private static int TEXT_MUTED;
    private static int ACCENT;

    private SettingsPage() {
    }

    /** The page follows the theme the activity runs in, which can differ from the system's. */
    private static void applyTheme(Activity activity) {
        boolean dark = (activity.getResources().getConfiguration().uiMode
                & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
        if (dark) {
            BACKGROUND = Color.rgb(24, 26, 29);
            SURFACE = Color.rgb(24, 26, 29);
            BORDER = Color.rgb(60, 64, 70);
            DIVIDER = Color.rgb(47, 51, 56);
            TEXT = Color.rgb(236, 239, 241);
            TEXT_MUTED = Color.rgb(144, 153, 162);
            ACCENT = Color.rgb(77, 208, 225);
        } else {
            BACKGROUND = Color.WHITE;
            SURFACE = Color.WHITE;
            BORDER = Color.rgb(207, 216, 220);
            DIVIDER = Color.rgb(228, 233, 236);
            TEXT = Color.rgb(33, 37, 41);
            TEXT_MUTED = Color.rgb(96, 108, 118);
            ACCENT = Color.rgb(0, 131, 143);
        }
    }

    /** Starts the activity that shows the page. */
    public static void open(Context context) {
        if (context == null) return;
        try {
            Intent intent = new Intent();
            intent.setClassName(context.getPackageName(),
                    "com.bytedance.ies.ugc.aweme.commercialize.compliance.personalization.AdPersonalizationActivity");
            intent.setAction(ACTION);
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(intent);
        } catch (Throwable ex) {
            Logger.printException(() -> "Could not open the settings page", ex);
        }
    }

    /**
     * Called from the lent activity's onCreate right after super.onCreate.
     *
     * @return whether the page took the activity, so the rest of its onCreate is skipped
     */
    public static boolean initialize(Activity activity) {
        try {
            Intent intent = activity.getIntent();
            if (intent == null || !ACTION.equals(intent.getAction())) return false;
            activity.setContentView(build(activity));
            registerBack(activity);
            return true;
        } catch (Throwable ex) {
            Logger.printException(() -> "Could not build the settings page", ex);
            return false;
        }
    }

    /** Called from the lent activity's onBackPressed; true when the page answered. */
    public static boolean handleBackPressed(Activity activity) {
        Intent intent = activity.getIntent();
        if (intent == null || !ACTION.equals(intent.getAction())) return false;
        activity.finish();
        return true;
    }

    private static View build(Activity activity) {
        applyTheme(activity);
        FrameLayout root = new FrameLayout(activity);
        root.setBackgroundColor(BACKGROUND);
        root.setFitsSystemWindows(true);

        LinearLayout column = new LinearLayout(activity);
        column.setOrientation(LinearLayout.VERTICAL);

        // A plain app bar: arrow, title, a line under it.
        LinearLayout top = new LinearLayout(activity);
        top.setGravity(Gravity.CENTER_VERTICAL);
        TextView back = new TextView(activity);
        back.setText("‹");
        back.setTextColor(TEXT);
        back.setTextSize(34);
        back.setGravity(Gravity.CENTER);
        back.setOnClickListener(v -> activity.finish());
        top.addView(back, new LinearLayout.LayoutParams(Dim.dp(56), Dim.dp(56)));
        top.addView(label(activity, "Pixkk Patches", 20, TEXT, true));
        column.addView(top, new LinearLayout.LayoutParams(-1, Dim.dp(56)));
        View line = new View(activity);
        line.setBackgroundColor(DIVIDER);
        column.addView(line, new LinearLayout.LayoutParams(-1, Dim.dp(1)));

        LinearLayout page = new LinearLayout(activity);
        page.setOrientation(LinearLayout.VERTICAL);
        page.setPadding(Dim.dp(20), 0, Dim.dp(20), Dim.dp(32));

        LinearLayout feed = group(page, "FEED");
        toggle(feed, "Expand description in place", Settings.EXPAND_DESCRIPTION_IN_PLACE);
        toggle(feed, "Sound name under description", Settings.SOUND_UNDER_DESCRIPTION);
        toggle(feed, "Scroll sound name", Settings.SOUND_NAME_SCROLL);
        number(feed, "Sound scroll speed", Settings.SOUND_NAME_SCROLL_SPEED);
        toggle(feed, "Old-style seeking", Settings.SEEK_FOLLOWS_FINGER);
        toggle(feed, "Old-style counts (12.3K)", Settings.OLD_STYLE_COUNTS);
        toggle(feed, "Animated profile covers", Settings.ANIMATED_PROFILE_COVERS);

        LinearLayout rail = group(page, "RIGHT COLUMN");
        number(rail, "Gap between buttons, dp", Settings.RAIL_SPACING_DP);
        number(rail, "Gap under avatar, dp", Settings.RAIL_AVATAR_GAP_DP);
        number(rail, "Gap above disc, dp", Settings.RAIL_DISC_GAP_DP);
        toggle(rail, "Don't open comments when swiping over icons", Settings.RAIL_SWIPE_PASSTHROUGH);

        LinearLayout comments = group(page, "COMMENTS");
        toggle(comments, "Centered comment menu", Settings.COMMENT_MENU_CENTERED);
        action(comments, "Comment menu rows", "Choose which rows the menu shows",
                () -> CommentMenuRowsPreference.show(activity));

        LinearLayout navigation = group(page, "NAVIGATION");
        toggle(navigation, "Discover tab instead of Friends", Settings.DISCOVER_TAB);

        TextView note = label(activity, "Changes apply after the app is restarted.", 13, TEXT_MUTED, false);
        note.setPadding(0, Dim.dp(24), 0, 0);
        page.addView(note);

        ScrollView scroll = new ScrollView(activity);
        scroll.setFillViewport(true);
        scroll.addView(page, new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        column.addView(scroll, new LinearLayout.LayoutParams(-1, 0, 1));
        root.addView(column, new FrameLayout.LayoutParams(-1, -1));
        return root;
    }

    private static LinearLayout group(LinearLayout page, String heading) {
        Context context = page.getContext();
        String name = heading.charAt(0) + heading.substring(1).toLowerCase();
        TextView header = label(context, name, 14, ACCENT, true);
        header.setPadding(0, Dim.dp(24), 0, Dim.dp(4));
        page.addView(header);

        LinearLayout card = new LinearLayout(context);
        card.setOrientation(LinearLayout.VERTICAL);
        page.addView(card, new LinearLayout.LayoutParams(-1, -2));
        return card;
    }

    /** A row in a card; every row after the first gets a divider above it. */
    private static LinearLayout row(LinearLayout card) {
        Context context = card.getContext();
        if (card.getChildCount() > 0) {
            View divider = new View(context);
            divider.setBackgroundColor(DIVIDER);
            card.addView(divider, new LinearLayout.LayoutParams(-1, Dim.dp(1)));
        }
        LinearLayout row = new LinearLayout(context);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(0, Dim.dp(14), 0, Dim.dp(14));
        card.addView(row, new LinearLayout.LayoutParams(-1, -2));
        return row;
    }

    private static void toggle(LinearLayout card, String title, Settings.BooleanSetting setting) {
        LinearLayout row = row(card);
        row.addView(label(card.getContext(), title, 16, TEXT, true), new LinearLayout.LayoutParams(0, -2, 1));
        Switch control = new Switch(card.getContext());
        control.setChecked(setting.get());
        ColorStateList states = new ColorStateList(
                new int[][]{{android.R.attr.state_checked}, {}}, new int[]{ACCENT, BORDER});
        control.setThumbTintList(states);
        control.setTrackTintList(ColorStateList.valueOf(DIVIDER));
        control.setOnCheckedChangeListener((button, checked) -> setting.save(checked));
        row.addView(control);
        row.setOnClickListener(v -> control.toggle());
    }

    private static void number(LinearLayout card, String title, Settings.IntegerSetting setting) {
        LinearLayout row = row(card);
        LinearLayout text = new LinearLayout(card.getContext());
        text.setOrientation(LinearLayout.VERTICAL);
        text.addView(label(card.getContext(), title, 16, TEXT, true));
        text.addView(label(card.getContext(), setting.min + " to " + setting.max, 13, TEXT_MUTED, false));
        row.addView(text, new LinearLayout.LayoutParams(0, -2, 1));

        EditText input = new EditText(card.getContext());
        input.setInputType(InputType.TYPE_CLASS_NUMBER | InputType.TYPE_NUMBER_FLAG_SIGNED);
        input.setText(String.valueOf(setting.get()));
        input.setTextColor(TEXT);
        input.setGravity(Gravity.END);
        input.setMinWidth(Dim.dp(64));
        input.setOnFocusChangeListener((view, focused) -> {
            if (focused) return;
            try {
                setting.save(Integer.parseInt(input.getText().toString().trim()));
            } catch (NumberFormatException ignored) {
            }
            input.setText(String.valueOf(setting.get()));
        });
        row.addView(input);
    }

    private static void action(LinearLayout card, String title, String summary, Runnable run) {
        LinearLayout row = row(card);
        LinearLayout text = new LinearLayout(card.getContext());
        text.setOrientation(LinearLayout.VERTICAL);
        text.addView(label(card.getContext(), title, 16, TEXT, true));
        text.addView(label(card.getContext(), summary, 13, TEXT_MUTED, false));
        row.addView(text, new LinearLayout.LayoutParams(0, -2, 1));
        row.addView(label(card.getContext(), ">", 18, TEXT_MUTED, false));
        row.setOnClickListener(v -> run.run());
    }

    private static TextView label(Context context, String text, int sp, int color, boolean bold) {
        TextView view = new TextView(context);
        view.setText(text);
        view.setTextSize(sp);
        view.setTextColor(color);
        if (bold) view.setTypeface(Typeface.DEFAULT_BOLD);
        return view;
    }

    /**
     * Back through the dispatcher, for the day TikTok's manifest stops routing it to onBackPressed.
     * Reflective, because the extension builds against an older API; ignored below Android 13.
     */
    private static void registerBack(Activity activity) {
        if (Build.VERSION.SDK_INT < 33) return;
        try {
            Class<?> callbackClass = Class.forName("android.window.OnBackInvokedCallback");
            Class<?> dispatcherClass = Class.forName("android.window.OnBackInvokedDispatcher");
            Object dispatcher = Activity.class.getMethod("getOnBackInvokedDispatcher").invoke(activity);
            Object callback = Proxy.newProxyInstance(callbackClass.getClassLoader(),
                    new Class<?>[]{callbackClass}, (proxy, method, args) -> {
                        switch (method.getName()) {
                            case "onBackInvoked":
                                activity.finish();
                                return null;
                            case "hashCode":
                                return System.identityHashCode(proxy);
                            case "equals":
                                return proxy == args[0];
                            case "toString":
                                return "PixkkSettingsBack";
                            default:
                                return null;
                        }
                    });
            Method register = dispatcherClass.getMethod("registerOnBackInvokedCallback", int.class, callbackClass);
            register.invoke(dispatcher, 1_000_000, callback);
        } catch (Throwable ignored) {
        }
    }
}
