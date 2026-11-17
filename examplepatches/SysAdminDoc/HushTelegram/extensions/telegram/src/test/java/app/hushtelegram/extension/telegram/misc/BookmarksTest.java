/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Looper;
import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.PatchFamilyForTests;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.shadows.ShadowToast;

/** Bookmarks (#79): the menu's item and when it shows, the list it keeps, and where a bookmark opens. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, shadows = {BookmarksTest.Menu.class, BookmarksTest.Marks.class, BookmarksTest.Tools.class},
        instrumentedPackages = "app.hushtelegram.extension.telegram.misc")
public class BookmarksTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final long SELF = 5L;
    private static final long ANNA = 100L;
    private static final long FRIENDS = -200L;
    private static final long SECRET = 777L;
    private static final int MARK = 0x7f010001;
    private static final int UNMARK = 0x7f010002;
    private static final char ELLIPSIS = (char) 0x2026;

    /** A message as the open chat holds it. */
    static final class Message {
        final int id;
        final long dialog;
        final int account;
        long sender;
        int date = 1_700_000_000;
        String text;
        String document;
        boolean photo;
        boolean video;
        boolean apart;
        long topic;

        Message(int id, long dialog, int account) {
            this.id = id;
            this.dialog = dialog;
            this.account = account;
        }
    }

    @Implements(value = MessageMenu.class, isInAndroidSdk = false)
    public static class Menu {
        static Object selected;

        @Implementation protected static int id(Object message) { return ((Message) message).id; }
        @Implementation protected static long dialog(Object message) { return ((Message) message).dialog; }
        @Implementation protected static int account(Object message) { return ((Message) message).account; }
        @Implementation protected static long sender(Object message) { return ((Message) message).sender; }
        @Implementation protected static int date(Object message) { return ((Message) message).date; }
        @Implementation protected static String text(Object message) { return ((Message) message).text; }
        @Implementation protected static String documentName(Object message) { return ((Message) message).document; }
        @Implementation protected static boolean photo(Object message) { return ((Message) message).photo; }
        @Implementation protected static long selfId(int account) { return account == 0 ? SELF : account == 1 ? 6L : 0L; }
        @Implementation protected static boolean secret(long dialog) { return dialog == SECRET; }
        @Implementation protected static Object selected(Object chat) { return selected; }
        @Implementation protected static String title(int account, long dialog) {
            return dialog == ANNA ? "Anna" : dialog == FRIENDS ? "Friends" : null;
        }
    }

    @Implements(value = Bookmarks.class, isInAndroidSdk = false)
    public static class Marks {
        @Implementation protected static boolean apart(Object message) { return ((Message) message).apart; }
        @Implementation protected static long topic(Object message) { return ((Message) message).topic; }
        @Implementation protected static int markIcon() { return MARK; }
        @Implementation protected static int unmarkIcon() { return UNMARK; }
    }

    @Implements(value = MessageMenuTools.class, isInAndroidSdk = false)
    public static class Tools {
        @Implementation protected static boolean video(Object message) { return ((Message) message).video; }
    }

    /** What this phone has: the signed-in account of the user SELF, and one chat as it stands. */
    static final class Phone implements Bookmarks.Tables {
        int account;
        Bookmarks.Place place = Bookmarks.Place.OPEN;
        boolean message = true;
        final List<String> asked = new ArrayList<>();

        @Override public int account(long owner) { return owner == SELF ? account : -1; }

        @Override public Bookmarks.Place chat(int account, long dialog) {
            asked.add("chat " + account + " " + dialog);
            return place;
        }

        @Override public boolean message(int account, long dialog, int message) {
            asked.add("message " + account + " " + dialog + " " + message);
            return this.message;
        }
    }

    private Context context;
    private Bookmarks.Tables original;

    @Before public void setUp() throws Exception {
        original = Bookmarks.tables;
        restore();
        context = RuntimeEnvironment.getApplication();
        PatchFamilyForTests.installed(PatchFamily.Capability.BOOKMARKS);
        Settings.MESSAGE_MENU_BOOKMARKS.save(true);
    }

    @After public void restore() throws Exception {
        Utils.awaitBackgroundTasksForTests();
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.MESSAGE_MENU_BOOKMARKS);
        Settings.MESSAGE_MENU_BOOKMARKS.resetToDefault();
        Settings.BOOKMARKS.resetToDefault();
        if (original != null) Bookmarks.tables = original;
        PatchFamilyForTests.resetCapabilities();
        Menu.selected = null;
        HookStatus.clear();
        ShadowToast.reset();
    }

    private static void settle() throws Exception {
        for (int round = 0; round < 3; round++) {
            Utils.awaitBackgroundTasksForTests();
            Shadows.shadowOf(Looper.getMainLooper()).idle();
        }
    }

    private static Bookmarks.Entry entry(long dialog, int message, long saved) {
        return new Bookmarks.Entry(SELF, dialog, message, 0, 1_700_000_000, saved, "", "Chat", "text " + message);
    }

    private static List<Integer> ids(String saved) {
        List<Integer> ids = new ArrayList<>();
        for (Bookmarks.Entry each : Bookmarks.parse(saved)) ids.add(each.message);
        return ids;
    }

    private static String repeat(char c, int count) {
        char[] chars = new char[count];
        Arrays.fill(chars, c);
        return new String(chars);
    }

    /** Bookmarks [message] from its menu and hands back what the list saved first. */
    private Bookmarks.Entry bookmark(Message message) throws Exception {
        Bookmarks.toggle(context, message);
        settle();
        assertEquals("Bookmarked.", ShadowToast.getTextOfLatestToast());
        return Bookmarks.parse(Settings.BOOKMARKS.savedValue()).get(0);
    }

    // ---- The menu's item ----------------------------------------------------------------------

    @Test public void theSwitchStartsOffAndNothingIsOffered() {
        Settings.MESSAGE_MENU_BOOKMARKS.resetToDefault();
        assertFalse(Settings.MESSAGE_MENU_BOOKMARKS.get());
        assertFalse(Bookmarks.offered(new Message(10, ANNA, 0)));
        assertFalse("no side menu row either", Bookmarks.rowShown());
        List<Object> options = new ArrayList<>(Collections.singletonList(MessageMenu.DETAILS));
        List<Object> items = new ArrayList<>(Collections.singletonList("Message details"));
        List<Object> icons = new ArrayList<>(Collections.singletonList(0));
        MessageMenuTools.offer(new Object(), new Message(10, ANNA, 0), icons, items, options, false);
        assertEquals(Collections.singletonList(MessageMenu.DETAILS), options);
    }

    @Test public void offeredOnlyWhereTheBuildHasItAndTheMessageOpensAgain() {
        Message message = new Message(10, ANNA, 0);
        assertTrue(Bookmarks.offered(message));
        assertTrue(Bookmarks.rowShown());
        PatchFamilyForTests.installed();
        assertFalse("a build without the patch's part", Bookmarks.offered(message));
        assertFalse(Bookmarks.rowShown());
        PatchFamilyForTests.installed(PatchFamily.Capability.BOOKMARKS);
        Message scheduled = new Message(11, ANNA, 0);
        scheduled.apart = true;
        assertFalse("numbered apart from the chat", Bookmarks.offered(scheduled));
        assertFalse("still sending", Bookmarks.offered(new Message(-3, ANNA, 0)));
        assertFalse("a secret chat", Bookmarks.offered(new Message(10, SECRET, 0)));
        assertFalse("an account with no user yet", Bookmarks.offered(new Message(10, ANNA, 2)));
        assertTrue("a group's message", Bookmarks.offered(new Message(12, FRIENDS, 1)));
        PauseForTests.pause(HushTelegramPause.Reason.CRASH_LOOP);
        assertFalse("paused", Bookmarks.offered(message));
        assertFalse(Bookmarks.rowShown());
    }

    @Test public void theMenuOffersBookmarkThenRemoveBookmarkOnceSaved() throws Exception {
        Message message = new Message(10, ANNA, 0);
        message.sender = ANNA;
        message.text = "see you at 8";
        assertTrue(MessageMenuTools.any());
        List<Object> icons = new ArrayList<>(Collections.singletonList(0));
        List<Object> items = new ArrayList<>(Collections.singletonList("Message details"));
        List<Object> options = new ArrayList<>(Collections.singletonList(MessageMenu.DETAILS));
        MessageMenuTools.offer(new Object(), message, icons, items, options, false);
        assertEquals(Arrays.asList(MessageMenuTools.BOOKMARK, MessageMenu.DETAILS), options);
        assertEquals("Bookmark", items.get(0));
        assertEquals(MARK, icons.get(0));

        Menu.selected = message;
        MessageMenu.chosen(new Object(), MessageMenuTools.BOOKMARK);
        settle();
        assertEquals("Bookmarked.", ShadowToast.getTextOfLatestToast());
        assertTrue(Bookmarks.has(Settings.BOOKMARKS.savedValue(), SELF, ANNA, 10));

        icons = new ArrayList<>(Collections.singletonList(0));
        items = new ArrayList<>(Collections.singletonList("Message details"));
        options = new ArrayList<>(Collections.singletonList(MessageMenu.DETAILS));
        MessageMenuTools.offer(new Object(), message, icons, items, options, false);
        assertEquals("Remove bookmark", items.get(0));
        assertEquals(UNMARK, icons.get(0));

        MessageMenu.chosen(new Object(), MessageMenuTools.BOOKMARK);
        settle();
        assertEquals("Bookmark removed.", ShadowToast.getTextOfLatestToast());
        assertEquals("", Settings.BOOKMARKS.savedValue());
        assertEquals("Bookmark", Bookmarks.label(message));
    }

    @Test public void aBookmarkKeepsWhoSentItWhereAndWhatItSaid() throws Exception {
        Message group = new Message(20, FRIENDS, 0);
        group.sender = ANNA;
        group.text = "  lunch\nat   noon ";
        group.topic = 4;
        Bookmarks.Entry saved = bookmark(group);
        assertEquals(SELF, saved.owner);
        assertEquals(FRIENDS, saved.dialog);
        assertEquals(20, saved.message);
        assertEquals(4, saved.topic);
        assertEquals(1_700_000_000, saved.date);
        assertTrue(saved.saved > 0);
        assertEquals("Friends", saved.chat);
        assertEquals("Anna: lunch at noon", saved.shown());

        Message mine = new Message(21, FRIENDS, 0);
        mine.sender = SELF;
        mine.document = "report.pdf";
        assertEquals("You: report.pdf", bookmark(mine).shown());

        Message photo = new Message(22, ANNA, 0);
        photo.sender = ANNA;
        photo.text = "   ";
        photo.photo = true;
        photo.topic = 9;
        Bookmarks.Entry person = bookmark(photo);
        assertEquals("a person's chat has no sender line", "Photo", person.shown());
        assertEquals("nor a topic", 0, person.topic);
        assertEquals("Anna", person.chat);

        Message video = new Message(23, FRIENDS, 0);
        video.sender = FRIENDS;
        video.video = true;
        assertEquals("a channel's own post", "Video", bookmark(video).shown());
        assertEquals("Message", bookmark(new Message(24, FRIENDS, 0)).shown());
        assertEquals(Arrays.asList(24, 23, 22, 21, 20), ids(Settings.BOOKMARKS.savedValue()));
    }

    @Test public void aFullListSaysHowManyItKeeps() throws Exception {
        String full = "";
        for (int i = 1; i <= Bookmarks.MAX; i++) full = Bookmarks.added(full, entry(FRIENDS, i, i));
        Settings.BOOKMARKS.save(full);
        Bookmarks.toggle(context, new Message(500, ANNA, 0));
        settle();
        assertEquals("You can keep up to 100 bookmarks.", ShadowToast.getTextOfLatestToast());
        assertEquals(full, Settings.BOOKMARKS.savedValue());
        Bookmarks.toggle(context, new Message(1, FRIENDS, 0));
        settle();
        assertEquals("one already there still comes off", "Bookmark removed.", ShadowToast.getTextOfLatestToast());
        assertEquals(Bookmarks.MAX - 1, Bookmarks.count(Settings.BOOKMARKS.savedValue()));
    }

    @Test public void aMessageWithNoPlaceSaysItCouldntBeSaved() throws Exception {
        Bookmarks.toggle(context, new Message(10, ANNA, 2));
        settle();
        assertEquals("Couldn't save the bookmark. Try again.", ShadowToast.getTextOfLatestToast());
        assertEquals("", Settings.BOOKMARKS.savedValue());
    }

    // ---- The list -----------------------------------------------------------------------------

    @Test public void theListKeepsEachMessageOnceNewestFirst() {
        String one = Bookmarks.added("", entry(ANNA, 10, 1));
        String two = Bookmarks.added(one, entry(FRIENDS, 11, 2));
        assertEquals(Arrays.asList(11, 10), ids(two));
        String again = Bookmarks.added(two, entry(ANNA, 10, 3));
        assertEquals("bookmarking it again moves it first", Arrays.asList(10, 11), ids(again));
        assertTrue(Bookmarks.has(again, SELF, ANNA, 10));
        assertFalse("the same message in another account", Bookmarks.has(again, 6L, ANNA, 10));
        assertFalse("the same id in another chat", Bookmarks.has(again, SELF, FRIENDS, 10));
        String fewer = Bookmarks.removed(again, SELF, ANNA, 10);
        assertEquals(Collections.singletonList(11), ids(fewer));
        assertEquals("removing what isn't there changes nothing", fewer, Bookmarks.removed(fewer, SELF, ANNA, 10));
        assertEquals("", Bookmarks.removed(fewer, SELF, FRIENDS, 11));
        assertEquals(0, Bookmarks.count(null));
    }

    @Test public void aFullListTakesNoNewBookmarkButMovesAnOldOne() {
        String full = "";
        for (int i = 1; i <= Bookmarks.MAX; i++) full = Bookmarks.added(full, entry(ANNA, i, i));
        assertEquals(Bookmarks.MAX, Bookmarks.count(full));
        assertNull(Bookmarks.added(full, entry(ANNA, Bookmarks.MAX + 1, 999)));
        String moved = Bookmarks.added(full, entry(ANNA, 1, 999));
        assertEquals(Integer.valueOf(1), ids(moved).get(0));
        assertEquals(Bookmarks.MAX, Bookmarks.count(moved));
    }

    @Test public void aSavedLineHoldsOneLineOfShortText() {
        Bookmarks.Entry entry = new Bookmarks.Entry(SELF, FRIENDS, 12, 3, 1_700_000_000, 7L,
                "An\tna", "Fri\nends", "two\nlines\tand  spaces");
        assertEquals("An na", entry.sender);
        assertEquals("Fri ends", entry.chat);
        assertEquals("two lines and spaces", entry.preview);
        Bookmarks.Entry back = Bookmarks.entry(entry.line());
        assertNotNull(back);
        assertEquals(SELF, back.owner);
        assertEquals(FRIENDS, back.dialog);
        assertEquals(12, back.message);
        assertEquals(3, back.topic);
        assertEquals(1_700_000_000, back.date);
        assertEquals(7L, back.saved);
        assertEquals("An na: two lines and spaces", back.shown());
        assertEquals("no topic below 0", 0,
                new Bookmarks.Entry(SELF, FRIENDS, 12, -4, 0, 0, "", "", "").topic);

        String face = new String(Character.toChars(0x1F600));
        int max = Bookmarks.PREVIEW_CHARS;
        assertEquals("never half a character", repeat('x', max - 2) + ELLIPSIS,
                Bookmarks.clean(repeat('x', max - 2) + face + "yy", max));
        assertEquals(repeat('x', max), Bookmarks.clean(repeat('x', max), max));
        assertEquals(repeat('x', max - 1) + ELLIPSIS, Bookmarks.clean(repeat('x', max + 5), max));
    }

    @Test public void aListReadBackLeavesOutWhatIsntABookmark() {
        String good = entry(ANNA, 10, 1).line();
        String saved = "junk\n" + good + "\n" + good + "\n5\t0\t11\t0\t1\t1\t\tA\tb\n5\t100\tx\t0\t1\t1\t\tA\tb"
                + "\n6\t100\t-1\t0\t1\t1\t\tA\tb\n0\t100\t13\t0\t1\t1\t\tA\tb\n5\t100\t14";
        assertEquals(Collections.singletonList(10), ids(saved));
        assertEquals(Collections.singletonList(good), Bookmarks.lines(saved));

        assertEquals("each message once", good, Bookmarks.fromLines(Arrays.asList(good, good)));
        assertNull(Bookmarks.fromLines(Arrays.asList(good, "junk")));
        assertNull(Bookmarks.fromLines(Collections.singletonList(good + "\r")));
        assertNull(Bookmarks.fromLines(Collections.singletonList(good + "\n" + good)));
        List<String> tooMany = new ArrayList<>();
        for (int i = 1; i <= Bookmarks.MAX + 1; i++) tooMany.add(entry(ANNA, i, i).line());
        assertNull(Bookmarks.fromLines(tooMany));
        assertEquals(Bookmarks.MAX, Bookmarks.count(Bookmarks.fromLines(tooMany.subList(0, Bookmarks.MAX))));
    }

    @Test public void aFilesBookmarksJoinThePhonesKeepingThePhonesCopy() {
        Bookmarks.Entry mine = new Bookmarks.Entry(SELF, ANNA, 10, 0, 1, 50, "", "Anna", "edited");
        Bookmarks.Entry theirs = new Bookmarks.Entry(SELF, ANNA, 10, 0, 1, 90, "", "Anna", "first");
        String merged = Bookmarks.merged(mine.line() + "\n" + entry(ANNA, 11, 10).line(),
                theirs.line() + "\n" + entry(FRIENDS, 12, 70).line());
        assertEquals("newest bookmark first", Arrays.asList(12, 10, 11), ids(merged));
        assertEquals("edited", Bookmarks.parse(merged).get(1).preview);
        assertEquals(mine.line(), Bookmarks.merged(mine.line(), null));
        assertEquals(theirs.line(), Bookmarks.merged("", theirs.line()));

        String full = "";
        for (int i = 1; i <= Bookmarks.MAX; i++) full = Bookmarks.added(full, entry(ANNA, i, i));
        String capped = Bookmarks.merged(full, entry(FRIENDS, 500, 1000).line());
        assertEquals(Bookmarks.MAX, Bookmarks.count(capped));
        assertEquals(Integer.valueOf(500), ids(capped).get(0));
        assertFalse("the oldest is left out", Bookmarks.has(capped, SELF, ANNA, 1));
    }

    @Test public void thePageRemovesABookmarkWhateverTheSwitchSays() {
        Settings.MESSAGE_MENU_BOOKMARKS.save(false);
        Bookmarks.Entry kept = entry(FRIENDS, 11, 2);
        Bookmarks.Entry gone = entry(ANNA, 10, 1);
        Settings.BOOKMARKS.save(Bookmarks.added(Bookmarks.added("", gone), kept));
        assertTrue(Bookmarks.remove(gone));
        assertEquals(kept.line(), Settings.BOOKMARKS.savedValue());
        assertTrue("already gone", Bookmarks.remove(gone));
        assertEquals(kept.line(), Settings.BOOKMARKS.savedValue());
    }

    // ---- Where a bookmark opens ---------------------------------------------------------------

    @Test public void aBookmarkOpensWhereItsChatStillIs() throws Exception {
        Phone phone = new Phone();
        Bookmarks.Entry entry = new Bookmarks.Entry(SELF, FRIENDS, 11, 3, 1, 1, "", "Friends", "hi");
        Bookmarks.Route open = Bookmarks.route(phone, entry);
        assertEquals(0, open.account);
        assertEquals("not a forum", 0, open.topic);
        assertNull(open.said);

        phone.place = Bookmarks.Place.FORUM;
        assertEquals(3, Bookmarks.route(phone, entry).topic);
        assertEquals("a bookmark from before the chat became a forum opens General", 1,
                Bookmarks.route(phone, new Bookmarks.Entry(SELF, FRIENDS, 11, 0, 1, 1, "", "Friends", "hi")).topic);

        phone.message = false;
        Bookmarks.Route missing = Bookmarks.route(phone, entry);
        assertEquals("the chat still opens", 0, missing.account);
        assertEquals("That message isn't on this phone anymore.", missing.said);
    }

    @Test public void aChatThatsGoneOrLeftSaysSoAndOpensNothing() throws Exception {
        Phone phone = new Phone();
        Bookmarks.Entry entry = new Bookmarks.Entry(SELF, FRIENDS, 11, 0, 1, 1, "", "Friends", "hi");
        phone.place = Bookmarks.Place.GONE;
        Bookmarks.Route gone = Bookmarks.route(phone, entry);
        assertEquals(-1, gone.account);
        assertEquals("That chat isn't on this phone anymore.", gone.said);

        phone.place = Bookmarks.Place.LEFT;
        Bookmarks.Route left = Bookmarks.route(phone, entry);
        assertEquals(-1, left.account);
        assertEquals("You're not in that chat anymore.", left.said);

        phone.asked.clear();
        Bookmarks.Route signedOut = Bookmarks.route(phone, new Bookmarks.Entry(6L, FRIENDS, 11, 0, 1, 1, "", "Friends", "hi"));
        assertEquals(-1, signedOut.account);
        assertEquals("That account isn't signed in here.", signedOut.said);
        assertTrue("no account, no lookup", phone.asked.isEmpty());
    }

    @Test public void tappingABookmarkOpensItsChatAtTheMessage() throws Exception {
        Phone phone = new Phone();
        phone.account = 1;
        phone.place = Bookmarks.Place.FORUM;
        Bookmarks.tables = phone;
        Activity activity = Robolectric.buildActivity(Activity.class).setup().get();
        int[] opened = {0};
        Bookmarks.Entry inTopic = new Bookmarks.Entry(SELF, FRIENDS, 11, 3, 1, 1, "", "Friends", "hi");
        Bookmarks.open(activity, inTopic, () -> opened[0]++);
        settle();
        Intent intent = Shadows.shadowOf(activity).getNextStartedActivity();
        assertNotNull(intent);
        assertTrue(intent.getAction(), intent.getAction().startsWith(Bookmarks.OPEN_CHAT));
        assertEquals(Bookmarks.LAUNCHER, intent.getComponent().getClassName());
        assertEquals(1, intent.getIntExtra("currentAccount", -1));
        assertEquals(200L, intent.getLongExtra("chatId", 0));
        assertEquals(3L, intent.getLongExtra("topicId", 0));
        assertEquals(11, intent.getIntExtra("message_id", 0));
        assertFalse(intent.hasExtra("userId"));
        assertEquals(1, opened[0]);
        assertNull("nothing to say", ShadowToast.getTextOfLatestToast());

        phone.place = Bookmarks.Place.OPEN;
        Bookmarks.open(activity, new Bookmarks.Entry(SELF, ANNA, 12, 0, 1, 1, "", "Anna", "hi"), null);
        settle();
        intent = Shadows.shadowOf(activity).getNextStartedActivity();
        assertEquals("a person's chat goes by their id", ANNA, intent.getLongExtra("userId", 0));
        assertFalse(intent.hasExtra("chatId"));
        assertFalse(intent.hasExtra("topicId"));
        assertEquals(12, intent.getIntExtra("message_id", 0));

        phone.message = false;
        Bookmarks.open(activity, inTopic, () -> opened[0]++);
        settle();
        assertNotNull("the chat opens without its message", Shadows.shadowOf(activity).getNextStartedActivity());
        assertEquals("That message isn't on this phone anymore.", ShadowToast.getTextOfLatestToast());
        assertEquals(2, opened[0]);

        phone.place = Bookmarks.Place.GONE;
        Bookmarks.open(activity, inTopic, () -> opened[0]++);
        settle();
        assertNull(Shadows.shadowOf(activity).getNextStartedActivity());
        assertEquals("That chat isn't on this phone anymore.", ShadowToast.getTextOfLatestToast());
        assertEquals("the page stays open", 2, opened[0]);
    }
}
