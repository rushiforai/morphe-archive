package io.github.sabopura.morphe.extension.twitch.original;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class SpeechLanguageTest {
    /** Automatic, on a device of that language, with nothing read before. */
    private static String auto(String text, String device) {
        return auto(text, device, "");
    }

    private static String auto(String text, String device, String before) {
        boolean latinDevice = "en".equals(device) || "de".equals(device);
        return SpeechLanguage.of(SpeechLanguage.AUTO, text, device, latinDevice, before);
    }

    @Test
    public void kanaOrKanjiIsReadInJapanese() {
        assertEquals("ja", auto("こんにちは", "en"));
        assertEquals("ja", auto("草", "de"));
        assertEquals("ja", auto("ナイス", "ko"));
    }

    @Test
    public void aJapaneseMessageWithLatinWordsStaysJapanese() {
        assertEquals("ja", auto("それな LUL", "en"));
    }

    @Test
    public void theDevicesOwnLanguageIsItsOwnVoice() {
        assertEquals("", auto("こんにちは", "ja"));
        assertEquals("", auto("你好", "zh"));
        assertEquals("", SpeechLanguage.of(SpeechLanguage.JAPANESE, "hello", "ja", false, ""));
        assertEquals("", SpeechLanguage.of(SpeechLanguage.ENGLISH, "こんにちは", "en", true, ""));
    }

    @Test
    public void latinLettersAreReadInEnglishOnADeviceOfAnotherScript() {
        assertEquals("en", auto("nice one", "ja"));
        assertEquals("en", auto("gg", "ko"));
        assertEquals("en", auto("gg", "iw"));
    }

    @Test
    public void latinLettersKeepTheVoiceOfADeviceThatUsesThem() {
        assertEquals("", auto("gut gespielt", "de"));
        assertEquals("", auto("nice one", "en"));
    }

    @Test
    public void kanjiAloneIsJapaneseUnlessTheDeviceIsChinese() {
        assertEquals("ja", auto("最高", "en"));
        assertEquals("", auto("最高", "zh"));
    }

    @Test
    public void hangulIsReadInKorean() {
        assertEquals("ko", auto("안녕", "ja"));
    }

    @Test
    public void aMessageThatNamesNoLanguageKeepsTheVoiceBeforeIt() {
        assertEquals("en", auto("123 !!", "ja", "en"));
        assertEquals("", auto("123 !!", "ja", ""));
        assertEquals("ko", auto("？？？", "ja", "ko"));
    }

    @Test
    public void laughterAndApplauseAreJapaneseOnAJapaneseDevice() {
        assertEquals("", auto("wwwww", "ja", "en"));
        assertEquals("", auto("ｗｗｗ", "ja", "en"));
        assertEquals("", auto("8888888", "ja", "en"));
        assertEquals("", auto("８８８", "ja", "ko"));
    }

    @Test
    public void laughterElsewhereKeepsTheVoiceBeforeIt() {
        assertEquals("ja", auto("www", "en", "ja"));
        assertEquals("", auto("www", "en", ""));
        assertEquals("en", auto("88", "ja", "en"));
    }

    @Test
    public void laughterBesideWordsFollowsTheWords() {
        assertEquals("en", auto("wow www", "ja"));
    }

    @Test
    public void noMessageIsTheDeviceVoice() {
        assertEquals("", auto(null, "ja", "en"));
    }

    @Test
    public void aFixedChoiceIgnoresTheTextAndTheVoiceBefore() {
        assertEquals("en", SpeechLanguage.of(SpeechLanguage.ENGLISH, "こんにちは", "ja", false, "ko"));
        assertEquals("ja", SpeechLanguage.of(SpeechLanguage.JAPANESE, "hello", "en", true, ""));
        assertEquals("", SpeechLanguage.of(SpeechLanguage.DEVICE, "hello", "ja", false, "en"));
    }

    @Test
    public void addedWordsFollowTheVoice() {
        assertTrue(SpeechLanguage.japanese("ja", "en"));
        assertTrue(SpeechLanguage.japanese("", "ja"));
        assertFalse(SpeechLanguage.japanese("en", "ja"));
        assertFalse(SpeechLanguage.japanese("", "de"));
    }
}
