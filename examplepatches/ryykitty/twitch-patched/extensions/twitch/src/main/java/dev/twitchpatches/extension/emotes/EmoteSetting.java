package dev.twitchpatches.extension.emotes;

import dev.twitchpatches.extension.settings.SettingSection;
import dev.twitchpatches.extension.settings.ToggleSetting;
import dev.twitchpatches.extension.settings.SettingGroup;
import java.util.Arrays;
import java.util.List;

final class EmoteSetting implements SettingGroup {
    @Override public String key() { return "third_party_emotes"; }
    @Override public String title() { return "Emotes"; }
    @Override public String summary() { return "BTTV, FrankerFaceZ and 7TV emotes in chat and the emote picker."; }
    @Override public SettingSection section() { return SettingSection.CHAT; }
    @Override public List<ToggleSetting> children() {
        return Arrays.asList(new ProviderSetting(-1, "Enable all"), new ProviderSetting(0, "BTTV"),
                new ProviderSetting(1, "7TV"), new ProviderSetting(2, "FrankerFaceZ"));
    }

    private static final class ProviderSetting implements ToggleSetting {
        private final int provider;
        private final String title;

        ProviderSetting(int provider, String title) { this.provider = provider; this.title = title; }
        @Override public String key() { return provider < 0 ? "third_party_emotes" : "emote_provider_" + provider; }
        @Override public String title() { return title; }
        @Override public String summary() {
            if (provider >= 0) return "";
            int count = Integer.bitCount(EmoteRuntime.providerMask());
            return count == 3 ? "All providers enabled." : count == 0 ? "All providers disabled." : count + " of 3 providers enabled.";
        }
        @Override public SettingSection section() { return SettingSection.CHAT; }
        @Override public boolean isEnabled() {
            return provider < 0 ? EmoteRuntime.providerMask() == EmotePolicy.ALL : EmoteRuntime.providerEnabled(provider);
        }
        @Override public void setEnabled(boolean enabled) {
            if (provider < 0) EmoteRuntime.setEnabled(enabled);
            else EmoteRuntime.setProviderEnabled(provider, enabled);
        }
    }
}
