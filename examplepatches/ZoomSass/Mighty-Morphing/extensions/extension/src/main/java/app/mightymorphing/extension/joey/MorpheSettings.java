package app.mightymorphing.extension.joey;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.PorterDuff;
import android.os.Build;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.window.OnBackInvokedCallback;
import android.window.OnBackInvokedDispatcher;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.lang.reflect.Proxy;

/**
 * Adds the Morphe Settings row at the top of Joey's Content section.
 */
public final class MorpheSettings {
    private static final String PREFS = "mighty_morphing";
    private static final String ROW = "morphe_settings";
    private static final String KEY_RESIZE = "comment_resize";
    private static final String KEY_INVISIBLE = "comment_resize_invisible";
    private static final String KEY_SIZE = "comment_size";
    private static final String KEY_INLINE = "comment_inline";
    private static final String KEY_PROFILE = "comment_profile_inline";
    private static final String KEY_AUTOPLAY = "comment_autoplay";
    private static final String KEY_YOUTUBE_INLINE = "comment_youtube_inline";
    private static final String KEY_LIMIT = "comment_media_limit_mb";
    private static final String KEY_TOOLTIPS = "tooltips_disabled";
    private static final int ACCENT = 0xFFF0A202;

    static final int SIZE_SMALL = 160;
    private static final int SIZE_MEDIUM = 240;
    private static final int SIZE_LARGE = 320;

    private static boolean mediaControls;
    private static boolean backupControls;
    private static boolean showHideControls;

    private MorpheSettings() {
    }

    public static void enableMedia() {
        mediaControls = true;
    }

    public static void enableBackup() {
        backupControls = true;
    }

    public static void enableShowHide() {
        showHideControls = true;
    }

    public static boolean pictureControls() {
        return mediaControls;
    }

    public static boolean backupControls() {
        return backupControls;
    }

    public static boolean showHideControls() {
        return showHideControls;
    }

    public static void attach(Activity activity) {
        if (!mediaControls && !backupControls && !showHideControls) return;
        try {
            int id = activity.getResources().getIdentifier(
                    "setting_item_comments_clickable", "id", activity.getPackageName());
            if (id == 0) return;
            View comments = activity.findViewById(id);
            if (!(comments instanceof ViewGroup) || !(comments.getParent() instanceof ViewGroup)) return;
            ViewGroup rowSample = (ViewGroup) comments;
            ViewGroup parent = (ViewGroup) comments.getParent();
            if (parent.findViewWithTag(ROW) != null) return;

            View iconSample = rowSample.getChildCount() > 0 ? rowSample.getChildAt(0) : null;
            TextView textSample = firstText(rowSample);

            LinearLayout row = new LinearLayout(activity);
            row.setTag(ROW);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);
            row.setLayoutParams(copyParams(comments.getLayoutParams()));
            row.setPadding(comments.getPaddingLeft(), comments.getPaddingTop(),
                    comments.getPaddingRight(), comments.getPaddingBottom());
            row.setMinimumHeight(comments.getMinimumHeight());
            row.setBackground(comments.getBackground());
            row.setClickable(true);
            row.setFocusable(true);

            ImageView icon = new ImageView(activity);
            icon.setLayoutParams(copyParams(iconSample == null ? null : iconSample.getLayoutParams()));
            int drawable = activity.getResources().getIdentifier(
                    "alien", "drawable", activity.getPackageName());
            if (drawable != 0) icon.setImageResource(drawable);
            icon.setColorFilter(ACCENT, PorterDuff.Mode.SRC_IN);
            row.addView(icon);

            TextView label = new TextView(activity);
            label.setText("Morphe Settings");
            label.setLayoutParams(copyParams(textSample == null ? null : textSample.getLayoutParams()));
            if (textSample != null) {
                label.setTextSize(TypedValue.COMPLEX_UNIT_PX, textSample.getTextSize());
                label.setTextColor(textSample.getCurrentTextColor());
                label.setTypeface(textSample.getTypeface());
                label.setGravity(textSample.getGravity());
            }
            row.addView(label);
            row.setOnClickListener(v -> open(activity));
            parent.addView(row, 1);
        } catch (Throwable ignored) {
        }
    }

    public static boolean resizeEnabled(Context context) {
        return prefs(context).getBoolean(KEY_RESIZE, false);
    }

    public static boolean invisibleHand(Context context) {
        return prefs(context).getBoolean(KEY_INVISIBLE, false);
    }

    public static int sizeDp(Context context) {
        switch (prefs(context).getInt(KEY_SIZE, 0)) {
            case 1:
                return SIZE_MEDIUM;
            case 2:
                return SIZE_LARGE;
            default:
                return SIZE_SMALL;
        }
    }

    public static int sizeIndex(Context context) {
        return prefs(context).getInt(KEY_SIZE, 0);
    }

    public static boolean inlineComments(Context context) {
        return prefs(context).getBoolean(KEY_INLINE, true);
    }

    /** Profile comments follow this only while inline previews are on. */
    public static boolean profileComments(Context context) {
        return inlineComments(context) && prefs(context).getBoolean(KEY_PROFILE, true);
    }

    public static boolean profileCommentsEnabled(Context context) {
        return prefs(context).getBoolean(KEY_PROFILE, true);
    }

    public static boolean inlineComments() {
        try {
            Object app = Class.forName("o.o.joey.MyApplication").getMethod("p").invoke(null);
            if (app instanceof Context) return inlineComments((Context) app);
        } catch (Throwable ignored) {
        }
        return true;
    }

    public static boolean autoplay(Context context) {
        return prefs(context).getBoolean(KEY_AUTOPLAY, true);
    }

    /** Our YouTube picture preview. Off leaves the link to Joey's link preview. */
    public static boolean youtubeInline(Context context) {
        return prefs(context).getBoolean(KEY_YOUTUBE_INLINE, false);
    }

    public static boolean youtubeInline() {
        try {
            Object app = Class.forName("o.o.joey.MyApplication").getMethod("p").invoke(null);
            if (app instanceof Context) return youtubeInline((Context) app);
        } catch (Throwable ignored) {
        }
        return false;
    }

    /** Megabytes, or -1 for no limit. Default is 50. */
    public static int mediaLimitMb(Context context) {
        return prefs(context).getInt(KEY_LIMIT, 50);
    }

    /** Byte cap, or -1 when the limit is unlimited. */
    public static long mediaLimitBytes(Context context) {
        int mb = mediaLimitMb(context);
        if (mb < 0) return -1L;
        if (mb == 0) mb = 50;
        return mb * 1024L * 1024L;
    }

    static String limitLabel(int mb) {
        if (mb < 0) return "Unlimited";
        for (int preset : new int[]{5, 10, 25, 50, 100}) {
            if (preset == mb) return mb + " MB";
        }
        return "Custom, " + mb + " MB";
    }

    public static boolean tooltipsDisabled(Context context) {
        return prefs(context).getBoolean(KEY_TOOLTIPS, false);
    }

    public static boolean tooltipsDisabled() {
        try {
            Object app = Class.forName("o.o.joey.MyApplication").getMethod("p").invoke(null);
            if (app instanceof Context) return tooltipsDisabled((Context) app);
        } catch (Throwable ignored) {
        }
        return false;
    }

    static void saveResize(Context context, boolean enabled) {
        prefs(context).edit().putBoolean(KEY_RESIZE, enabled).commit();
    }

    static void saveInvisibleHand(Context context, boolean enabled) {
        prefs(context).edit().putBoolean(KEY_INVISIBLE, enabled).commit();
    }

    static void saveSize(Context context, int index) {
        prefs(context).edit().putInt(KEY_SIZE, index).commit();
    }

    static void saveInline(Context context, boolean enabled) {
        prefs(context).edit().putBoolean(KEY_INLINE, enabled).commit();
    }

    static void saveProfile(Context context, boolean enabled) {
        prefs(context).edit().putBoolean(KEY_PROFILE, enabled).commit();
    }

    static void saveAutoplay(Context context, boolean enabled) {
        prefs(context).edit().putBoolean(KEY_AUTOPLAY, enabled).commit();
    }

    static void saveYoutubeInline(Context context, boolean enabled) {
        prefs(context).edit().putBoolean(KEY_YOUTUBE_INLINE, enabled).commit();
    }

    static void saveLimit(Context context, int megabytes) {
        prefs(context).edit().putInt(KEY_LIMIT, megabytes).commit();
    }

    public static void saveTooltipsDisabled(Context context, boolean disabled) {
        prefs(context).edit().putBoolean(KEY_TOOLTIPS, disabled).commit();
    }

    static String sizeLabel(int index) {
        switch (index) {
            case 1:
                return "Medium";
            case 2:
                return "Large";
            default:
                return "Small";
        }
    }

    private static void open(Activity activity) {
        ViewGroup content = activity.findViewById(android.R.id.content);
        if (content == null || content.getChildCount() == 0) return;
        View existing = content.getChildAt(0);
        content.removeView(existing);
        PageCloser restore = new PageCloser(activity, content, existing);
        View page = MorpheSettingsActivity.create(activity, restore);
        content.addView(page, new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        restore.install();
        if (Build.VERSION.SDK_INT >= 33) {
            OnBackInvokedCallback callback = restore::run;
            restore.callback = callback;
            activity.getOnBackInvokedDispatcher().registerOnBackInvokedCallback(
                    OnBackInvokedDispatcher.PRIORITY_OVERLAY, callback);
        }
    }

    private static final class PageCloser implements Runnable {
        private final Activity activity;
        private final ViewGroup content;
        private final View existing;
        private boolean done;
        private Window.Callback previous;
        OnBackInvokedCallback callback;

        PageCloser(Activity activity, ViewGroup content, View existing) {
            this.activity = activity;
            this.content = content;
            this.existing = existing;
        }

        void install() {
            previous = activity.getWindow().getCallback();
            Window.Callback wrapped = (Window.Callback) Proxy.newProxyInstance(
                    Window.Callback.class.getClassLoader(),
                    new Class<?>[] {Window.Callback.class},
                    (proxy, method, args) -> {
                        if ("dispatchKeyEvent".equals(method.getName())
                                && args != null && args.length == 1 && args[0] instanceof KeyEvent) {
                            KeyEvent event = (KeyEvent) args[0];
                            if (event.getKeyCode() == KeyEvent.KEYCODE_BACK) {
                                if (event.getAction() == KeyEvent.ACTION_UP) run();
                                return true;
                            }
                        }
                        return method.invoke(previous, args);
                    });
            activity.getWindow().setCallback(wrapped);
        }

        @Override
        public void run() {
            if (done) return;
            done = true;
            if (previous != null) activity.getWindow().setCallback(previous);
            if (callback != null && Build.VERSION.SDK_INT >= 33) {
                activity.getOnBackInvokedDispatcher().unregisterOnBackInvokedCallback(callback);
            }
            content.removeAllViews();
            content.addView(existing);
        }
    }

    private static ViewGroup.LayoutParams copyParams(ViewGroup.LayoutParams source) {
        if (source instanceof ViewGroup.MarginLayoutParams) {
            return new LinearLayout.LayoutParams((ViewGroup.MarginLayoutParams) source);
        }
        if (source != null) {
            return new LinearLayout.LayoutParams(source);
        }
        return new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
    }

    private static TextView firstText(View view) {
        if (view instanceof TextView) return (TextView) view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                TextView found = firstText(group.getChildAt(i));
                if (found != null) return found;
            }
        }
        return null;
    }

    private static SharedPreferences prefs(Context context) {
        return context.getApplicationContext().getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }
}
