package dev.utaa.linimal.extension.features.font;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

/** LINE 自身のフォント provider に限って照合を通す条件（ADR 0005）を検証します。 */
public final class FontProviderHooksTest {
    private static final String LINE = "jp.naver.line.android";
    private static final int UID = 10234;

    @Test
    public void unavailableConfigurationKeepsTheOriginalCheck() {
        // この単体テストでは LinimalConfig を初期化しないため、元の照合を続けます。
        assertFalse(FontProviderHooks.trustsOwnProvider(null));
    }

    @Test
    public void ownPremiumAndDownloadableFontProvidersAreTrusted() {
        assertTrue(FontProviderHooks.isOwnFontProvider(LINE, UID, LINE, LINE + ".premiumfont", false, UID));
        assertTrue(FontProviderHooks.isOwnFontProvider(LINE, UID, LINE, LINE + ".fonts", false, UID));
    }

    @Test
    public void otherProvidersKeepTheOriginalCheck() {
        // Google のフォントなど、別アプリの provider。
        assertFalse(FontProviderHooks.isOwnFontProvider(
                LINE, UID, "com.google.android.gms", "com.google.android.gms.fonts", false, 10010));
        // 同じ authority を名乗る別アプリ。
        assertFalse(FontProviderHooks.isOwnFontProvider(
                LINE, UID, "com.example.fake", LINE + ".premiumfont", false, 10500));
        // package 名だけ合わせても、uid が違えば自アプリではない。
        assertFalse(FontProviderHooks.isOwnFontProvider(LINE, UID, LINE, LINE + ".premiumfont", false, 10500));
    }

    @Test
    public void exportedOrUnknownAuthoritiesAreNotTrusted() {
        assertFalse(FontProviderHooks.isOwnFontProvider(LINE, UID, LINE, LINE + ".premiumfont", true, UID));
        assertFalse(FontProviderHooks.isOwnFontProvider(LINE, UID, LINE, LINE + ".fileprovider", false, UID));
        assertFalse(FontProviderHooks.isOwnFontProvider(
                LINE, UID, LINE, LINE + ".premiumfont;" + LINE + ".other", false, UID));
        assertFalse(FontProviderHooks.isOwnFontProvider(LINE, UID, LINE, null, false, UID));
        assertFalse(FontProviderHooks.isOwnFontProvider(null, UID, null, ".premiumfont", false, UID));
        assertFalse(FontProviderHooks.isOwnFontProvider("", UID, "", ".premiumfont", false, UID));
    }
}
