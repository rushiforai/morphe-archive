/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */
package app.morphe.extension.samsung.dailyboard;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Typeface;
import android.view.Display;
import android.view.Surface;
import android.widget.TextView;
import android.widget.ScrollView;

import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.lang.reflect.Method;
import java.util.ArrayDeque;
import java.util.Locale;

public final class AngleDiagnosticsPatch {
    private static final int MAX_EVENTS = 16;
    private static final Object EVENT_LOCK = new Object();
    private static final ArrayDeque<String> DREAM_EVENTS = new ArrayDeque<>();
    private static int eventSequence;

    private AngleDiagnosticsPatch() {
    }

    static void recordDreamEvent(String italian, String english) {
        boolean useItalian = Locale.getDefault().getLanguage()
                .equals(Locale.ITALIAN.getLanguage());
        synchronized (EVENT_LOCK) {
            while (DREAM_EVENTS.size() >= MAX_EVENTS) DREAM_EVENTS.removeFirst();
            DREAM_EVENTS.addLast((++eventSequence) + ". " + (useItalian ? italian : english));
        }
    }

    private static String dreamEventLog(boolean italian) {
        synchronized (EVENT_LOCK) {
            if (DREAM_EVENTS.isEmpty()) {
                return italian ? "Nessun evento dream" : "No dream events";
            }
            StringBuilder result = new StringBuilder();
            for (String event : DREAM_EVENTS) {
                if (result.length() > 0) result.append('\n');
                result.append(event);
            }
            return result.toString();
        }
    }

    public static void show(Activity activity) {
        boolean italian = Locale.getDefault().getLanguage().equals(Locale.ITALIAN.getLanguage());
        TextView output = new TextView(activity);
        int padding = Math.round(24.0f * activity.getResources().getDisplayMetrics().density);
        output.setPadding(padding, padding, padding, padding);
        output.setTextSize(16.0f);
        output.setTypeface(Typeface.MONOSPACE);

        ScrollView scroll = new ScrollView(activity);
        scroll.addView(output);
        DiagnosticsListener listener = new DiagnosticsListener(activity, output, italian);
        AlertDialog dialog = new AlertDialog.Builder(activity)
                .setTitle(italian ? "Diagnostica inclinazione" : "Angle diagnostics")
                .setView(scroll)
                .setNegativeButton(android.R.string.cancel, null)
                .create();
        dialog.setOnShowListener(ignored -> listener.start());
        dialog.setOnDismissListener(ignored -> listener.stopAsync());
        dialog.show();
    }

    private static final class DiagnosticsListener implements PropertyChangeListener {
        final Activity activity;
        final TextView output;
        final boolean italian;

        Object sensorManager;
        Method removeListener;
        boolean stationary;
        volatile boolean stopped;

        DiagnosticsListener(Activity activity, TextView output, boolean italian) {
            this.activity = activity;
            this.output = output;
            this.italian = italian;
        }

        void start() {
            updateUnavailable(italian ? "In attesa dei sensori..." : "Waiting for sensors...");
            try {
                Class<?> sensorClass = Class.forName(
                        "com.samsung.android.homemode.infra.manager.SensorMgr"
                );
                sensorManager = sensorClass.getMethod("getInstance").invoke(null);
                Method addListener = sensorClass.getMethod(
                        "addPropertyChangeListener",
                        Context.class,
                        PropertyChangeListener.class
                );
                removeListener = sensorClass.getMethod(
                        "removePropertyChangeListener",
                        Context.class,
                        PropertyChangeListener.class
                );
                addListener.invoke(sensorManager, activity.getApplicationContext(), this);
            } catch (ReflectiveOperationException | RuntimeException ignored) {
                updateUnavailable(
                        italian ? "Sensori non disponibili" : "Sensors unavailable"
                );
            }
        }

        @Override
        public void propertyChange(PropertyChangeEvent event) {
            if (stopped) return;
            Object value = event.getNewValue();
            if (!(value instanceof Object[])) return;
            Object[] values = (Object[]) value;

            if ("linear_acceleration".equals(event.getPropertyName())) {
                if (values.length < 3 ||
                        !(values[0] instanceof Integer) ||
                        !(values[1] instanceof Integer) ||
                        !(values[2] instanceof Integer)) return;
                stationary = Math.abs((Integer) values[0]) <= 1 &&
                        Math.abs((Integer) values[1]) <= 1 &&
                        Math.abs((Integer) values[2]) <= 1;
                return;
            }

            if (!"magnetic_field".equals(event.getPropertyName()) ||
                    values.length < 2 ||
                    !(values[0] instanceof Float) ||
                    !(values[1] instanceof Float)) return;

            float pitch = Math.abs((Float) values[0]);
            float roll = Math.abs((Float) values[1]);
            Display display = activity.getWindow().getDecorView().getDisplay();
            float angle = DreamAnglePatch.calculateSamsungDockAngle(pitch, roll);
            Float minimum = DreamAnglePatch.configuredMinimum();
            Float maximum = DreamAnglePatch.configuredMaximum();
            boolean inRange = stationary && minimum != null && maximum != null &&
                    minimum <= angle && angle <= maximum;
            String text = format(
                    display,
                    pitch,
                    roll,
                    angle,
                    minimum,
                    maximum,
                    inRange
            );
            output.post(() -> {
                if (!stopped) output.setText(text);
            });
        }

        String format(
                Display display,
                float pitch,
                float roll,
                float angle,
                Float minimum,
                Float maximum,
                boolean inRange
        ) {
            String rotation = rotationLabel(display);
            String axis = pitch >= roll ? "pitch" : "roll";
            String range = minimum == null || maximum == null
                    ? "-"
                    : String.format(Locale.US, "%.1f - %.1f°", minimum, maximum);
            if (italian) {
                String result = !stationary
                        ? "ATTENDI: telefono in movimento"
                        : inRange
                                ? "DENTRO: il dream verrebbe mostrato"
                                : "FUORI: il dream resterebbe scuro";
                return String.format(
                        Locale.US,
                        "Rotazione: %s\nPitch: %.1f°\nRoll: %.1f°\nAsse fisico: %s\nAngolo dream: %.1f°\nIntervallo: %s\n\n%s\n\nUltimi eventi dream:\n%s",
                        rotation,
                        pitch,
                        roll,
                        axis,
                        angle,
                        range,
                        result,
                        dreamEventLog(true)
                );
            }
            String result = !stationary
                    ? "WAIT: device is moving"
                    : inRange
                            ? "INSIDE: the dream would be shown"
                            : "OUTSIDE: the dream would stay dark";
            return String.format(
                    Locale.US,
                    "Rotation: %s\nPitch: %.1f°\nRoll: %.1f°\nPhysical axis: %s\nDream angle: %.1f°\nRange: %s\n\n%s\n\nLatest dream events:\n%s",
                    rotation,
                    pitch,
                    roll,
                    axis,
                    angle,
                    range,
                    result,
                    dreamEventLog(false)
            );
        }

        String rotationLabel(Display display) {
            if (display == null) {
                return activity.getResources().getConfiguration().orientation ==
                        Configuration.ORIENTATION_LANDSCAPE ? "landscape" : "portrait";
            }
            switch (display.getRotation()) {
                case Surface.ROTATION_90:
                    return "90° landscape";
                case Surface.ROTATION_180:
                    return "180° portrait";
                case Surface.ROTATION_270:
                    return "270° landscape";
                default:
                    return "0° portrait";
            }
        }

        void updateUnavailable(String message) {
            output.post(() -> {
                if (!stopped) {
                    String label = italian ? "Ultimi eventi dream:" : "Latest dream events:";
                    output.setText(message + "\n\n" + label + "\n" + dreamEventLog(italian));
                }
            });
        }

        void stopAsync() {
            stopped = true;
            Thread cleanup = new Thread(this::unregister, "MorpheAngleDiagnosticsCleanup");
            cleanup.start();
        }

        void unregister() {
            if (sensorManager == null || removeListener == null) return;
            try {
                removeListener.invoke(
                        sensorManager,
                        activity.getApplicationContext(),
                        this
                );
            } catch (ReflectiveOperationException | RuntimeException ignored) {
                // The listener is process-local and disappears with the settings process.
            } finally {
                sensorManager = null;
                removeListener = null;
            }
        }
    }
}
