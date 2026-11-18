package io.github.sabopura.morphe.extension.twitch.danmaku;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.Arrays;
import java.util.List;

import org.junit.Test;

public final class ChatTokensTest {
    /** Stand-in for Twitch's obfuscated data classes: only toString() matters. */
    private static Object token(String description) {
        return new Object() {
            @Override
            public String toString() {
                return description;
            }
        };
    }

    @Test
    public void textTokensKeepCommasAndParentheses() {
        ChatTokens.Segment segment = ChatTokens.parse("TextToken(text=hello, world (lol))");
        assertEquals("hello, world (lol)", segment.text);
        assertFalse(segment.isEmote());
    }

    @Test
    public void textTokenFlagsAreStripped() {
        assertEquals("gg wp", ChatTokens.parse(
                "TextToken(text=gg wp, flags=AutoModMessageFlags(identityLevel=0))").text);
        assertEquals("****", ChatTokens.parse(
                "CensoredTextToken(text=****, trackingInfo=Info(a=1, b=2))").text);
    }

    @Test
    public void emoteTokensInEitherFieldOrder() {
        ChatTokens.Segment kappa = ChatTokens.parse("EmoteToken(id=25, text=Kappa)");
        assertTrue(kappa.isEmote());
        assertEquals("25", kappa.emoteId);
        assertEquals("Kappa", kappa.text);
        ChatTokens.Segment v2 = ChatTokens.parse(
                "EmoteToken(text=catJAM, id=emotesv2_0123abcd)");
        assertEquals("emotesv2_0123abcd", v2.emoteId);
        assertEquals("catJAM", v2.text);
    }

    @Test
    public void mentionsUrlsAndBits() {
        assertEquals("@streamer", ChatTokens.parse(
                "MentionToken(text=@streamer, userName=streamer, isLocalUser=false)").text);
        assertEquals("https://twitch.tv", ChatTokens.parse(
                "UrlToken(url=https://twitch.tv, hidden=false)").text);
        assertEquals("Cheer100", ChatTokens.parse(
                "BitsToken(prefix=Cheer, numBits=100)").text);
        assertEquals("Corgo500", ChatTokens.parse(
                "BitsToken(cheermote=Cheermote(id=1, prefix=Corgo, type=X, tiers=[]), numBits=500)")
                .text);
    }

    @Test
    public void unknownTokensAreIgnored() {
        assertNull(ChatTokens.parse("SomethingElse(x=1)"));
        assertNull(ChatTokens.parse("not a token"));
        assertNull(ChatTokens.parse(null));
    }

    @Test
    public void parseAllMergesTextAroundEmotes() {
        List<?> tokens = Arrays.asList(
                token("TextToken(text=hi )"),
                token("MentionToken(text=@bob, userName=bob, isLocalUser=false)"),
                token("TextToken(text= look )"),
                token("EmoteToken(id=25, text=Kappa)"),
                token("TextToken(text= ok)"));
        List<ChatTokens.Segment> segments = ChatTokens.parseAll(tokens);
        assertEquals(3, segments.size());
        assertEquals("hi @bob look ", segments.get(0).text);
        assertTrue(segments.get(1).isEmote());
        assertEquals(" ok", segments.get(2).text);
        assertEquals("hi @bob look Kappa ok", ChatTokens.plainText(segments));
        assertEquals("hi @bob look   ok", ChatTokens.withoutEmotes(segments));
    }
}
