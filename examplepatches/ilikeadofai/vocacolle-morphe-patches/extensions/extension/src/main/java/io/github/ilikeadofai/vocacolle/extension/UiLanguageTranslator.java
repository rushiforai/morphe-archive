package io.github.ilikeadofai.vocacolle.extension;

import io.github.ilikeadofai.vocacolle.extension.settings.DisplayLanguage;
import java.util.Collections;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/** Display-only translations for exact, stable VocaColle UI metadata and literals. */
@SuppressWarnings("unused")
public final class UiLanguageTranslator {
    private static final Map<String, LocalizedText> HARDCODED_STRINGS;
    private static final Map<String, LocalizedText> RANKING_LABELS;
    private static final Map<String, LocalizedText> PUSH_TITLES;
    private static final Map<String, LocalizedText> PUSH_DESCRIPTIONS;

    static {
        Map<String, LocalizedText> hardcodedStrings = new HashMap<>();
        hardcodedStrings.put("リンク先に遷移する", text("Open link", "외부 링크로 이동"));
        hardcodedStrings.put("OK", text("OK", "확인"));
        hardcodedStrings.put("Cancel", text("Cancel", "취소"));
        hardcodedStrings.put("ダウンロード", text("Download", "다운로드"));
        hardcodedStrings.put(
                "「ロキ」「シャルル」「Tell Your World」「ハッピーシンセサイザ」などの名曲を3DMV付きで多数収録！"
                        + "SEGA×Colorful Paletteが贈る、誰でもかんたんに楽しめるリズムゲーム。",
                text(
                        "Featuring many hit songs, including “Roki,” “Charles,” “Tell Your World,” "
                                + "and “Happy Synthesizer,” with 3D music videos! A rhythm game from "
                                + "SEGA × Colorful Palette that anyone can easily enjoy.",
                        "‘로키’, ‘샤를’, ‘Tell Your World’, ‘해피 신시사이저’ 등의 명곡을 3D MV와 함께 다수 수록! "
                                + "SEGA×Colorful Palette가 선사하는 누구나 쉽고 재미있게 즐길 수 있는 리듬 게임."
                )
        );
        hardcodedStrings.put(
                "初音ミクも登場する新作リズムゲーム",
                text("A new rhythm game featuring Hatsune Miku", "하츠네 미쿠도 등장하는 신작 리듬 게임")
        );
        hardcodedStrings.put(
                "プロジェクトセカイ カラフルステージ！ feat. 初音ミク",
                text(
                        "Project SEKAI COLORFUL STAGE! feat. Hatsune Miku",
                        "프로젝트 세카이 컬러풀 스테이지! feat. 하츠네 미쿠"
                )
        );
        HARDCODED_STRINGS = Collections.unmodifiableMap(hardcodedStrings);

        Map<String, LocalizedText> rankingLabels = new HashMap<>();
        rankingLabels.put("音楽・サウンド", text("Music & Sound", "음악·사운드"));
        rankingLabels.put("ニコニコインディーズ", text("Niconico Indies", "니코니코 인디즈"));
        rankingLabels.put("演奏してみた", text("Played It", "연주해 보았다"));
        rankingLabels.put("歌ってみた", text("Sang It", "불러보았다"));
        rankingLabels.put("音楽", text("Music", "음악"));
        rankingLabels.put("東方", text("Touhou", "동방"));
        rankingLabels.put("ラジオ", text("Radio", "라디오"));
        RANKING_LABELS = Collections.unmodifiableMap(rankingLabels);

        Map<String, LocalizedText> pushTitles = new HashMap<>();
        pushTitles.put("vocacolle_info", text("News from the Team", "운영팀 공지"));
        pushTitles.put("vocacolle_feature", text("VocaColle Features & Tips", "보카코레 기능과 팁"));
        pushTitles.put("vocacolle_recommend", text("Recommended Works", "추천 작품"));
        PUSH_TITLES = Collections.unmodifiableMap(pushTitles);
        PUSH_DESCRIPTIONS = Collections.emptyMap();
    }

    private UiLanguageTranslator() {
    }

    public static String translateHardcoded(String source) {
        return translateHardcoded(currentLanguage(), source);
    }

    static String translateHardcoded(DisplayLanguage language, String source) {
        return translatedOrSource(HARDCODED_STRINGS, source, source, language);
    }

    public static String translateRanking(String source) {
        return translateRanking(currentLanguage(), source);
    }

    static String translateRanking(DisplayLanguage language, String source) {
        if (source == null) {
            return null;
        }
        DisplayLanguage resolvedLanguage = resolveLanguage(language);
        if (resolvedLanguage == DisplayLanguage.JAPANESE) {
            return source;
        }
        String normalized = source
                .replace("\u200B", "")
                .replace("\uFEFF", "")
                .trim();
        LocalizedText exact = RANKING_LABELS.get(normalized);
        if (exact != null) {
            return exact.forLanguage(resolvedLanguage);
        }
        return source;
    }

    public static String translatePushTitle(String stableName, String source) {
        return translatePushTitle(currentLanguage(), stableName, source);
    }

    static String translatePushTitle(
            DisplayLanguage language,
            String stableName,
            String source
    ) {
        return translatedOrSource(PUSH_TITLES, stableName, source, language);
    }

    public static String translatePushDescription(String stableName, String source) {
        return translatePushDescription(currentLanguage(), stableName, source);
    }

    static String translatePushDescription(
            DisplayLanguage language,
            String stableName,
            String source
    ) {
        return translatedOrSource(PUSH_DESCRIPTIONS, stableName, source, language);
    }

    private static String translatedOrSource(
            Map<String, LocalizedText> translations,
            String lookupKey,
            String source,
            DisplayLanguage language
    ) {
        if (source == null || lookupKey == null) {
            return source;
        }
        DisplayLanguage resolvedLanguage = resolveLanguage(language);
        if (resolvedLanguage == DisplayLanguage.JAPANESE) {
            return source;
        }
        LocalizedText translated = translations.get(lookupKey);
        return translated != null ? translated.forLanguage(resolvedLanguage) : source;
    }

    private static DisplayLanguage currentLanguage() {
        String language = Locale.getDefault().getLanguage();
        if (Locale.ENGLISH.getLanguage().equals(language)) {
            return DisplayLanguage.ENGLISH;
        }
        if (Locale.KOREAN.getLanguage().equals(language)) {
            return DisplayLanguage.KOREAN;
        }
        return DisplayLanguage.JAPANESE;
    }

    private static DisplayLanguage resolveLanguage(DisplayLanguage language) {
        return language == null || language == DisplayLanguage.SYSTEM ? currentLanguage() : language;
    }

    private static LocalizedText text(String english, String korean) {
        return new LocalizedText(english, korean);
    }

    private static final class LocalizedText {
        private final String english;
        private final String korean;

        private LocalizedText(String english, String korean) {
            this.english = english;
            this.korean = korean;
        }

        private String forLanguage(DisplayLanguage language) {
            return language == DisplayLanguage.KOREAN ? korean : english;
        }
    }
}
