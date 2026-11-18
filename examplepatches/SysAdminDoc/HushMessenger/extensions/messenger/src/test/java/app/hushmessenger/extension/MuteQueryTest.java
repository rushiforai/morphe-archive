package app.hushmessenger.extension;

import android.content.Context;
import android.content.SharedPreferences;
import java.io.File;
import java.io.IOException;
import java.nio.channels.FileChannel;
import java.nio.channels.FileLock;
import java.nio.channels.OverlappingFileLockException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.nio.file.StandardOpenOption;
import java.util.Arrays;
import java.util.Random;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLog;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class MuteQueryTest {
    /** The start of 587's mute decision, as it sits in libstartup.so at 0x345b68. */
    private static final String STOCK_STATEMENT = "SELECT HT.mute_expiration_ts_ms IS NULL OR ? > HT.mute_expiration_ts_ms AND "
            + "HT.mute_expiration_ts_ms > -1, CREATE_PRIVACY_CONTEXT_FROM_TRANSPORT_KEY_SQL(HT.transport_key), HT.is_group_thread AND NOT";
    private static final String STOCK_COLUMN = "HT.mute_expiration_ts_ms IS NULL OR ? > HT.mute_expiration_ts_ms AND HT.mute_expiration_ts_ms > -1,";
    /** Past one read, so the statement can sit across two. */
    private static final int MIB = 1 << 20;
    private static final long TIME = 1_794_622_557_000L;

    @Rule public TemporaryFolder folder = new TemporaryFolder();
    private SharedPreferences cache;
    private File lib;
    private byte[] planted;
    private int swaps;
    private MuteQuery.Swap stockSwap;

    @Before public void reset() throws Exception {
        cache = RuntimeEnvironment.getApplication().getSharedPreferences(MuteQuery.FILE, Context.MODE_PRIVATE);
        cache.edit().clear().commit();
        // Laid out like Messenger's data folder: SoLoader's unpack folder with the library and its lock file.
        File unpacked = folder.newFolder("lib-compressed");
        lib = new File(unpacked, "libstartup.so");
        assertTrue(lib.createNewFile());
        assertTrue(new File(unpacked, MuteQuery.LOCK).createNewFile());
        swaps = 0;
        stockSwap = MuteQuery.swap;
        MuteQuery.swap = (from, to) -> {
            // What lands at Messenger's path is finished before it gets there: read-only, with the old copy's time,
            // and Messenger's own copy was never opened for writing on the way.
            assertFalse("The new copy is read-only before it moves", from.canWrite());
            assertEquals(to.lastModified(), from.lastModified());
            assertArrayEquals("Messenger's copy is untouched until the move", planted, read());
            // SoLoader keeps its folder read-only between unpacks, so nothing can be made in it (the S25 refused that).
            assertNotEquals("The new copy is made outside SoLoader's folder", to.getParentFile(), from.getParentFile());
            assertHeld(new File(to.getParentFile(), MuteQuery.LOCK));
            swaps++;
            // Android's rename replaces a read-only file in one step. Windows won't, so the test clears it first.
            to.setWritable(true, true);
            Files.move(from.toPath(), to.toPath(), StandardCopyOption.REPLACE_EXISTING);
        };
    }

    @After public void unlock() {
        MuteQuery.swap = stockSwap;
        lib.setWritable(true, true);
        MuteQuery.next(lib).setWritable(true, true);
    }

    private static byte[] ascii(String text) { return text.getBytes(StandardCharsets.US_ASCII); }

    /** The move runs under SoLoader's unpack lock: another try at it in this process can't take it. */
    private static void assertHeld(File lock) throws IOException {
        try (FileChannel channel = FileChannel.open(lock.toPath(), StandardOpenOption.WRITE)) {
            assertThrows("SoLoader's unpack lock is held for the move", OverlappingFileLockException.class, channel::tryLock);
        }
    }

    /** Random filler with [statements] at [spots], read-only, with a known time, like Messenger's unpacked copy. */
    private byte[] plant(int size, long time, String statement, int... spots) throws Exception {
        return plant(lib, size, time, statement, spots);
    }

    private byte[] plant(File file, int size, long time, String statement, int... spots) throws Exception {
        byte[] bytes = new byte[size];
        new Random(143).nextBytes(bytes);
        for (int spot : spots) System.arraycopy(ascii(statement), 0, bytes, spot, statement.length());
        file.setWritable(true, true);
        Files.write(file.toPath(), bytes);
        assertTrue(file.setLastModified(time));
        assertTrue(file.setWritable(false, false));
        planted = bytes;
        return bytes;
    }

    private byte[] read() throws IOException { return Files.readAllBytes(lib.toPath()); }

    @Test public void theMuteColumnTurnsIntoOneOrBindAndBackInPlace() throws Exception {
        int spot = MIB - 40;
        byte[] stock = plant(3 * MIB, TIME, STOCK_STATEMENT, spot);
        assertEquals(Boolean.TRUE, MuteQuery.put(lib, cache, true));

        byte[] edited = read();
        assertEquals(stock.length, edited.length);
        int column = spot + "SELECT ".length();
        String now = new String(edited, column, STOCK_COLUMN.length(), StandardCharsets.US_ASCII);
        // Same length and the same one bind, so the statement keeps its place in Messenger's binds.
        assertEquals("1 OR ?", now.substring(0, 6));
        assertTrue(now.substring(6, now.length() - 1).trim().isEmpty());
        assertTrue(now.endsWith(","));
        assertEquals(1, now.chars().filter(c -> c == '?').count());
        byte[] outside = edited.clone();
        System.arraycopy(stock, column, outside, column, STOCK_COLUMN.length());
        assertArrayEquals("Nothing past the column moves", stock, outside);
        assertFalse("The copy is read-only", lib.canWrite());
        assertEquals(TIME, lib.lastModified());
        assertEquals(1, swaps);
        assertFalse("Nothing is left beside it", MuteQuery.next(lib).exists());

        // The next start reads only the cached spot, and finds it already edited.
        planted = edited;
        assertEquals(Boolean.TRUE, MuteQuery.put(lib, cache, true));
        assertArrayEquals(edited, read());
        assertEquals("No change, no new copy", 1, swaps);

        assertEquals(Boolean.FALSE, MuteQuery.put(lib, cache, false));
        assertArrayEquals("Off gives Messenger its own bytes back", stock, read());
        assertFalse(lib.canWrite());
        assertEquals(TIME, lib.lastModified());
        assertEquals(2, swaps);
    }

    @Test public void aCopyMessengerLeftWritableIsReadOnlyAfterTheChange() throws Exception {
        plant(MIB, TIME, STOCK_STATEMENT, 700);
        assertTrue(lib.setWritable(true, true));
        assertEquals(Boolean.TRUE, MuteQuery.put(lib, cache, true));
        assertFalse(lib.canWrite());
        assertEquals(TIME, lib.lastModified());
    }

    @Test public void aFailedMoveLeavesMessengersCopyAsItWas() throws Exception {
        byte[] stock = plant(MIB, TIME, STOCK_STATEMENT, 700);
        MuteQuery.swap = (from, to) -> { throw new IOException("busy"); };
        assertThrows(IOException.class, () -> MuteQuery.put(lib, cache, true));
        assertArrayEquals(stock, read());
        assertFalse(lib.canWrite());
        assertEquals(TIME, lib.lastModified());
        assertFalse("The unused copy is taken away", MuteQuery.next(lib).exists());
        assertFalse(cache.contains("at"));
    }

    @Test public void aFolderWithNoUnpackLockIsLeftAlone() throws Exception {
        byte[] stock = plant(MIB, TIME, STOCK_STATEMENT, 700);
        assertTrue(new File(lib.getParentFile(), MuteQuery.LOCK).delete());
        MuteQuery.Refused refused = assertThrows(MuteQuery.Refused.class, () -> MuteQuery.put(lib, cache, true));
        assertEquals("Messenger's library folder has no unpack lock to take", refused.getMessage());
        assertArrayEquals(stock, read());
        assertFalse(MuteQuery.next(lib).exists());
        assertEquals(0, swaps);
    }

    @Test public void anUnpackUnderwayInThisProcessPutsTheChangeOffToTheNextStart() throws Exception {
        byte[] stock = plant(MIB, TIME, STOCK_STATEMENT, 700);
        File lock = new File(lib.getParentFile(), MuteQuery.LOCK);
        try (FileChannel unpacking = FileChannel.open(lock.toPath(), StandardOpenOption.WRITE); FileLock held = unpacking.lock()) {
            MuteQuery.Refused refused = assertThrows(MuteQuery.Refused.class, () -> MuteQuery.put(lib, cache, true));
            assertEquals("Messenger was unpacking its libraries", refused.getMessage());
        }
        assertArrayEquals(stock, read());
        assertFalse("The unused copy is taken away", MuteQuery.next(lib).exists());
        assertEquals(0, swaps);
        // The next start, with the unpack done, makes the change.
        assertEquals(Boolean.TRUE, MuteQuery.put(lib, cache, true));
        assertEquals(1, swaps);
    }

    @Test public void aCopyLeftOverFromAnEarlierTryIsReplaced() throws Exception {
        File leftover = MuteQuery.next(lib);
        plant(leftover, 4096, TIME - 1, "junk");
        byte[] stock = plant(MIB, TIME, STOCK_STATEMENT, 700);
        assertEquals(Boolean.TRUE, MuteQuery.put(lib, cache, true));
        assertFalse(leftover.exists());
        assertEquals(stock.length, lib.length());
        assertEquals("1 OR ?", new String(read(), 700 + 7, 6, StandardCharsets.US_ASCII));
    }

    @Test public void aRefusedChangeIsReportedWithItsOwnReason() throws Exception {
        android.app.Application app = RuntimeEnvironment.getApplication();
        Settings.initialize(app);
        Settings.preferences.edit().clear().commit();
        Settings.hookErrors.clear();
        CrashGuard.resetForTests();
        CrashGuard.onProcessStart(app);
        Settings.preferences.edit().putBoolean(MessageLog.KEY, true).putBoolean(QuietChats.KEY, true).commit();
        assertTrue(QuietChats.wanted());
        File messengers = new File(app.getApplicationInfo().dataDir, MuteQuery.LIB);
        assertTrue(messengers.getParentFile().isDirectory() || messengers.getParentFile().mkdirs());
        File unpackLock = new File(messengers.getParentFile(), MuteQuery.LOCK);
        assertTrue(unpackLock.isFile() || unpackLock.createNewFile());
        byte[] stock = plant(messengers, MIB, TIME, STOCK_STATEMENT, 700);
        MuteQuery.swap = (from, to) -> { throw new MuteQuery.Refused("Can't make the mute check's new copy read-only"); };
        ShadowLog.clear();
        try {
            MuteQuery.sync(app);
            assertTrue(Settings.hookErrors.containsKey(QuietChats.KEY));
            assertTrue(ShadowLog.getLogsForTag("HushMessenger").stream()
                .anyMatch(line -> line.msg.startsWith("Can't make the mute check's new copy read-only: ")));
            assertArrayEquals(stock, Files.readAllBytes(messengers.toPath()));
            assertFalse(messengers.canWrite());
        } finally {
            messengers.setWritable(true, true);
            assertTrue(messengers.delete());
            assertTrue(unpackLock.delete());
            assertFalse("The unused copy is taken away", MuteQuery.next(messengers).exists());
            Settings.hookErrors.clear();
        }
    }

    @Test public void anUntouchedCopyIsntReadWithTheSwitchOff() throws Exception {
        byte[] stock = plant(MIB / 2, TIME, STOCK_STATEMENT, 100);
        assertNull(MuteQuery.put(lib, cache, false));
        assertArrayEquals(stock, read());
        assertFalse(cache.contains("at"));
    }

    @Test public void aCopyWithTwoStatementsOrAnotherColumnIsLeftAlone() throws Exception {
        byte[] twice = plant(2 * MIB, TIME, STOCK_STATEMENT, 500, MIB + 500);
        assertNull(MuteQuery.put(lib, cache, true));
        assertArrayEquals(twice, read());

        byte[] other = plant(MIB, TIME, STOCK_STATEMENT.replace("> -1,", ">= 0,"), 500);
        assertNull(MuteQuery.put(lib, cache, true));
        assertArrayEquals(other, read());

        byte[] noTail = plant(MIB, TIME, STOCK_STATEMENT.replace("CREATE_PRIVACY", "CREATE_PRIVATE"), 500);
        assertNull(MuteQuery.put(lib, cache, true));
        assertArrayEquals(noTail, read());
    }

    @Test public void anUpdatedCopyIsFoundAgainAndAnOldSpotIsntTrusted() throws Exception {
        plant(MIB, TIME, STOCK_STATEMENT, 300);
        assertEquals(Boolean.TRUE, MuteQuery.put(lib, cache, true));

        // Messenger's update unpacks a new stock copy, with the statement somewhere else.
        byte[] update = plant(MIB + 7, TIME + 60_000, STOCK_STATEMENT, 9000);
        assertEquals(Boolean.TRUE, MuteQuery.put(lib, cache, true));
        byte[] edited = read();
        assertEquals("1 OR ?", new String(edited, 9000 + 7, 6, StandardCharsets.US_ASCII));
        assertArrayEquals("The old spot stays as it was", Arrays.copyOfRange(update, 300, 400), Arrays.copyOfRange(edited, 300, 400));

        // Switched off after another update: the new copy is stock, so it's left as it is.
        byte[] next = plant(MIB + 9, TIME + 120_000, STOCK_STATEMENT, 4000);
        assertNull(MuteQuery.put(lib, cache, false));
        assertArrayEquals(next, read());
        assertFalse(cache.contains("at"));
    }

    @Test public void aMissingCopyChangesNothing() throws Exception {
        assertTrue(lib.delete());
        assertNull(MuteQuery.put(lib, cache, true));
        assertNull(MuteQuery.put(lib, cache, false));
    }
}
