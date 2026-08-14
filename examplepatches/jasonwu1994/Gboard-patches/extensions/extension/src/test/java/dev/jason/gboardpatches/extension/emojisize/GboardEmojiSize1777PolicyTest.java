package dev.jason.gboardpatches.extension.emojisize;

import org.junit.Assert;
import org.junit.Test;

public final class GboardEmojiSize1777PolicyTest {
    @Test
    public void forcesOnlyExactFalseBooleanWhenEnabled() {
        Assert.assertEquals(Boolean.TRUE, GboardEmojiSize1777Policy.maybeForce(
                "emoji_scale_supported", Boolean.FALSE, true));
        Assert.assertSame(Boolean.FALSE, GboardEmojiSize1777Policy.maybeForce(
                "emoji_scale_supported", Boolean.FALSE, false));
        Assert.assertSame(Boolean.TRUE, GboardEmojiSize1777Policy.maybeForce(
                "emoji_scale_supported", Boolean.TRUE, true));
        Assert.assertSame(Boolean.FALSE, GboardEmojiSize1777Policy.maybeForce(
                "unrelated", Boolean.FALSE, true));
    }
}
