package app.morphe.extension.discord.bunny.recovery;

import org.json.JSONArray;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;

import java.util.Arrays;
import java.util.LinkedHashSet;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

public final class RecoveryStateTest {
    @Rule public final TemporaryFolder temporary = new TemporaryFolder();

    @Test public void recentCrashesAreBoundedAndPersisted() throws Exception {
        RecoveryState state = new RecoveryState();
        for (int index = 0; index < RecoveryState.MAX_HISTORY_RECORDS + 3; index++) {
            state.addCrash(new RecoveryState.CrashRecord(
                    "crash-" + index,
                    1000L + index,
                    index % 2 == 0 ? "native" : "render",
                    "crash-" + index,
                    "stack-" + index,
                    index == 12 ? "example.plugin" : null,
                    index < 2
            ));
        }

        assertEquals(8L, state.totalCrashes);
        assertEquals(RecoveryState.MAX_HISTORY_RECORDS, state.recentCrashes.size());
        assertEquals("crash-7", state.recentCrashes.get(0).message);

        RecoveryState restored = RecoveryState.fromJson(state.toJson());
        assertEquals(state.totalCrashes, restored.totalCrashes);
        assertEquals(state.recentCrashes.size(), restored.recentCrashes.size());
        assertEquals("crash-7", restored.recentCrashes.get(0).id);
        assertTrue(restored.toJson().getInt("version") >= 3);
    }

    @Test public void failedStartsKeepOnlyNewestFive() throws Exception {
        RecoveryState state = new RecoveryState();
        for (int index = 0; index < 6; index++) {
            state.addFailedStart(new RecoveryState.FailedStartRecord(
                    "failed-" + index,
                    2000L + index,
                    index,
                    index == 5 ? "example.plugin" : null,
                    "failed start " + index
            ));
        }
        assertEquals(5, state.failedStarts.size());
        assertEquals("failed-5", state.failedStarts.get(0).id);
        assertEquals("failed-1", state.failedStarts.get(4).id);

        RecoveryState restored = RecoveryState.fromJson(state.toJson());
        assertEquals(5, restored.failedStarts.size());
        assertEquals("example.plugin", restored.failedStarts.get(0).plugin);
    }

    @Test public void selectedDiagnosticsExportOnlyChosenRecords() throws Exception {
        RecoveryState state = new RecoveryState();
        for (int index = 0; index < 3; index++) {
            state.addCrash(new RecoveryState.CrashRecord(
                    "crash-" + index,
                    3000L + index,
                    "native",
                    "message-" + index,
                    "stack-" + index,
                    null,
                    false
            ));
        }
        RecoveryStore store = new RecoveryStore(temporary.newFolder("pyoncord"));
        JSONArray records = store.diagnostics(
                state,
                "crashes",
                new LinkedHashSet<>(Arrays.asList("crash-0", "crash-2"))
        ).getJSONArray("records");

        assertEquals(2, records.length());
        assertEquals("crash-2", records.getJSONObject(0).getString("id"));
        assertEquals("crash-0", records.getJSONObject(1).getString("id"));
    }
}
