package io.github.ilikeadofai.vocacolle.extension;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import io.github.ilikeadofai.vocacolle.extension.settings.DisplayLanguage;
import java.util.Locale;
import org.junit.Test;

public class UiLanguageTranslatorTest {
    @Test
    public void translatesHardcodedUiForEnglishAndKorean() {
        assertEquals(
                "Open link",
                UiLanguageTranslator.translateHardcoded(
                        DisplayLanguage.ENGLISH,
                        "リンク先に遷移する"
                )
        );
        assertEquals(
                "외부 링크로 이동",
                UiLanguageTranslator.translateHardcoded(
                        DisplayLanguage.KOREAN,
                        "リンク先に遷移する"
                )
        );
        assertEquals(
                "Project SEKAI COLORFUL STAGE! feat. Hatsune Miku",
                UiLanguageTranslator.translateHardcoded(
                        DisplayLanguage.ENGLISH,
                        "プロジェクトセカイ カラフルステージ！ feat. 初音ミク"
                )
        );
        assertEquals(
                "프로젝트 세카이 컬러풀 스테이지! feat. 하츠네 미쿠",
                UiLanguageTranslator.translateHardcoded(
                        DisplayLanguage.KOREAN,
                        "プロジェクトセカイ カラフルステージ！ feat. 初音ミク"
                )
        );
    }

    @Test
    public void preservesOriginalHardcodedUiForJapaneseAndUnknownStrings() {
        assertEquals(
                "ダウンロード",
                UiLanguageTranslator.translateHardcoded(
                        DisplayLanguage.JAPANESE,
                        "ダウンロード"
                )
        );
        assertEquals(
                "future literal",
                UiLanguageTranslator.translateHardcoded(
                        DisplayLanguage.ENGLISH,
                        "future literal"
                )
        );
        assertNull(UiLanguageTranslator.translateHardcoded(DisplayLanguage.KOREAN, null));
    }

    @Test
    public void translatesWhitelistedServerUiForEnglishKoreanAndJapanese() {
        assertEquals(
                "Music & Sound",
                UiLanguageTranslator.translateRanking(DisplayLanguage.ENGLISH, "音楽・サウンド")
        );
        assertEquals(
                "음악·사운드",
                UiLanguageTranslator.translateRanking(DisplayLanguage.KOREAN, "\u200B音楽・サウンド\uFEFF")
        );
        assertEquals(
                "音楽・サウンド",
                UiLanguageTranslator.translateRanking(DisplayLanguage.JAPANESE, "音楽・サウンド")
        );
        assertEquals(
                "News from the Team",
                UiLanguageTranslator.translatePushTitle(
                        DisplayLanguage.ENGLISH,
                        "vocacolle_info",
                        "運営からのお知らせ"
                )
        );
        assertEquals(
                "운영팀 공지",
                UiLanguageTranslator.translatePushTitle(
                        DisplayLanguage.KOREAN,
                        "vocacolle_info",
                        "運営からのお知らせ"
                )
        );
    }

    @Test
    public void preservesUnknownServerContentAndDescriptions() {
        assertEquals(
                "曲名は翻訳しない",
                UiLanguageTranslator.translateRanking(DisplayLanguage.ENGLISH, "曲名は翻訳しない")
        );
        assertEquals(
                "ジャンル: 音楽・サウンド",
                UiLanguageTranslator.translateRanking(DisplayLanguage.ENGLISH, "ジャンル: 音楽・サウンド")
        );
        assertEquals(
                "新しい項目",
                UiLanguageTranslator.translatePushTitle(
                        DisplayLanguage.ENGLISH,
                        "future_topic",
                        "新しい項目"
                )
        );
        assertEquals(
                "説明",
                UiLanguageTranslator.translatePushDescription(
                        DisplayLanguage.ENGLISH,
                        "future_topic",
                        "説明"
                )
        );
        assertNull(
                UiLanguageTranslator.translatePushDescription(
                        DisplayLanguage.KOREAN,
                        "vocacolle_info",
                        null
                )
        );
    }

    @Test
    public void runtimeEntryPointsFollowTheProcessLocale() {
        Locale original = Locale.getDefault();
        try {
            Locale.setDefault(Locale.ENGLISH);
            assertEquals("Open link", UiLanguageTranslator.translateHardcoded("リンク先に遷移する"));
            Locale.setDefault(Locale.KOREAN);
            assertEquals("외부 링크로 이동", UiLanguageTranslator.translateHardcoded("リンク先に遷移する"));
            Locale.setDefault(Locale.JAPANESE);
            assertEquals("リンク先に遷移する", UiLanguageTranslator.translateHardcoded("リンク先に遷移する"));
        } finally {
            Locale.setDefault(original);
        }
    }
}
