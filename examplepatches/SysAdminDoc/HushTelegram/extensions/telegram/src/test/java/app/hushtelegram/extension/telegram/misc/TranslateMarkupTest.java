/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import java.util.Arrays;
import java.util.Collections;
import org.junit.Test;

public class TranslateMarkupTest {
    private static final TranslateMarkup.Entities ENTITIES = new TranslateMarkup.TelegramEntities();

    /** Telegram's entity shape: the class name says the kind, the fields where it sits. */
    public static class Entity {
        public int offset;
        public int length;

        public Entity() {}

        @SuppressWarnings("unchecked")
        <T extends Entity> T at(int offset, int length) {
            this.offset = offset;
            this.length = length;
            return (T) this;
        }
    }

    public static class TL_messageEntityBold extends Entity {}
    public static class TL_messageEntityItalic extends Entity {}
    public static class TL_messageEntitySpoiler extends Entity {}
    public static class TL_messageEntityMention extends Entity {}
    public static class TL_messageEntityBlockquote extends Entity {
        public boolean collapsed;
    }
    public static class TL_messageEntityTextUrl extends Entity {
        public String url;
    }
    public static class TL_messageEntityCustomEmoji extends Entity {
        public long document_id;
    }

    private static TranslateMarkup.Marked mark(String text, Entity... entities) throws ReflectiveOperationException {
        return TranslateMarkup.mark(text, Arrays.asList(entities), ENTITIES);
    }

    /** The entity of [kind] in [restored], which has to be the only one of its kind. */
    private static Entity only(TranslateMarkup.Restored restored, Class<?> kind) {
        Entity found = null;
        for (Object entity : restored.entities) {
            if (!kind.isInstance(entity)) continue;
            assertNull("one " + kind.getSimpleName(), found);
            found = (Entity) entity;
        }
        assertNotNull(kind.getSimpleName(), found);
        return found;
    }

    private static void covers(TranslateMarkup.Restored restored, Entity entity, String words) {
        int at = restored.text.indexOf(words);
        assertTrue(words + " in " + restored.text, at >= 0);
        assertEquals(words, at, entity.offset);
        assertEquals(words, words.length(), entity.length);
    }

    @Test public void formattingFollowsTheTranslatedWordsEvenWhenTheyMove() throws Exception {
        String text = "Click here to read the full story about the election.";
        TL_messageEntityTextUrl link = new TL_messageEntityTextUrl().at(6, 4);
        link.url = "https://example.com/story";
        TranslateMarkup.Marked marked = mark(text, link, new TL_messageEntityBold().at(23, 10), new TL_messageEntityItalic().at(28, 5));
        assertEquals("Click <a0>here</a0> to read the <b1>full <i2>story</i2></b1> about the election.", marked.text);

        TranslateMarkup.Restored restored = TranslateMarkup.restore(marked,
                "Um die <b1>vollständige <i2>Geschichte</i2></b1> über die Wahl zu lesen, klicken Sie <a0>hier</a0>.", ENTITIES);
        assertEquals("Um die vollständige Geschichte über die Wahl zu lesen, klicken Sie hier.", restored.text);
        assertEquals(3, restored.entities.size());
        covers(restored, only(restored, TL_messageEntityBold.class), "vollständige Geschichte");
        covers(restored, only(restored, TL_messageEntityItalic.class), "Geschichte");
        TL_messageEntityTextUrl moved = (TL_messageEntityTextUrl) only(restored, TL_messageEntityTextUrl.class);
        covers(restored, moved, "hier");
        assertEquals("the link keeps its address", "https://example.com/story", moved.url);
        assertNotSame(link, moved);
        assertEquals("the message's own entity stays where it was", 6, link.offset);
        assertTrue("in the order Telegram reads them", restored.entities.get(0) instanceof TL_messageEntityBold);
    }

    @Test public void aSpoilersWordsNeverGoOutAndComeBackCovered() throws Exception {
        String text = "The winner is John from the second team! Congratulations.";
        TranslateMarkup.Marked marked = mark(text, new TL_messageEntitySpoiler().at(14, 25));
        assertEquals("The winner is <x0/>! Congratulations.", marked.text);
        assertFalse(marked.text.contains("John"));

        TranslateMarkup.Restored restored = TranslateMarkup.restore(marked, "Der Gewinner ist <x0/>! Herzlichen Glückwunsch.", ENTITIES);
        assertEquals("Der Gewinner ist John from the second team! Herzlichen Glückwunsch.", restored.text);
        covers(restored, only(restored, TL_messageEntitySpoiler.class), "John from the second team");
    }

    @Test public void aPlaceholderLostOrRepeatedLeavesTheMessageAsWritten() throws Exception {
        TranslateMarkup.Marked marked = mark("Ask @someone about it", new TL_messageEntityMention().at(4, 8));
        assertEquals("Ask <x0/> about it", marked.text);
        assertNull(TranslateMarkup.restore(marked, "Frag danach", ENTITIES));
        assertNull(TranslateMarkup.restore(marked, "Frag <x0/> und <x0/> danach", ENTITIES));
        assertNull("one that stops being a placeholder", TranslateMarkup.restore(marked, "Frag <x0> danach", ENTITIES));
        TranslateMarkup.Restored restored = TranslateMarkup.restore(marked, "Frag <x0/> danach", ENTITIES);
        assertEquals("Frag @someone danach", restored.text);
        covers(restored, only(restored, TL_messageEntityMention.class), "@someone");
    }

    @Test public void aTagTheServiceBreaksOnlyLosesItsOwnFormatting() throws Exception {
        TranslateMarkup.Marked marked = mark("Meet me at the old station tomorrow, and don't tell anyone.",
                new TL_messageEntityBold().at(11, 15), new TL_messageEntityItalic().at(41, 5));
        assertEquals("Meet me at <b0>the old station</b0> tomorrow, and <i1>don't</i1> tell anyone.", marked.text);
        TranslateMarkup.Restored restored = TranslateMarkup.restore(marked,
                "Treffen Sie mich morgen am <b0>alten Bahnhof</b0> und <i1>erzählen Sie es niemandem.", ENTITIES);
        assertEquals("Treffen Sie mich morgen am alten Bahnhof und erzählen Sie es niemandem.", restored.text);
        assertEquals(1, restored.entities.size());
        covers(restored, only(restored, TL_messageEntityBold.class), "alten Bahnhof");
    }

    @Test public void tagsThatCrossInTheAnswerKeepTheOneClosedFirst() throws Exception {
        TranslateMarkup.Marked marked = mark("one two three", new TL_messageEntityBold().at(0, 13), new TL_messageEntityItalic().at(4, 3));
        assertEquals("<b0>one <i1>two</i1> three</b0>", marked.text);
        TranslateMarkup.Restored restored = TranslateMarkup.restore(marked, "<b0>eins <i1>zwei</b0> drei</i1>", ENTITIES);
        assertEquals("eins zwei drei", restored.text);
        assertEquals(1, restored.entities.size());
        covers(restored, only(restored, TL_messageEntityBold.class), "eins zwei");
    }

    @Test public void formattingInsideASpoilerRidesAlongWithIt() throws Exception {
        TranslateMarkup.Marked marked = mark("The answer is very secret indeed.",
                new TL_messageEntitySpoiler().at(14, 11), new TL_messageEntityBold().at(19, 6));
        assertEquals("The answer is <x0/> indeed.", marked.text);
        TranslateMarkup.Restored restored = TranslateMarkup.restore(marked, "Die Antwort ist tatsächlich <x0/>.", ENTITIES);
        assertEquals("Die Antwort ist tatsächlich very secret.", restored.text);
        covers(restored, only(restored, TL_messageEntitySpoiler.class), "very secret");
        covers(restored, only(restored, TL_messageEntityBold.class), "secret");
    }

    @Test public void aCustomEmojiKeepsItsCharacterAndItsSticker() throws Exception {
        TL_messageEntityCustomEmoji emoji = new TL_messageEntityCustomEmoji().at(13, 2);
        emoji.document_id = 5368324170671202286L;
        TranslateMarkup.Marked marked = mark("I love this! 👍", emoji);
        assertEquals("I love this! <x0/>", marked.text);
        TranslateMarkup.Restored restored = TranslateMarkup.restore(marked, "Ich liebe das! <x0/>", ENTITIES);
        assertEquals("Ich liebe das! 👍", restored.text);
        TL_messageEntityCustomEmoji moved = (TL_messageEntityCustomEmoji) only(restored, TL_messageEntityCustomEmoji.class);
        covers(restored, moved, "👍");
        assertEquals(5368324170671202286L, moved.document_id);
    }

    @Test public void aSpoilerThatCantBeMarkedLeavesTheMessageAsWritten() throws Exception {
        assertNull("past the end of the text", mark("short", new TL_messageEntitySpoiler().at(2, 10)));
        assertNull("half over a mention", mark("hi @someone there", new TL_messageEntityMention().at(3, 8), new TL_messageEntitySpoiler().at(6, 10)));
        assertNull("text already shaped like a tag", mark("see <b0> here", new TL_messageEntitySpoiler().at(9, 4)));
    }

    @Test public void textShapedLikeATagOrWithoutFormattingGoesAsItIs() throws Exception {
        TranslateMarkup.Marked tagged = mark("type <b0> to start", new TL_messageEntityBold().at(0, 4));
        assertTrue(tagged.plain());
        assertEquals("type <b0> to start", tagged.text);
        TranslateMarkup.Restored back = TranslateMarkup.restore(tagged, "tippe <b0> zum Starten", ENTITIES);
        assertEquals("tippe <b0> zum Starten", back.text);
        assertTrue(back.entities.isEmpty());

        TranslateMarkup.Marked plain = TranslateMarkup.mark("Привет, мир", null, ENTITIES);
        assertTrue(plain.plain());
        assertEquals("Привет, мир", plain.text);
        assertTrue(TranslateMarkup.restore(plain, "Hello, world", ENTITIES).entities.isEmpty());
        assertTrue(TranslateMarkup.mark("Привет", Collections.emptyList(), ENTITIES).plain());
    }

    @Test public void boldThatStartsWithAMentionKeepsItsFormatting() throws Exception {
        TranslateMarkup.Marked marked = mark("@someone is here now", new TL_messageEntityBold().at(0, 16), new TL_messageEntityMention().at(0, 8));
        assertEquals("<b0><x1/> is here</b0> now", marked.text);
        TranslateMarkup.Restored restored = TranslateMarkup.restore(marked, "<b0><x1/> ist hier</b0> jetzt", ENTITIES);
        assertEquals("@someone ist hier jetzt", restored.text);
        covers(restored, only(restored, TL_messageEntityBold.class), "@someone ist hier");
        covers(restored, only(restored, TL_messageEntityMention.class), "@someone");
        assertTrue("both start together, the bold first as in the list", restored.entities.get(0) instanceof TL_messageEntityBold);
    }

    @Test public void tagsTheServiceMadeUpAreDroppedAndQuotesKeepTheirLines() throws Exception {
        TL_messageEntityBlockquote quote = new TL_messageEntityBlockquote().at(0, 41);
        quote.collapsed = true;
        TranslateMarkup.Marked marked = mark("To be or not to be, that is the question.\nI think it's overrated.", quote);
        assertEquals("<q0>To be or not to be, that is the question.</q0>\nI think it's overrated.", marked.text);
        TranslateMarkup.Restored restored = TranslateMarkup.restore(marked,
                "<q0>Sein oder Nichtsein, das ist hier die Frage.</q0>\nIch <b7>denke</b7>, es ist überbewertet.", ENTITIES);
        assertEquals("Sein oder Nichtsein, das ist hier die Frage.\nIch denke, es ist überbewertet.", restored.text);
        TL_messageEntityBlockquote moved = (TL_messageEntityBlockquote) only(restored, TL_messageEntityBlockquote.class);
        covers(restored, moved, "Sein oder Nichtsein, das ist hier die Frage.");
        assertTrue("a collapsed quote stays collapsed", moved.collapsed);
        assertEquals(1, restored.entities.size());
    }

    @Test public void anEmptyTagLosesItsFormattingAndABoldCrossingAKeptRunIsLeftOut() throws Exception {
        TranslateMarkup.Marked marked = mark("the full story about it", new TL_messageEntityBold().at(4, 10), new TL_messageEntityItalic().at(9, 5));
        TranslateMarkup.Restored restored = TranslateMarkup.restore(marked, "die <b0>ganze<i1></i1></b0> Geschichte dazu", ENTITIES);
        assertEquals("die ganze Geschichte dazu", restored.text);
        assertEquals(1, restored.entities.size());
        covers(restored, only(restored, TL_messageEntityBold.class), "ganze");

        TranslateMarkup.Marked crossing = mark("say hi to @someone soon", new TL_messageEntityBold().at(4, 10), new TL_messageEntityMention().at(10, 8));
        assertEquals("say hi to <x1/> soon", crossing.text);
        TranslateMarkup.Restored back = TranslateMarkup.restore(crossing, "sag <x1/> bald hallo", ENTITIES);
        assertEquals(1, back.entities.size());
        covers(back, only(back, TL_messageEntityMention.class), "@someone");
    }
}
