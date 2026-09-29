package io.github.bakwudo.uyu.extension.settings;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.PreferenceFragment;
import android.preference.PreferenceGroup;
import android.preference.PreferenceScreen;
import android.preference.SwitchPreference;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.util.Locale;

import io.github.bakwudo.uyu.extension.danmaku.DanmakuPreview;

/**
 * An uyu settings screen. Built in code with platform preferences, so it needs no resources
 * added to the app. Only settings of applied patches are shown.
 * <p>
 * The first screen lists the sections, and each section opens as its own screen on top.
 * Screens are shown on top of Twitch's own settings screen, so they have an opaque background,
 * take all touches, and put the toolbar title back when they close.
 */
@SuppressWarnings("deprecation")
public class UyuSettingsFragment extends PreferenceFragment {
    static final String SECTION_GENERAL = "general";
    static final String SECTION_APPEARANCE = "appearance";
    static final String SECTION_DANMAKU = "danmaku";
    static final String SECTION_ADS = "ads";

    private static final String ARG_SECTION = "section";

    private static final String[] WEIGHT_NAMES = {
            "Thin", "Extra light", "Light", "Regular", "Medium", "Semi bold", "Bold", "Extra bold", "Black",
    };

    /** Null for the list of sections. */
    private String section;
    private CharSequence previousTitle;
    private FontPreference fontPreference;

    /**
     * @param section One of the SECTION constants, or null for the list of sections.
     */
    static UyuSettingsFragment create(String section) {
        UyuSettingsFragment fragment = new UyuSettingsFragment();
        Bundle arguments = new Bundle();
        arguments.putString(ARG_SECTION, section);
        fragment.setArguments(arguments);
        return fragment;
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getPreferenceManager().setSharedPreferencesName(Setting.PREFERENCES_NAME);
        Bundle arguments = getArguments();
        section = arguments == null ? null : arguments.getString(ARG_SECTION);

        PreferenceScreen screen = getPreferenceManager().createPreferenceScreen(getActivity());
        setPreferenceScreen(screen);

        if (section == null) {
            addSectionLinks(screen);
        } else if (section.equals(SECTION_GENERAL)) {
            addGeneralSettings(screen);
        } else if (section.equals(SECTION_APPEARANCE)) {
            addAppearanceSettings(screen);
        } else if (section.equals(SECTION_DANMAKU)) {
            addDanmakuSettings(screen);
        } else if (section.equals(SECTION_ADS)) {
            addAdsSettings(screen);
        }
    }

    private void addSectionLinks(PreferenceScreen screen) {
        if (PatchStatus.autoClaimChannelPoints()) {
            addSectionLink(screen, SECTION_GENERAL, "Channel points");
        }
        if (PatchStatus.hidePromotions()) {
            addSectionLink(screen, SECTION_APPEARANCE,
                    "Subscribe and Bits buttons, gift leaderboard, promotions");
        }
        if (PatchStatus.danmakuComments()) {
            addSectionLink(screen, SECTION_DANMAKU, "Chat messages scrolling across the video");
        }
        if (PatchStatus.blockAds()) {
            addSectionLink(screen, SECTION_ADS, "Video and display ads, proxy");
        }
    }

    private void addSectionLink(PreferenceScreen screen, String linkedSection, String summary) {
        Preference preference = new Preference(screen.getContext());
        preference.setTitle(title(linkedSection));
        preference.setSummary(summary);
        preference.setOnPreferenceClickListener(clicked -> {
            Activity activity = getActivity();
            if (activity != null) SettingsPatch.showScreen(activity, linkedSection);
            return true;
        });
        screen.addPreference(preference);
    }

    private void addGeneralSettings(PreferenceScreen screen) {
        if (PatchStatus.autoClaimChannelPoints()) {
            addSwitch(screen, Settings.AUTO_CLAIM_CHANNEL_POINTS,
                    "Auto claim channel points",
                    "Claims the bonus chest on the channel you are watching.");
        }
    }

    private void addAppearanceSettings(PreferenceScreen screen) {
        addSwitch(screen, Settings.HIDE_SUBSCRIBE_BUTTONS, "Hide the subscribe and Bits buttons",
                "Hides the row above chat with the Bits, gift a sub and subscribe buttons.");
        addSwitch(screen, Settings.HIDE_CHAT_BITS_BUTTON, "Hide the Bits button in the chat box",
                "Hides the Bits button next to the emote button.");
        addSwitch(screen, Settings.HIDE_GIFT_LEADERBOARD, "Hide the gift leaderboard",
                "Hides the ranking of top gifters and cheerers above chat.");
        addSwitch(screen, Settings.HIDE_SUBSCRIPTION_PROMOTIONS, "Hide subscription promotions",
                "Hides the banners that advertise subscription and gift discounts and "
                        + "SUBtember, above the player and above chat, and the banner that "
                        + "advertises Turbo.");

        Preference note = new Preference(screen.getContext());
        note.setSummary("Items you show again appear the next time you open a stream.");
        note.setSelectable(false);
        screen.addPreference(note);
    }

    private void addDanmakuSettings(PreferenceScreen screen) {
        addSwitch(screen, Settings.DANMAKU_ENABLED, "Danmaku comments",
                "Chat messages scroll across the video on live streams. The button in the "
                        + "player's top right corner switches this too.");
        addSwitch(screen, Settings.DANMAKU_PORTRAIT, "Show in portrait",
                "Comments also scroll on the video above chat when the phone is upright.");
        addSwitch(screen, Settings.DANMAKU_MINI_PLAYER, "Show in the mini player",
                "Comments also scroll in the small player that stays on screen while you "
                        + "browse Twitch.");
        addSwitch(screen, Settings.DANMAKU_PICTURE_IN_PICTURE, "Show in picture in picture",
                "Comments also scroll in the floating window shown over other apps.");
        addSwitch(screen, Settings.DANMAKU_HIDE_LANDSCAPE_CHAT, "Hide the chat in landscape",
                "Hides the chat button in landscape and keeps the landscape chat off, so the "
                        + "stream fills the screen without a chat overlay.");
        addSlider(screen, Settings.DANMAKU_ROWS, 1, "Rows",
                value -> value + " rows. The text size follows from this.");
        addSlider(screen, Settings.DANMAKU_AREA, 5, "Area",
                value -> "Top " + value + "% of the video");
        addSlider(screen, Settings.DANMAKU_DURATION, 500, "Time on screen",
                value -> String.format(Locale.ROOT, "%.1f seconds", value / 1000f));
        addSlider(screen, Settings.DANMAKU_MAX_COMMENTS, 10, "Maximum comments",
                value -> "Up to " + value + " comments on screen at once. Later messages are "
                        + "skipped until there is room.");

        fontPreference = new FontPreference(getActivity(), this, Settings.DANMAKU_FONT);
        fontPreference.setTitle("Font");
        screen.addPreference(fontPreference);

        addSlider(screen, Settings.DANMAKU_FONT_WEIGHT, 100, "Font weight",
                value -> value + " (" + WEIGHT_NAMES[value / 100 - 1] + ")");
        addColor(screen, Settings.DANMAKU_TEXT_COLOR, "Text color");
        addColor(screen, Settings.DANMAKU_OUTLINE_COLOR, "Outline color");
        addSlider(screen, Settings.DANMAKU_OUTLINE_WIDTH, 1, "Outline width",
                value -> value == 0 ? "No outline" : value + "% of the text size");
        addSlider(screen, Settings.DANMAKU_OPACITY, 5, "Opacity",
                value -> value + "%");
    }

    private void addAdsSettings(PreferenceScreen screen) {
        addSwitch(screen, Settings.BLOCK_ADS, "Block ads",
                "Blocks live, VOD and display ads. Ads that are part of the stream itself are "
                        + "covered with a black screen and muted until they end.");

        Preference proxy = new TextPreference(screen.getContext(), Settings.ADS_PROXY_URL,
                "https://example.com/live/{channel}",
                "Not set. Ads are blocked on the device only.");
        proxy.setTitle("Proxy URL");
        screen.addPreference(proxy);

        Preference note = new Preference(screen.getContext());
        note.setSummary("Optional. Live streams are loaded through this proxy, which can remove "
                + "the ads that are part of the stream. {channel} is replaced with the channel "
                + "name; without it, the name is added to the end.\n\n"
                + "With a proxy, the ad-free viewing of your subscriptions and Turbo no longer "
                + "applies, and the proxy's operator can see which channels you watch. If the "
                + "proxy fails, uyu shows \"Proxy failed\" and blocks ads on the device only.");
        note.setSelectable(false);
        screen.addPreference(note);
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View list = super.onCreateView(inflater, container, savedInstanceState);
        if (!SECTION_DANMAKU.equals(section)) return list;

        // The preview stays above the list, so it is visible while any setting is changed.
        LinearLayout layout = new LinearLayout(getActivity());
        layout.setOrientation(LinearLayout.VERTICAL);
        LinearLayout.LayoutParams previewParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        // The preview is narrower than the screen in landscape.
        previewParams.gravity = Gravity.CENTER_HORIZONTAL;
        layout.addView(new DanmakuPreview(getActivity()), previewParams);
        layout.addView(list, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));
        return layout;
    }

    @Override
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        view.setBackgroundColor(SettingsUi.backgroundColor(view.getContext()));
        view.setClickable(true);
    }

    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode == FontPreference.REQUEST_IMPORT_FONT && fontPreference != null) {
            fontPreference.onActivityResult(resultCode, data);
            return;
        }
        super.onActivityResult(requestCode, resultCode, data);
    }

    @Override
    public void onResume() {
        super.onResume();
        Activity activity = getActivity();
        TextView title = activity == null ? null : SettingsPatch.findToolbarTitle(activity);
        if (title == null) return;
        if (previousTitle == null) previousTitle = title.getText();
        title.setText(title(section));
    }

    @Override
    public void onDestroyView() {
        Activity activity = getActivity();
        TextView title = activity == null ? null : SettingsPatch.findToolbarTitle(activity);
        if (title != null && previousTitle != null) title.setText(previousTitle);
        super.onDestroyView();
    }

    private static String title(String section) {
        if (section == null) return SettingsPatch.TITLE;
        switch (section) {
            case SECTION_GENERAL:
                return "General";
            case SECTION_APPEARANCE:
                return "Appearance";
            case SECTION_DANMAKU:
                return "Danmaku";
            case SECTION_ADS:
                return "Ads";
            default:
                return SettingsPatch.TITLE;
        }
    }

    private static void addSwitch(PreferenceGroup group, BooleanSetting setting,
                                  String title, String summary) {
        SwitchPreference preference = new SwitchPreference(group.getContext());
        preference.setKey(setting.key);
        preference.setDefaultValue(setting.defaultValue);
        preference.setTitle(title);
        preference.setSummary(summary);
        group.addPreference(preference);
    }

    private static void addSlider(PreferenceGroup group, IntSetting setting, int step,
                                  String title, SliderPreference.Formatter formatter) {
        Preference preference = new SliderPreference(group.getContext(), setting, step, formatter);
        preference.setTitle(title);
        group.addPreference(preference);
    }

    private static void addColor(PreferenceGroup group, IntSetting setting, String title) {
        Preference preference = new ColorPreference(group.getContext(), setting);
        preference.setTitle(title);
        group.addPreference(preference);
    }
}
