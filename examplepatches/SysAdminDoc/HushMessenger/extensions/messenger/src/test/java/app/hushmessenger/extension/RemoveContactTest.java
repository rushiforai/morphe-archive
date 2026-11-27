package app.hushmessenger.extension;

import android.content.Context;
import android.os.Looper;

import com.facebook.auth.usersession.FbUserSession;
import com.facebook.user.model.User;
import com.facebook.user.model.UserKey;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.Executor;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowToast;

import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class RemoveContactTest {
    /** Messenger's friendship values, in its order, under an enum that says nothing by its own name. */
    enum Bond { UNKNOWN, CANNOT_REQUEST, ARE_FRIENDS, INCOMING_REQUEST, OUTGOING_REQUEST, CAN_REQUEST }

    /** Messenger's kinds of user. */
    enum Kind { FACEBOOK, INSTAGRAM, PAGE, EVENT, GROUP, PARENT_APPROVED_USER, UNSET }

    /** Some of Messenger's menu icons, the minus ones in between. */
    enum Glyph { EYE_CROSSED, MINUS_CIRCLE, FRIEND_GENERIC_MINUS, BLOCK }

    /** Icons with neither minus one. */
    enum OtherGlyph { EYE_CROSSED, BLOCK }

    /** A contact menu row as 503 builds one: icon, spoken text, title, the parts it draws, its id and a flag. */
    static final class Row {
        final Glyph A00;
        final String A01;
        final String A02;
        final Set<String> A03;
        final int A04;
        final boolean A05;

        Row(Glyph icon, String spoken, String title, Set<String> parts, int id, boolean flag) {
            A00 = icon;
            A01 = spoken;
            A02 = title;
            A03 = parts;
            A04 = id;
            A05 = flag;
        }
    }

    /** The same row in a build whose icon enum has neither minus icon. */
    static final class PlainRow {
        final OtherGlyph A00;
        final String A01;
        final String A02;
        final Set<String> A03;
        final int A04;
        final boolean A05;

        PlainRow(OtherGlyph icon, String spoken, String title, Set<String> parts, int id, boolean flag) {
            A00 = icon;
            A01 = spoken;
            A02 = title;
            A03 = parts;
            A04 = id;
            A05 = flag;
        }
    }

    /** A row class with no constructor shaped like Messenger's. */
    static final class OddRow {
        final int A00;

        OddRow(int id) {
            A00 = id;
        }
    }

    /** A contact menu socket: the screen, the account, the person and where the menu was opened from. */
    static final class Socket {
        final Context A02;
        final FbUserSession A05;
        final User A0C;
        final String A0D;
        int A01;

        Socket(Context screen, User person, String entry) {
            A02 = screen;
            A05 = new FbUserSession(ME);
            A0C = person;
            A0D = entry;
        }
    }

    private static final String THEM = "100042";
    private static final String ME = "100001";
    private static final int HIDE_CONTACT = 8;

    /** What the fake removal was asked for, and what it hands back. */
    private final List<Object[]> started = new ArrayList<>();
    private CompletableFuture<Object> removed;
    private CompletableFuture<Object> fetched;
    private boolean startFails;

    private RemoveContact.Removal savedRemoval;
    private Executor savedWorker;

    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().putBoolean(RemoveContact.KEY, true).commit();
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        CrashGuard.resetForTests();
        StrangerSend.resetForTests();
        ShadowToast.reset();
        savedRemoval = RemoveContact.removal;
        savedWorker = RemoveContact.worker;
        removed = CompletableFuture.completedFuture(null);
        fetched = CompletableFuture.completedFuture(null);
        RemoveContact.removal = (screen, session, userId) -> {
            started.add(new Object[] {screen, session, userId});
            return startFails ? null : new Object[] {removed, fetched};
        };
        RemoveContact.worker = Runnable::run;
    }

    @After public void restore() {
        RemoveContact.removal = savedRemoval;
        RemoveContact.worker = savedWorker;
        StrangerSend.resetForTests();
        Settings.hookErrors.clear();
    }

    private static User person(Bond bond, Kind kind, String typeName) {
        User user = new User("Pat", typeName, false);
        user.A0f = bond;
        user.A0Y = kind;
        user.A0p = new UserKey(THEM);
        return user;
    }

    private static Socket menu(User person) {
        return new Socket(RuntimeEnvironment.getApplication(), person, "people_tab_long_click");
    }

    private static Socket stranger() {
        return menu(person(Bond.CAN_REQUEST, Kind.FACEBOOK, "User"));
    }

    /** Hide contact's row, the one Messenger itself puts in this menu. */
    private static List<Object> stockRows() {
        List<Object> rows = new ArrayList<>();
        rows.add(new Row(Glyph.EYE_CROSSED, "Hide contact", "Hide contact", Collections.singleton("icon"), HIDE_CONTACT, true));
        return rows;
    }

    private static List<Object> rowsFor(Object socket) {
        List<Object> rows = stockRows();
        RemoveContact.contactRows(socket, rows);
        return rows;
    }

    private static boolean tap(Object socket, int id) {
        boolean ours = RemoveContact.contactTapped(socket, id);
        shadowOf(Looper.getMainLooper()).idle();
        return ours;
    }

    private static String text(String key) {
        return new SettingsText(RuntimeEnvironment.getApplication()).get(key);
    }

    @Test public void someoneWhoIsntAFriendGetsTheRowAfterMessengersOwn() {
        List<Object> rows = rowsFor(stranger());
        assertEquals(2, rows.size());
        Row row = (Row) rows.get(1);
        assertEquals(RemoveContact.ROW_ID, row.A04);
        assertEquals("Remove contact", row.A02);
        assertEquals(row.A02, row.A01);
        assertEquals(Glyph.FRIEND_GENERIC_MINUS, row.A00);
        assertEquals(Collections.singleton("icon"), row.A03);
        assertTrue("Set like Hide contact's", row.A05);
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void everyKindOfNonFriendGetsTheRow() {
        for (Bond bond : new Bond[] {Bond.CAN_REQUEST, Bond.CANNOT_REQUEST, Bond.INCOMING_REQUEST, Bond.OUTGOING_REQUEST}) {
            for (Kind kind : new Kind[] {Kind.FACEBOOK, Kind.INSTAGRAM}) {
                assertEquals(bond + " " + kind, 2, rowsFor(menu(person(bond, kind, "User"))).size());
            }
        }
    }

    @Test public void aFriendGetsNoRow() {
        assertEquals(stockRows().size(), rowsFor(menu(person(Bond.ARE_FRIENDS, Kind.FACEBOOK, "User"))).size());
        assertEquals(stockRows().size(), rowsFor(menu(person(Bond.ARE_FRIENDS, Kind.INSTAGRAM, "User"))).size());
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void pagesAndPeopleMessengerHasntWorkedOutGetNoRow() {
        assertEquals("A page", 1, rowsFor(menu(person(Bond.CAN_REQUEST, Kind.PAGE, "User"))).size());
        assertEquals("A user the server typed as a page", 1, rowsFor(menu(person(Bond.CAN_REQUEST, Kind.FACEBOOK, "page"))).size());
        assertEquals("A kind that isn't a person", 1, rowsFor(menu(person(Bond.CAN_REQUEST, Kind.UNSET, "User"))).size());
        assertEquals("Friendship not known yet", 1, rowsFor(menu(person(Bond.UNKNOWN, Kind.FACEBOOK, "User"))).size());
        assertEquals("No friendship at all", 1, rowsFor(menu(person(null, Kind.FACEBOOK, "User"))).size());
        assertEquals("No person", 1, rowsFor(menu(null)).size());
        User nobody = person(Bond.CAN_REQUEST, Kind.FACEBOOK, "User");
        nobody.A0p = null;
        assertEquals("No id to remove", 1, rowsFor(menu(nobody)).size());
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void searchsMenuForPeopleWhoArentContactsGetsNoRow() {
        Socket notAContact = new Socket(RuntimeEnvironment.getApplication(), person(Bond.CAN_REQUEST, Kind.FACEBOOK, "User"), RemoveContact.NONCONTACT);
        assertEquals(1, rowsFor(notAContact).size());
    }

    @Test public void theRowGoesInOnceHoweverOftenTheMenuIsBuilt() {
        Socket socket = stranger();
        List<Object> rows = rowsFor(socket);
        RemoveContact.contactRows(socket, rows);
        assertEquals(2, rows.size());
    }

    @Test public void anEmptyMenuGetsNoRowSinceThereIsNothingToCopy() {
        List<Object> rows = new ArrayList<>();
        RemoveContact.contactRows(stranger(), rows);
        assertTrue(rows.isEmpty());
    }

    @Test public void theSwitchOffChangesNothing() {
        Settings.preferences.edit().putBoolean(RemoveContact.KEY, false).commit();
        assertEquals(1, rowsFor(stranger()).size());
        assertFalse("Messenger handles the tap as before", tap(stranger(), RemoveContact.ROW_ID));
        assertTrue(started.isEmpty());
        assertNull(ShadowToast.getTextOfLatestToast());
        assertEquals(0, Settings.lastActive(RemoveContact.KEY));
    }

    @Test public void pauseSafeModeAndAMissingControlChangeNothing() {
        for (String state : new String[] {"paused", "safe", "missing"}) {
            Settings.initialize(RuntimeEnvironment.getApplication());
            Settings.preferences.edit().clear().putBoolean(RemoveContact.KEY, true)
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            if (state.equals("missing")) Settings.installed = Collections.emptySet();
            Settings.activeAt.clear();
            assertEquals(state, 1, rowsFor(stranger()).size());
            assertFalse(state, tap(stranger(), RemoveContact.ROW_ID));
        }
        assertTrue(started.isEmpty());
    }

    @Test public void theRowsTapStartsMessengersRemovalForThatPerson() {
        Socket socket = stranger();
        assertTrue(tap(socket, RemoveContact.ROW_ID));
        assertEquals(1, started.size());
        assertSame("The menu's own screen", socket.A02, started.get(0)[0]);
        assertSame("The menu's own account", socket.A05, started.get(0)[1]);
        assertEquals(THEM, started.get(0)[2]);
        assertEquals(text(RemoveContact.DONE), ShadowToast.getTextOfLatestToast());
        assertEquals("Removed from your contacts", text(RemoveContact.DONE));
        assertEquals(1, ShadowToast.shownToastCount());
        assertTrue(Settings.hookErrors.isEmpty());
        assertTrue(Settings.lastActive(RemoveContact.KEY) > 0);
    }

    @Test public void theToastWaitsForTheDelete() {
        removed = new CompletableFuture<>();
        List<Runnable> waits = new ArrayList<>();
        RemoveContact.worker = waits::add;
        assertTrue(tap(stranger(), RemoveContact.ROW_ID));
        assertNull("Nothing yet while Messenger works", ShadowToast.getTextOfLatestToast());
        removed.complete(null);
        waits.get(0).run();
        shadowOf(Looper.getMainLooper()).idle();
        assertEquals(text(RemoveContact.DONE), ShadowToast.getTextOfLatestToast());
    }

    @Test public void messengersOwnRowsAreLeftToMessenger() {
        for (int id : new int[] {1, 7, HIDE_CONTACT, 9, 0, -1}) assertFalse(String.valueOf(id), tap(stranger(), id));
        assertTrue(started.isEmpty());
        assertNull(ShadowToast.getTextOfLatestToast());
    }

    @Test public void aFetchThatFailsSaysSo() {
        fetched = new CompletableFuture<>();
        fetched.completeExceptionally(new IllegalStateException("Unable to fetch contact for deletion."));
        removed = new CompletableFuture<>();
        assertTrue(tap(stranger(), RemoveContact.ROW_ID));
        assertEquals(text(RemoveContact.FAILED), ShadowToast.getTextOfLatestToast());
        assertEquals("Couldn't remove this contact", text(RemoveContact.FAILED));
        assertEquals(Collections.singleton(RemoveContact.KEY), Settings.hookErrors.keySet());
    }

    @Test public void aDeleteThatFailsSaysSo() {
        removed = new CompletableFuture<>();
        removed.completeExceptionally(new RuntimeException("delete_contact failed"));
        assertTrue(tap(stranger(), RemoveContact.ROW_ID));
        assertEquals(text(RemoveContact.FAILED), ShadowToast.getTextOfLatestToast());
        assertEquals(Collections.singleton(RemoveContact.KEY), Settings.hookErrors.keySet());
    }

    @Test public void aRemovalThatDoesntStartSaysSo() {
        startFails = true;
        assertTrue("The row was ours, so Messenger gets nothing to handle", tap(stranger(), RemoveContact.ROW_ID));
        assertEquals(text(RemoveContact.FAILED), ShadowToast.getTextOfLatestToast());
        assertEquals(Collections.singleton(RemoveContact.KEY), Settings.hookErrors.keySet());
    }

    @Test public void aMenuWithoutItsPersonSaysSoInsteadOfStarting() {
        User nobody = person(Bond.CAN_REQUEST, Kind.FACEBOOK, "User");
        nobody.A0p = null;
        assertTrue(tap(menu(nobody), RemoveContact.ROW_ID));
        assertTrue(started.isEmpty());
        assertEquals(text(RemoveContact.FAILED), ShadowToast.getTextOfLatestToast());
    }

    @Test public void aBuildWithoutTheMinusIconsGetsARowWithNoIcon() {
        List<Object> rows = new ArrayList<>();
        rows.add(new PlainRow(OtherGlyph.EYE_CROSSED, "Hide contact", "Hide contact", Collections.singleton("icon"), HIDE_CONTACT, true));
        RemoveContact.contactRows(stranger(), rows);
        PlainRow row = (PlainRow) rows.get(1);
        assertNull(row.A00);
        assertEquals(new HashSet<String>(), row.A03);
        assertEquals(RemoveContact.ROW_ID, row.A04);
    }

    @Test public void aRowItCantBuildLeavesTheMenuAsItWasAndIsRecorded() {
        List<Object> rows = new ArrayList<>();
        rows.add(new OddRow(HIDE_CONTACT));
        RemoveContact.contactRows(stranger(), rows);
        assertEquals(1, rows.size());
        assertEquals(Collections.singleton(RemoveContact.KEY), Settings.hookErrors.keySet());
    }

    @Test public void theRowAndItsToastsAreTranslated() {
        for (String key : new String[] {RemoveContact.ROW, RemoveContact.DONE, RemoveContact.FAILED}) {
            for (String tag : SettingsTranslations.LOCALES.keySet()) {
                String english = SettingsText.ENGLISH.get(key);
                String local = new SettingsText(java.util.Locale.forLanguageTag(tag)).get(key);
                assertNotNull(tag + " " + key, local);
                assertNotEquals(tag + " " + key, english, local);
            }
        }
    }
}
