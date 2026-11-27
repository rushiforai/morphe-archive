package app.ayham.extension.music.features;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

/** The keys are YT Music 9.30's own, read from its media session on the emulator. */
public class LikeKeyTest {
    private static final String UP = "thumbs_up_action yt_outline_experimental_thumb_up_vd_theme_24";
    private static final String UP_LIKED = "thumbs_up_action yt_fill_experimental_thumb_up_vd_theme_24";
    private static final String DOWN = "thumbs_down_action yt_outline_experimental_thumb_down_vd_theme_24";

    @Test
    public void theThumbsUpActionIsTheLikeOne() {
        assertTrue(LikeKey.isLike(UP));
        assertTrue(LikeKey.isLike(UP_LIKED));
        assertFalse(LikeKey.isLike(DOWN));
        assertFalse(LikeKey.isLike("shuffle_action shuffle_padded_delhi_off"));
    }

    @Test
    public void aFilledThumbMeansLiked() {
        assertTrue(LikeKey.liked(UP_LIKED));
        assertFalse(LikeKey.liked(UP));
    }

    @Test
    public void otherWordingsStillRead() {
        assertTrue(LikeKey.isLike("ACTION_LIKE icon"));
        assertFalse(LikeKey.isLike("ACTION_DISLIKE icon"));
        assertTrue(LikeKey.liked("remove_like icon"));
        assertTrue(LikeKey.liked("ACTION_UNLIKE icon"));
    }
}
