/* SPDX-License-Identifier: GPL-3.0-only */
package io.github.pengusto.patches.clock.tests;

import android.app.Instrumentation;
import android.app.PendingIntent;
import android.content.Context;
import android.os.Bundle;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import static android.app.Activity.RESULT_OK;
import static android.app.Activity.RESULT_CANCELED;

/** Inspect the real 1.6.0 APK's identities; no alarm database or settings writes. */
public final class UpcomingIdentityProbe extends Instrumentation {
    @Override public void onCreate(Bundle args) {
        super.onCreate(args);
        if (!"ranchu".equals(android.os.Build.HARDWARE)) {
            throw new IllegalStateException("Disposable emulator required");
        }
        start();
    }

    @Override public void onStart() {
        Bundle result = new Bundle();
        PendingIntent mainA = null, mainB = null, upcomingA = null, upcomingB = null;
        try {
            Context context = getTargetContext();
            ClassLoader loader = context.getClassLoader();
            Class<?> alarm = Class.forName("org.fossify.clock.models.Alarm", true, loader);
            Constructor<?> constructor = alarm.getConstructor(int.class, int.class, int.class,
                boolean.class, boolean.class, String.class, String.class, String.class, boolean.class);
            Object first = constructor.newInstance(910014, 420, 127, true, false, "", "", "Penguin A", false);
            Object second = constructor.newInstance(910015, 540, 127, true, false, "", "", "Penguin B", false);
            Class<?> helpers = Class.forName("j5.e", true, loader);
            Method main = helpers.getMethod("g", Context.class, alarm);
            Method upcoming = helpers.getMethod("v", Context.class, alarm);
            Method skip = helpers.getMethod("s", Context.class, int.class);
            mainA = (PendingIntent) main.invoke(null, context, first);
            mainB = (PendingIntent) main.invoke(null, context, second);
            upcomingA = (PendingIntent) upcoming.invoke(null, context, first);
            upcomingB = (PendingIntent) upcoming.invoke(null, context, second);
            if (mainA.equals(mainB)) throw new AssertionError("Fixture alarm IDs are not distinct");
            boolean collision = upcomingA.equals(upcomingB);
            PendingIntent skipA = (PendingIntent) skip.invoke(null, context, 910014);
            PendingIntent skipB = (PendingIntent) skip.invoke(null, context, 910015);
            boolean skipCollision = skipA.equals(skipB);
            skipA.cancel();
            skipB.cancel();
            // Cancelling one identity cancels the other even though their alarm IDs differ.
            upcomingA.cancel();
            boolean secondCancelled = false;
            try { upcomingB.send(); }
            catch (PendingIntent.CanceledException expected) { secondCancelled = true; }
            result.putBoolean("upcomingCollision", collision);
            result.putBoolean("skipActionCollision", skipCollision);
            result.putBoolean("cancellingFirstCancelsSecond", secondCancelled);
            result.putString("result", collision && !skipCollision && secondCancelled
                ? "REPRODUCED: distinct alarms share the upcoming PendingIntent; skip actions remain distinct"
                : "Identities differ; reevaluate the recorded baseline finding");
            finish(RESULT_OK, result);
        } catch (Throwable error) {
            result.putString("error", android.util.Log.getStackTraceString(error));
            finish(RESULT_CANCELED, result);
        } finally {
            for (PendingIntent intent : new PendingIntent[]{mainA, mainB, upcomingA, upcomingB}) {
                if (intent != null) intent.cancel();
            }
        }
    }
}
