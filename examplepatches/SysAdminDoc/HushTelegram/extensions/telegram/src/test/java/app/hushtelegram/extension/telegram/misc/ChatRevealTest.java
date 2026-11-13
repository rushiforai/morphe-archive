/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import android.text.SpannableString;
import android.text.Spanned;
import android.view.View;
import android.widget.FrameLayout;
import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.BooleanSetting;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowToast;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, shadows = {ChatRevealTest.Host.class, ChatRevealTest.SpoilerHost.class})
public class ChatRevealTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        for (BooleanSetting setting : new BooleanSetting[] {Settings.REVEAL_MENU, Settings.SEARCH_OPENS_QUOTES, Settings.REVEAL_SPOILERS}) {
            SettingReadsForTests.mend(setting);
            setting.resetToDefault();
        }
        HookStatus.clear();
        ChatReveal.resetForTests();
        Spoilers.resetForTests();
        ShadowToast.reset();
    }

    private static String report() { return String.join("\n", HookStatus.report()); }

    private static String toast() {
        ShadowLooper.idleMainLooper();
        return ShadowToast.getTextOfLatestToast();
    }

    /** [text] with a spoiler over [covered]. */
    private static Spanned spoiler(String text, String covered) {
        SpannableString spanned = new SpannableString(text);
        int start = text.indexOf(covered);
        spanned.setSpan(new SpoilerSpan(), start, start + covered.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        return spanned;
    }

    @Test public void offByDefaultChangesNothing() {
        assertFalse(Settings.REVEAL_MENU.get());
        assertFalse(Settings.SEARCH_OPENS_QUOTES.get());
        Chat chat = new Chat();
        Message quoted = new Message().quote(0, 40);
        chat.messages.add(quoted);
        ChatReveal.headerMenu(chat);
        assertTrue(chat.items.isEmpty());
        assertTrue("an item left in an open menu is still ours", ChatReveal.headerClick(chat, ChatReveal.QUOTES_ITEM));
        assertNull(quoted.expanded);
        Cell cell = new Cell(quoted);
        cell.highlighted = true;
        ChatReveal.searchHit(cell, 5, 9, quoted.blocks);
        assertNull(quoted.expanded);
        assertEquals(0, cell.laidOut);
        assertTrue(report().contains(FamilyNames.REVEAL_SPOILERS));
    }

    @Test public void aChatWithAMenuGetsBothItemsOnce() {
        Settings.REVEAL_MENU.save(true);
        Chat chat = new Chat();
        ChatReveal.headerMenu(chat);
        ChatReveal.headerMenu(chat);
        assertEquals("every later update of the Translate item leaves them alone",
                Arrays.asList(ChatReveal.SPOILERS_ITEM + " Show all spoilers", ChatReveal.QUOTES_ITEM + " Expand all quotes"), chat.items);
        Chat bare = new Chat();
        bare.hasHeader = false;
        ChatReveal.headerMenu(bare);
        assertTrue("a chat that built no menu", bare.items.isEmpty());
        ChatReveal.headerMenu(null);
    }

    @Test public void showAllSpoilersUncoversWhatATapWould() {
        Settings.REVEAL_MENU.save(true);
        Chat chat = new Chat();
        Message text = new Message().plain(0, 20, 2);
        Message caption = new Message();
        caption.caption = spoiler("the ending is sad", "sad");
        Message media = new Message();
        media.mediaSpoiler = true;
        Message viewOnce = new Message();
        viewOnce.mediaSpoiler = true;
        viewOnce.viewOnce = true;
        Message revealed = new Message().plain(0, 20, 0);
        revealed.spoilersRevealed = true;
        Message plain = new Message().plain(0, 20, 0);
        chat.messages.addAll(Arrays.asList(text, caption, media, viewOnce, revealed, plain, null));
        Cell onScreen = new Cell(text);
        Cell other = new Cell(plain);
        chat.list.addView(onScreen);
        chat.list.addView(other);
        chat.list.addView(new View(RuntimeEnvironment.getApplication()));

        assertTrue(ChatReveal.headerClick(chat, ChatReveal.SPOILERS_ITEM));
        assertTrue(text.spoilersRevealed);
        assertTrue("the covers already laid out come off", text.blocks.get(0).spoilers.isEmpty());
        assertTrue(text.forceUpdate);
        assertTrue(caption.spoilersRevealed);
        assertFalse(media.spoilersRevealed);
        assertFalse("the media's blur comes off", Spoilers.mediaCovered(media));
        assertTrue("view-once media keeps its blur", Spoilers.mediaCovered(viewOnce));
        assertFalse(viewOnce.forceUpdate);
        assertFalse(revealed.forceUpdate);
        assertFalse(plain.forceUpdate);
        assertEquals("the row on screen lays out again", 1, onScreen.laidOut);
        assertEquals(0, other.laidOut);
        assertNull(toast());
        assertTrue(report().contains("spoilers shown from the menu"));
    }

    @Test public void withRevealSpoilersOnOnlyWhatItKeepsCoveredCounts() {
        Settings.REVEAL_MENU.save(true);
        Settings.REVEAL_SPOILERS.save(true);
        Chat chat = new Chat();
        Message code = new Message();
        code.caption = spoiler("Login code: 52814", "52814");
        Message story = new Message();
        story.caption = spoiler("the ending is sad", "sad");
        Message media = new Message();
        media.mediaSpoiler = true;
        chat.messages.addAll(Arrays.asList(code, story, media));
        assertTrue(ChatReveal.headerClick(chat, ChatReveal.SPOILERS_ITEM));
        assertTrue("a spoiler shaped like a code, which Reveal spoilers keeps covered", code.spoilersRevealed);
        assertFalse("already uncovered", story.forceUpdate);
        assertFalse("already uncovered", media.forceUpdate);
    }

    @Test public void expandAllQuotesOpensEveryCollapsedQuote() {
        Settings.REVEAL_MENU.save(true);
        Chat chat = new Chat();
        Message quotes = new Message().quote(0, 40).plain(40, 60, 0).quote(60, 120);
        HashSet<Integer> earlier = new HashSet<>(Collections.singletonList(9));
        quotes.expanded = earlier;
        Message open = new Message().quote(0, 40);
        open.expanded = new HashSet<>(Collections.singletonList(0));
        Message plain = new Message().plain(0, 10, 0);
        chat.messages.addAll(Arrays.asList(quotes, open, plain));
        Cell row = new Cell(quotes);
        chat.list.addView(row);

        assertTrue(ChatReveal.headerClick(chat, ChatReveal.QUOTES_ITEM));
        assertEquals(new HashSet<>(Arrays.asList(0, 2, 9)), quotes.expanded);
        assertNotSame("a new set, as Telegram makes one", earlier, quotes.expanded);
        assertEquals(Collections.singleton(9), earlier);
        assertEquals(1, quotes.newSets);
        assertEquals(0, open.newSets);
        assertEquals(0, plain.newSets);
        assertTrue(quotes.forceUpdate);
        assertEquals(1, row.laidOut);
        assertNull(toast());
        assertTrue(report().contains("quotes expanded from the menu"));
    }

    @Test public void nothingToChangeSaysSo() {
        Settings.REVEAL_MENU.save(true);
        Chat chat = new Chat();
        chat.messages.add(new Message().plain(0, 10, 0));
        assertTrue(ChatReveal.headerClick(chat, ChatReveal.SPOILERS_ITEM));
        assertEquals("No hidden spoilers in the loaded messages.", toast());
        assertTrue(ChatReveal.headerClick(chat, ChatReveal.QUOTES_ITEM));
        assertEquals("No collapsed quotes in the loaded messages.", toast());
    }

    @Test public void aChatWhoseMessagesCantBeReadSaysSo() {
        Settings.REVEAL_MENU.save(true);
        Chat chat = new Chat();
        chat.messages = null;
        assertTrue(ChatReveal.headerClick(chat, ChatReveal.SPOILERS_ITEM));
        assertEquals("Couldn't update the messages here.", toast());
        ShadowToast.reset();
        Chat broken = new Chat();
        broken.failMessages = true;
        assertTrue(ChatReveal.headerClick(broken, ChatReveal.QUOTES_ITEM));
        assertEquals("Couldn't update the messages here.", toast());
        assertFalse(HookStatus.missing(FamilyNames.REVEAL_SPOILERS).isEmpty());
    }

    @Test public void telegramsOwnChoicesPassThrough() {
        Settings.REVEAL_MENU.save(true);
        Chat chat = new Chat();
        Message quoted = new Message().quote(0, 10);
        chat.messages.add(quoted);
        for (int id : new int[] {0, 1, 13, 0x48545408, 0x4854540B, 0x4854540E}) {
            assertFalse(ChatReveal.headerClick(chat, id));
        }
        assertNull(quoted.expanded);
    }

    @Test public void aSearchHitInsideACollapsedQuoteOpensIt() {
        Settings.SEARCH_OPENS_QUOTES.save(true);
        Message message = new Message().plain(0, 12, 0).quote(12, 80).plain(80, 90, 0);
        Cell cell = new Cell(message);
        cell.highlighted = true;
        ChatReveal.searchHit(cell, 30, 36, message.blocks);
        assertEquals(Collections.singleton(1), message.expanded);
        assertEquals("the row lays out again", 1, cell.laidOut);
        ChatReveal.searchHit(cell, 40, 44, message.blocks);
        assertEquals("an open quote is left as it is", 1, message.newSets);
        assertEquals(1, cell.laidOut);
        assertTrue(report().contains("quote opened on a search hit"));
    }

    @Test public void otherHitsLeaveQuotesAlone() {
        Settings.SEARCH_OPENS_QUOTES.save(true);
        Message message = new Message().plain(0, 12, 0).quote(12, 80);
        Cell cell = new Cell(message);
        cell.highlighted = true;
        ChatReveal.searchHit(cell, 3, 8, message.blocks);
        ChatReveal.searchHit(cell, 80, 85, message.blocks);
        ChatReveal.searchHit(cell, -1, 0, message.blocks);
        ChatReveal.searchHit(cell, 20, 25, null);
        ChatReveal.searchHit(null, 20, 25, message.blocks);
        cell.highlighted = false;
        ChatReveal.searchHit(cell, 20, 25, message.blocks);
        assertNull("a quote the user collapsed again stays collapsed once the row isn't the hit", message.expanded);
        assertEquals(0, cell.laidOut);

        cell.highlighted = true;
        ChatReveal.searchHit(cell, 20, 25, new ArrayList<>(Collections.singletonList("not a block")));
        assertNull(message.expanded);
        assertFalse(HookStatus.missing(FamilyNames.REVEAL_SPOILERS).isEmpty());
    }

    @Test public void pausedOrNotReadyLeavesTelegramAlone() {
        Settings.REVEAL_MENU.save(true);
        Settings.SEARCH_OPENS_QUOTES.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            Chat chat = new Chat();
            Message quoted = new Message().quote(0, 40);
            chat.messages.add(quoted);
            ChatReveal.headerMenu(chat);
            assertTrue(reason.name(), chat.items.isEmpty());
            assertTrue(ChatReveal.headerClick(chat, ChatReveal.QUOTES_ITEM));
            assertNull(reason.name(), quoted.expanded);
            Cell cell = new Cell(quoted);
            cell.highlighted = true;
            ChatReveal.searchHit(cell, 5, 9, quoted.blocks);
            assertNull(reason.name(), quoted.expanded);
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> {
            assertFalse(ChatReveal.active());
            assertFalse(ChatReveal.searchActive());
        });
        SettingReadsForTests.breakReads(Settings.REVEAL_MENU);
        Chat chat = new Chat();
        ChatReveal.headerMenu(chat);
        assertTrue(chat.items.isEmpty());
        assertFalse(HookStatus.missing(FamilyNames.REVEAL_SPOILERS).isEmpty());
    }

    /** Stands in for Telegram's spoiler style span. */
    static final class SpoilerSpan {}

    static final class Message {
        final ArrayList<Block> blocks = new ArrayList<>();
        CharSequence caption;
        boolean spoilersRevealed;
        HashSet<?> expanded;
        int newSets;
        boolean forceUpdate;
        boolean mediaSpoiler;
        boolean viewOnce;

        /** A text block from [start] to [end] with [covers] spoiler covers laid out. */
        Message plain(int start, int end, int covers) {
            Block block = new Block(this, start, end, false);
            for (int i = 0; i < covers; i++) block.spoilers.add(new Object());
            blocks.add(block);
            return this;
        }

        /** A collapsible quote from [start] to [end]. */
        Message quote(int start, int end) {
            blocks.add(new Block(this, start, end, true));
            return this;
        }
    }

    static final class Block {
        final Message message;
        final int start;
        final int end;
        final int index;
        final boolean quote;
        final ArrayList<Object> spoilers = new ArrayList<>();

        Block(Message message, int start, int end, boolean quote) {
            this.message = message;
            this.start = start;
            this.end = end;
            this.index = message.blocks.size();
            this.quote = quote;
        }
    }

    static final class Cell extends View {
        final Message message;
        boolean highlighted;
        int laidOut;

        Cell(Message message) {
            super(RuntimeEnvironment.getApplication());
            this.message = message;
        }
    }

    static final class Chat {
        boolean hasHeader = true;
        boolean failMessages;
        ArrayList<Message> messages = new ArrayList<>();
        final FrameLayout list = new FrameLayout(RuntimeEnvironment.getApplication());
        final List<String> items = new ArrayList<>();
    }

    @Implements(value = ChatReveal.class, isInAndroidSdk = false)
    public static class Host {
        @Implementation protected static boolean hasHeader(Object chat) { return ((Chat) chat).hasHeader; }
        @Implementation protected static Object addHeaderItem(Object chat, int id, int icon, String text) {
            ((Chat) chat).items.add(id + " " + text);
            return text;
        }
        @Implementation protected static Object chatOf(Object delegate) { return delegate; }
        @Implementation protected static ArrayList<?> messages(Object chat) {
            Chat owner = (Chat) chat;
            if (owner.failMessages) throw new IllegalStateException("message list moved");
            return owner.messages;
        }
        @Implementation protected static Object listView(Object chat) { return ((Chat) chat).list; }
        @Implementation protected static Object cellMessage(Object view) { return view instanceof Cell ? ((Cell) view).message : null; }
        @Implementation protected static boolean highlighted(Object cell) { return ((Cell) cell).highlighted; }
        @Implementation protected static void openCell(Object cell) { ((Cell) cell).laidOut++; }
        @Implementation protected static ArrayList<?> textBlocks(Object message) { return ((Message) message).blocks; }
        @Implementation protected static ArrayList<?> blockSpoilers(Object block) { return ((Block) block).spoilers; }
        @Implementation protected static int blockStart(Object block) { return ((Block) block).start; }
        @Implementation protected static int blockEnd(Object block) { return ((Block) block).end; }
        @Implementation protected static int blockIndex(Object block) { return ((Block) block).index; }
        @Implementation protected static Object blockMessage(Object block) { return ((Block) block).message; }
        /** Telegram's own check: a collapsible quote whose index isn't in the message's open quotes. */
        @Implementation protected static boolean collapsedQuote(Object block) {
            Block b = (Block) block;
            return b.quote && (b.message.expanded == null || !b.message.expanded.contains(b.index));
        }
        @Implementation protected static boolean spoilersRevealed(Object message) { return ((Message) message).spoilersRevealed; }
        @Implementation protected static void revealSpoilers(Object message) { ((Message) message).spoilersRevealed = true; }
        @Implementation protected static CharSequence caption(Object message) { return ((Message) message).caption; }
        @Implementation protected static HashSet<?> expandedQuotes(Object message) { return ((Message) message).expanded; }
        @Implementation protected static void setExpandedQuotes(Object message, HashSet<?> open) {
            Message owner = (Message) message;
            owner.expanded = open;
            owner.newSets++;
        }
        @Implementation protected static void forceUpdate(Object message) { ((Message) message).forceUpdate = true; }
    }

    @Implements(value = Spoilers.class, isInAndroidSdk = false)
    public static class SpoilerHost {
        @Implementation protected static boolean spoilerSpan(Object span) { return span instanceof SpoilerSpan; }
        @Implementation protected static boolean stockMediaCovered(Object message) { return ((Message) message).mediaSpoiler; }
        @Implementation protected static boolean keptCovered(Object message) { return ((Message) message).viewOnce; }
    }
}
