/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-24.
 */
package app.morphe.extension.youtube.patches.general.offline;

import static java.util.concurrent.TimeUnit.SECONDS;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.os.Handler;
import android.os.HandlerThread;
import android.view.SurfaceHolder;
import android.view.SurfaceView;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.FutureTask;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.LooperMode;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 34)
@LooperMode(LooperMode.Mode.PAUSED)
public class OfflineWatchSurfaceCallbackTest {
    private final HandlerThread playerThread = new HandlerThread("offline-watch-test-player");
    private Handler playerHandler;
    private SurfaceHolder holder;

    @Before
    public void startPlayerThread() {
        playerThread.start();
        playerHandler = new Handler(playerThread.getLooper());
        holder = new SurfaceView(RuntimeEnvironment.getApplication()).getHolder();
    }

    @After
    public void stopPlayerThread() throws InterruptedException {
        playerThread.quitSafely();
        playerThread.join(5_000);
    }

    @Test
    public void forwardsHolderEventsInOrderAndWaitsForRendererDetach() throws Exception {
        CountDownLatch destroyStarted = new CountDownLatch(1);
        CountDownLatch finishDestroy = new CountDownLatch(1);
        RecordingCallback renderer = new RecordingCallback(destroyStarted, finishDestroy);
        OfflineWatchSurfaceCallback binding = bind(renderer);

        try {
            binding.surfaceCreated(holder);
            binding.surfaceChanged(holder, 1, 1280, 720);
            FutureTask<Void> viewDestruction = new FutureTask<>(() -> {
                binding.surfaceDestroyed(holder);
                return null;
            });
            new Thread(viewDestruction, "offline-watch-test-view").start();

            assertTrue(destroyStarted.await(5, SECONDS));
            assertFalse("The view must not invalidate the surface before the renderer detaches",
                    viewDestruction.isDone());
            finishDestroy.countDown();
            viewDestruction.get(5, SECONDS);
            assertEquals(List.of("create", "change:1280x720", "destroy"), renderer.events);
        } finally {
            finishDestroy.countDown();
            close(binding);
        }
    }

    @Test
    public void detachDiscardsQueuedAndLateCallbacksForAReusedHolder() throws Exception {
        RecordingCallback renderer = new RecordingCallback(new CountDownLatch(0), new CountDownLatch(0));
        OfflineWatchSurfaceCallback binding = bind(renderer);
        CountDownLatch detachStarted = new CountDownLatch(1);
        CountDownLatch eventsPosted = new CountDownLatch(1);
        FutureTask<Void> detach = runOnPlayer(() -> {
            detachStarted.countDown();
            await(eventsPosted);
            binding.close();
            return null;
        });

        try {
            assertTrue(detachStarted.await(5, SECONDS));
            binding.surfaceCreated(holder);
            binding.surfaceChanged(holder, 1, 1280, 720);
        } finally {
            eventsPosted.countDown();
        }
        detach.get(5, SECONDS);

        RecordingCallback newRenderer = new RecordingCallback(new CountDownLatch(0), new CountDownLatch(0));
        OfflineWatchSurfaceCallback newBinding = bind(newRenderer);
        try {
            binding.surfaceCreated(holder);
            binding.surfaceDestroyed(holder);
            newBinding.surfaceCreated(holder);
            runOnPlayer(() -> null).get(5, SECONDS);

            assertTrue(renderer.events.isEmpty());
            assertEquals(List.of("create"), newRenderer.events);
        } finally {
            close(newBinding);
        }
    }

    private OfflineWatchSurfaceCallback bind(RecordingCallback renderer) throws Exception {
        return runOnPlayer(() -> {
            OfflineWatchSurfaceCallback binding = new OfflineWatchSurfaceCallback(holder, renderer);
            holder.addCallback(binding);
            return binding;
        }).get(5, SECONDS);
    }

    private void close(OfflineWatchSurfaceCallback binding) throws Exception {
        runOnPlayer(() -> {
            binding.close();
            return null;
        }).get(5, SECONDS);
    }

    private <T> FutureTask<T> runOnPlayer(Callable<T> action) {
        FutureTask<T> task = new FutureTask<>(action);
        assertTrue(playerHandler.post(task));
        return task;
    }

    private static void await(CountDownLatch event) {
        try {
            assertTrue(event.await(5, SECONDS));
        } catch (InterruptedException ex) {
            Thread.currentThread().interrupt();
            throw new AssertionError(ex);
        }
    }

    private final class RecordingCallback implements SurfaceHolder.Callback {
        private final List<String> events = new ArrayList<>();
        private final CountDownLatch destroyStarted;
        private final CountDownLatch finishDestroy;

        private RecordingCallback(CountDownLatch destroyStarted, CountDownLatch finishDestroy) {
            this.destroyStarted = destroyStarted;
            this.finishDestroy = finishDestroy;
        }

        @Override
        public void surfaceCreated(SurfaceHolder source) {
            record(source, "create");
        }

        @Override
        public void surfaceChanged(SurfaceHolder source, int format, int width, int height) {
            record(source, "change:" + width + "x" + height);
        }

        @Override
        public void surfaceDestroyed(SurfaceHolder source) {
            record(source, "destroy");
            destroyStarted.countDown();
            await(finishDestroy);
        }

        private void record(SurfaceHolder source, String event) {
            assertSame(holder, source);
            assertSame(playerThread, Thread.currentThread());
            events.add(event);
        }
    }
}
