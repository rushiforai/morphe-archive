/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-10.
 * Written by lavinhoque33, 2026-11-10.
 */
package app.morphe.extension.music.patches.androidauto;

import static org.junit.Assert.*;

import org.junit.Test;

import java.io.IOException;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Executor;

public class AndroidAutoStreamPlaybackTest {
    private static final class Tasks implements Executor {
        final ArrayDeque<Runnable> queued = new ArrayDeque<>();
        @Override public void execute(Runnable task) { queued.add(task); }
        void runOne() { queued.remove().run(); }
        void drain() { while (!queued.isEmpty()) runOne(); }
    }

    @Test
    public void queueResolutionWaitsForWorkerAndOnlyDispatchWaitsForSessionThread() {
        Tasks worker = new Tasks();
        Tasks session = new Tasks();
        List<Exception> failures = new ArrayList<>();
        List<byte[]> delivered = new ArrayList<>();
        List<String> steps = new ArrayList<>();
        AndroidAutoStreamPlayback playback = new AndroidAutoStreamPlayback(worker, session, failures::add);
        byte[] selectedCommand = {7, 3, 1};
        playback.resolve(playback.begin(), () -> {
            steps.add("resolved");
            return selectedCommand;
        }, delivered::add);

        assertTrue(steps.isEmpty());
        assertTrue(delivered.isEmpty());
        worker.runOne();
        assertEquals(List.of("resolved"), steps);
        assertTrue(delivered.isEmpty());
        session.runOne();
        assertSame(selectedCommand, delivered.get(0));
        assertTrue(failures.isEmpty());
    }

    @Test
    public void newerSelectionSkipsOlderWorkBeforeAnyMetadataIsRead() {
        Tasks worker = new Tasks();
        Tasks session = new Tasks();
        List<Integer> resolved = new ArrayList<>();
        List<Integer> delivered = new ArrayList<>();
        AndroidAutoStreamPlayback playback = new AndroidAutoStreamPlayback(worker, session,
                failure -> fail(failure.toString()));
        playback.resolve(playback.begin(), () -> { resolved.add(1); return new byte[]{1}; },
                command -> delivered.add((int) command[0]));
        playback.resolve(playback.begin(), () -> { resolved.add(2); return new byte[]{2}; },
                command -> delivered.add((int) command[0]));

        worker.drain();
        session.drain();
        assertEquals(List.of(2), resolved);
        assertEquals(List.of(2), delivered);
    }

    @Test
    public void olderResolutionFinishingAfterANewSelectionCannotReplaceIt() {
        Tasks worker = new Tasks();
        Tasks session = new Tasks();
        List<Integer> delivered = new ArrayList<>();
        AndroidAutoStreamPlayback playback = new AndroidAutoStreamPlayback(worker, session,
                failure -> fail(failure.toString()));
        playback.resolve(playback.begin(), () -> {
            playback.resolve(playback.begin(), () -> new byte[]{2}, command -> delivered.add((int) command[0]));
            return new byte[]{1};
        }, command -> delivered.add((int) command[0]));

        worker.drain();
        session.drain();
        assertEquals(List.of(2), delivered);
    }

    @Test
    public void stockSelectionOrReconnectInvalidatesAnAlreadyResolvedLocalCommand() {
        Tasks worker = new Tasks();
        Tasks session = new Tasks();
        List<byte[]> delivered = new ArrayList<>();
        AndroidAutoStreamPlayback playback = new AndroidAutoStreamPlayback(worker, session,
                failure -> fail(failure.toString()));
        playback.resolve(playback.begin(), () -> new byte[]{1}, delivered::add);
        worker.runOne();
        playback.begin();
        session.drain();
        assertTrue(delivered.isEmpty());
    }

    @Test
    public void missingTrackReportsOneFailureWithoutDispatchOrRetry() {
        Tasks worker = new Tasks();
        Tasks session = new Tasks();
        List<Exception> failures = new ArrayList<>();
        List<byte[]> delivered = new ArrayList<>();
        AndroidAutoStreamPlayback playback = new AndroidAutoStreamPlayback(worker, session, failures::add);
        playback.resolve(playback.begin(), () -> null, delivered::add);
        worker.drain();
        session.drain();
        assertEquals(1, failures.size());
        assertTrue(failures.get(0) instanceof IOException);
        assertTrue(delivered.isEmpty());
        assertTrue(worker.queued.isEmpty());
    }
}
