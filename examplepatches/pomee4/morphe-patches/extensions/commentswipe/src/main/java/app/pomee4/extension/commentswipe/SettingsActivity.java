package app.pomee4.extension.commentswipe;

import android.app.Activity;
import android.content.Context;
import android.content.pm.ShortcutManager;
import android.os.Build;
import android.os.Bundle;
import android.graphics.drawable.Drawable;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toolbar;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.PreferenceCategory;
import android.preference.PreferenceFragment;
import android.preference.PreferenceScreen;
import android.preference.SwitchPreference;

import java.util.Collections;

import app.pomee4.extension.commentswipe.CommentSwipeActionsPatch.SwipeAction;
import app.pomee4.extension.commentswipe.PostSwipe.PostAction;

/**
 * Settings screen of the swipe actions of comments and posts. Added to the manifest during patching and
 * opened from the "Swipe actions" row of the Reddit settings (General section).
 */
@SuppressWarnings("deprecation")
public final class SettingsActivity extends Activity {
    private static final String SHORTCUT_ID = "pomee4_comment_swipe_settings";
    private static boolean oldShortcutRemoved;

    /**
     * Removes the launcher shortcut of older versions of the patch, once per process.
     * The settings are now a row of the Reddit settings.
     */
    static void removeOldShortcut(Context context) {
        if (oldShortcutRemoved) return;
        oldShortcutRemoved = true;
        try {
            ShortcutManager manager = context.getSystemService(ShortcutManager.class);
            if (manager != null) manager.removeDynamicShortcuts(Collections.singletonList(SHORTCUT_ID));
        } catch (Exception ex) {
            Logger.printException(() -> "removeOldShortcut failure", ex);
        }
    }

    private static final String TITLE = "Swipe actions";

    /**
     * If the screen uses the settings style of the Morphe Patches, like the Morphe settings.
     */
    private static boolean morpheStyle;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        // The colors come from the Reddit theme, so from the Reddit screen this one was opened from.
        Activity reddit = CommentSwipeActionsPatch.currentActivity();
        morpheStyle = MorpheStyle.load(reddit == null || reddit instanceof SettingsActivity ? this : reddit);

        if (morpheStyle) {
            setTheme(MorpheStyle.isDark()
                    ? android.R.style.Theme_DeviceDefault_NoActionBar
                    : android.R.style.Theme_DeviceDefault_Light_NoActionBar);
        } else {
            setTheme(Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q
                    ? android.R.style.Theme_DeviceDefault_DayNight
                    : android.R.style.Theme_DeviceDefault_Settings);
        }
        super.onCreate(savedInstanceState);
        setTitle(TITLE);
        Settings.init(this);

        int containerId = android.R.id.content;
        if (morpheStyle) containerId = setUpMorpheLayout();

        if (savedInstanceState == null) {
            getFragmentManager().beginTransaction()
                    .replace(containerId, new SettingsFragment())
                    .commit();
        }
    }

    /**
     * A toolbar with a back arrow and the title above the settings, like the Morphe settings.
     *
     * @return The id of the view that holds the settings.
     */
    private int setUpMorpheLayout() {
        int background = MorpheStyle.backgroundColor();
        boolean dark = MorpheStyle.isDark();

        Window window = getWindow();
        window.setStatusBarColor(background);
        window.setNavigationBarColor(background);
        window.getDecorView().setSystemUiVisibility(dark
                ? 0
                : View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR | View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR);

        LinearLayout layout = new LinearLayout(this);
        layout.setOrientation(LinearLayout.VERTICAL);
        layout.setBackgroundColor(background);
        layout.setFitsSystemWindows(true);

        int actionBarSize;
        TypedValue value = new TypedValue();
        if (getTheme().resolveAttribute(android.R.attr.actionBarSize, value, true)) {
            actionBarSize = TypedValue.complexToDimensionPixelSize(value.data, getResources().getDisplayMetrics());
        } else {
            actionBarSize = Math.round(56 * getResources().getDisplayMetrics().density);
        }

        Toolbar toolbar = new Toolbar(this);
        toolbar.setBackgroundColor(background);
        toolbar.setTitle(TITLE);
        toolbar.setTitleTextColor(MorpheStyle.titleColor());
        toolbar.setElevation(getResources().getDisplayMetrics().density * (dark ? 1 : 6));
        toolbar.post(() -> {
            for (int i = 0; i < toolbar.getChildCount(); i++) {
                View child = toolbar.getChildAt(i);
                if (child instanceof TextView title) {
                    MorpheStyle.styleToolbarTitle(title);
                    break;
                }
            }
        });

        int backIconId = getResources().getIdentifier("icon_arrow_back", "drawable", getPackageName());
        Drawable backIcon = backIconId != 0 ? getDrawable(backIconId) : null;
        if (backIcon != null) {
            backIcon.setTint(MorpheStyle.textColor());
            toolbar.setNavigationIcon(backIcon);
        }
        toolbar.setNavigationContentDescription("Back");
        toolbar.setNavigationOnClickListener(v -> finish());
        layout.addView(toolbar, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, actionBarSize));

        FrameLayout container = new FrameLayout(this);
        container.setId(View.generateViewId());
        layout.addView(container, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        setContentView(layout);
        return container.getId();
    }

    public static final class SettingsFragment extends PreferenceFragment {
        private ViewTreeObserver.OnPreDrawListener styleListener;

        @Override
        public void onViewCreated(View view, Bundle savedInstanceState) {
            super.onViewCreated(view, savedInstanceState);
            if (!morpheStyle) return;
            ListView list = view.findViewById(android.R.id.list);
            if (list != null) styleListener = MorpheStyle.styleList(list);
        }

        @Override
        public void onDestroyView() {
            View view = getView();
            if (styleListener != null && view != null) {
                ListView list = view.findViewById(android.R.id.list);
                if (list != null) list.getViewTreeObserver().removeOnPreDrawListener(styleListener);
            }
            styleListener = null;
            super.onDestroyView();
        }

        @Override
        public void onCreate(Bundle savedInstanceState) {
            super.onCreate(savedInstanceState);
            getPreferenceManager().setSharedPreferencesName(Settings.PREFERENCES_NAME);

            Context context = getActivity();
            PreferenceScreen screen = getPreferenceManager().createPreferenceScreen(context);
            setPreferenceScreen(screen);

            addKind(context, screen, "Comments", Settings.COMMENT_SWIPE_ACTIONS, "Comment swipe actions",
                    "Swipe a comment left or right to vote, save, reply and more. How far you swipe picks the first or second action",
                    SwipeAction.values(), Settings.LEFT_FIRST, Settings.LEFT_SECOND,
                    Settings.RIGHT_FIRST, Settings.RIGHT_SECOND);
            addKind(context, screen, "Posts", Settings.POST_SWIPE_ACTIONS, "Post swipe actions",
                    "Swipe a post left or right in feeds, subreddits, profiles and saved posts to vote, save, hide and more",
                    PostAction.values(), Settings.POST_LEFT_FIRST, Settings.POST_LEFT_SECOND,
                    Settings.POST_RIGHT_FIRST, Settings.POST_RIGHT_SECOND);

            PreferenceCategory other = new PreferenceCategory(context);
            other.setTitle("Feedback");
            screen.addPreference(other);
            other.addPreference(vibratePreference(context));
        }

        /**
         * The switch and the swipe directions of comments or posts.
         */
        private static <T extends Enum<T>> void addKind(Context context, PreferenceScreen screen, String title,
                                                        Settings.BooleanSetting enabledSetting, String switchTitle,
                                                        String switchSummary, T[] values,
                                                        Settings.EnumSetting<T> leftFirst,
                                                        Settings.EnumSetting<T> leftSecond,
                                                        Settings.EnumSetting<T> rightFirst,
                                                        Settings.EnumSetting<T> rightSecond) {
            PreferenceCategory category = new PreferenceCategory(context);
            category.setTitle(title);
            screen.addPreference(category);

            SwitchPreference enabled = new SwitchPreference(context);
            enabled.setKey(enabledSetting.key);
            enabled.setDefaultValue(enabledSetting.defaultValue);
            enabled.setTitle(switchTitle);
            enabled.setSummary(switchSummary);
            category.addPreference(enabled);

            addDirection(context, screen, enabled, title + ": swipe left", values, leftFirst, leftSecond);
            addDirection(context, screen, enabled, title + ": swipe right", values, rightFirst, rightSecond);
        }

        private static <T extends Enum<T>> void addDirection(Context context, PreferenceScreen screen,
                                                             Preference enabled, String title, T[] values,
                                                             Settings.EnumSetting<T> first,
                                                             Settings.EnumSetting<T> second) {
            PreferenceCategory category = new PreferenceCategory(context);
            category.setTitle(title);
            screen.addPreference(category);

            ListPreference firstPreference = actionPreference(context, values, first, "First action");
            category.addPreference(firstPreference);
            firstPreference.setDependency(enabled.getKey());

            ListPreference secondPreference = actionPreference(context, values, second, "Second action");
            category.addPreference(secondPreference);
            secondPreference.setDependency(enabled.getKey());
            updateSecondSummary(secondPreference, second.get());
            secondPreference.setOnPreferenceChangeListener((preference, value) -> {
                updateSecondSummary((ListPreference) preference,
                        Enum.valueOf(second.defaultValue.getDeclaringClass(), (String) value));
                return true;
            });
        }

        /**
         * Explains what a longer swipe does when the second action is None.
         */
        private static void updateSecondSummary(ListPreference preference, Enum<?> action) {
            preference.setSummary(action.name().equals("NONE")
                    ? "None: any swipe distance does the first action. Set both to None to turn off this direction"
                    : Labels.action(action) + ", on a longer swipe");
        }

        private static <T extends Enum<T>> ListPreference actionPreference(Context context, T[] values,
                                                                           Settings.EnumSetting<T> setting,
                                                                           String title) {
            String[] entries = new String[values.length];
            String[] entryValues = new String[values.length];
            for (int i = 0; i < values.length; i++) {
                entries[i] = Labels.action(values[i]);
                entryValues[i] = values[i].name();
            }
            return listPreference(context, setting.key, setting.defaultValue.name(), title, entries, entryValues);
        }

        private static ListPreference listPreference(Context context, String key, String defaultValue, String title,
                                                     String[] entries, String[] entryValues) {
            ListPreference preference = new ListPreference(context);
            preference.setKey(key);
            preference.setDefaultValue(defaultValue);
            preference.setTitle(title);
            preference.setDialogTitle(title);
            preference.setEntries(entries);
            preference.setEntryValues(entryValues);
            preference.setSummary("%s");
            return preference;
        }

        private static SwitchPreference vibratePreference(Context context) {
            SwitchPreference preference = new SwitchPreference(context);
            preference.setKey(Settings.COMMENT_SWIPE_VIBRATE.key);
            preference.setDefaultValue(Settings.COMMENT_SWIPE_VIBRATE.defaultValue);
            preference.setTitle("Vibrate on each action");
            preference.setSummary("Vibrates when the swipe reaches the next action, even when touch vibration is off");
            return preference;
        }
    }
}
