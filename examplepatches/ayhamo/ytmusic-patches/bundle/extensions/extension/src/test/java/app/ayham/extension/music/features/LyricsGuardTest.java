package app.ayham.extension.music.features;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.util.Arrays;
import java.util.List;

public class LyricsGuardTest {
    private static final List<String> CHINESE_RAP = Arrays.asList(
            "抛开我的俩个身份不聊rapper不聊hustler",
            "就像我第一眼见你就认定she is my type",
            "我说的每一句话都是真的不是在演戏",
            "不聊TV show magazine cover 只想做你的partner",
            "baby you know that I got you every night");
    private static final List<String> ENGLISH = Arrays.asList(
            "I love you till I die never switch my side",
            "Can't you feel what I'm saying");

    @Test
    public void chineseLyricsForALatinNamedSongAreRefused() {
        assertTrue(LyricsGuard.scriptMismatch("i don't need ur love", "Rumelis, Minzie & Hotel Red", CHINESE_RAP));
    }

    @Test
    public void theRightLyricsPass() {
        assertFalse(LyricsGuard.scriptMismatch("i don't need ur love", "Rumelis, Minzie & Hotel Red", ENGLISH));
    }

    @Test
    public void aSongWithCjkInItsNameKeepsItsLyrics() {
        assertFalse(LyricsGuard.scriptMismatch("晴天", "周杰倫", CHINESE_RAP));
        assertFalse(LyricsGuard.scriptMismatch("Love Story", "林俊傑", CHINESE_RAP));
    }

    @Test
    public void japaneseAndKoreanLyricsAreNeverRefused() {
        // romanized names, lyrics in Japanese (kanji + kana) or Korean
        assertFalse(LyricsGuard.scriptMismatch("Idol", "YOASOBI", Arrays.asList(
                "無敵の笑顔で荒らすメディア", "知りたいその秘密ミステリアス", "抜けてるとこさえ彼女のエリア")));
        assertFalse(LyricsGuard.scriptMismatch("Spicy", "aespa", Arrays.asList(
                "너는 내 맘을 흔들어", "가끔 내가 너무 매워", "Spicy 한 내 모습이 좋아")));
    }

    @Test
    public void chineseRapFullOfEnglishWordsIsStillChinese() {
        // the stored Luna match: 447 Chinese characters against 1003 Latin letters, Chinese on most lines
        assertTrue(LyricsGuard.scriptMismatch("i don't need ur love", "Rumelis", Arrays.asList(
                "抛开我的俩个身份不聊rapper不聊hustler", "不聊TV show magazine cover 只想做你的partner",
                "Baby I just wanna stay with you all night long", "就像我第一眼见你就认定she is my type",
                "我会给你所有的love and all my time")));
    }

    @Test
    public void aChinesePlaceholderForAnInstrumentalIsRefused() {
        // a Chinese provider's "instrumental, please enjoy" for Hans Zimmer's Cornfield Chase
        assertTrue(LyricsGuard.scriptMismatch("Cornfield Chase", "Hans Zimmer", Arrays.asList("纯音乐，请欣赏")));
    }

    @Test
    public void aFewChineseWordsInEnglishLyricsPass() {
        assertFalse(LyricsGuard.scriptMismatch("Song", "Artist", Arrays.asList(
                "We dance all night in the city lights", "you say 我爱你 and I smile", "never let me go tonight")));
    }
}
