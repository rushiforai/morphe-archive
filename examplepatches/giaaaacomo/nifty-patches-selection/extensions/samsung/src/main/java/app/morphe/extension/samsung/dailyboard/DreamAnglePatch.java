/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */
package app.morphe.extension.samsung.dailyboard;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.service.dreams.DreamService;
import android.view.Window;
import android.view.WindowManager;

import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.lang.reflect.Method;
import java.util.Locale;

public final class DreamAnglePatch {
    private static final long ANGLE_STABILITY_MS = 750L;
    private static final long OUT_OF_RANGE_STABILITY_MS = 500L;
    private static final Object LOCK = new Object();
    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());

    private static DreamAngleListener activeListener;
    private static DreamService deferredStartService;

    private DreamAnglePatch() {
    }

    public static boolean onDreamingStarted(DreamService service) {
        synchronized (LOCK) {
            if (deferredStartService == service) {
                deferredStartService = null;
                AngleDiagnosticsPatch.recordDreamEvent(
                        "Angolo accettato: inizializzazione Samsung avviata",
                        "Angle accepted: Samsung initialization started"
                );
                return true;
            }
        }
        AngleDiagnosticsPatch.recordDreamEvent(
                "Avvio dream richiesto",
                "Dream start requested"
        );
        stopActiveListener();
        if (!booleanSetting("K", false)) {
            AngleDiagnosticsPatch.recordDreamEvent(
                    "Modalità app/ricarica: dream mantenuto scuro",
                    "App/charging mode: dream kept dark"
            );
            holdDreamOff(service);
            return false;
        }
        if (!OrientationPatch.isDreamAngleEnabled(service)) {
            AngleDiagnosticsPatch.recordDreamEvent(
                    "Limite disattivato: dream mostrato",
                    "Angle limit disabled: dream shown"
            );
            return true;
        }

        Float minimum = configuredMinimum();
        Float maximum = configuredMaximum();
        if (minimum == null || maximum == null) {
            AngleDiagnosticsPatch.recordDreamEvent(
                    "Intervallo non disponibile: dream mantenuto scuro",
                    "Range unavailable: dream kept dark"
            );
            holdDreamOff(service);
            return false;
        }

        holdDreamOff(service);
        DreamAngleListener listener = new DreamAngleListener(service, minimum, maximum);
        synchronized (LOCK) {
            activeListener = listener;
        }
        if (!listener.start()) {
            AngleDiagnosticsPatch.recordDreamEvent(
                    "Sensore non disponibile: dream mantenuto scuro",
                    "Sensor unavailable: dream kept dark"
            );
            stopListening(service);
            return false;
        }
        recordRangeEvent(minimum, maximum);
        MAIN_HANDLER.post(listener::keepDarkWhileWaiting);
        // Defer Samsung's UI initialization until the sensor has accepted the angle.
        return false;
    }

    public static void onDreamingStopped(DreamService service) {
        AngleDiagnosticsPatch.recordDreamEvent("Dream arrestato", "Dream stopped");
        synchronized (LOCK) {
            if (deferredStartService == service) deferredStartService = null;
            if (activeListener != null &&
                    activeListener.service == service &&
                    activeListener.suspended) return;
        }
        stopListening(service);
    }

    private static void recordRangeEvent(float minimum, float maximum) {
        String range = String.format(Locale.US, "%.1f - %.1f°", minimum, maximum);
        AngleDiagnosticsPatch.recordDreamEvent(
                "Gate in ascolto, intervallo " + range,
                "Gate listening, range " + range
        );
    }

    private static void stopListening(DreamService service) {
        DreamAngleListener listener;
        synchronized (LOCK) {
            listener = activeListener;
            if (listener == null || listener.service != service) return;
            activeListener = null;
        }
        listener.finishListening();
    }

    private static void stopActiveListener() {
        DreamAngleListener listener;
        synchronized (LOCK) {
            listener = activeListener;
            activeListener = null;
        }
        if (listener != null) listener.finishListening();
    }

    private static void holdDreamOff(DreamService service) {
        Window window = service.getWindow();
        if (window != null) window.getDecorView().setAlpha(0.0f);
        service.setInteractive(false);
        service.setScreenBright(false);
        setWindowBrightness(service, 0.0f);
    }

    private static void showDream(DreamService service) {
        Window window = service.getWindow();
        if (window != null) window.getDecorView().setAlpha(1.0f);
        setWindowBrightness(service, WindowManager.LayoutParams.BRIGHTNESS_OVERRIDE_NONE);
        service.setScreenBright(true);
        service.setInteractive(true);
    }

    private static void setWindowBrightness(DreamService service, float brightness) {
        Window window = service.getWindow();
        if (window == null) return;
        WindowManager.LayoutParams attributes = window.getAttributes();
        attributes.screenBrightness = brightness;
        window.setAttributes(attributes);
    }

    private static boolean booleanSetting(String methodName, boolean fallback) {
        try {
            Class<?> settings = Class.forName("s1.b");
            Method method = settings.getDeclaredMethod(methodName);
            method.setAccessible(true);
            return (Boolean) method.invoke(null);
        } catch (ReflectiveOperationException | ClassCastException ignored) {
            return fallback;
        }
    }

    private static Float floatSetting(String methodName) {
        try {
            Class<?> settings = Class.forName("s1.b");
            Method method = settings.getDeclaredMethod(methodName);
            method.setAccessible(true);
            return (Float) method.invoke(null);
        } catch (ReflectiveOperationException | ClassCastException ignored) {
            return null;
        }
    }

    static Float configuredMinimum() {
        return floatSetting("c");
    }

    static Float configuredMaximum() {
        return floatSetting("b");
    }

    static float calculateSamsungDockAngle(float pitch, float roll) {
        float angle = 90.0f;
        if (roll <= 90.0f) {
            angle = 180.0f - Math.max(pitch, roll);
        }
        return Math.round(angle * 10.0f) / 10.0f;
    }

    private static final class DreamAngleListener implements PropertyChangeListener {
        final DreamService service;
        final float minimum;
        final float maximum;

        Object sensorManager;
        Method removeListener;
        boolean stationary;
        volatile boolean finished;
        volatile boolean accepted;
        volatile boolean samsungStarted;
        volatile boolean suspended;
        volatile boolean visible;
        Float lastAngle;
        long inRangeSince;
        long outOfRangeSince;

        DreamAngleListener(DreamService service, float minimum, float maximum) {
            this.service = service;
            this.minimum = minimum;
            this.maximum = maximum;
        }

        boolean start() {
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
                addListener.invoke(sensorManager, service.getApplicationContext(), this);
                return true;
            } catch (ReflectiveOperationException ignored) {
                unregister();
                return false;
            }
        }

        @Override
        public void propertyChange(PropertyChangeEvent event) {
            if (finished) return;
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

            if (!stationary) {
                inRangeSince = 0L;
                outOfRangeSince = 0L;
                return;
            }

            float firstAxis = Math.abs((Float) values[0]);
            float secondAxis = Math.abs((Float) values[1]);
            float angle = samsungDockAngle(firstAxis, secondAxis);
            lastAngle = angle;
            long now = SystemClock.elapsedRealtime();

            if (angle < minimum || angle > maximum) {
                inRangeSince = 0L;
                if (outOfRangeSince == 0L) {
                    outOfRangeSince = now;
                    return;
                }
                if (now - outOfRangeSince >= OUT_OF_RANGE_STABILITY_MS) {
                    accepted = false;
                    boolean handedOff = false;
                    if (!suspended) {
                        suspended = true;
                        handedOff = DreamSettingsPatch.suspendForAngle(
                                service.getApplicationContext()
                        );
                        if (!handedOff) suspended = false;
                    }
                    if (handedOff) {
                        visible = false;
                        String angleValue = String.format(Locale.US, "%.1f°", angle);
                        AngleDiagnosticsPatch.recordDreamEvent(
                                "Angolo " + angleValue + ": passaggio ad AOD/schermo spento",
                                "Angle " + angleValue + ": handing off to AOD/screen off"
                        );
                        MAIN_HANDLER.post(() -> {
                            holdDreamOff(service);
                            service.finish();
                        });
                    } else if (!suspended && samsungStarted && visible) {
                        visible = false;
                        String angleValue = String.format(Locale.US, "%.1f°", angle);
                        AngleDiagnosticsPatch.recordDreamEvent(
                                "Angolo " + angleValue + ": contenuti nascosti",
                                "Angle " + angleValue + ": content hidden"
                        );
                        MAIN_HANDLER.post(() -> holdDreamOff(service));
                    }
                }
                return;
            }
            outOfRangeSince = 0L;
            if (inRangeSince == 0L) {
                inRangeSince = now;
                return;
            }
            if (now - inRangeSince >= ANGLE_STABILITY_MS && !accepted) {
                accepted = true;
                String angleValue = String.format(Locale.US, "%.1f°", angle);
                if (suspended) {
                    AngleDiagnosticsPatch.recordDreamEvent(
                            "Angolo " + angleValue + ": screensaver riattivato",
                            "Angle " + angleValue + ": screen saver re-enabled"
                    );
                    if (DreamSettingsPatch.resumeAfterAngle(
                            service.getApplicationContext()
                    )) {
                        finishListening();
                    } else {
                        accepted = false;
                    }
                    return;
                }
                AngleDiagnosticsPatch.recordDreamEvent(
                        "Angolo " + angleValue + ": dream mostrato",
                        "Angle " + angleValue + ": dream shown"
                );
                if (!samsungStarted) {
                    samsungStarted = true;
                    MAIN_HANDLER.post(() -> startDeferredDream(service, this));
                } else if (!visible) {
                    visible = true;
                    MAIN_HANDLER.post(() -> showDream(service));
                }
            }
        }

        void keepDarkWhileWaiting() {
            if (finished) return;
            holdDreamOff(service);
        }

        private float samsungDockAngle(float pitch, float roll) {
            return calculateSamsungDockAngle(pitch, roll);
        }

        boolean finishListening() {
            if (!markFinished()) return false;
            unregisterAsync();
            return true;
        }

        boolean markFinished() {
            synchronized (this) {
                if (finished) return false;
                finished = true;
            }
            synchronized (LOCK) {
                if (activeListener == this) activeListener = null;
            }
            return true;
        }

        void unregisterAsync() {
            Thread cleanup = new Thread(
                    this::unregister,
                    "MorpheDailyBoardSensorCleanup"
            );
            cleanup.start();
        }

        void unregister() {
            if (sensorManager == null || removeListener == null) return;
            try {
                removeListener.invoke(
                        sensorManager,
                        service.getApplicationContext(),
                        this
                );
            } catch (ReflectiveOperationException ignored) {
                // The listener is process-local and disappears with the dream process.
            } finally {
                sensorManager = null;
                removeListener = null;
            }
        }
    }

    private static void startDeferredDream(
            DreamService service,
            DreamAngleListener listener
    ) {
        if (listener.finished) return;
        synchronized (LOCK) {
            deferredStartService = service;
        }
        service.onDreamingStarted();
        if (listener.accepted && !listener.finished) {
            listener.visible = true;
            showDream(service);
        } else {
            listener.visible = false;
            holdDreamOff(service);
        }
    }
}
