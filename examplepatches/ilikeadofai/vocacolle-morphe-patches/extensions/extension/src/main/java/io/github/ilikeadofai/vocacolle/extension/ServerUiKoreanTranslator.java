package io.github.ilikeadofai.vocacolle.extension;

import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Display-only Korean translations for stable native UI metadata returned by VocaColle servers.
 *
 * <p>This class intentionally uses a narrow whitelist. Unknown strings are returned unchanged so
 * video titles, creator names, tags outside the ranking navigation, URLs, and request identifiers
 * are never translated accidentally.</p>
 */
@SuppressWarnings("unused")
public final class ServerUiKoreanTranslator {
    private static final Map<String, String> RANKING_LABELS;
    private static final Map<String, String> PUSH_TITLES;
    private static final Map<String, String> PUSH_DESCRIPTIONS;

    static {
        Map<String, String> rankingLabels = new LinkedHashMap<>();
        // Longer overlapping labels must come first for the scoped contains fallback.
        rankingLabels.put("音楽・サウンド", "음악·사운드");
        rankingLabels.put("ニコニコインディーズ", "니코니코 인디즈");
        rankingLabels.put("演奏してみた", "연주해 보았다");
        rankingLabels.put("歌ってみた", "불러보았다");
        rankingLabels.put("音楽", "음악");
        rankingLabels.put("東方", "동방");
        rankingLabels.put("ラジオ", "라디오");
        RANKING_LABELS = Collections.unmodifiableMap(rankingLabels);

        Map<String, String> pushTitles = new HashMap<>();
        pushTitles.put("vocacolle_info", "운영팀 공지");
        pushTitles.put("vocacolle_feature", "보카코레 기능과 팁");
        pushTitles.put("vocacolle_recommend", "추천 작품");
        PUSH_TITLES = Collections.unmodifiableMap(pushTitles);

        PUSH_DESCRIPTIONS = Collections.emptyMap();
    }

    private ServerUiKoreanTranslator() {
    }

    public static String translateRanking(String source) {
        if (source == null) {
            return null;
        }

        String normalized = source
                .replace("\u200B", "")
                .replace("\uFEFF", "")
                .trim();
        String exact = RANKING_LABELS.get(normalized);
        if (exact != null) {
            return exact;
        }

        for (Map.Entry<String, String> entry : RANKING_LABELS.entrySet()) {
            if (normalized.contains(entry.getKey())) {
                return entry.getValue();
            }
        }
        return source;
    }

    public static String translatePushTitle(String stableName, String source) {
        return translatedOrSource(PUSH_TITLES, stableName, source);
    }

    public static String translatePushDescription(String stableName, String source) {
        return translatedOrSource(PUSH_DESCRIPTIONS, stableName, source);
    }

    private static String translatedOrSource(
            Map<String, String> translations,
            String lookupKey,
            String source
    ) {
        if (source == null || lookupKey == null) {
            return source;
        }
        String translated = translations.get(lookupKey);
        return translated != null ? translated : source;
    }
}