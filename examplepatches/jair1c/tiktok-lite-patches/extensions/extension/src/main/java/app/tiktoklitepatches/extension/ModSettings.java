package app.tiktoklitepatches.extension;

import static app.tiktoklitepatches.extension.ModStrings.Text.*;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.drawable.GradientDrawable;
import android.widget.TextView;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.content.pm.ShortcutManager;
import android.os.Build;
import android.view.View;
import android.content.ContextWrapper;

import java.util.Collections;
import java.util.WeakHashMap;


public final class ModSettings {
    static final String PROFILE_GESTURE = "launcher_shortcut";
    private static final String OLD_SHORTCUT_ID = "lite_mod_settings";
    static final String ADS = "hide_ads";
    static final String LIVE = "hide_live";
    static final String PHOTO_POSTS = "hide_photo_posts";
    static final String DOWNLOAD = "clean_downloads";
    static final String EXACT_COUNTS = "exact_counts";
    static final int DEFAULT_ACCENT = 0xFFFE2C55;
    private static final String ACCENT_COLOR = "accent_color";
    private static final WeakHashMap<TextView, ColorStateList[]> originalUnreadColors = new WeakHashMap<>();
    private static final WeakHashMap<View, Boolean> followBackgrounds = new WeakHashMap<>();
    private static final WeakHashMap<View, ColorStateList[]> messagePopups = new WeakHashMap<>();
    private static final WeakHashMap<TextView, Boolean> unreadCounts = new WeakHashMap<>();
    private static final WeakHashMap<View, String> inboxRows = new WeakHashMap<>();
    private static volatile SharedPreferences preferences;
    private static volatile boolean liveFilterAvailable;


    private ModSettings() {}

    public static void initialize(Context context) {
        initializePreferences(context);
        removeOldShortcut(context);
    }

    public static void initializePreferences(Context context) {
        if (context != null && preferences == null) {
            try {
                String version = context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionName;
                liveFilterAvailable = "47.8.15".equals(version);
            } catch (PackageManager.NameNotFoundException ignored) {
                liveFilterAvailable = false;
            }
            preferences = context.getSharedPreferences("tiktok_lite_patches", Context.MODE_PRIVATE);
        }
    }

    public static void onWindowFocus(Activity activity, boolean focused) {
        if (!focused) return;
        initialize(activity);
    }

    public static void bindProfileGesture(View tab, String key) {
        if (!"USER".equals(key) || tab.isLongClickable()) return;
        initialize(tab.getContext());
        tab.setOnLongClickListener(view -> {
            if (!profileGestureEnabled()) return false;
            Context context = view.getContext();
            while (context instanceof ContextWrapper) {
                if (context instanceof Activity) {
                    Activity activity = (Activity) context;
                    if (activity.isFinishing() || activity.isDestroyed()) return false;
                    ModSettingsActivity.open(activity, ModSettingsActivity.usesLightAppTheme(activity));
                    return true;
                }
                Context base = ((ContextWrapper) context).getBaseContext();
                if (base == context) break;
                context = base;
            }
            return false;
        });
    }

    private static void removeOldShortcut(Context context) {
        if (Build.VERSION.SDK_INT < 25) return;
        ShortcutManager manager = context.getSystemService(ShortcutManager.class);
        if (manager != null && manager.getDynamicShortcuts().stream()
                .anyMatch(shortcut -> OLD_SHORTCUT_ID.equals(shortcut.getId()))) {
            manager.removeDynamicShortcuts(Collections.singletonList(OLD_SHORTCUT_ID));
        }
    }

    static boolean feedFilterAvailable() {
        return false;
    }

    static boolean profileGestureAvailable() {
        return false;
    }

    static boolean cleanDownloadsAvailable() {
        return false;
    }

    static final String HIDE_PROFILE_SUGGESTIONS = "hide_profile_suggestions";

    static boolean profileSuggestionsAvailable() {
        return false;
    }

    public static boolean hideProfileSuggestions() {
        SharedPreferences current = preferences;
        return current != null && current.getBoolean(HIDE_PROFILE_SUGGESTIONS, false);
    }

    static final String HIDE_INBOX_STORY_TRAY = "hide_inbox_story_tray";

    static boolean inboxStoryTrayAvailable() {
        return false;
    }

    static boolean hideInboxStoryTray() {
        SharedPreferences current = preferences;
        return current != null && current.getBoolean(HIDE_INBOX_STORY_TRAY, false);
    }

    public static boolean hideInboxRow(View row, String key) {
        String setting;
        if ("story__skylight".equals(key) && inboxStoryTrayAvailable()) {
            setting = HIDE_INBOX_STORY_TRAY;
        } else if (profileSuggestionsAvailable() && isInboxSuggestion(key)) {
            setting = HIDE_PROFILE_SUGGESTIONS;
        } else {
            inboxRows.remove(row);
            return false;
        }
        android.view.ViewParent parent = row.getParent();
        while (parent instanceof View) {
            if (((View) parent).getId() == 0x790a059c) {
                inboxRows.put(row, setting);
                return setting.equals(HIDE_INBOX_STORY_TRAY) ? hideInboxStoryTray() : hideProfileSuggestions();
            }
            parent = parent.getParent();
        }
        return false;
    }

    private static boolean isInboxSuggestion(String key) {
        // Inbox recommendations use bare user IDs. Conversations use conversation_* keys.
        return "rec_header".equals(key) || "contact".equals(key) || "facebook".equals(key)
                || (key != null && !key.isEmpty() && android.text.TextUtils.isDigitsOnly(key));
    }

    static void refreshInboxRows(String setting) {
        for (View row : new java.util.ArrayList<>(inboxRows.keySet())) {
            if (setting.equals(inboxRows.get(row)) && row.isAttachedToWindow()) row.requestLayout();
        }
    }

    static final String PAUSE_FIRST_VIDEO = "pause_first_video";
    private static final java.util.concurrent.atomic.AtomicBoolean startupVideoSeen =
            new java.util.concurrent.atomic.AtomicBoolean();

    static boolean startupPauseAvailable() {
        return false;
    }

    static boolean startupPauseEnabled() {
        SharedPreferences current = preferences;
        return current != null && current.getBoolean(PAUSE_FIRST_VIDEO, false);
    }

    public static boolean takeStartupPause(View player) {
        if (startupVideoSeen.get() || player == null || !player.isShown()) return false;
        Context context = player.getContext();
        while (context instanceof ContextWrapper && !(context instanceof Activity)) {
            Context base = ((ContextWrapper) context).getBaseContext();
            if (base == context) return false;
            context = base;
        }
        if (!(context instanceof Activity)) return false;
        android.content.Intent intent = ((Activity) context).getIntent();
        if (intent == null || !android.content.Intent.ACTION_MAIN.equals(intent.getAction())) return false;
        initializePreferences(context);
        return startupVideoSeen.compareAndSet(false, true) && startupPauseEnabled();
    }

    static final String STOP_VIDEO_LOOPING = "stop_video_looping";

    static boolean stopVideoLoopingAvailable() {
        return false;
    }

    static boolean stopVideoLoopingEnabled() {
        SharedPreferences current = preferences;
        return current != null && current.getBoolean(STOP_VIDEO_LOOPING, false);
    }

    public static boolean videoLooping(boolean requested) {
        return requested && !stopVideoLoopingEnabled();
    }

    static final String SHOW_SEEKBAR = "show_video_seekbar";

    static boolean seekbarAvailable() {
        return false;
    }

    public static boolean seekbarEnabled() {
        SharedPreferences current = preferences;
        return current != null && current.getBoolean(SHOW_SEEKBAR, false);
    }

    public static boolean seekbarDraftEnabled(boolean requested) {
        return requested || seekbarEnabled();
    }

    static boolean exactCountsAvailable() {
        return false;
    }

    public static boolean exactCountsEnabled() {
        SharedPreferences current = preferences;
        return current != null && current.getBoolean(EXACT_COUNTS, false);
    }

    static int accentColor() {
        SharedPreferences current = preferences;
        return current == null ? DEFAULT_ACCENT : current.getInt(ACCENT_COLOR, DEFAULT_ACCENT);
    }

    public static int nativeAccent(int color) {
        int rgb = color & 0xFFFFFF;
        if (rgb != 0xFE2C55 && rgb != 0xFF3B5C) return color;
        int selected = accentColor();
        if (selected == DEFAULT_ACCENT) return color;
        return (color & 0xFF000000) | (selected & 0xFFFFFF);
    }

    public static void tintMessagePopup(View content) {
        if (!(content instanceof android.widget.FrameLayout)) return;
        android.widget.FrameLayout frame = (android.widget.FrameLayout) content;
        initializePreferences(frame.getContext());
        View panel = frame.getChildAt(0);
        View arrowView = frame.findViewById(0x790a07ba);
        android.widget.ImageView arrow = arrowView instanceof android.widget.ImageView
                ? (android.widget.ImageView) arrowView : null;
        ColorStateList[] original = messagePopups.get(frame);
        if (original == null) {
            original = new ColorStateList[]{
                    panel == null ? null : panel.getBackgroundTintList(),
                    arrow == null ? null : arrow.getImageTintList()
            };
            messagePopups.put(frame, original);
        }
        int accent = accentColor();
        ColorStateList tint = ColorStateList.valueOf(accent);
        if (panel != null) panel.setBackgroundTintList(accent == DEFAULT_ACCENT ? original[0] : tint);
        if (arrow != null) arrow.setImageTintList(accent == DEFAULT_ACCENT ? original[1] : tint);
    }

    public static void tintFollowBackground(View background) {
        if (background == null) return;
        initializePreferences(background.getContext());
        followBackgrounds.put(background, Boolean.TRUE);
        int accent = accentColor();
        if (background.getBackground() instanceof GradientDrawable) {
            ((GradientDrawable) background.getBackground().mutate()).setColor(accent);
        }
    }

    public static void tintUnreadCount(TextView count) {
        initializePreferences(count.getContext());
        unreadCounts.put(count, Boolean.TRUE);
        int accent = accentColor();
        if (accent == DEFAULT_ACCENT) {
            ColorStateList[] original = originalUnreadColors.remove(count);
            if (original != null) {
                count.setBackgroundTintList(original[0]);
                count.setTextColor(original[1]);
            }
            return;
        }

        if (!originalUnreadColors.containsKey(count)) {
            originalUnreadColors.put(count, new ColorStateList[]{count.getBackgroundTintList(), count.getTextColors()});
        }
        count.setBackgroundTintList(ColorStateList.valueOf(accent));
        count.setTextColor(ModSettingsActivity.contrast(accent, Color.WHITE) >= 4.5 ? Color.WHITE : Color.BLACK);
    }

    public static void drawBadgeCircle(Canvas canvas, float x, float y, float radius, Paint paint) {
        int original = paint.getColor();
        int accent = badgeAccent(original);
        if (accent == original) {
            canvas.drawCircle(x, y, radius, paint);
            return;
        }
        paint.setColor(accent);
        try {
            canvas.drawCircle(x, y, radius, paint);
        } finally {
            paint.setColor(original);
        }
    }

    public static int badgeAccent(int color) {
        // The Tux badge uses a deeper pink in one of its theme variants.
        if ((color & 0xFFFFFF) != 0xB50030) return nativeAccent(color);
        int selected = accentColor();
        if (selected == DEFAULT_ACCENT) return color;
        return (color & 0xFF000000) | (selected & 0xFFFFFF);
    }

    public static Integer nativeAccent(Integer color) {
        if (color == null) return null;
        int adjusted = nativeAccent(color.intValue());
        return adjusted == color.intValue() ? color : Integer.valueOf(adjusted);
    }

    static void setAccentColor(int color) {
        if (color == accentColor()) return;
        preferences.edit().putInt(ACCENT_COLOR, color).apply();
        for (View view : new java.util.ArrayList<>(followBackgrounds.keySet())) tintFollowBackground(view);
        for (View view : new java.util.ArrayList<>(messagePopups.keySet())) tintMessagePopup(view);
        for (TextView view : new java.util.ArrayList<>(unreadCounts.keySet())) tintUnreadCount(view);
    }

    static boolean profileGestureEnabled() {
        SharedPreferences current = preferences;
        return current == null || current.getBoolean(PROFILE_GESTURE, true);
    }

    public static boolean hideAds() {
        SharedPreferences current = preferences;
        return feedFilterAvailable() && (current == null || current.getBoolean(ADS, true));
    }

    static boolean liveFilterAvailable() {
        return feedFilterAvailable() && liveFilterAvailable;
    }

    static boolean hideLive() {
        SharedPreferences current = preferences;
        return current != null && liveFilterAvailable() && current.getBoolean(LIVE, false);
    }

    static boolean hidePhotoPosts() {
        SharedPreferences current = preferences;
        return feedFilterAvailable() && current != null && current.getBoolean(PHOTO_POSTS, false);
    }

    public static boolean cleanDownloads() {
        SharedPreferences current = preferences;
        return current == null || current.getBoolean(DOWNLOAD, true);
    }

    public static AlertDialog show(Activity activity) {
        SharedPreferences current = activity.getSharedPreferences("tiktok_lite_patches", Context.MODE_PRIVATE);
        ModStrings strings = ModStrings.forContext(activity);
        String[] keys = {ADS, DOWNLOAD};
        return new AlertDialog.Builder(activity)
                .setTitle(strings.get(SETTINGS))
                .setMultiChoiceItems(new String[]{strings.get(HIDE_ADS), strings.get(CLEAN_DOWNLOADS)},
                        new boolean[]{hideAds(), cleanDownloads()},
                        (dialog, which, enabled) -> current.edit().putBoolean(keys[which], enabled).apply())
                .setPositiveButton(android.R.string.ok, null)
                .show();
    }
}
