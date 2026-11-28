/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 *
 * Modified for HushGram (Instagram), 2026.
 */
package app.hushgram.extension.instagram.settings;

import static app.hushgram.extension.instagram.settings.HushgramPreferenceFragment.category;
import static app.hushgram.extension.instagram.settings.HushgramPreferenceFragment.glassBlurRow;
import static app.hushgram.extension.instagram.settings.HushgramPreferenceFragment.startTabRow;
import static app.hushgram.extension.instagram.settings.HushgramPreferenceFragment.tabBarLayoutRow;
import static app.hushgram.extension.instagram.settings.HushgramPreferenceFragment.tabIconSizeRow;
import static app.hushgram.extension.instagram.settings.HushgramPreferenceFragment.toggle;

import android.content.Context;
import android.preference.PreferenceCategory;
import android.preference.PreferenceScreen;

import java.util.Set;

import app.hushgram.extension.shared.L10n;

/** Builds the Tab bar category of HushGram settings. */
final class TabBarCategory {
    private TabBarCategory() { }

    static void add(HushgramPreferenceFragment page, PreferenceScreen screen, Context context, Set<PatchFamily> build) {
        if (build.contains(PatchFamily.GLASS_TAB_BAR) || build.contains(PatchFamily.REELS_TAB)
                || build.contains(PatchFamily.TAB_BAR_LAYOUT)) {
            PreferenceCategory glass = category(screen, L10n.t("Tab bar"), SettingsIcons.TAB_BAR,
                    L10n.t("Pick your tabs, their order and how the bar looks."));
            // First, since it picks which bar the rows below work on (#356).
            if (build.contains(PatchFamily.TAB_BAR_LAYOUT)) glass.addPreference(tabBarLayoutRow(context));
            if (build.contains(PatchFamily.REELS_TAB)) {
                glass.addPreference(toggle(context, Settings.HIDE_HOME_TAB, L10n.t("Hide the Home tab"),
                        L10n.t("Takes Home off the tab bar. Your Start tab opens wherever Home would, so pick one other than Home "
                                + "that's on the bar, or Home stays. Restart Instagram to see the change.")));
                // Under Reels until 2026-10-26, and a search for Reels still finds them.
                glass.addPreference(toggle(context, Settings.HIDE_REELS_TAB, L10n.t("Hide the Reels tab"),
                        L10n.t("Takes Reels off the tab bar. Reels in your feed and reels people send you still open. "
                                + "Restart Instagram to see the change.")));
                glass.addPreference(toggle(context, Settings.SHOW_REELS_TAB, L10n.t("Show the Reels tab"),
                        L10n.t("Puts Reels back on the tab bar if Instagram left it off yours. Hide the Reels tab wins if "
                                + "both are on. Restart Instagram to see the change.")));
                glass.addPreference(toggle(context, Settings.HIDE_SEARCH_TAB, L10n.t("Hide the Search tab"),
                        L10n.t("Takes Search off the tab bar and closes up the gap. Restart Instagram to see the change.")));
                glass.addPreference(toggle(context, Settings.HIDE_CREATE_TAB, L10n.t("Hide the Create tab"),
                        L10n.t("Takes Create off the tab bar and closes up the gap. Restart Instagram to see the change.")));
                glass.addPreference(toggle(context, Settings.HIDE_PROFILE_TAB, L10n.t("Hide the Profile tab"),
                        L10n.t("Takes Profile off the tab bar. Your profile still opens from other places in the app. "
                                + "Restart Instagram to see the change.")));
                glass.addPreference(toggle(context, Settings.SHOW_MESSAGES_TAB, L10n.t("Show the Messages tab"),
                        L10n.t("Puts Messages on the tab bar, before Profile, if Instagram left it off yours. Tab order "
                                + "can move it. Restart Instagram to see the change.")));
                glass.addPreference(toggle(context, Settings.HIDE_MESSAGES_TAB, L10n.t("Hide the Messages tab"),
                        L10n.t("Takes the Messages button off the tab bar. A Messages button on Home's header still "
                                + "opens your chats, and so do notifications.")));
                glass.addPreference(toggle(context, Settings.HIDE_MESSAGES_BADGE, L10n.t("Hide the Messages badge"),
                        L10n.t("Takes the unread count off the Messages button on the tab bar. Chats still show as unread "
                                + "in your inbox, and notifications still come. Restart Instagram to see the change.")));
                glass.addPreference(toggle(context, Settings.SHOW_ACTIVITY_TAB, L10n.t("Show the Activity tab"),
                        L10n.t("Puts Activity, the screen the heart opens, on the tab bar before Profile. Tab order can "
                                + "move it, and Hide notifications on Home's header takes the heart away. "
                                + "Restart Instagram to see the change.")));
                glass.addPreference(toggle(context, Settings.HIDE_HOME_CREATE_BUTTON, L10n.t("Hide Create on Home's header"),
                        L10n.t("Takes the plus button off the top of Home and closes up the gap. The Create tab and "
                                + "swiping to create are separate. Restart Instagram to see the change.")));
                glass.addPreference(toggle(context, Settings.HIDE_HOME_NOTIFICATIONS_BUTTON, L10n.t("Hide notifications on Home's header"),
                        L10n.t("Takes the heart off the top of Home and closes up the gap. Alerts still arrive. "
                                + "Restart Instagram to see the change.")));
                glass.addPreference(toggle(context, Settings.HEART_COUNT, L10n.t("Count on the heart"),
                        L10n.t("The heart at the top of Home shows how many notifications are waiting, like the "
                                + "number on Messages, in place of the red dot. Restart Instagram to see the change.")));
                glass.addPreference(toggle(context, Settings.SEARCH_BUTTON_ON_HOME, L10n.t("Search button on Home's header"),
                        L10n.t("Adds a magnifier at the top of Home that opens Search, like the Search tab does. It works "
                                + "with the Search tab hidden too. Restart Instagram "
                                + "to see the change.")));
                glass.addPreference(toggle(context, Settings.MESSAGES_BUTTON_ON_HOME, L10n.t("Messages button on Home's header"),
                        L10n.t("Adds a Messages button at the top of Home when Instagram moved Messages to your tab bar. "
                                + "A tap opens your messages like the tab does. Restart Instagram to see the change.")));
                glass.addPreference(toggle(context, Settings.HIDE_HOME_MESSAGES_BUTTON, L10n.t("Hide Messages on Home's header"),
                        L10n.t("Takes Instagram's Messages button off the top of Home, for when Messages is on your tab "
                                + "bar too. Restart Instagram to see the change.")));
                if (!GhostMode.switches(build).isEmpty()) {
                    glass.addPreference(toggle(context, Settings.GHOST_BUTTON_ON_HOME, L10n.t("Ghost mode button on Home's header"),
                            L10n.t("Adds a ghost button at the top of Home, next to Messages when it's there and at the end "
                                    + "of the buttons when it isn't. Tap it to turn Ghost mode on or off. Restart Instagram "
                                    + "to see the change.")));
                    glass.addPreference(HushgramPreferenceFragment.ghostIndicatorColorRow(context));
                }
                glass.addPreference(toggle(context, Settings.SETTINGS_BUTTON_ON_HOME, L10n.t("Settings button on Home's header"),
                        L10n.t("Adds a gear at the top of Home that opens HushGram settings. Restart Instagram "
                                + "to see the change.")));
                glass.addPreference(toggle(context, Settings.MENU_BUTTON_ON_HOME, L10n.t("Menu button on Home's header"),
                        L10n.t("Adds a menu button at the top of Home with your viewing history, Ghost mode and "
                                + "HushGram settings. Restart Instagram to see the change.")));
                if (HomeMenuButton.logout.wired()) {
                    glass.addPreference(toggle(context, Settings.LOGOUT_IN_HOME_MENU, L10n.t("Log out in Home's menu"),
                            L10n.t("Adds Log out after HushGram settings in the list the menu button on Home's header "
                                    + "opens. It starts the same Log out as Instagram's own settings.")));
                }
                glass.addPreference(toggle(context, Settings.HISTORY_BUTTON_ON_HOME, L10n.t("History button on Home's header"),
                        L10n.t("Adds a clock at the top of Home that opens your viewing history in one tap. Restart "
                                + "Instagram to see the change.")));
                glass.addPreference(toggle(context, Settings.CENTER_HOME_LOGO, L10n.t("Center the logo on Home's header"),
                        L10n.t("Puts Instagram's logo in the middle of the top of Home, even with header buttons hidden "
                                + "or added. A feed's name shown there is centered too. Restart Instagram to see the change.")));
                glass.addPreference(toggle(context, Settings.CENTER_PROFILE_NAME, L10n.t("Center the name on profiles"),
                        L10n.t("Puts the username in the middle of the bar at the top of a profile, yours and other "
                                + "people's. The buttons stay where they are.")));
                glass.addPreference(toggle(context, Settings.CENTER_SCREEN_TITLES, L10n.t("Center titles on other screens"),
                        L10n.t("Puts the title in the middle of the bar at the top of other screens, like notifications, "
                                + "as far as the buttons beside it allow. The buttons stay where they are.")));
                glass.addPreference(toggle(context, Settings.TITLES_AT_START, L10n.t("Logo and titles at the start"),
                        L10n.t("Puts Instagram's logo and every bar's title at the start of the bar, where Instagram used "
                                + "to show them. Turn it on if Instagram centers them for you. It wins over the centering "
                                + "switches above. Restart Instagram to see the change on Home.")));
                glass.addPreference(page.tabOrderRow(context));
                glass.addPreference(startTabRow(context));
                glass.addPreference(tabIconSizeRow(context));
                glass.addPreference(toggle(context, Settings.FULL_SIZE_REELS_ICON, L10n.t("Full-size Reels icon"),
                        L10n.t("Draws the Reels icon on the tab bar a bit bigger, so it looks as big as the icons beside it. "
                                + "Tab icon size still sizes every icon on top of that.")));
            }
            if (build.contains(PatchFamily.GLASS_TAB_BAR)) {
                glass.addPreference(toggle(context, Settings.GLASS_TAB_BAR, L10n.t("Liquid Glass navigation bar"),
                        L10n.t("Uses the Liquid Glass bar with scroll shrinking and draggable tab selection. Open the sliders button "
                                + "on your profile to customize its style, glass, shape and selection.")));
                glass.addPreference(toggle(context, Settings.GLASS_TAB_BAR_BLUR, L10n.t("Blur behind the tab bar"),
                        L10n.t("Blurs the content visible through the Liquid Glass pill, including Reels. Turn this off to keep it clear.")));
                glass.addPreference(glassBlurRow(context));
                glass.addPreference(toggle(context, Settings.GLASS_TAB_BAR_REELS_BEHIND, L10n.t("Run Reels behind the tab bar"),
                        L10n.t("The Reels video fills the screen behind the pill. Its caption, buttons and seek bar sit just above the pill.")));
            }
        }
    }
}
