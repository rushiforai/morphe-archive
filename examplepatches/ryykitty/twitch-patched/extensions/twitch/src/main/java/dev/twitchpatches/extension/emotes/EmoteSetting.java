package dev.twitchpatches.extension.emotes;

import dev.twitchpatches.extension.settings.SettingSection;
import dev.twitchpatches.extension.settings.ToggleSetting;

final class EmoteSetting implements ToggleSetting {
    @Override public String key() { return "third_party_emotes"; }
    @Override public String title() { return "BTTV and 7TV emotes"; }
    @Override public String summary() { return "Show global and channel emotes in live chat. Send emotes by typing their names."; }
    @Override public SettingSection section() { return SettingSection.CHAT; }
    @Override public boolean isEnabled() { return EmoteRuntime.enabled(); }
    @Override public void setEnabled(boolean enabled) { EmoteRuntime.setEnabled(enabled); }
}
