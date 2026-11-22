package dev.utaa.linimal.extension.features.font;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.nio.charset.StandardCharsets;

/** 手持ちのフォントの検証、要求の判定、起動の失敗の扱いを確かめます。 */
public final class CustomFontTest {
    private static final String LINE = "jp.naver.line.android";

    @Test
    public void trueTypeOpenTypeAndCollectionsAreAccepted() {
        assertTrue(CustomFontFiles.hasFontSignature(new byte[] {0x00, 0x01, 0x00, 0x00}));
        assertTrue(CustomFontFiles.hasFontSignature(ascii("OTTO")));
        assertTrue(CustomFontFiles.hasFontSignature(ascii("true")));
        assertTrue(CustomFontFiles.hasFontSignature(ascii("ttcf")));
    }

    @Test
    public void otherFilesAreRejected() {
        assertFalse(CustomFontFiles.hasFontSignature(ascii("wOFF")));
        assertFalse(CustomFontFiles.hasFontSignature(ascii("wOF2")));
        assertFalse(CustomFontFiles.hasFontSignature(ascii("PK\u0003\u0004")));
        assertFalse(CustomFontFiles.hasFontSignature(new byte[] {0x00, 0x01}));
        assertFalse(CustomFontFiles.hasFontSignature(null));
    }

    @Test
    public void filesOverTheLimitAreRejected() {
        assertFalse(CustomFontFiles.exceedsLimit(CustomFontFiles.MAX_FONT_BYTES));
        assertTrue(CustomFontFiles.exceedsLimit(CustomFontFiles.MAX_FONT_BYTES + 1));
    }

    @Test
    public void displayNamesDropControlCharacters() {
        assertEquals("NotoSans.ttf", CustomFontFiles.sanitizeDisplayName(" Noto\nSans.ttf\u0000 "));
        assertNull(CustomFontFiles.sanitizeDisplayName("\n\t"));
        assertNull(CustomFontFiles.sanitizeDisplayName(null));
    }

    @Test
    public void onlyTheSelectedFontOfTheOwnPremiumProviderIsReplaced() {
        assertTrue(CustomFontHooks.isSelectedFontRequest(LINE, LINE + ".premiumfont", "-1"));
        // 公式の設定画面の確認やプレビューは、ID を指定して問い合わせます。
        assertFalse(CustomFontHooks.isSelectedFontRequest(LINE, LINE + ".premiumfont", "112"));
        assertFalse(CustomFontHooks.isSelectedFontRequest(LINE, LINE + ".premiumfont", "212"));
        // ホーム用のダウンロードフォントと、別アプリの provider は対象外です。
        assertFalse(CustomFontHooks.isSelectedFontRequest(LINE, LINE + ".fonts", "-1"));
        assertFalse(CustomFontHooks.isSelectedFontRequest(LINE, "com.example.premiumfont", "-1"));
        assertFalse(CustomFontHooks.isSelectedFontRequest(LINE, null, "-1"));
        assertFalse(CustomFontHooks.isSelectedFontRequest(null, LINE + ".premiumfont", "-1"));
    }

    @Test
    public void unconfiguredHooksKeepTheOriginalBehavior() {
        // この単体テストでは LinimalConfig も Application もないため、元の結果を返します。
        assertTrue(CustomFontHooks.shouldApplyPremiumFontTheme(true));
        assertFalse(CustomFontHooks.shouldApplyPremiumFontTheme(false));
        assertNull(CustomFontHooks.openSelectedFont(null));
    }

    @Test
    public void repeatedUnstableLaunchesStopTheCustomFont() {
        assertFalse(CustomFontGuard.isBlocked(0));
        assertFalse(CustomFontGuard.isBlocked(CustomFontGuard.MAX_UNSTABLE_LAUNCHES - 1));
        assertTrue(CustomFontGuard.isBlocked(CustomFontGuard.MAX_UNSTABLE_LAUNCHES));
    }

    @Test
    public void unreadableCountersAreTreatedAsStable() {
        assertEquals(0, CustomFontGuard.parse(null));
        assertEquals(0, CustomFontGuard.parse("broken"));
        assertEquals(0, CustomFontGuard.parse("-3"));
        assertEquals(2, CustomFontGuard.parse(" 2\n"));
    }

    private static byte[] ascii(String value) {
        return value.getBytes(StandardCharsets.ISO_8859_1);
    }
}
