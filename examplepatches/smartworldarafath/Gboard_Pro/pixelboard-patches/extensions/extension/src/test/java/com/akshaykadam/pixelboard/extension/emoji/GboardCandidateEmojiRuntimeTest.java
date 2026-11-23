package com.akshaykadam.pixelboard.extension.emoji;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.text.TextPaint;
import android.widget.TextView;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;

@RunWith(RobolectricTestRunner.class)
public class GboardCandidateEmojiRuntimeTest {

    @Test
    public void testContainsEmoji_emptyAndNull() {
        assertFalse(GboardCandidateEmojiRuntime.containsEmoji(null));
        assertFalse(GboardCandidateEmojiRuntime.containsEmoji(""));
        assertFalse(GboardCandidateEmojiRuntime.containsEmoji("   "));
    }

    @Test
    public void testContainsEmoji_plainText() {
        assertFalse(GboardCandidateEmojiRuntime.containsEmoji("Hello world"));
        assertFalse(GboardCandidateEmojiRuntime.containsEmoji("1234567890"));
        assertFalse(GboardCandidateEmojiRuntime.containsEmoji("What is this?"));
        assertFalse(GboardCandidateEmojiRuntime.containsEmoji("test@example.com"));
    }

    @Test
    public void testContainsEmoji_surrogatePairs() {
        assertTrue(GboardCandidateEmojiRuntime.containsEmoji("😊"));
        assertTrue(GboardCandidateEmojiRuntime.containsEmoji("🚀"));
        assertTrue(GboardCandidateEmojiRuntime.containsEmoji("🔥"));
        assertTrue(GboardCandidateEmojiRuntime.containsEmoji("Good morning 😊"));
        assertTrue(GboardCandidateEmojiRuntime.containsEmoji("👍🏻"));
    }

    @Test
    public void testContainsEmoji_bmpSymbolsAndPresentationSelectors() {
        assertTrue(GboardCandidateEmojiRuntime.containsEmoji("❤️"));
        assertTrue(GboardCandidateEmojiRuntime.containsEmoji("☕️"));
        assertTrue(GboardCandidateEmojiRuntime.containsEmoji("✨"));
        assertTrue(GboardCandidateEmojiRuntime.containsEmoji("⭐"));
        assertTrue(GboardCandidateEmojiRuntime.containsEmoji("⚡"));
    }

    @Test
    public void testAdjustCandidatePaint_forcesFullAlphaForEmoji() {
        Context context = RuntimeEnvironment.getApplication();
        TextView textView = new TextView(context);
        TextPaint paint = new TextPaint();

        // 60% translucent secondary text color (alpha ~ 0x99)
        int initialColor = 0x99444444;
        paint.setColor(initialColor);
        textView.setText("😊");

        GboardCandidateEmojiRuntime.adjustCandidatePaint(textView, paint);

        assertEquals(255, paint.getAlpha());
        assertEquals(0xFF444444, paint.getColor());
    }

    @Test
    public void testAdjustCandidatePaint_preservesNormalTextPaint() {
        Context context = RuntimeEnvironment.getApplication();
        TextView textView = new TextView(context);
        TextPaint paint = new TextPaint();

        int initialColor = 0x99444444;
        paint.setColor(initialColor);
        textView.setText("suggested");

        GboardCandidateEmojiRuntime.adjustCandidatePaint(textView, paint);

        assertEquals(initialColor, paint.getColor());
    }
}
