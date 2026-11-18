package io.github.sabopura.morphe.extension.twitch.chat;

import org.json.JSONObject;
import org.junit.Test;

import java.util.Map;

import static org.junit.Assert.*;

public class ChatMetadataTest {
    private static final String KINDS = "{\"any\":{\"name\":\"any\",\"subject\":\"Any\",\"object\":\"Any\",\"singular\":true},"
            + "\"hehim\":{\"name\":\"hehim\",\"subject\":\"He\",\"object\":\"Him\",\"singular\":false},"
            + "\"theythem\":{\"name\":\"theythem\",\"subject\":\"They\",\"object\":\"Them\",\"singular\":false}}";

    @Test public void pronounsAreShownLikeAlejosExtension() throws Exception {
        Map<String, ChatMetadata.Pronoun> kinds = ChatMetadata.parsePronounKinds(new JSONObject(KINDS));
        assertEquals("He/Him", ChatMetadata.pronounLabel(kinds, "hehim", ""));
        assertEquals("He/They", ChatMetadata.pronounLabel(kinds, "hehim", "theythem"));
        assertEquals("Any", ChatMetadata.pronounLabel(kinds, "any", null));
        assertNull(ChatMetadata.pronounLabel(kinds, "", ""));
        assertNull(ChatMetadata.pronounLabel(kinds, "unknown", ""));
    }

    /** Every result that arrives redraws all chat rows when it counts as a change. */
    @Test public void theSamePronounsAgainOrAUserWithoutPronounsChangesNoRow() {
        assertFalse(ChatMetadata.changes(new String[] {"hehim", ""}, new String[] {"hehim", ""}));
        assertFalse(ChatMetadata.changes(null, null));
        assertTrue(ChatMetadata.changes(null, new String[] {"hehim", ""}));
        assertTrue(ChatMetadata.changes(new String[] {"hehim", ""}, new String[] {"theythem", ""}));
    }
}
