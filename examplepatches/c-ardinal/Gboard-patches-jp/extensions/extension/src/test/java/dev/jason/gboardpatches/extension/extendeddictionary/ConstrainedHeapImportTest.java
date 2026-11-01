package dev.jason.gboardpatches.extension.extendeddictionary;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assume.assumeTrue;

import android.content.Context;
import android.database.Cursor;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.SQLiteMode;

import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * Imports ~387k rows and removes them while only ~150 MB of heap stay free, the situation of
 * a device without largeHeap. Needs the locally generated word lists, so it skips without them.
 */
@RunWith(RobolectricTestRunner.class)
@SQLiteMode(SQLiteMode.Mode.NATIVE)
public final class ConstrainedHeapImportTest {
    private static final Path DATA = Path.of(String.valueOf(System.getenv("TEMP")), "claude",
            "C---Workspace-Gboard-patches", "fba20fb1-d857-4e23-9d42-c3e48790342d",
            "scratchpad", "ed-wikidata5", "out");
    private static final String[] FILES = {"sudachi-ja-all.txt", "sudachi-ja-notcore-extra.txt",
            "wikidata-ja-proper-part1.txt", "wikidata-ja-proper-part2.txt"};
    private static final long MB = 1_048_576L;
    private static final long FREE_HEAP = 150 * MB;

    @Test(timeout = 1_200_000)
    public void importsAndRemovesWithLimitedHeap() throws Exception {
        Runtime runtime = Runtime.getRuntime();
        assumeTrue("needs a test JVM with at least 512 MB heap, has "
                + runtime.maxMemory() / MB + " MB", runtime.maxMemory() >= 512 * MB);
        for (String file : FILES) {
            assumeTrue("missing local word list " + DATA.resolve(file),
                    Files.isRegularFile(DATA.resolve(file)));
        }
        Context context = RuntimeEnvironment.getApplication();
        GboardPersonalDictionaryReflectionGatewayTest.PersonalDictionaryHelper helper =
                new GboardPersonalDictionaryReflectionGatewayTest.PersonalDictionaryHelper(
                        context, true);
        List<byte[]> ballast = allocateBallast(runtime);
        try (ManagedEntryStore store = ManagedEntryStore.open(context)) {
            store.save(Collections.emptyList());
            for (String file : FILES) {
                List<WordListParser.Row> rows =
                        WordListParser.parse(Files.readAllBytes(DATA.resolve(file)));
                ExtendedDictionaryImporter.ImportResult result = ExtendedDictionaryImporter
                        .importRows(gateway(helper), store, rows, (done, total) -> {
                        }, new AtomicBoolean());
                assertFalse(file + " rolled back", result.rolledBack);
                assertEquals(file + " inserted", rows.size() - result.skippedExisting
                        - result.skippedReading, result.inserted);
                rows = null;
                assertEquals(store.count(), extendedRows(helper));
                System.out.println("HEAP " + file + " managed=" + store.count()
                        + " headroomMB=" + headroom(runtime) / MB);
            }
            ExtendedDictionaryImporter.RemoveResult removed =
                    ExtendedDictionaryImporter.removeAll(gateway(helper), store);
            assertEquals(0, removed.failed);
            assertEquals(0, store.count());
            assertEquals(0, extendedRows(helper));
            System.out.println("HEAP remove deleted=" + removed.deleted
                    + " headroomMB=" + headroom(runtime) / MB);
        } finally {
            ballast.clear();
        }
    }

    private static GboardPersonalDictionaryReflectionGateway gateway(
            GboardPersonalDictionaryReflectionGatewayTest.PersonalDictionaryHelper helper) {
        return new GboardPersonalDictionaryReflectionGateway(helper, "ja_ext", () -> {
        }, tag -> tag);
    }

    /** Fills the heap until only FREE_HEAP remains, in chunks the JVM can always place. */
    private static List<byte[]> allocateBallast(Runtime runtime) {
        System.gc();
        long target = runtime.maxMemory() - (runtime.totalMemory() - runtime.freeMemory())
                - FREE_HEAP;
        List<byte[]> ballast = new ArrayList<>();
        for (long left = target; left > 0; left -= 16 * MB) {
            ballast.add(new byte[(int) Math.min(left, 16 * MB)]);
        }
        System.out.println("HEAP max=" + runtime.maxMemory() / MB + "MB ballast="
                + Math.max(0, target) / MB + "MB headroomMB=" + headroom(runtime) / MB);
        return ballast;
    }

    private static long headroom(Runtime runtime) {
        System.gc();
        return runtime.maxMemory() - (runtime.totalMemory() - runtime.freeMemory());
    }

    private static int extendedRows(
            GboardPersonalDictionaryReflectionGatewayTest.PersonalDictionaryHelper helper) {
        try (Cursor cursor = helper.getReadableDatabase().rawQuery(
                "SELECT COUNT(*) FROM entry WHERE locale LIKE '%-x-extdict'", null)) {
            cursor.moveToFirst();
            return cursor.getInt(0);
        }
    }
}
