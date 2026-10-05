package dev.twitchpatches.extension.channelpoints;

import dev.twitchpatches.extension.settings.ToggleSetting;
import dev.twitchpatches.extension.settings.SettingSection;

final class ChannelPointsSetting implements ToggleSetting {
    @Override public String key() { return "channel_points_auto_claim"; }
    @Override public String title() { return "Auto-claim bonus channel points"; }
    @Override public String summary() { return "Collect available bonus points while watching a live stream."; }
    @Override public SettingSection section() { return SettingSection.CHANNEL_POINTS; }
    @Override public boolean isEnabled() { return ChannelPointsRuntime.isEnabled(); }
    @Override public void setEnabled(boolean enabled) { ChannelPointsRuntime.setEnabled(enabled); }
}
