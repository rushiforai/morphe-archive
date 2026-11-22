package app.userinsights.extension;

import android.app.Activity;
import android.content.ComponentName;
import android.content.pm.PackageManager;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.text.InputType;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.EditorInfo;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

/**
 * Settings for User Insights. Opened from its own launcher icon,
 * by long-pressing any pill, or from the archive screen.
 */
public class SettingsActivity extends Activity {
    private static final int BG = 0xFF0B0B0C;
    private static final int SURFACE = 0xFF17181B;
    private static final int TEXT = 0xFFEDEEF0;
    private static final int TEXT_DIM = 0xFF9A9DA3;
    private static final int ACCENT = 0xFFFF4500;

    private TextView statusText;
    private Button statusButton;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        UserInsights.init(this);
        try {
            getWindow().setStatusBarColor(BG);
            getWindow().setNavigationBarColor(BG);
        } catch (Throwable ignored) {
            // Not important.
        }
        setContentView(buildLayout());
    }

    @Override
    protected void onResume() {
        super.onResume();
        updateStatus();
    }

    private View buildLayout() {
        ScrollView scroll = new ScrollView(this);
        scroll.setBackgroundColor(BG);
        scroll.setFitsSystemWindows(true);

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(dp(20), dp(16), dp(20), dp(32));
        scroll.addView(root);

        TextView title = new TextView(this);
        title.setText("User Insights");
        title.setTextColor(TEXT);
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 26);
        title.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        root.addView(title);
        root.addView(dim("Top subreddits next to usernames, and hidden profile activity, from the Arctic Shift archive."));

        // Service status.
        LinearLayout statusCard = card();
        statusText = new TextView(this);
        statusText.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        statusText.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        statusCard.addView(statusText);
        statusCard.addView(dim("Reddit User Insights needs its accessibility service on to see usernames on screen. "
                + "It only reads this Reddit app."));
        statusButton = button("Open accessibility settings");
        statusButton.setOnClickListener(v -> UserInsights.openAccessibilitySettings(this));
        statusCard.addView(statusButton);
        statusCard.addView(dim("Switch greyed out? Open App info → ⋮ (top right) → Allow restricted settings, then try again."));
        Button appInfo = button("Open App info");
        appInfo.setOnClickListener(v -> UserInsights.openAppInfo(this));
        statusCard.addView(appInfo);
        root.addView(statusCard);

        // Badges.
        LinearLayout badgeCard = card();
        badgeCard.addView(heading("Top subreddit badges"));
        badgeCard.addView(toggle("Show badges next to usernames", Prefs.badgesEnabled(),
                (b, checked) -> Prefs.setBadgesEnabled(checked)));
        badgeCard.addView(toggle("Draw them inside comments (restart Reddit)", Prefs.embeddedEnabled(),
                (b, checked) -> Prefs.setEmbeddedEnabled(checked)));

        badgeCard.addView(label("Number of badges"));
        RadioGroup countGroup = radioGroup(new String[]{"1", "2", "3"}, Prefs.badgeCount() - 1, true);
        countGroup.setOnCheckedChangeListener((group, id) -> Prefs.setBadgeCount(id));
        badgeCard.addView(countGroup);

        badgeCard.addView(label("Count activity from"));
        String window = Prefs.timeWindow();
        int windowIndex = Prefs.WINDOW_YEAR.equals(window) ? 1 : Prefs.WINDOW_3_MONTHS.equals(window) ? 2 : 0;
        RadioGroup windowGroup = radioGroup(new String[]{"All time", "Past year", "Past 3 months"}, windowIndex, false);
        windowGroup.setOnCheckedChangeListener((group, id) -> {
            Prefs.setTimeWindow(id == 2 ? Prefs.WINDOW_YEAR : id == 3 ? Prefs.WINDOW_3_MONTHS : Prefs.WINDOW_ALL);
        });
        badgeCard.addView(windowGroup);
        badgeCard.addView(dim("Tap a badge to see what that user posted in that subreddit. Long-press a badge to open these settings."));
        root.addView(badgeCard);

        // Hidden profiles.
        LinearLayout hiddenCard = card();
        hiddenCard.addView(heading("Hidden profiles"));
        hiddenCard.addView(toggle("Unhide profiles", Prefs.hiddenButtonEnabled(),
                (b, checked) -> Prefs.setHiddenButtonEnabled(checked)));
        hiddenCard.addView(toggle("Show hidden activity inside the profile", Prefs.inlineHiddenEnabled(),
                (b, checked) -> Prefs.setInlineHiddenEnabled(checked)));
        hiddenCard.addView(dim("When off, hidden profiles show a button instead. Every profile also gets a "
                + "'Full history' pill, for users who only hide some communities."));
        hiddenCard.addView(label("Look up any user"));
        final EditText input = new EditText(this);
        input.setHint("username");
        input.setTextColor(TEXT);
        input.setHintTextColor(TEXT_DIM);
        input.setSingleLine(true);
        input.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        input.setImeOptions(EditorInfo.IME_ACTION_SEARCH);
        hiddenCard.addView(input);
        Button lookup = button("Show activity");
        Runnable doLookup = () -> {
            String name = input.getText().toString().trim().replaceFirst("^/?u/", "");
            if (!name.matches("[A-Za-z0-9_-]{3,20}")) {
                Toast.makeText(this, "Enter a Reddit username", Toast.LENGTH_SHORT).show();
                return;
            }
            UserInsights.openArchive(this, name, null);
        };
        lookup.setOnClickListener(v -> doLookup.run());
        input.setOnEditorActionListener((v, actionId, event) -> {
            doLookup.run();
            return true;
        });
        hiddenCard.addView(lookup);
        root.addView(hiddenCard);

        // Other.
        LinearLayout otherCard = card();
        otherCard.addView(heading("Other"));
        otherCard.addView(toggle("Show 'User Insights' icon in app drawer", isLauncherIconEnabled(),
                (b, checked) -> setLauncherIconEnabled(checked)));
        otherCard.addView(dim("If you hide the icon, long-press any badge to get back here."));

        Button clear = button("Clear cached badges");
        clear.setOnClickListener(v -> {
            ArcticShift.clearCache();
            Toast.makeText(this, "Cache cleared", Toast.LENGTH_SHORT).show();
        });
        otherCard.addView(clear);

        Button dump = button("Copy the next Reddit screen's layout");
        dump.setOnClickListener(v -> {
            Prefs.requestDebugDump();
            Toast.makeText(this, "Go back to Reddit and open the screen. Its layout will be copied to the clipboard.",
                    Toast.LENGTH_LONG).show();
        });
        otherCard.addView(dump);
        otherCard.addView(dim("For fixing badges that don't show up: paste the copied text to whoever is fixing the patch."));
        root.addView(otherCard);

        root.addView(dim("The Reddit settings entry uses code from Morphe Patches "
                + "(github.com/MorpheApp/morphe-patches), GPLv3."));
        root.addView(dim("Data: Arctic Shift by Arthur Heitmann (arctic-shift.photon-reddit.com). "
                + "The archive can be incomplete or a few hours behind, and it can't show content that was deleted before it was archived."));
        return scroll;
    }

    private void updateStatus() {
        boolean enabled = UserInsights.isServiceEnabled(this);
        statusText.setText(enabled ? "● Accessibility service is on" : "● Accessibility service is off");
        statusText.setTextColor(enabled ? 0xFF46D160 : ACCENT);
        statusButton.setText(enabled ? "Accessibility settings" : "Turn it on");
    }

    private ComponentName launcherAlias() {
        return new ComponentName(getPackageName(), "app.userinsights.extension.SettingsLauncher");
    }

    private boolean isLauncherIconEnabled() {
        try {
            int state = getPackageManager().getComponentEnabledSetting(launcherAlias());
            return state != PackageManager.COMPONENT_ENABLED_STATE_DISABLED;
        } catch (Throwable t) {
            return true;
        }
    }

    private void setLauncherIconEnabled(boolean enabled) {
        try {
            getPackageManager().setComponentEnabledSetting(launcherAlias(),
                    enabled ? PackageManager.COMPONENT_ENABLED_STATE_ENABLED
                            : PackageManager.COMPONENT_ENABLED_STATE_DISABLED,
                    PackageManager.DONT_KILL_APP);
        } catch (Throwable t) {
            Toast.makeText(this, "Could not change the icon", Toast.LENGTH_SHORT).show();
        }
    }

    // UI helpers.

    private int dp(float value) {
        return Ui.dp(this, value);
    }

    private LinearLayout card() {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(16), dp(14), dp(16), dp(14));
        GradientDrawable background = new GradientDrawable();
        background.setCornerRadius(dp(16));
        background.setColor(SURFACE);
        card.setBackground(background);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.topMargin = dp(16);
        card.setLayoutParams(params);
        return card;
    }

    private TextView heading(String text) {
        TextView view = new TextView(this);
        view.setText(text);
        view.setTextColor(TEXT);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, 17);
        view.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        view.setPadding(0, 0, 0, dp(6));
        return view;
    }

    private TextView label(String text) {
        TextView view = new TextView(this);
        view.setText(text);
        view.setTextColor(TEXT);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        view.setPadding(0, dp(12), 0, dp(2));
        return view;
    }

    private TextView dim(String text) {
        TextView view = new TextView(this);
        view.setText(text);
        view.setTextColor(TEXT_DIM);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        view.setPadding(0, dp(6), 0, dp(4));
        return view;
    }

    private Button button(String text) {
        Button button = new Button(this);
        button.setText(text);
        button.setAllCaps(false);
        button.setTextColor(0xFFFFFFFF);
        GradientDrawable background = new GradientDrawable();
        background.setCornerRadius(dp(50));
        background.setColor(ACCENT);
        button.setBackground(background);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(44));
        params.topMargin = dp(8);
        button.setLayoutParams(params);
        return button;
    }

    private Switch toggle(String text, boolean checked, CompoundButton.OnCheckedChangeListener listener) {
        Switch toggle = new Switch(this);
        toggle.setText(text);
        toggle.setTextColor(TEXT);
        toggle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        toggle.setChecked(checked);
        toggle.setPadding(0, dp(8), 0, dp(8));
        toggle.setOnCheckedChangeListener(listener);
        return toggle;
    }

    private RadioGroup radioGroup(String[] labels, int selected, boolean horizontal) {
        RadioGroup group = new RadioGroup(this);
        group.setOrientation(horizontal ? LinearLayout.HORIZONTAL : LinearLayout.VERTICAL);
        for (int i = 0; i < labels.length; i++) {
            RadioButton radio = new RadioButton(this);
            radio.setId(i + 1);
            radio.setText(labels[i]);
            radio.setTextColor(TEXT);
            radio.setGravity(Gravity.CENTER_VERTICAL);
            group.addView(radio, new RadioGroup.LayoutParams(
                    horizontal ? 0 : ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT, horizontal ? 1f : 0f));
            if (i == selected) {
                radio.setChecked(true);
            }
        }
        return group;
    }
}
