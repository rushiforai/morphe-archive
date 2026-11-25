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

import android.os.ConditionVariable;
import android.os.Handler;
import android.os.Looper;
import android.view.SurfaceHolder;

import androidx.annotation.Nullable;

import java.util.Objects;

/** Runs the stock holder callback on the offline watch adapter's application looper. */
public final class OfflineWatchSurfaceCallback implements SurfaceHolder.Callback {
    private static final int CREATED = 0;
    private static final int CHANGED = 1;
    private static final int DESTROYED = 2;

    private final Handler owner = new Handler(Objects.requireNonNull(Looper.myLooper()));
    // The owner thread mutates the binding. The view thread checks it under this object's monitor.
    @Nullable private SurfaceHolder holder;
    @Nullable private SurfaceHolder.Callback callback;
    @Nullable private ConditionVariable pendingDestruction;

    /** Injection point, called on the player thread before registering this callback with the view. */
    public OfflineWatchSurfaceCallback(SurfaceHolder holder, SurfaceHolder.Callback callback) {
        this.holder = holder;
        this.callback = callback;
    }

    @Override
    public void surfaceCreated(SurfaceHolder source) {
        dispatch(source, CREATED, 0, 0, 0);
    }

    @Override
    public void surfaceChanged(SurfaceHolder source, int format, int width, int height) {
        dispatch(source, CHANGED, format, width, height);
    }

    @Override
    public void surfaceDestroyed(SurfaceHolder source) {
        dispatch(source, DESTROYED, 0, 0, 0);
    }

    private void dispatch(SurfaceHolder source, int event, int format, int width, int height) {
        if (Looper.myLooper() == owner.getLooper()) {
            if (source == holder) deliver(event, format, width, height);
            return;
        }

        // SurfaceView may invalidate the output as soon as its destruction callback returns.
        ConditionVariable complete;
        synchronized (this) {
            if (source != holder) return;
            complete = event == DESTROYED ? new ConditionVariable() : null;
            if (complete != null) pendingDestruction = complete;
            if (!owner.post(() -> {
                try {
                    deliver(event, format, width, height);
                } finally {
                    if (complete != null) finishDestruction(complete);
                }
            })) {
                throw new IllegalStateException("Offline watch surface owner quit without releasing its holder");
            }
        }
        if (complete != null) complete.block();
    }

    private void deliver(int event, int format, int width, int height) {
        SurfaceHolder active = holder;
        SurfaceHolder.Callback listener = callback;
        if (active == null || listener == null) return;

        switch (event) {
            case CREATED -> listener.surfaceCreated(active);
            case CHANGED -> listener.surfaceChanged(active, format, width, height);
            case DESTROYED -> listener.surfaceDestroyed(active);
            default -> throw new IllegalArgumentException("Unknown surface event: " + event);
        }
    }

    private synchronized void finishDestruction(ConditionVariable complete) {
        if (pendingDestruction == complete) pendingDestruction = null;
        complete.open();
    }

    /** Injection point, after stock Media3 has detached the renderer output on the owner thread. */
    public void close() {
        SurfaceHolder previous;
        synchronized (this) {
            previous = holder;
            holder = null;
            callback = null;
            if (pendingDestruction != null) {
                pendingDestruction.open();
                pendingDestruction = null;
            }
        }
        owner.removeCallbacksAndMessages(null);
        if (previous != null) previous.removeCallback(this);
    }
}
