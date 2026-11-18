package io.github.sabopura.morphe.extension.twitch.danmaku;

import org.junit.Test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import static org.junit.Assert.*;

public class VodCommentReaderTest {
    private static VodCommentReader.Emote emote(String id, int begin) {
        return new VodCommentReader.Emote(id, begin);
    }

    /** Segments as "text" or "[id:code]", to compare whole messages at once. */
    private static List<String> shape(List<ChatTokens.Segment> segments) {
        List<String> result = new ArrayList<>();
        for (ChatTokens.Segment segment : segments)
            result.add(segment.isEmote() ? "[" + segment.emoteId + ":" + segment.text + "]" : segment.text);
        return result;
    }

    @Test
    public void plainTextIsOneRun() {
        assertEquals(Arrays.asList("hello world"),
                shape(VodCommentReader.segments("hello world", Collections.emptyList())));
    }

    @Test
    public void emotesSplitTheTextWhereverTwitchListsThem() {
        List<VodCommentReader.Emote> emotes = Arrays.asList(emote("425618", 15), emote("25", 3));
        assertEquals(Arrays.asList("hi ", "[25:Kappa]", " there ", "[425618:LUL]"),
                shape(VodCommentReader.segments("hi Kappa there LUL", emotes)));
        assertEquals(Arrays.asList("[25:Kappa]", " ", "[25:Kappa]"),
                shape(VodCommentReader.segments("Kappa Kappa", Arrays.asList(emote("25", 0), emote("25", 6)))));
    }

    @Test
    public void positionsCountCodePointsAsInIrc() {
        assertEquals(Arrays.asList("😀 ", "[25:Kappa]"),
                shape(VodCommentReader.segments("😀 Kappa", Collections.singletonList(emote("25", 2)))));
    }

    @Test
    public void positionsThatDoNotStartAWordLeaveTheTextAlone() {
        List<VodCommentReader.Emote> wrong = Arrays.asList(emote("25", 4), emote("25", 40), emote("25", -1),
                emote("", 0), emote(null, 0));
        assertEquals(Arrays.asList("hi Kappa"), shape(VodCommentReader.segments("hi Kappa", wrong)));
        assertEquals("an overlapping duplicate", Arrays.asList("[25:Kappa]"),
                shape(VodCommentReader.segments("Kappa", Arrays.asList(emote("25", 0), emote("25", 0)))));
    }

    @Test
    public void readsTheCommentWithItsNameAndColour() {
        ChatMessageReader.Comment comment = VodCommentReader.read("id1", "Nick", "nick", "42", "#1E90FF",
                " gg Kappa ", Collections.singletonList(emote("25", 4)));
        assertEquals("id1", comment.id);
        assertEquals("Nick", comment.author);
        assertEquals("nick", comment.login);
        assertEquals("42", comment.userId);
        assertEquals(Integer.valueOf(0x1E90FF), comment.color);
        assertEquals("gg Kappa", comment.plainText);
        assertEquals("the login when there is no display name", "nick",
                VodCommentReader.read("id1", "", "nick", "42", null, "gg", Collections.emptyList()).author);
        assertNull(VodCommentReader.read("id1", "Nick", "nick", "42", null, "  ", Collections.emptyList()));
        assertNull(VodCommentReader.read("id1", "Nick", "nick", "42", null, null, Collections.emptyList()));
    }

    @Test
    public void onlyAHexColourIsAColour() {
        assertEquals(Integer.valueOf(0xFF4500), VodCommentReader.color("#FF4500"));
        assertNull(VodCommentReader.color(null));
        assertNull(VodCommentReader.color(""));
        assertNull(VodCommentReader.color("red"));
        assertNull(VodCommentReader.color("#12345"));
        assertNull(VodCommentReader.color("#GGGGGG"));
    }
}
