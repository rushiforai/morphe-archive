package dev.utaa.linimal.extension.features.font;

import android.content.Context;
import android.content.pm.ProviderInfo;
import android.os.Process;

import dev.utaa.linimal.extension.config.LinimalConfig;
import dev.utaa.linimal.extension.config.LinimalConfigHealth;

/**
 * androidx の FontProvider が、フォントを配る ContentProvider の署名を照合する処理に割り込みます。
 *
 * <p>LINE は公式のフォント設定のフォントを、LINE 自身の provider（{@code <package>.premiumfont}）から
 * downloadable font として読み込みます。照合は provider を持つアプリの署名を公式証明書と比べるため、
 * 再署名した LINE では一致せず、フォントを適用できません。ここでは LINE 自身の provider に限って照合を
 * 通します。条件は ADR 0005 のとおりで、ほかの provider の照合は変えません。</p>
 */
public final class FontProviderHooks {
    static final String PREMIUM_FONT_AUTHORITY_SUFFIX = ".premiumfont";
    static final String DOWNLOADABLE_FONT_AUTHORITY_SUFFIX = ".fonts";

    private FontProviderHooks() {
    }

    /**
     * 照合メソッドで、provider の package が要求と一致すると確かめた直後に呼ばれます。
     *
     * <p>「LINE のフォント設定を使えるようにする」か「手持ちのフォントを使う」が ON のときに働きます。
     * true を返すと、署名を比べずにその provider を使います。設定 OFF、未初期化、条件に当たらない、
     * 例外のときは false を返し、元の照合（再署名版では失敗）を続けます。</p>
     */
    public static boolean trustsOwnProvider(ProviderInfo provider) {
        try {
            if (provider == null || provider.applicationInfo == null) {
                return false;
            }
            LinimalConfig config = LinimalConfig.get();
            if (config.getRuntimeHealth() != LinimalConfigHealth.OK
                    || !(config.isOfficialFontsEnabled() || config.isCustomFontEnabled())) {
                return false;
            }
            Context application = FontContext.currentApplication();
            if (application == null) {
                return false;
            }
            return isOwnFontProvider(
                    application.getPackageName(),
                    Process.myUid(),
                    provider.packageName,
                    provider.authority,
                    provider.exported,
                    provider.applicationInfo.uid);
        } catch (Throwable ignored) {
            return false;
        }
    }

    /**
     * provider が LINE 自身のフォント provider かどうか。package と uid が自アプリと一致し、
     * 外部に公開されておらず、authority が {@code <package>.premiumfont} か {@code <package>.fonts} の
     * いずれか 1 つそのものであることを求めます。
     */
    static boolean isOwnFontProvider(
            String ownPackage,
            int ownUid,
            String providerPackage,
            String authority,
            boolean exported,
            int providerUid) {
        if (ownPackage == null || ownPackage.isEmpty() || authority == null || exported) {
            return false;
        }
        if (!ownPackage.equals(providerPackage) || ownUid != providerUid) {
            return false;
        }
        return authority.equals(ownPackage + PREMIUM_FONT_AUTHORITY_SUFFIX)
                || authority.equals(ownPackage + DOWNLOADABLE_FONT_AUTHORITY_SUFFIX);
    }
}
