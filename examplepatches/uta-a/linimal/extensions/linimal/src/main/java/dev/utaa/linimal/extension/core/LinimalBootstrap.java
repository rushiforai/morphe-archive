package dev.utaa.linimal.extension.core;

import android.content.Context;

import dev.utaa.linimal.extension.config.LinimalConfigBootstrap;
import dev.utaa.linimal.extension.features.readwithoutreceipt.ChatListMenuHooks;
import dev.utaa.linimal.extension.features.theme.AmoledThemeHooks;
import dev.utaa.linimal.extension.i18n.LinimalText;
import dev.utaa.linimal.extension.settings.SettingsEntryHooks;

/** LINE の Application 初期化から Linimal を一度だけ立ち上げる注入境界。 */
public final class LinimalBootstrap {
    private LinimalBootstrap() {
    }

    /**
     * 注入点。LINE の起動を止めないため、初期化の失敗はここで完全に握りつぶします。
     * 失敗した場合、設定は fail-open のままとなり、hook は元の LINE の挙動を維持します。
     */
    public static void initialize(Context context) {
        if (context == null) {
            return;
        }
        try {
            LinimalText.initialize(context);
        } catch (Throwable ignored) {
            // 文言は端末の既定の言語で表示します。
        }
        try {
            LinimalConfigBootstrap.initialize(context);
        } catch (Throwable ignored) {
            // 設定を読めない場合も元の動作へ委ねます。
        }
        try {
            SettingsEntryHooks.initialize(context);
        } catch (Throwable ignored) {
            // 設定画面への入口が作れないだけで、LINE の機能には影響させません。
        }
        try {
            // 設定の初期化の後、Activity が作られる前に loader を用意します。
            AmoledThemeHooks.initialize(context);
        } catch (Throwable ignored) {
            // 背景色を変えられないだけで、LINE の機能には影響させません。
        }
        try {
            ChatListMenuHooks.initialize(context);
        } catch (Throwable ignored) {
            // ラベル resource を解決できないだけで、LINE の機能には影響させません。
        }
    }
}
