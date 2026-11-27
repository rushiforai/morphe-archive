// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.extension.syncforreddit.translation;

import java.util.ArrayList;
import java.util.List;
import org.junit.Test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertThrows;
import static org.junit.Assert.fail;

public final class BulkSnapshotTest {
    @Test
    public void copiesOnceAndReleasesBeforeWorkStartsEvenWithReentrantDelivery() {
        List<String> events = new ArrayList<>();
        List<String> cursor = new ArrayList<>(List.of("row"));
        List<String> results = new ArrayList<>();
        BulkSnapshot<List<String>> snapshot = new BulkSnapshot<>(() -> {
            events.add("release");
            cursor.clear();
        });

        snapshot.deliver(() -> {
            events.add("copy");
            rejectSecondDelivery(snapshot);
            return List.copyOf(cursor);
        }, rows -> {
            events.add("start");
            results.addAll(rows);
            rejectSecondDelivery(snapshot);
        });
        rejectSecondDelivery(snapshot);
        snapshot.cancel();

        assertEquals(List.of("copy", "release", "start"), events);
        assertEquals(List.of("row"), results);
    }

    @Test
    public void cancellationReleasesOnceAndDiscardsLaterDeliveries() {
        List<String> events = new ArrayList<>();
        BulkSnapshot<List<String>> snapshot = new BulkSnapshot<>(() -> events.add("release"));

        snapshot.cancel();
        rejectSecondDelivery(snapshot);
        snapshot.cancel();

        assertEquals(List.of("release"), events);
    }

    @Test
    public void failedCopyStillReleasesAndDoesNotStartWork() {
        List<String> events = new ArrayList<>();
        BulkSnapshot<List<String>> snapshot = new BulkSnapshot<>(() -> events.add("release"));

        assertThrows(IllegalStateException.class, () -> snapshot.deliver(() -> {
            throw new IllegalStateException("cursor closed");
        }, rows -> fail("started with an incomplete snapshot")));
        rejectSecondDelivery(snapshot);

        assertEquals(List.of("release"), events);
    }

    private static void rejectSecondDelivery(BulkSnapshot<List<String>> snapshot) {
        snapshot.deliver(() -> {
            fail("copied a second delivery");
            return List.of();
        }, rows -> fail("started a second delivery"));
    }
}
