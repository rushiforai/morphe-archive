package io.github.sabopura.morphe.extension.twitch.chat.emotes;

import org.junit.Test;

import static org.junit.Assert.*;

public class TwitchEmotesTest {
    private static String line(String tags, String text) {
        return "@" + tags + " :someone!someone@someone.tmi.twitch.tv PRIVMSG #channel :" + text;
    }

    @Test public void readsTheEmotesOfALineAndWhereTheirImagesAre() {
        TwitchEmotes emotes = TwitchEmotes.ofIrc(line("color=#FF0000;emotes=25:0-4,12-16/1902:6-10;id=abc",
                "Kappa Keepo Kappa hello"));
        assertFalse(emotes.isEmpty());
        Emote kappa = emotes.find("Kappa", true);
        assertEquals("https://static-cdn.jtvnw.net/emoticons/v2/25/static/dark/2.0", kappa.url);
        assertEquals("Kappa", kappa.name);
        assertFalse(kappa.animated);
        assertEquals("https://static-cdn.jtvnw.net/emoticons/v2/1902/static/light/2.0", emotes.find("Keepo", false).url);
        assertNull("a word the tag does not name stays text", emotes.find("hello", true));
        assertTrue(EmoteUrls.allowed(kappa.url));
    }

    @Test public void positionsCountCodePointsNotUtf16Units() {
        // Each of the two emoji before the emote is one code point and two chars.
        TwitchEmotes emotes = TwitchEmotes.parse("emotesv2_ab12:3-9", "😀😀 PogBird ok");
        assertNotNull(emotes.find("PogBird", true));
        assertNull(emotes.find("ogBird", true));
    }

    @Test public void aSlashMeMessageCountsFromItsOwnText() {
        TwitchEmotes emotes = TwitchEmotes.ofIrc(line("emotes=25:6-10", "\u0001ACTION waves Kappa\u0001"));
        assertNotNull(emotes.find("Kappa", true));
    }

    @Test public void aOneWordMessageMaySendItsTextWithoutTheColon() {
        TwitchEmotes emotes = TwitchEmotes.ofIrc("@emotes=25:0-4;id=abc :a!a@a.tmi.twitch.tv PRIVMSG #channel Kappa");
        assertNotNull(emotes.find("Kappa", true));
    }

    @Test public void aLineWithoutEmotesHasNone() {
        assertSame(TwitchEmotes.NONE, TwitchEmotes.ofIrc(line("color=;emotes=;id=abc", "hello")));
        assertSame(TwitchEmotes.NONE, TwitchEmotes.ofIrc(line("emote-only=1;id=abc", "Kappa")));
        assertSame(TwitchEmotes.NONE, TwitchEmotes.ofIrc(":tmi.twitch.tv PRIVMSG #channel :Kappa"));
        assertSame(TwitchEmotes.NONE, TwitchEmotes.ofIrc("@emotes=25:0-4 :tmi.twitch.tv CLEARCHAT #channel"));
        assertSame(TwitchEmotes.NONE, TwitchEmotes.ofIrc(null));
        assertTrue(TwitchEmotes.NONE.isEmpty());
    }

    @Test public void whateverIsMalformedIsLeftAsText() {
        String text = "Kappa Keepo";
        assertSame("positions past the end", TwitchEmotes.NONE, TwitchEmotes.parse("25:6-99", text));
        assertSame("a reversed range", TwitchEmotes.NONE, TwitchEmotes.parse("25:4-0", text));
        assertSame("no range", TwitchEmotes.NONE, TwitchEmotes.parse("25", text));
        assertSame("not numbers", TwitchEmotes.NONE, TwitchEmotes.parse("25:a-b", text));
        assertSame("more than one word", TwitchEmotes.NONE, TwitchEmotes.parse("25:0-10", text));
        // The id becomes part of an image address ("/" cannot be in one: it separates the emotes).
        assertSame(TwitchEmotes.NONE, TwitchEmotes.parse("..%2Fx:0-4", text));
        assertSame(TwitchEmotes.NONE, TwitchEmotes.parse("25?a=b:0-4", text));
        assertSame(TwitchEmotes.NONE, TwitchEmotes.parse("25.png#:0-4", text));
        // One bad entry does not lose the good one next to it.
        TwitchEmotes mixed = TwitchEmotes.parse("2.5:0-4/1902:6-10", text);
        assertNull(mixed.find("Kappa", true));
        assertNotNull(mixed.find("Keepo", true));
    }

    @Test public void aPositionInsideAWordMeansTheTextIsNotTheTagsOwn() {
        // A row's text can differ from the line the tag came with; a shifted position must not turn
        // a piece of another word into an emote.
        assertSame(TwitchEmotes.NONE, TwitchEmotes.parse("25:1-5", "xKappa Keepo"));
        assertSame(TwitchEmotes.NONE, TwitchEmotes.parse("25:0-3", "Kappa Keepo"));
        assertNotNull(TwitchEmotes.parse("25:0-4", "Kappa").find("Kappa", true));
        assertNotNull(TwitchEmotes.parse("1902:6-10", "Kappa Keepo").find("Keepo", true));
    }

    @Test public void theLargerCopyOfATwitchEmoteIsItsNextSize() {
        assertEquals("https://static-cdn.jtvnw.net/emoticons/v2/25/static/dark/3.0",
                EmoteUrls.large(TwitchEmotes.url("25", true)));
        assertFalse(EmoteUrls.allowed("https://static-cdn.jtvnw.net/jtv_user_pictures/a.png"));
        assertFalse(EmoteUrls.allowed("https://static-cdn.jtvnw.net.evil.example/emoticons/v2/25/static/dark/2.0"));
    }
}
