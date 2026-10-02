/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.stories;

/**
 * The size the rings in the stories row at the top of Home are drawn at, as a share of the size
 * Instagram picks for the screen. Instagram's own keeps every ring as it is.
 *
 * <p>It holds no Android type and reads no setting, and the name a person reads is the settings
 * screen's, in the phone's language.
 */
public enum StoryRingSize {
    SMALLEST(0.7f),
    SMALLER(0.85f),
    INSTAGRAM(1f),
    LARGER(1.15f),
    LARGEST(1.3f);

    /** What a ring's size is multiplied by. */
    public final float scale;

    StoryRingSize(float scale) {
        this.scale = scale;
    }

    /** The scale as a whole percentage, such as 85 for {@link #SMALLER}. */
    public int percent() {
        return Math.round(scale * 100);
    }
}
