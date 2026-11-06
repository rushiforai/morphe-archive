package dev.twitchpatches.extension.emotes;

import dev.twitchpatches.extension.settings.SettingSection;
import dev.twitchpatches.extension.settings.ToggleSetting;
import dev.twitchpatches.extension.settings.SettingGroup;
import java.util.Arrays;
import java.util.List;

final class EmoteSetting implements SettingGroup {
    @Override public String key() { return "third_party_emotes"; }
    @Override public String title() { return "エモート"; }
    @Override public String summary() { return "チャット、自動補完、エモートピッカーで BTTV、FrankerFaceZ、7TV のエモートを使えるようにします。"; }
    @Override public SettingSection section() { return SettingSection.CHAT; }
    @Override public List<ToggleSetting> children() {
        return Arrays.asList(new ProviderSetting(-1, "すべてのプロバイダーを有効化"), new ProviderSetting(0, "BTTV"),
                new ProviderSetting(1, "7TV"), new ProviderSetting(2, "FrankerFaceZ"), new InlineSetting());
    }

    private static final class InlineSetting implements ToggleSetting {
        @Override public String key() { return "inline_emotes"; }
        @Override public String title() { return "エモートをインライン表示"; }
        @Override public String summary() { return "メッセージ入力欄で、エモート名ではなくエモート画像を表示します。"; }
        @Override public SettingSection section() { return SettingSection.CHAT; }
        @Override public boolean isEnabled() { return EmoteRuntime.inlineEnabled(); }
        @Override public void setEnabled(boolean enabled) { EmoteRuntime.setInlineEnabled(enabled); }
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
            return count == 3 ? "すべてのプロバイダーが有効です。" : count == 0 ? "すべてのプロバイダーが無効です。" : "3件中" + count + "件のプロバイダーが有効です。";
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
