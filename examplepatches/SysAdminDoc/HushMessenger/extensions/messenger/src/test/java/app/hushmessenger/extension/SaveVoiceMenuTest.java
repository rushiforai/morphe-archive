package app.hushmessenger.extension;

import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import android.os.Looper;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowToast;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 36)
public class SaveVoiceMenuTest {
    static final Executor WORKER = VoiceMessages.copies;
    static final VoiceMessages.Library SHARED = VoiceMessages.library;
    static final SaveVoiceMenu.Menu STUBS = SaveVoiceMenu.menu;
    /** Here and not in a test: the first use runs VoiceMessagesTest's static setup, which keeps whatever worker and library are set then. */
    static final byte[] SOUND = VoiceMessagesTest.m4a("sound");

    @Rule public TemporaryFolder folder = new TemporaryFolder();

    final Object ourRow = new Object();
    final Object otherRow = new Object();
    final Object tap = new Object();
    final Object session = new Object();
    final Uri message = Uri.parse("content://message/1");
    final Object sheet = new Object();
    final Object hold = new Object();
    final Uri remote = Uri.parse("https://example.com/voice.m4a");

    /** The stand-in for Messenger's classes. */
    final class FakeMenu implements SaveVoiceMenu.Menu {
        boolean voice = true, voiceFails, rowFails, rowIdFails, fetchFails;
        Object row = ourRow, givenSession = session;
        Uri audio;
        CharSequence title;
        int id, fetches;
        Object fetchedSession, fetchedMessage;
        Uri heldVoice = remote, fetchedVoice;
        boolean voiceUriFails;
        Object heldMessage = hold;
        final List<Object> sheetRows = new ArrayList<>();
        Object sheetBuilder;

        @Override public Object row(CharSequence title, int id) {
            if (rowFails) throw new IllegalStateException("no row");
            this.title = title;
            this.id = id;
            return row;
        }

        @Override public int rowId(Object item) {
            if (rowIdFails) throw new ClassCastException("not an item");
            return item == ourRow ? SaveVoiceMenu.ROW_ID : 7;
        }

        @Override public boolean isVoice(Object message) {
            if (voiceFails) throw new IllegalStateException("no classifier");
            return voice;
        }

        @Override public Object session(Object tap) {
            return givenSession;
        }

        @Override public Uri fetch(Object session, Object message) {
            fetches++;
            fetchedSession = session;
            fetchedMessage = message;
            if (fetchFails) throw new IllegalStateException("no download");
            return audio;
        }

        @Override public boolean addRow(Object builder, Object row) {
            sheetBuilder = builder;
            sheetRows.add(row);
            return true;
        }

        @Override public Object held(Object tap) {
            return heldMessage;
        }

        @Override public Object sheetSession(Object tap) {
            return givenSession;
        }

        @Override public Uri voiceUri(Object given) {
            if (voiceUriFails) throw new IllegalStateException("no row model");
            return given == hold ? heldVoice : null;
        }

        @Override public Uri fetchUri(Object session, Uri voice) {
            fetches++;
            fetchedSession = session;
            fetchedVoice = voice;
            if (fetchFails) throw new IllegalStateException("no download");
            return audio;
        }
    }

    final FakeMenu fake = new FakeMenu();
    final List<String> added = new ArrayList<>();
    final Set<String> stored = new HashSet<>();

    final VoiceMessages.Library library = new VoiceMessages.Library() {
        @Override public boolean has(Context context, String hash) {
            return stored.contains(hash);
        }

        @Override public void add(Context context, String name, String mime, byte[] sound) {
            added.add(name + "|" + mime);
        }
    };

    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        CrashGuard.resetForTests();
        VoiceMessages.saved.clear();
        VoiceMessages.copies = Runnable::run;
        VoiceMessages.library = library;
        SaveVoiceMenu.menu = fake;
    }

    @After public void restore() {
        VoiceMessages.copies = WORKER;
        VoiceMessages.library = SHARED;
        VoiceMessages.saved.clear();
        SaveVoiceMenu.menu = STUBS;
    }

    void turnOn() {
        Settings.preferences.edit().putBoolean(SaveVoiceMenu.KEY, true).commit();
    }

    Bundle extra() {
        Bundle bundle = new Bundle();
        bundle.putParcelable("rowMessage", message);
        return bundle;
    }

    Uri cached() throws IOException {
        File file = folder.newFile();
        Files.write(file.toPath(), SOUND);
        return Uri.fromFile(file);
    }

    String toast() {
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        return ShadowToast.getTextOfLatestToast();
    }

    static List<Object> rows(int count) {
        List<Object> rows = new ArrayList<>();
        for (int i = 0; i < count; i++) rows.add("row" + i);
        return rows;
    }

    @Test public void withTheSwitchOffTheMenuKeepsItsOwnList() {
        List<Object> rows = rows(4);
        assertSame(rows, SaveVoiceMenu.rows(rows, extra()));
        assertNull(fake.title);
    }

    @Test public void aMenuThatIsntForAMessageKeepsItsOwnList() {
        turnOn();
        List<Object> rows = rows(4);
        assertSame(rows, SaveVoiceMenu.rows(rows, "not a Bundle"));
        assertSame(rows, SaveVoiceMenu.rows(rows, null));
        assertSame(rows, SaveVoiceMenu.rows(rows, new Bundle()));
        assertNull(fake.title);
    }

    @Test public void anotherKindOfMessageKeepsItsOwnList() {
        turnOn();
        fake.voice = false;
        List<Object> rows = rows(4);
        assertSame(rows, SaveVoiceMenu.rows(rows, extra()));
        assertNull(fake.title);
    }

    @Test public void aVoiceMessageGetsTheRowUnderMore() {
        turnOn();
        List<Object> rows = rows(5);
        List<Object> added = SaveVoiceMenu.rows(rows, extra());
        assertEquals(Arrays.asList("row0", "row1", "row2", ourRow, "row3", "row4"), added);
        assertEquals("Save voice message", fake.title.toString());
        assertEquals(SaveVoiceMenu.ROW_ID, fake.id);
        assertEquals("The builder's own list stays as it was", rows(5), rows);
    }

    /** Messenger splits a long menu in two and builds the More part as a second menu with the same message. */
    @Test public void theMorePartOfASplitMenuKeepsOneRow() {
        turnOn();
        List<Object> more = new ArrayList<>(Arrays.asList(ourRow, otherRow));
        assertSame(more, SaveVoiceMenu.rows(more, extra()));
    }

    @Test public void aShortMenuGetsTheRowAtItsEnd() {
        turnOn();
        assertEquals(Arrays.asList("row0", ourRow), SaveVoiceMenu.rows(rows(1), extra()));
        assertEquals(Collections.singletonList(ourRow), SaveVoiceMenu.rows(rows(0), extra()));
    }

    @Test public void aListThatCantBeChangedStillGetsTheRow() {
        turnOn();
        assertEquals(Arrays.asList("row0", ourRow), SaveVoiceMenu.rows(Collections.unmodifiableList(rows(1)), extra()));
    }

    @Test public void noListStaysNoList() {
        turnOn();
        assertNull(SaveVoiceMenu.rows(null, extra()));
    }

    @Test public void aFailureKeepsTheMenuAndIsRecorded() {
        turnOn();
        List<Object> rows = rows(4);
        fake.voiceFails = true;
        assertSame(rows, SaveVoiceMenu.rows(rows, extra()));
        assertTrue(Settings.hookErrors.get(SaveVoiceMenu.KEY).startsWith("java.lang.IllegalStateException"));
        fake.voiceFails = false;
        fake.rowFails = true;
        assertSame(rows, SaveVoiceMenu.rows(rows, extra()));
        fake.rowFails = false;
        fake.row = null;
        assertSame("Stubs that were never written make no row", rows, SaveVoiceMenu.rows(rows, extra()));
    }

    @Config(sdk = 28)
    @Test public void androidNineGetsNoRow() {
        turnOn();
        List<Object> rows = rows(4);
        assertSame(rows, SaveVoiceMenu.rows(rows, extra()));
        assertNull(fake.title);
    }

    @Test public void messengersOwnRowsGoBackToMessenger() throws IOException {
        fake.audio = cached();
        assertFalse(SaveVoiceMenu.clicked(tap, otherRow, extra()));
        assertFalse(SaveVoiceMenu.clicked(tap, null, extra()));
        assertEquals(0, fake.fetches);
        assertNull(ShadowToast.getTextOfLatestToast());
    }

    @Test public void aRowItCantReadGoesBackToMessenger() {
        fake.rowIdFails = true;
        assertFalse(SaveVoiceMenu.clicked(tap, ourRow, extra()));
        assertEquals(0, fake.fetches);
        assertTrue(Settings.hookErrors.containsKey(SaveVoiceMenu.KEY));
    }

    @Test public void tappingTheRowSavesThatVoiceMessageWithTheSwitchForPlaysOff() throws IOException {
        fake.audio = cached();
        assertTrue(SaveVoiceMenu.clicked(tap, ourRow, extra()));
        assertEquals(1, fake.fetches);
        assertSame(session, fake.fetchedSession);
        assertEquals(message, fake.fetchedMessage);
        assertEquals(1, added.size());
        assertTrue(added.get(0), added.get(0).startsWith("Voice message "));
        assertTrue(added.get(0), added.get(0).endsWith(".m4a|audio/mp4"));
        assertEquals("Saved to Recordings/Messenger", toast());
    }

    @Test public void aVoiceMessageThatsAlreadySavedCountsAsSaved() throws Exception {
        fake.audio = cached();
        stored.add(VoiceMessages.hash(SOUND));
        assertTrue(SaveVoiceMenu.clicked(tap, ourRow, extra()));
        assertTrue(added.isEmpty());
        assertEquals("Saved to Recordings/Messenger", toast());
    }

    @Test public void savingByHandPutsBackACopyThatWasDeleted() throws Exception {
        fake.audio = cached();
        VoiceMessages.saved.add(VoiceMessages.hash(SOUND));
        assertTrue(SaveVoiceMenu.clicked(tap, ourRow, extra()));
        assertEquals(1, added.size());
        assertEquals("Saved to Recordings/Messenger", toast());
    }

    @Test public void aFailedDownloadSaysSo() {
        assertTrue(SaveVoiceMenu.clicked(tap, ourRow, extra()));
        assertEquals(1, fake.fetches);
        assertTrue(added.isEmpty());
        assertEquals("Couldn't save this voice message", toast());
    }

    @Test public void aDownloadThatThrowsSaysSoAndIsRecorded() {
        fake.fetchFails = true;
        assertTrue(SaveVoiceMenu.clicked(tap, ourRow, extra()));
        assertEquals("Couldn't save this voice message", toast());
        assertTrue(Settings.hookErrors.containsKey(SaveVoiceMenu.KEY));
    }

    @Test public void aFileThatIsntOnThePhoneIsNotFetchedAgain() {
        fake.audio = Uri.parse("https://example.com/voice.m4a");
        assertTrue(SaveVoiceMenu.clicked(tap, ourRow, extra()));
        assertTrue(added.isEmpty());
        assertEquals("Couldn't save this voice message", toast());
    }

    @Test public void aFileThatIsntSoundIsNotKept() throws IOException {
        File file = folder.newFile();
        Files.write(file.toPath(), "not a sound".getBytes(java.nio.charset.StandardCharsets.ISO_8859_1));
        fake.audio = Uri.fromFile(file);
        assertTrue(SaveVoiceMenu.clicked(tap, ourRow, extra()));
        assertTrue(added.isEmpty());
        assertEquals("Couldn't save this voice message", toast());
    }

    @Test public void aFullQueueSaysSoInsteadOfDroppingTheTap() throws IOException {
        fake.audio = cached();
        VoiceMessages.copies = work -> { throw new RejectedExecutionException(); };
        assertTrue(SaveVoiceMenu.clicked(tap, ourRow, extra()));
        assertEquals(0, fake.fetches);
        assertEquals("Couldn't save this voice message", toast());
    }

    @Test public void aTapWithNoMessageOrAccountSaysSo() throws IOException {
        fake.audio = cached();
        assertTrue(SaveVoiceMenu.clicked(tap, ourRow, new Bundle()));
        assertEquals("Couldn't save this voice message", toast());
        ShadowToast.reset();
        fake.givenSession = null;
        assertTrue(SaveVoiceMenu.clicked(tap, ourRow, extra()));
        assertEquals("Couldn't save this voice message", toast());
        assertEquals(0, fake.fetches);
    }

    @Test public void theSaveRunsOnTheWorkerNotOnTheTap() throws IOException {
        fake.audio = cached();
        List<Runnable> queued = new ArrayList<>();
        VoiceMessages.copies = queued::add;
        assertTrue(SaveVoiceMenu.clicked(tap, ourRow, extra()));
        assertEquals("Nothing is read on the main thread", 0, fake.fetches);
        queued.get(0).run();
        assertEquals(1, fake.fetches);
        assertEquals(1, added.size());
    }

    @Test public void aVoiceMessagesSheetGetsTheRow() {
        turnOn();
        SaveVoiceMenu.sheetRow(sheet, hold);
        assertSame(sheet, fake.sheetBuilder);
        assertEquals(Collections.singletonList(ourRow), fake.sheetRows);
        assertEquals("Save voice message", fake.title.toString());
        assertEquals(SaveVoiceMenu.ROW_ID, fake.id);
    }

    @Test public void anotherMessagesSheetGetsNoRow() {
        turnOn();
        fake.heldVoice = null;
        SaveVoiceMenu.sheetRow(sheet, hold);
        SaveVoiceMenu.sheetRow(sheet, new Object());
        SaveVoiceMenu.sheetRow(sheet, null);
        assertTrue(fake.sheetRows.isEmpty());
        assertNull(fake.title);
    }

    @Test public void withTheSwitchOffTheSheetGetsNoRow() {
        SaveVoiceMenu.sheetRow(sheet, hold);
        assertTrue(fake.sheetRows.isEmpty());
    }

    @Config(sdk = 28)
    @Test public void androidNinesSheetGetsNoRow() {
        turnOn();
        SaveVoiceMenu.sheetRow(sheet, hold);
        assertTrue(fake.sheetRows.isEmpty());
    }

    @Test public void aSheetThatFailsKeepsItsOwnRowsAndIsRecorded() {
        turnOn();
        fake.voiceUriFails = true;
        SaveVoiceMenu.sheetRow(sheet, hold);
        assertTrue(fake.sheetRows.isEmpty());
        assertTrue(Settings.hookErrors.get(SaveVoiceMenu.KEY).startsWith("java.lang.IllegalStateException"));
        fake.voiceUriFails = false;
        fake.row = null;
        SaveVoiceMenu.sheetRow(sheet, hold);
        assertTrue("Stubs that were never written make no row", fake.sheetRows.isEmpty());
    }

    @Test public void theSheetsOwnRowsGoBackToMessenger() {
        assertFalse(SaveVoiceMenu.sheetClicked(tap, otherRow));
        assertFalse(SaveVoiceMenu.sheetClicked(tap, null));
        assertEquals(0, fake.fetches);
        assertNull(ShadowToast.getTextOfLatestToast());
    }

    @Test public void aSheetRowItCantReadGoesBackToMessenger() {
        fake.rowIdFails = true;
        assertFalse(SaveVoiceMenu.sheetClicked(tap, ourRow));
        assertEquals(0, fake.fetches);
        assertTrue(Settings.hookErrors.containsKey(SaveVoiceMenu.KEY));
    }

    @Test public void tappingTheSheetRowDownloadsThatVoiceMessageAndKeepsIt() throws IOException {
        fake.audio = cached();
        assertTrue(SaveVoiceMenu.sheetClicked(tap, ourRow));
        assertEquals(1, fake.fetches);
        assertSame(session, fake.fetchedSession);
        assertEquals(remote, fake.fetchedVoice);
        assertEquals(1, added.size());
        assertTrue(added.get(0), added.get(0).endsWith(".m4a|audio/mp4"));
        assertEquals("Saved to Recordings/Messenger", toast());
    }

    @Test public void aVoiceMessageOnThePhoneNeedsNoDownload() throws IOException {
        fake.heldVoice = cached();
        assertTrue(SaveVoiceMenu.sheetClicked(tap, ourRow));
        assertEquals(0, fake.fetches);
        assertEquals(1, added.size());
        assertEquals("Saved to Recordings/Messenger", toast());
    }

    @Test public void aSheetDownloadThatFailsSaysSo() {
        assertTrue("The download gave nothing back", SaveVoiceMenu.sheetClicked(tap, ourRow));
        assertEquals("Couldn't save this voice message", toast());
        ShadowToast.reset();
        fake.audio = remote;
        assertTrue("The download gave back a link", SaveVoiceMenu.sheetClicked(tap, ourRow));
        assertEquals("Couldn't save this voice message", toast());
        ShadowToast.reset();
        fake.fetchFails = true;
        assertTrue(SaveVoiceMenu.sheetClicked(tap, ourRow));
        assertEquals("Couldn't save this voice message", toast());
        assertTrue(Settings.hookErrors.containsKey(SaveVoiceMenu.KEY));
        assertTrue(added.isEmpty());
    }

    @Test public void aSheetTapWithNoVoiceMessageOrAccountSaysSo() throws IOException {
        fake.audio = cached();
        fake.heldMessage = new Object();
        assertTrue(SaveVoiceMenu.sheetClicked(tap, ourRow));
        assertEquals("Couldn't save this voice message", toast());
        ShadowToast.reset();
        fake.heldMessage = hold;
        fake.givenSession = null;
        assertTrue(SaveVoiceMenu.sheetClicked(tap, ourRow));
        assertEquals("Couldn't save this voice message", toast());
        assertEquals(0, fake.fetches);
    }

    @Test public void aFullQueueSaysSoOnTheSheetToo() throws IOException {
        fake.audio = cached();
        VoiceMessages.copies = work -> { throw new RejectedExecutionException(); };
        assertTrue(SaveVoiceMenu.sheetClicked(tap, ourRow));
        assertEquals(0, fake.fetches);
        assertEquals("Couldn't save this voice message", toast());
    }

    @Test public void theSheetsSaveRunsOnTheWorkerNotOnTheTap() throws IOException {
        fake.audio = cached();
        List<Runnable> queued = new ArrayList<>();
        VoiceMessages.copies = queued::add;
        assertTrue(SaveVoiceMenu.sheetClicked(tap, ourRow));
        assertEquals("Nothing is read on the main thread", 0, fake.fetches);
        queued.get(0).run();
        assertEquals(1, fake.fetches);
        assertEquals(1, added.size());
    }

    @Test public void theStubsAsShippedChangeNothing() {
        SaveVoiceMenu.menu = STUBS;
        turnOn();
        List<Object> rows = rows(4);
        assertSame(rows, SaveVoiceMenu.rows(rows, extra()));
        assertFalse(SaveVoiceMenu.clicked(tap, ourRow, extra()));
        SaveVoiceMenu.sheetRow(sheet, hold);
        assertFalse(SaveVoiceMenu.sheetClicked(tap, ourRow));
        assertFalse(SaveVoiceMenu.addRow(sheet, ourRow));
        assertNull(SaveVoiceMenu.held(tap));
        assertNull(SaveVoiceMenu.sheetSession(tap));
        assertNull(SaveVoiceMenu.voiceUri(hold));
        assertNull(SaveVoiceMenu.fetchUri(session, remote));
        assertNull(SaveVoiceMenu.row("title", 1));
        assertEquals(0, SaveVoiceMenu.rowId(ourRow));
        assertFalse(SaveVoiceMenu.isVoice(message));
        assertNull(SaveVoiceMenu.session(tap));
        assertNull(SaveVoiceMenu.fetch(session, message));
    }

    @Test public void theRowsIdCantBeOneOfMessengers() {
        assertTrue("Messenger's own ids are small", SaveVoiceMenu.ROW_ID > 0xFFFF);
    }
}
