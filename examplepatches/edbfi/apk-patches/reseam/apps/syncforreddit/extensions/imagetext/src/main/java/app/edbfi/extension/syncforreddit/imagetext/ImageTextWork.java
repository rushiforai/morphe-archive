// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.extension.syncforreddit.imagetext;

import android.view.View;
import app.reseam.runtime.Export;
import java.lang.ref.WeakReference;

public final class ImageTextWork implements View.OnAttachStateChangeListener, Runnable {
    private final View view;
    private Runnable request;
    private boolean active;

    private ImageTextWork(View view, Runnable request) {
        this.view = view;
        this.request = request;
    }

    @Export
    public static void schedule(View view, Object sheet, int tagId) {
        if (view == null) return;
        var owner = new WeakReference<>(sheet);
        schedule(view, tagId, () -> {
            Object current = owner.get();
            if (current != null) startRequest(current, view);
        });
    }

    static void schedule(View view, int tagId, Runnable request) {
        if (view.getTag(tagId) != null) return;
        var work = new ImageTextWork(view, request);
        view.setTag(tagId, work);
        view.addOnAttachStateChangeListener(work);
        if (view.isAttachedToWindow()) work.onViewAttachedToWindow(view);
    }

    @Export
    private static native void startRequest(Object sheet, View view);

    @Export
    public static boolean isActive(View view, int tagId) {
        return view.getTag(tagId) instanceof ImageTextWork work && work.active && view.isAttachedToWindow();
    }

    @Override
    public void onViewAttachedToWindow(View attached) {
        // Let the entire view hierarchy finish attaching before Sync can receive a cached bitmap.
        if (!attached.post(this)) cancel();
    }

    @Override
    public void run() {
        if (request == null || !view.isAttachedToWindow()) return;
        Runnable pending = request;
        request = null;
        active = true;
        pending.run();
    }

    @Override
    public void onViewDetachedFromWindow(View detached) {
        cancel();
    }

    private void cancel() {
        active = false;
        request = null;
        view.removeCallbacks(this);
        view.removeOnAttachStateChangeListener(this);
        // Keep the tag so the same view can never start a second request.
    }
}
