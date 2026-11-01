package dev.jason.gboardpatches.extension.emojifont;

import org.junit.Assert;
import org.junit.Test;

public class GboardEmojiFontRuntimeTest {

    @Test
    public void testIsEmojiOrSymbolDetection() {
        // Common emojis
        Assert.assertTrue(GboardEmojiFontRuntime.isEmojiOrSymbol("😀"));
        Assert.assertTrue(GboardEmojiFontRuntime.isEmojiOrSymbol("🔥"));
        Assert.assertTrue(GboardEmojiFontRuntime.isEmojiOrSymbol("🚀"));
        Assert.assertTrue(GboardEmojiFontRuntime.isEmojiOrSymbol("❤️"));
        Assert.assertTrue(GboardEmojiFontRuntime.isEmojiOrSymbol("🎉"));
        Assert.assertTrue(GboardEmojiFontRuntime.isEmojiOrSymbol("🦄"));

        // Text with emoji
        Assert.assertTrue(GboardEmojiFontRuntime.isEmojiOrSymbol("Hello 😀"));

        // Non-emoji text
        Assert.assertFalse(GboardEmojiFontRuntime.isEmojiOrSymbol("abc"));
        Assert.assertFalse(GboardEmojiFontRuntime.isEmojiOrSymbol("123"));
        Assert.assertFalse(GboardEmojiFontRuntime.isEmojiOrSymbol("Hello world"));
        Assert.assertFalse(GboardEmojiFontRuntime.isEmojiOrSymbol(""));
        Assert.assertFalse(GboardEmojiFontRuntime.isEmojiOrSymbol(null));
    }

    @Test
    public void testDefaultSettingsConstants() {
        Assert.assertEquals("gboard_patches_emoji_font", GboardEmojiFontSettings.PREF_NAME);
        Assert.assertEquals("pref_custom_emoji_font_enabled", GboardEmojiFontSettings.PREF_KEY_ENABLED);
        Assert.assertEquals("pref_custom_emoji_font_name", GboardEmojiFontSettings.PREF_KEY_FONT_NAME);
        Assert.assertEquals("pref_custom_emoji_font_size", GboardEmojiFontSettings.PREF_KEY_FONT_SIZE);
        Assert.assertEquals("custom_emoji_font.ttf", GboardEmojiFontSettings.FONT_FILE_NAME);
        Assert.assertFalse(GboardEmojiFontSettings.DEFAULT_ENABLED);
    }

    @Test
    public void testIsMetadataEmoji() {
        Assert.assertTrue(GboardEmojiFontRuntime.isMetadataEmoji("😀"));
        Assert.assertFalse(GboardEmojiFontRuntime.isMetadataEmoji("abc"));
        Assert.assertFalse(GboardEmojiFontRuntime.isMetadataEmoji(null));

        // Mock object with CharSequence array field
        class MockKeyDef {
            public CharSequence[] g = new CharSequence[]{"😀", "fire"};
        }
        Assert.assertTrue(GboardEmojiFontRuntime.isMetadataEmoji(new MockKeyDef()));

        class MockNonEmojiKeyDef {
            public CharSequence[] g = new CharSequence[]{"a", "b"};
        }
        Assert.assertFalse(GboardEmojiFontRuntime.isMetadataEmoji(new MockNonEmojiKeyDef()));
    }

    @Test
    public void testHasAlphanumericWords() {
        Assert.assertTrue(GboardEmojiFontRuntime.hasAlphanumericWords("English (US)"));
        Assert.assertTrue(GboardEmojiFontRuntime.hasAlphanumericWords("Space"));
        Assert.assertTrue(GboardEmojiFontRuntime.hasAlphanumericWords("Enter"));
        Assert.assertTrue(GboardEmojiFontRuntime.hasAlphanumericWords("Next line"));
        Assert.assertTrue(GboardEmojiFontRuntime.hasAlphanumericWords("Hello world"));

        Assert.assertFalse(GboardEmojiFontRuntime.hasAlphanumericWords("😀"));
        Assert.assertFalse(GboardEmojiFontRuntime.hasAlphanumericWords(""));
        Assert.assertFalse(GboardEmojiFontRuntime.hasAlphanumericWords(null));
        Assert.assertFalse(GboardEmojiFontRuntime.hasAlphanumericWords("a"));
    }

    @Test
    public void testContainsEmoji() {
        Assert.assertTrue(GboardEmojiFontRuntime.containsEmoji("😀"));
        Assert.assertTrue(GboardEmojiFontRuntime.containsEmoji("🔥"));
        Assert.assertTrue(GboardEmojiFontRuntime.containsEmoji("Hello 😀"));
        Assert.assertTrue(GboardEmojiFontRuntime.containsEmoji("good morning ☀️"));

        Assert.assertFalse(GboardEmojiFontRuntime.containsEmoji("Hello world"));
        Assert.assertFalse(GboardEmojiFontRuntime.containsEmoji("English (US)"));
        Assert.assertFalse(GboardEmojiFontRuntime.containsEmoji("Enter"));
        Assert.assertFalse(GboardEmojiFontRuntime.containsEmoji(""));
        Assert.assertFalse(GboardEmojiFontRuntime.containsEmoji(null));
    }
}
