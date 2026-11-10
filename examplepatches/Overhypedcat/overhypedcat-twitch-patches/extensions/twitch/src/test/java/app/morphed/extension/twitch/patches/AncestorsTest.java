package app.morphed.extension.twitch.patches;

import org.junit.Test;

import java.util.HashMap;
import java.util.Map;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public class AncestorsTest {
    /** child -> parent, like a view tree. */
    private final Map<String, String> parents = new HashMap<>();

    @Test
    public void findsAScrollingListAboveAFeedPreview() {
        // Live and Following feeds: the preview's video sits inside a vertical list.
        parents.put("video", "playerView");
        parents.put("playerView", "feedItem");
        parents.put("feedItem", "verticalList");
        parents.put("verticalList", "screen");

        assertTrue(Ancestors.any("video", parents::get, "verticalList"::equals));
    }

    @Test
    public void streamPlayerIsNotInAList() {
        // The stream screen: the player sits next to the chat list, not inside it.
        parents.put("video", "playerView");
        parents.put("playerView", "screen");
        parents.put("chatList", "screen");

        assertFalse(Ancestors.any("video", parents::get, "chatList"::equals));
    }

    @Test
    public void theStartItselfDoesNotCountAndLoopsEnd() {
        parents.put("a", "b");
        parents.put("b", "a");

        assertFalse(Ancestors.any("a", parents::get, "c"::equals));
        assertFalse(Ancestors.any("x", parents::get, "x"::equals));
        assertFalse(Ancestors.any(null, parents::get, "x"::equals));
    }
}
