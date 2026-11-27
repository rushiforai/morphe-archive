// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.tests.reseam;

import android.app.Activity;
import android.app.Instrumentation;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.FrameLayout;
import java.lang.reflect.Method;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;

public final class ImageTextWorkTest extends Instrumentation {
    private static final int TAG = 0x7f010001;
    private Method schedule;
    private Method isActive;

    @Override
    public void onCreate(Bundle arguments) {
        super.onCreate(arguments);
        start();
    }

    @Override
    public void onStart() {
        var result = new Bundle();
        try {
            var work = Class.forName("app.edbfi.extension.syncforreddit.imagetext.ImageTextWork");
            schedule = work.getDeclaredMethod("schedule", View.class, int.class, Runnable.class);
            schedule.setAccessible(true);
            isActive = work.getMethod("isActive", View.class, int.class);
            var intent = new Intent().setClass(getTargetContext(), Activity.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            checkLifecycle(startActivitySync(intent));
            result.putString("stream", "OCR work starts once per attached view and is cancelled on detach.\n");
            finish(Activity.RESULT_OK, result);
        } catch (Exception | AssertionError error) {
            result.putString("stream", android.util.Log.getStackTraceString(error));
            finish(Activity.RESULT_CANCELED, result);
        }
    }

    private void checkLifecycle(Activity activity) throws InterruptedException {
        var root = new FrameLayout(activity);
        var first = new View(activity);
        var cancelled = new View(activity);
        var replacement = new View(activity);
        int[] starts = new int[3];
        boolean[] activeAtStart = new boolean[1];
        var ready = new CountDownLatch(1);
        onMain(() -> {
            activity.setContentView(root);
            root.post(ready::countDown);
        });
        require(ready.await(10, TimeUnit.SECONDS), "The host view must attach");

        onMain(() -> {
            schedule(first, () -> {
                activeAtStart[0] = active(first);
                starts[0]++;
            });
            schedule(first, () -> starts[0]++);
            require(!active(first) && starts[0] == 0, "Work must wait for attachment");
            root.addView(first);
            require(first.isAttachedToWindow() && starts[0] == 0, "Work must wait for attachment to finish");
        });
        waitForIdleSync();
        onMain(() -> {
            require(activeAtStart[0], "A synchronous callback must see the first view as active");
            require(active(first) && starts[0] == 1, "The first view must start only once");
            root.removeView(first);
            require(!active(first), "A detached view must reject callbacks");
            root.addView(first);
            schedule(first, () -> starts[0]++);

            root.addView(cancelled);
            schedule(cancelled, () -> starts[1]++);
            root.removeView(cancelled);
            root.addView(cancelled);

            root.addView(replacement);
            schedule(replacement, () -> starts[2]++);
            schedule(replacement, () -> starts[2]++);
        });
        waitForIdleSync();
        onMain(() -> {
            require(!active(first) && starts[0] == 1, "Reattachment must not reactivate the first view");
            require(!active(cancelled) && starts[1] == 0, "Detach must cancel posted work");
            require(active(replacement) && starts[2] == 1, "A replacement view must get one independent start");
        });
    }

    private void onMain(Runnable checks) {
        var failure = new AtomicReference<Throwable>();
        runOnMainSync(() -> {
            try {
                checks.run();
            } catch (RuntimeException | AssertionError error) {
                failure.set(error);
            }
        });
        if (failure.get() != null) throw new AssertionError(failure.get());
    }

    private void schedule(View view, Runnable request) {
        try {
            schedule.invoke(null, view, TAG, request);
        } catch (ReflectiveOperationException error) {
            throw new AssertionError(error);
        }
    }

    private boolean active(View view) {
        try {
            return (boolean) isActive.invoke(null, view, TAG);
        } catch (ReflectiveOperationException error) {
            throw new AssertionError(error);
        }
    }

    private static void require(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }
}
