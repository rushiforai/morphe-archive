package io.github.sabopura.morphe.extension.twitch.chat.emotes;

import org.junit.Test;

import java.util.Arrays;
import java.util.List;

import static org.junit.Assert.*;

public class EmoteCompletionTest {
    private static final List<String> NAMES = Arrays.asList("PogU", "catJAM", "PogChamp", "NOPERS", "pogger");

    @Test public void prefixMatchesComeBeforeMatchesAnywhere() {
        assertEquals(Arrays.asList("catJAM"), EmoteCompletion.rank(NAMES, "jam", 20));
        assertEquals(Arrays.asList("PogChamp", "pogger", "PogU"), EmoteCompletion.rank(NAMES, "POG", 20));
        assertEquals(Arrays.asList("ergo", "NOPERS"), EmoteCompletion.rank(Arrays.asList("NOPERS", "ergo"), "er", 20));
    }

    @Test public void limitCutsTheLaterMatches() {
        assertEquals(Arrays.asList("PogChamp"), EmoteCompletion.rank(NAMES, "pog", 1));
    }

    @Test public void onlyAClosedTokenOfAKnownEmoteResolves() {
        assertEquals("PogU", EmoteCompletion.closedName(":PogU:", name -> name.equals("PogU")));
        assertNull(EmoteCompletion.closedName(":PogU", name -> true));
        assertNull(EmoteCompletion.closedName("PogU:", name -> true));
        assertNull(EmoteCompletion.closedName("::", name -> true));
        assertNull(EmoteCompletion.closedName(":other:", name -> name.equals("PogU")));
    }
}
