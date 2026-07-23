package io.github.ilikeadofai.vocacolle.extension;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import org.junit.Test;

public class ServerUiKoreanTranslatorTest {
    @Test
    public void translatesWhitelistedRankingLabelsAndTags() {
        assertEquals("불러보았다", ServerUiKoreanTranslator.translateRanking("歌ってみた"));
        assertEquals("음악", ServerUiKoreanTranslator.translateRanking("音楽"));
        assertEquals("니코니코 인디즈", ServerUiKoreanTranslator.translateRanking("ニコニコインディーズ"));
        assertEquals("연주해 보았다", ServerUiKoreanTranslator.translateRanking("演奏してみた"));
        assertEquals("음악·사운드", ServerUiKoreanTranslator.translateRanking("音楽・サウンド"));
        assertEquals("동방", ServerUiKoreanTranslator.translateRanking("東方"));
        assertEquals("라디오", ServerUiKoreanTranslator.translateRanking("ラジオ"));
        assertEquals("VOCALOID", ServerUiKoreanTranslator.translateRanking("VOCALOID"));
        assertEquals("ASMR", ServerUiKoreanTranslator.translateRanking("ASMR"));
    }

    @Test
    public void preservesUnknownRankingContentAndNull() {
        assertEquals("曲名は翻訳しない", ServerUiKoreanTranslator.translateRanking("曲名は翻訳しない"));
        assertNull(ServerUiKoreanTranslator.translateRanking(null));
    }

    @Test
    public void normalizesServerRankingLabelWrappersWithinTheRankingDisplayBoundary() {
        assertEquals("불러보았다", ServerUiKoreanTranslator.translateRanking("\u200B歌ってみた\uFEFF"));
        assertEquals("음악·사운드", ServerUiKoreanTranslator.translateRanking("ジャンル: 音楽・サウンド"));
    }

    @Test
    public void translatesPushTitlesByStableNameOnly() {
        assertEquals("운영팀 공지", ServerUiKoreanTranslator.translatePushTitle("vocacolle_info", "運営からのお知らせ"));
        assertEquals("보카코레 기능과 팁", ServerUiKoreanTranslator.translatePushTitle("vocacolle_feature", "ボカコレの機能とヒント"));
        assertEquals("추천 작품", ServerUiKoreanTranslator.translatePushTitle("vocacolle_recommend", "おすすめの作品"));
    }

    @Test
    public void preservesUnknownPushTopicsAndDescriptions() {
        assertEquals("新しい項目", ServerUiKoreanTranslator.translatePushTitle("future_topic", "新しい項目"));
        assertEquals("説明", ServerUiKoreanTranslator.translatePushDescription("future_topic", "説明"));
        assertNull(ServerUiKoreanTranslator.translatePushDescription("vocacolle_info", null));
    }
}