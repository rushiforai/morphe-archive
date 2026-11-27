package dev.jason.gboardpatches.extension.shiftdelete;

import android.content.Context;
import android.os.SystemClock;
import android.view.MotionEvent;

import dev.jason.gboardpatches.extension.settings.GboardPatchesSettings;

/** Adapts Gboard's soft-key chord on its UI thread. */
public final class GboardShiftDeleteRuntime {
    private static final ShiftDeleteSession SESSION = new ShiftDeleteSession();
    private static final ShiftDeleteEnabledCache ENABLED = new ShiftDeleteEnabledCache();

    private static GboardShiftDeleteEventBinding binding;
    private static boolean failed;

    private GboardShiftDeleteRuntime() {}

    public static Object remapInput(Object service, Object event) {
        if (failed || event == null || !(service instanceof Context context)) return event;
        try {
            if (!ENABLED.get(SystemClock.elapsedRealtime(), () -> GboardPatchesSettings
                    .readRuntimeSetting(context, GboardShiftDeleteSettings::enabled, null))) {
                return event;
            }
            if (binding == null) {
                binding = new GboardShiftDeleteEventBinding(event.getClass());
            } else if (event.getClass() != binding.eventType()) {
                return event;
            }

            return binding.remap(event, SESSION);
        } catch (ReflectiveOperationException | RuntimeException | LinkageError failure) {
            failed = true;
            SESSION.cancel();
            return event;
        }
    }

    public static void onTouchEvent(MotionEvent event) {
        if (!SESSION.isShiftHeld() || event == null) return;
        int action = event.getActionMasked();
        if (action == MotionEvent.ACTION_DOWN || action == MotionEvent.ACTION_CANCEL) {
            SESSION.cancel();
        }
    }

}
