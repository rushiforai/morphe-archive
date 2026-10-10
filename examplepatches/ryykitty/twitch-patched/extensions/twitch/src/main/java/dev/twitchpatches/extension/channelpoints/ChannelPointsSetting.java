package dev.twitchpatches.extension.channelpoints;

import dev.twitchpatches.extension.settings.ToggleSetting;
import dev.twitchpatches.extension.settings.SettingSection;

final class ChannelPointsSetting implements ToggleSetting {
    @Override public String key() { return "channel_points_auto_claim"; }
    @Override public String title() { return "Auto-claim bonus channel points"; }
    @Override public String summary() { return "Automatically claim bonus channel points while watching live streams."; }
    @Override public SettingSection section() { return SettingSection.CHANNEL_POINTS; }
    @Override public boolean isEnabled() { return ChannelPointsRuntime.isEnabled(); }
    @Override public void setEnabled(boolean enabled) { ChannelPointsRuntime.setEnabled(enabled); }
}
