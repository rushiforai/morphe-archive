package app.morphe.extension.twitch.hometab;

import android.app.Activity;
import android.content.res.ColorStateList;
import android.graphics.Typeface;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.LinearLayout;
import android.widget.TextView;

import app.morphe.extension.twitch.base.MorpheTheme;
import app.morphe.extension.twitch.base.SeyttingsSection;

/**
 * DEFAULT HOME TAB section of the SEYTTINGS dialog. Discovered through
 * reflection by the base SEYTTINGS extension, so it only appears when the
 * DEFAULT HOME TAB patch was applied as well.
 *
 * <p>The checkbox turns automatic tab navigation on or off. The button lets
 * the user choose which tab (Home, Following, Browse or Search) Twitch TV
 * opens on every launch. The choice is saved and survives app restarts.</p>
 */
public final class HomeTabSection implements SeyttingsSection {

    private static final String[] TABS = {
            "Home", "Following", "Browse", "Search"
    };

    @Override
    public void addTo(final Activity activity, LinearLayout container) {
        HomeTabPrefs.init(activity);

        TextView header = new TextView(activity);
        header.setText("DEFAULT HOME TAB");
        header.setTextColor(MorpheTheme.COLOR_ACCENT);
        header.setTextSize(13);
        header.setTypeface(Typeface.DEFAULT_BOLD);
        header.setPadding(0, MorpheTheme.dp(activity, 10), 0, MorpheTheme.dp(activity, 4));
        container.addView(header, MorpheTheme.matchWidth());

        final CheckBox enable = new CheckBox(activity);
        enable.setText("Open " + HomeTabPrefs.getHomeTab() + " tab on start");
        enable.setTextColor(MorpheTheme.COLOR_TEXT);
        enable.setTextSize(18);
        enable.setChecked(HomeTabPrefs.isEnabled());
        enable.setButtonTintList(ColorStateList.valueOf(MorpheTheme.COLOR_ACCENT));
        MorpheTheme.makeFocusable(activity, enable);
        container.addView(enable, MorpheTheme.matchWidth());

        final Button tabButton = new Button(activity);
        tabButton.setAllCaps(false);
        tabButton.setTextSize(16);
        tabButton.setTextColor(MorpheTheme.COLOR_ACCENT);
        MorpheTheme.makeFocusable(activity, tabButton);
        container.addView(tabButton, MorpheTheme.matchWidth());

        final TextView status = new TextView(activity);
        status.setText(valueText());
        status.setTextColor(MorpheTheme.COLOR_MUTED);
        status.setTextSize(13);
        status.setPadding(
                MorpheTheme.dp(activity, 10),
                MorpheTheme.dp(activity, 6),
                MorpheTheme.dp(activity, 10),
                MorpheTheme.dp(activity, 4));
        container.addView(status, MorpheTheme.matchWidth());

        TextView hint = new TextView(activity);
        hint.setText("Twitch TV opens the chosen tab (default Home) on every "
                + "launch instead of the stock start tab. The choice is saved "
                + "and survives app restarts.");
        hint.setTextColor(MorpheTheme.COLOR_MUTED);
        hint.setTextSize(12);
        hint.setPadding(
                MorpheTheme.dp(activity, 10),
                MorpheTheme.dp(activity, 6),
                MorpheTheme.dp(activity, 10),
                MorpheTheme.dp(activity, 8));
        container.addView(hint, MorpheTheme.matchWidth());

        enable.setOnClickListener(v -> {
            boolean enabled = enable.isChecked();
            HomeTabPrefs.setEnabled(enabled);
            updateState(enable, tabButton, status);
            HomeTabInjector.setEnabled(enabled);
        });

        tabButton.setOnClickListener(v -> {
            String current = HomeTabPrefs.getHomeTab();
            int index = indexOf(current);
            int next = (index + 1) % TABS.length;
            String nextTab = TABS[next];
            HomeTabPrefs.setHomeTab(nextTab);
            updateState(enable, tabButton, status);
            HomeTabInjector.setTab(nextTab);
        });

        updateState(enable, tabButton, status);
    }

    private static void updateState(final CheckBox enable, final Button tabButton, final TextView status) {
        enable.setText("Open " + HomeTabPrefs.getHomeTab() + " tab on start");
        enable.setChecked(HomeTabPrefs.isEnabled());
        tabButton.setText("Start on tab: " + HomeTabPrefs.getHomeTab());
        status.setText(valueText());
    }

    private static int indexOf(String tab) {
        for (int i = 0; i < TABS.length; i++) {
            if (TABS[i].equals(tab)) {
                return i;
            }
        }
        return 0;
    }

    private static String valueText() {
        return HomeTabPrefs.isEnabled()
                ? "Enabled: Twitch opens the " + HomeTabPrefs.getHomeTab() + " tab on start."
                : "Disabled: Twitch uses its stock start tab.";
    }
}
