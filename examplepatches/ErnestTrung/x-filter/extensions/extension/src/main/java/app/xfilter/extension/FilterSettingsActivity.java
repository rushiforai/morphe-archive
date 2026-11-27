package app.xfilter.extension;

import android.app.Activity;
import android.content.res.Configuration;
import android.os.Build;
import android.os.Bundle;
import android.preference.EditTextPreference;
import android.preference.PreferenceCategory;
import android.preference.PreferenceFragment;
import android.preference.PreferenceScreen;
import android.preference.SwitchPreference;
import android.text.InputType;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowInsetsController;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.Toolbar;

import static app.xfilter.extension.PostFilter.*;

/** Settings screen, opened from the "X Filters" launcher icon the patch adds. */
@SuppressWarnings({"deprecation", "unused"})
public final class FilterSettingsActivity extends Activity {
    // Fixed (for fragment restore) and outside the app's 0x7f resource id range.
    private static final int CONTAINER_ID = 0x00ff0001;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        setTheme(Build.VERSION.SDK_INT >= 29
                ? android.R.style.Theme_DeviceDefault_DayNight
                : android.R.style.Theme_DeviceDefault);
        super.onCreate(savedInstanceState);
        // Own toolbar instead of the window action bar, which doesn't offset content under edge-to-edge.
        requestWindowFeature(Window.FEATURE_NO_TITLE);

        Toolbar toolbar = new Toolbar(this);
        toolbar.setTitle(getTitle());
        FrameLayout container = new FrameLayout(this);
        container.setId(CONTAINER_ID);
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.addView(toolbar);
        root.addView(container, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));
        // Edge to edge (Android 15+, targetSdk 35): pad by the system bars. Older versions report 0 here.
        root.setOnApplyWindowInsetsListener((v, insets) -> {
            v.setPadding(insets.getSystemWindowInsetLeft(), insets.getSystemWindowInsetTop(),
                    insets.getSystemWindowInsetRight(), insets.getSystemWindowInsetBottom());
            return insets.consumeSystemWindowInsets();
        });
        setContentView(root);

        boolean night = (getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                == Configuration.UI_MODE_NIGHT_YES;
        if (Build.VERSION.SDK_INT >= 30 && !night) {
            // Dark status/navigation bar icons on the light background.
            int light = WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS
                    | WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS;
            getWindow().getInsetsController().setSystemBarsAppearance(light, light);
        }

        if (savedInstanceState == null) {
            getFragmentManager().beginTransaction().replace(CONTAINER_ID, new Screen()).commit();
        }
    }

    public static final class Screen extends PreferenceFragment {
        private static final String LIST_HINT = "One per line.";

        @Override
        public void onCreate(Bundle savedInstanceState) {
            super.onCreate(savedInstanceState);
            getPreferenceManager().setSharedPreferencesName(PREFS);
            PreferenceScreen screen = getPreferenceManager().createPreferenceScreen(getActivity());
            setPreferenceScreen(screen);

            PreferenceCategory feed = category(screen, "Feed items");
            toggle(feed, PROMOTED, "Promoted posts");
            toggle(feed, WHO_TO_FOLLOW, "Who to follow");
            toggle(feed, CREATORS, "Creators to subscribe to");
            toggle(feed, COMMUNITIES, "Communities to join");
            toggle(feed, NEWS, "Today's news");
            toggle(feed, PREMIUM_PROMPTS, "Premium prompts");
            toggle(feed, DISCOVER_MORE, "Discover more (under replies)");

            PreferenceCategory posts = category(screen, "Posts");
            toggle(posts, REPOSTS, "Reposts");
            toggle(posts, QUOTES, "Quote posts");
            toggle(posts, REPLIES, "Replies");
            toggle(posts, NOT_FOLLOWED, "Accounts you don't follow");
            toggle(posts, BLUE_NOT_FOLLOWED, "Blue-check accounts you don't follow");
            toggle(posts, PHOTOS, "Posts with photos");
            toggle(posts, VIDEOS, "Posts with videos or GIFs");
            toggle(posts, TEXT_ONLY, "Text-only posts");
            toggle(posts, LINKS, "Posts with links");
            toggle(posts, POLLS, "Polls");
            toggle(posts, SENSITIVE, "Sensitive media");
            toggle(posts, COMMUNITY_POSTS, "Community posts");
            number(posts, MAX_HASHTAGS, "Max hashtags", "Hide posts with more hashtags than this. 0 = off.");
            text(posts, MUTED_USERS, "Muted users", "One @handle per line.");
            text(posts, LANGUAGES, "Languages", "Show only these language codes, comma-separated (e.g. en, de). Empty = all.");

            PreferenceCategory text = category(screen, "Text");
            text(text, CONTAINS, "Contains", LIST_HINT);
            text(text, STARTS_WITH, "Starts with", LIST_HINT);
            text(text, ENDS_WITH, "Ends with", LIST_HINT);
            text(text, REGEX, "Regex", "One pattern per line. Case-insensitive.");
            number(text, MIN_LENGTH, "Min length", "Hide posts with fewer characters. 0 = off.");
            number(text, MAX_LENGTH, "Max length", "Hide posts with more characters. 0 = off.");

            PreferenceCategory scope = category(screen, "Apply post filters in");
            toggle(scope, SCOPE_HOME, "Home");
            toggle(scope, SCOPE_SEARCH, "Search");
            toggle(scope, SCOPE_REPLIES, "Replies");
            toggle(scope, SCOPE_LISTS, "Lists");
        }

        private PreferenceCategory category(PreferenceScreen screen, String title) {
            PreferenceCategory category = new PreferenceCategory(getActivity());
            category.setTitle(title);
            screen.addPreference(category);
            return category;
        }

        private void toggle(PreferenceCategory parent, String key, String title) {
            SwitchPreference p = new SwitchPreference(getActivity());
            p.setKey(key);
            p.setTitle(title);
            p.setDefaultValue(DEFAULT_ON.contains(key));
            parent.addPreference(p);
        }

        private void text(PreferenceCategory parent, String key, String title, String hint) {
            edit(parent, key, title, hint, InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_MULTI_LINE);
        }

        private void number(PreferenceCategory parent, String key, String title, String hint) {
            edit(parent, key, title, hint, InputType.TYPE_CLASS_NUMBER);
        }

        private void edit(PreferenceCategory parent, String key, String title, String hint, int inputType) {
            EditTextPreference p = new EditTextPreference(getActivity());
            p.setKey(key);
            p.setTitle(title);
            p.setDialogTitle(title);
            p.setDialogMessage(hint);
            p.getEditText().setInputType(inputType);
            parent.addPreference(p);
            // Show the current value; getText() is loaded once the preference is attached.
            p.setSummary(describe(key, p.getText()));
            p.setOnPreferenceChangeListener((pref, value) -> {
                pref.setSummary(describe(key, (String) value));
                return true;
            });
        }

        /** Lines joined with ", "; empty or 0 reads as Off (All for languages). */
        static String describe(String key, String value) {
            StringBuilder out = new StringBuilder();
            for (String line : (value == null ? "" : value).split("\n")) {
                if (line.trim().isEmpty()) continue;
                if (out.length() > 0) out.append(", ");
                out.append(line.trim());
            }
            String text = out.toString();
            if (text.isEmpty() || text.equals("0")) return LANGUAGES.equals(key) ? "All" : "Off";
            return text;
        }
    }
}
