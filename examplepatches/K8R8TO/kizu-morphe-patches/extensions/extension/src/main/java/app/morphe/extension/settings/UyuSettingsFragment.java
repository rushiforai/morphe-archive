package app.morphe.extension.settings;

import android.app.Activity;
import android.app.AlertDialog;
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

@SuppressWarnings("deprecation")
public class UyuSettingsFragment extends PreferenceFragment {
    static final String SECTION_GENERAL = "general";
    static final String SECTION_APPEARANCE = "appearance";
    static final String SECTION_DANMAKU = "danmaku";
    static final String SECTION_ADS = "ads";
    static final String SECTION_EMOTES = "emotes";
    static final String SECTION_CHAT = "chat";
    static final String SECTION_PRIVACY = "privacy";
    private static final String ARG_SECTION = "section";
    private static final String[] WEIGHT_NAMES = {
            "Thin", "Extra light", "Light", "Regular", "Medium", "Semi bold", "Bold", "Extra bold", "Black",
    };
    private String section;
    private CharSequence previousTitle;
    private FontPreference fontPreference;

    private static final String[] PROXY_NAMES = {
            "Default (Luminous EU2)",
            "Luminous EU (Russia)",
            "Luminous EU2 (Ukraine)",
            "Luminous EU3 (Bulgaria)",
            "Luminous Asia (Kazakhstan)",
            "PerfProd EU",
            "PerfProd EU2",
            "PerfProd EU3 (Russia)",
            "PerfProd EU4",
            "PerfProd EU5",
            "PerfProd NA (Phoenix)",
            "PerfProd Asia",
            "PerfProd South America (New York)",
    };

    private static final String[] PROXY_URLS = {
            "",
            "https://eu.luminous.dev/live/{channel}?allow_source=true&allow_audio_only=true&fast_bread=true",
            "https://eu2.luminous.dev/live/{channel}?allow_source=true&allow_audio_only=true&fast_bread=true",
            "https://eu3.luminous.dev/live/{channel}?allow_source=true&allow_audio_only=true&fast_bread=true",
            "https://as.luminous.dev/live/{channel}?allow_source=true&allow_audio_only=true&fast_bread=true",
            "https://lb-eu.cdn-perfprod.com/live/{channel}?allow_source=true&allow_audio_only=true&fast_bread=true",
            "https://lb-eu2.cdn-perfprod.com/live/{channel}?allow_source=true&allow_audio_only=true&fast_bread=true",
            "https://lb-eu3.cdn-perfprod.com/live/{channel}?allow_source=true&allow_audio_only=true&fast_bread=true",
            "https://lb-eu4.cdn-perfprod.com/live/{channel}?allow_source=true&allow_audio_only=true&fast_bread=true",
            "https://lb-eu5.cdn-perfprod.com/live/{channel}?allow_source=true&allow_audio_only=true&fast_bread=true",
            "https://lb-na.cdn-perfprod.com/live/{channel}?allow_source=true&allow_audio_only=true&fast_bread=true",
            "https://lb-as.cdn-perfprod.com/live/{channel}?allow_source=true&allow_audio_only=true&fast_bread=true",
            "https://lb-sa.cdn-perfprod.com/live/{channel}?allow_source=true&allow_audio_only=true&fast_bread=true",
    };

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
        if (section == null) addSectionLinks(screen);
        else if (section.equals(SECTION_GENERAL)) addGeneralSettings(screen);
        else if (section.equals(SECTION_APPEARANCE)) addAppearanceSettings(screen);
        else if (section.equals(SECTION_DANMAKU)) addDanmakuSettings(screen);
        else if (section.equals(SECTION_ADS)) addAdsSettings(screen);
        else if (section.equals(SECTION_EMOTES)) addEmoteSettings(screen);
        else if (section.equals(SECTION_CHAT)) addChatSettings(screen);
        else if (section.equals(SECTION_PRIVACY)) addPrivacySettings(screen);
    }

    private void addSectionLinks(PreferenceScreen screen) {
        if (PatchStatus.autoClaimChannelPoints()) addSectionLink(screen, SECTION_GENERAL, "Channel points");
        if (PatchStatus.hidePromotions()) addSectionLink(screen, SECTION_APPEARANCE,
                "Subscribe and Bits buttons, gift leaderboard, promotions");
        if (PatchStatus.danmakuComments()) addSectionLink(screen, SECTION_DANMAKU,
                "Chat messages scrolling across the video");
        if (PatchStatus.blockAds()) addSectionLink(screen, SECTION_ADS,
                "Video and display ads, proxy");
        addSectionLink(screen, SECTION_EMOTES, "7TV, BTTV, FFZ and animated emotes");
        addSectionLink(screen, SECTION_CHAT, "Chat controls");
        addSectionLink(screen, SECTION_PRIVACY, "Privacy");
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
        Preference homeTab = new Preference(screen.getContext());
        homeTab.setTitle("Default Home Tab");
        homeTab.setSummary(homeTabName(Settings.DEFAULT_HOME_TAB.get()));
        homeTab.setOnPreferenceClickListener(clicked -> {
            Activity activity = getActivity();
            if (activity == null) return true;
            String[] names = {"Following", "Live", "Clips"};
            String[] values = {"following", "live", "clips"};
            String current = Settings.DEFAULT_HOME_TAB.get();
            int selected = homeTabIndex(current);
            new AlertDialog.Builder(activity)
                    .setTitle("Default Home Tab")
                    .setSingleChoiceItems(names, selected, (dialog, which) -> {
                        Settings.DEFAULT_HOME_TAB.save(values[which]);
                        homeTab.setSummary(names[which]);
                        dialog.dismiss();
                    })
                    .setNegativeButton(android.R.string.cancel, null)
                    .show();
            return true;
        });
        screen.addPreference(homeTab);

        if (PatchStatus.autoClaimChannelPoints()) addSwitch(screen, Settings.AUTO_CLAIM_CHANNEL_POINTS,
                "Auto claim channel points", "Claims the bonus chest on the channel you are watching.");
    }

    private static int homeTabIndex(String value) {
        if ("live".equalsIgnoreCase(value)) return 1;
        if ("clips".equalsIgnoreCase(value)) return 2;
        return 0;
    }

    private static String homeTabName(String value) {
        if ("live".equalsIgnoreCase(value)) return "Live";
        if ("clips".equalsIgnoreCase(value)) return "Clips";
        return "Following";
    }

    private void addAppearanceSettings(PreferenceScreen screen) {
        addSwitch(screen, Settings.HIDE_SUBSCRIBE_BUTTONS, "Hide the subscribe and Bits buttons",
                "Hides the row above chat with the Bits, gift a sub and subscribe buttons.");
        addSwitch(screen, Settings.HIDE_CHAT_BITS_BUTTON, "Hide the Bits button in the chat box",
                "Hides the Bits button next to the emote button.");
        addSwitch(screen, Settings.HIDE_GIFT_LEADERBOARD, "Hide the gift leaderboard",
                "Hides the ranking of top gifters and cheerers above chat.");
        addSwitch(screen, Settings.HIDE_SUBSCRIPTION_PROMOTIONS, "Hide subscription promotions",
                "Hides the banners that advertise subscription and gift discounts and SUBtember, above the player and above chat, and the banner that advertises Turbo.");
        Preference note = new Preference(screen.getContext());
        note.setSummary("Items you show again appear the next time you open a stream.");
        note.setSelectable(false);
        screen.addPreference(note);
    }

    private void addDanmakuSettings(PreferenceScreen screen) {
        addSwitch(screen, Settings.DANMAKU_ENABLED, "Danmaku comments",
                "Chat messages scroll across the video on live streams. The button in the player's top right corner switches this too.");
        addSwitch(screen, Settings.DANMAKU_PORTRAIT, "Show in portrait",
                "Comments also scroll on the video above chat when the phone is upright.");
        addSwitch(screen, Settings.DANMAKU_MINI_PLAYER, "Show in the mini player",
                "Comments also scroll in the small player that stays on screen while you browse Twitch.");
        addSwitch(screen, Settings.DANMAKU_PICTURE_IN_PICTURE, "Show in picture in picture",
                "Comments also scroll in the floating window shown over other apps.");
        addSwitch(screen, Settings.DANMAKU_HIDE_LANDSCAPE_CHAT, "Hide the chat in landscape",
                "Hides the chat button in landscape and keeps the landscape chat off, so the stream fills the screen without a chat overlay.");
        addSlider(screen, Settings.DANMAKU_ROWS, 1, "Rows", value -> value + " rows. The text size follows from this.");
        addSlider(screen, Settings.DANMAKU_AREA, 5, "Area", value -> "Top " + value + "% of the video");
        addSlider(screen, Settings.DANMAKU_DURATION, 500, "Time on screen", value -> String.format(Locale.ROOT, "%.1f seconds", value / 1000f));
        addSlider(screen, Settings.DANMAKU_MAX_COMMENTS, 10, "Maximum comments", value -> "Up to " + value + " comments on screen at once. Later messages are skipped until there is room.");
        fontPreference = new FontPreference(getActivity(), this, Settings.DANMAKU_FONT);
        fontPreference.setTitle("Font");
        screen.addPreference(fontPreference);
        addSlider(screen, Settings.DANMAKU_FONT_WEIGHT, 100, "Font weight", value -> value + " (" + WEIGHT_NAMES[value / 100 - 1] + ")");
        addColor(screen, Settings.DANMAKU_TEXT_COLOR, "Text color");
        addColor(screen, Settings.DANMAKU_OUTLINE_COLOR, "Outline color");
        addSlider(screen, Settings.DANMAKU_OUTLINE_WIDTH, 1, "Outline width", value -> value == 0 ? "No outline" : value + "% of the text size");
        addSlider(screen, Settings.DANMAKU_OPACITY, 5, "Opacity", value -> value + "%");
    }

    private void addAdsSettings(PreferenceScreen screen) {
        addSwitch(screen, Settings.BLOCK_ADS, "Block ads",
                "Blocks live, VOD and display ads. Ads that are part of the stream itself are covered with a black screen and muted until they end.");

        Preference proxySelector = new Preference(screen.getContext());
        proxySelector.setTitle("Proxy");
        proxySelector.setSummary(proxyName(Settings.ADS_PROXY_URL.get()));
        proxySelector.setOnPreferenceClickListener(clicked -> {
            Activity activity = getActivity();
            if (activity == null) return true;
            String current = Settings.ADS_PROXY_URL.get();
            int selected = proxyIndex(current);
            new AlertDialog.Builder(activity)
                    .setTitle("Ad-blocking proxy")
                    .setSingleChoiceItems(PROXY_NAMES, selected, (dialog, which) -> {
                        Settings.ADS_PROXY_URL.save(PROXY_URLS[which]);
                        proxySelector.setSummary(PROXY_NAMES[which]);
                        dialog.dismiss();
                    })
                    .setNegativeButton(android.R.string.cancel, null)
                    .show();
            return true;
        });
        screen.addPreference(proxySelector);

        Preference proxy = new TextPreference(screen.getContext(), Settings.ADS_PROXY_URL,
                "https://example.com/live/{channel}?allow_source=true&allow_audio_only=true&fast_bread=true",
                "Using the built-in default: Luminous EU2. Edit to use a custom proxy URL.");
        proxy.setTitle("Proxy URL");
        screen.addPreference(proxy);

        Preference note = new Preference(screen.getContext());
        note.setSummary("Optional. Live streams are loaded through the selected proxy, which can remove the ads that are part of the stream. {channel} is replaced with the channel name; without it, the name is added to the end.\n\nPublic proxies can go offline or change behavior. The proxy operator can see which channels you watch. If the proxy fails, uyu shows Proxy failed and falls back to Twitch while device-side ad blocking remains active.");
        note.setSelectable(false);
        screen.addPreference(note);
    }

    private static int proxyIndex(String value) {
        for (int i = 0; i < PROXY_URLS.length; i++) {
            if (PROXY_URLS[i].equals(value)) return i;
        }
        return -1;
    }

    private static String proxyName(String value) {
        int index = proxyIndex(value);
        return index >= 0 ? PROXY_NAMES[index] : "Custom proxy URL";
    }

    private void addEmoteSettings(PreferenceScreen screen) {
        addSwitch(screen, Settings.EMOTES_THIRD_PARTY, "3rd party emotes",
                "Show 7TV, BTTV and FFZ emotes in live chat.");
        addSwitch(screen, Settings.EMOTES_ANIMATED, "Animated emotes", "Play animated third-party emotes. Turn this off to use static frames.");
        addSwitch(screen, Settings.EMOTES_PICKER, "Third-party emote menu", "Show the separate Kizu third-party emote menu when the Twitch emote button is opened.");
        addSwitch(screen, Settings.EMOTES_AUTOCOMPLETE, "Third-party autocomplete", "Offer third-party emote names while typing in chat.");
        addSwitch(screen, Settings.EMOTES_ZERO_WIDTH, "Zero-width emotes", "Allow third-party overlay emotes marked as zero-width.");
    }

    private void addChatSettings(PreferenceScreen screen) {
        addSwitch(screen, Settings.CHAT_DELETED_MESSAGES, "Deleted messages", "Control whether deleted chat messages remain visible locally.");
        addSwitch(screen, Settings.CHAT_TIMESTAMPS, "Chat timestamps", "Show timestamps on chat messages.");
        addSwitch(screen, Settings.CHAT_MENTION_HIGHLIGHT, "Highlight on mention",
                "Highlight chat messages that directly mention your account.");
        addColor(screen, Settings.CHAT_MENTION_HIGHLIGHT_COLOR, "Highlight color");
        addSwitch(screen, Settings.CHAT_MENTION_SOUND, "Play sound on mention",
                "Play a short notification sound when a new chat message directly mentions your account.");
        addSlider(screen, Settings.CHAT_MENTION_SOUND_COOLDOWN_MS, 1000, "Sound cooldown",
                value -> value == 0 ? "No cooldown" : (value / 1000) + " seconds between sounds.");
        addSwitch(screen, Settings.LANDSCAPE_CHAT_SIZE_ENABLED, "Landscape chat size", "Use the custom landscape chat width.");
        addSlider(screen, Settings.LANDSCAPE_CHAT_SIZE, 5, "Landscape chat width", value -> value + "% of the screen");
        addSwitch(screen, Settings.LANDSCAPE_CHAT_OPACITY_ENABLED, "Landscape chat opacity", "Use the custom landscape chat opacity.");
        addSlider(screen, Settings.LANDSCAPE_CHAT_OPACITY, 5, "Landscape chat opacity", value -> value + "%");
    }

    private void addPrivacySettings(PreferenceScreen screen) {
        addSwitch(screen, Settings.DISABLE_COMSCORE, "Disable Comscore", "Prevent Twitch's Comscore measurement component from starting.");
        addSwitch(screen, Settings.DISABLE_BUGSNAG, "Disable crash reporting", "Prevent Twitch's crash-reporting component from collecting reports.");
    }

    @Override public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View list = super.onCreateView(inflater, container, savedInstanceState);
        if (!SECTION_DANMAKU.equals(section)) return list;
        LinearLayout layout = new LinearLayout(getActivity());
        layout.setOrientation(LinearLayout.VERTICAL);
        LinearLayout.LayoutParams previewParams = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        previewParams.gravity = Gravity.CENTER_HORIZONTAL;
        layout.addView(new DanmakuPreview(getActivity()), previewParams);
        layout.addView(list, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));
        return layout;
    }

    @Override public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        view.setBackgroundColor(SettingsUi.backgroundColor(view.getContext()));
        view.setClickable(true);
    }

    @Override public void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode == FontPreference.REQUEST_IMPORT_FONT && fontPreference != null) {
            fontPreference.onActivityResult(resultCode, data);
            return;
        }
        super.onActivityResult(requestCode, resultCode, data);
    }

    @Override public void onResume() {
        super.onResume();
        Activity activity = getActivity();
        TextView title = activity == null ? null : SettingsPatch.findToolbarTitle(activity);
        if (title == null) return;
        if (previousTitle == null) previousTitle = title.getText();
        title.setText(title(section));
    }

    @Override public void onDestroyView() {
        Activity activity = getActivity();
        TextView title = activity == null ? null : SettingsPatch.findToolbarTitle(activity);
        if (title != null && previousTitle != null) title.setText(previousTitle);
        super.onDestroyView();
    }

    private static String title(String section) {
        if (section == null) return SettingsPatch.TITLE;
        switch (section) {
            case SECTION_GENERAL: return "General";
            case SECTION_APPEARANCE: return "Appearance";
            case SECTION_DANMAKU: return "Danmaku";
            case SECTION_ADS: return "Ads";
            case SECTION_EMOTES: return "Emotes";
            case SECTION_CHAT: return "Chat";
            case SECTION_PRIVACY: return "Privacy";
            default: return SettingsPatch.TITLE;
        }
    }

    private static void addSwitch(PreferenceGroup group, BooleanSetting setting, String title, String summary) {
        SwitchPreference preference = new SwitchPreference(group.getContext());
        preference.setKey(setting.key);
        preference.setDefaultValue(setting.defaultValue);
        preference.setTitle(title);
        preference.setSummary(summary);
        group.addPreference(preference);
    }

    private static void addSlider(PreferenceGroup group, IntSetting setting, int step, String title, SliderPreference.Formatter formatter) {
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
