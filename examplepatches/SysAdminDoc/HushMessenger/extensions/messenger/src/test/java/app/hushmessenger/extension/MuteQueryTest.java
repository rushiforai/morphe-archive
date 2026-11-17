package app.hushmessenger.extension;

import android.content.Context;
import android.content.SharedPreferences;
import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
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

    @Before public void reset() throws Exception {
        cache = RuntimeEnvironment.getApplication().getSharedPreferences(MuteQuery.FILE, Context.MODE_PRIVATE);
        cache.edit().clear().commit();
        lib = folder.newFile("libstartup.so");
    }

    @After public void unlock() {
        lib.setWritable(true, true);
    }

    private static byte[] ascii(String text) { return text.getBytes(StandardCharsets.US_ASCII); }

    /** Random filler with [statements] at [spots], read-only, with a known time, like Messenger's unpacked copy. */
    private byte[] plant(int size, long time, String statement, int... spots) throws Exception {
        byte[] bytes = new byte[size];
        new Random(143).nextBytes(bytes);
        for (int spot : spots) System.arraycopy(ascii(statement), 0, bytes, spot, statement.length());
        lib.setWritable(true, true);
        Files.write(lib.toPath(), bytes);
        assertTrue(lib.setLastModified(time));
        assertTrue(lib.setWritable(false, false));
        return bytes;
    }

    private byte[] read() throws Exception { return Files.readAllBytes(lib.toPath()); }

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
        assertFalse("The copy goes back to read-only", lib.canWrite());
        assertEquals(TIME, lib.lastModified());

        // The next start reads only the cached spot, and finds it already edited.
        assertEquals(Boolean.TRUE, MuteQuery.put(lib, cache, true));
        assertArrayEquals(edited, read());

        assertEquals(Boolean.FALSE, MuteQuery.put(lib, cache, false));
        assertArrayEquals("Off gives Messenger its own bytes back", stock, read());
        assertFalse(lib.canWrite());
        assertEquals(TIME, lib.lastModified());
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
