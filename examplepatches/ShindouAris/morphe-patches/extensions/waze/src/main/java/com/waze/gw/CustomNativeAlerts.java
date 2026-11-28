package com.waze.gw;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;

import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Calendar;

/** Injects short-lived WazeMod descriptors into Waze's native alert repository. */
final class CustomNativeAlerts {
    private static final String TAG = "WazeGW-CustomAlert";
    private static final String PREFS = "waze_hud_gw";
    static final String PREF_HEADLIGHT_REMINDER = "headlight_reminder";
    private static final String PREF_HEADLIGHT_LAST_DAY = "headlight_reminder_last_day";

    private static final long EVALUATE_INTERVAL_MS = 10_000L;
    private static final long DISPLAY_MS = 15_000L;
    private static final String PROVIDER = "WazeMod";
    private static final String LIGHTS_PROVIDER = "LightsAlert";
    private static final String REALTIME_PROVIDER = "RealtimeAlert";
    private static final String ID_PREFIX = "wazemod:";

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static Object latestBaseRepository;
    private static Alert active;
    private static boolean expiryScheduled;
    private static long lastEvaluationElapsed;

    private CustomNativeAlerts() { }

    /** Called in AlerterNativeManager immediately before Waze emits its StateFlow value. */
    static Object patchRepository(Context context, Object repository) {
        if (repository == null) return null;
        synchronized (CustomNativeAlerts.class) {
            latestBaseRepository = repository;
            evaluateLocked(context, false, false);
            Object patched = appendActiveLocked(repository);
            if (patched != repository) markDeliveredLocked(context);
            return patched;
        }
    }

    /** Hot-path scheduler; throttled and safe to call from every speedometer update. */
    static void evaluateHeadlightReminder(Context context) {
        synchronized (CustomNativeAlerts.class) {
            evaluateLocked(context, true, true);
        }
    }

    /** Settings callback: apply an enable/disable change without waiting for another speed frame. */
    static void onHeadlightSettingChanged(Context context) {
        synchronized (CustomNativeAlerts.class) {
            lastEvaluationElapsed = 0L;
            evaluateLocked(context, false, true);
        }
    }

    /** Reusable single-slot API for future WazeMod features. */
    static boolean show(Context context, String key, String title, String description,
                        String icon, int type, int subType, int timeoutSeconds) {
        if (key == null || key.trim().isEmpty() || title == null || title.trim().isEmpty())
            return false;
        synchronized (CustomNativeAlerts.class) {
            if (active != null) return false;
            if (latestBaseRepository == null) latestBaseRepository = currentRepository();
            if (latestBaseRepository == null) {
                Log.w(TAG, "No native alert repository available");
                return false;
            }
            String cleanKey = key.trim().replaceAll("[^A-Za-z0-9_.:-]", "_");
            active = new Alert("api", ID_PREFIX + cleanKey, title.trim(),
                    description == null ? "" : description.trim(),
                    icon == null || icon.trim().isEmpty() ? "icon_report_hazard" : icon.trim(),
                    type, subType, Math.max(3, Math.min(60, timeoutSeconds)),
                    PROVIDER, null, 0, 0, 0, 0, true, true);
            boolean published = publishActiveLocked(context);
            if (!published) active = null;
            return published;
        }
    }

    /** Publish/update a point-backed native alerter with real coordinates and remaining meters. */
    static boolean showPositioned(Context context, String key, String title, String icon,
                                  int latitudeE6, int longitudeE6, int meters,
                                  int triggerDistanceMeters) {
        if (key == null || key.trim().isEmpty() || title == null || title.trim().isEmpty())
            return false;
        synchronized (CustomNativeAlerts.class) {
            String cleanKey = key.trim().replaceAll("[^A-Za-z0-9_.:-]", "_");
            String id = ID_PREFIX + cleanKey;
            int cleanMeters = Math.max(0, meters);
            if (active != null) {
                if (!id.equals(active.id) || !"positioned".equals(active.feature)) return false;
                if (Math.abs(active.distanceMeters - cleanMeters) < 10) return true;
            }
            if (latestBaseRepository == null) latestBaseRepository = currentRepository();
            if (latestBaseRepository == null) return false;
            String imperialDistance = Units.imperialDistance(cleanMeters, false);
            String distance = imperialDistance != null ? imperialDistance
                    : cleanMeters < 1000 ? cleanMeters + " m"
                    : String.format(java.util.Locale.US, "%.1f km", cleanMeters / 1000f);
            active = new Alert("positioned", id, title.trim(), "", icon,
                    5, 0, -1, REALTIME_PROVIDER, title.trim() + " " + distance,
                    latitudeE6, longitudeE6, cleanMeters,
                    Math.max(cleanMeters, triggerDistanceMeters), false, false);
            boolean published = publishActiveLocked(context);
            if (published) markDeliveredLocked(context);
            else active = null;
            return published;
        }
    }

    static boolean dismiss(String key) {
        synchronized (CustomNativeAlerts.class) {
            if (active == null) return false;
            String expected = ID_PREFIX + (key == null ? "" : key.trim()
                    .replaceAll("[^A-Za-z0-9_.:-]", "_"));
            if (!active.id.equals(expected)) return false;
            clearActiveLocked();
            return true;
        }
    }

    /** Prevent synthetic WazeMod alert lifecycle events from reaching Waze's native core. */
    static boolean consumeCallback(Object alertIdModel) {
        if (alertIdModel == null) return false;
        try {
            for (Method method : alertIdModel.getClass().getMethods()) {
                if (method.getParameterTypes().length != 0 || method.getReturnType() != String.class)
                    continue;
                Object raw = method.invoke(alertIdModel);
                String value = raw == null ? "" : raw.toString();
                if (PROVIDER.equals(value) || value.startsWith(ID_PREFIX)) {
                    Log.d(TAG, "Consumed custom alert callback " + method.getName()
                            + "=" + value);
                    return true;
                }
            }
        } catch (Throwable error) {
            Log.w(TAG, "Unable to inspect alert callback: " + error.getClass().getSimpleName());
        }
        return false;
    }

    /** Keep synthetic descriptors out of WazeMod's secondary HUD list. */
    static boolean isCustomDescriptor(Object descriptor) {
        if (descriptor == null) return false;
        try {
            Object id = descriptor.getClass().getMethod("getAlertId").invoke(descriptor);
            Object provider = id == null ? null
                    : id.getClass().getMethod("getProviderId").invoke(id);
            Object uniqueId = id == null ? null
                    : id.getClass().getMethod("getUniqueId").invoke(id);
            return PROVIDER.equals(provider == null ? "" : provider.toString())
                    || (uniqueId != null && uniqueId.toString().startsWith(ID_PREFIX));
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static void evaluateLocked(Context context, boolean throttle, boolean publishNow) {
        Context app = context == null ? null : context.getApplicationContext();
        if (app == null) return;
        long elapsed = SystemClock.elapsedRealtime();
        if (throttle && elapsed - lastEvaluationElapsed < EVALUATE_INTERVAL_MS) return;
        lastEvaluationElapsed = elapsed;

        SharedPreferences preferences = app.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        Calendar now = Calendar.getInstance();
        int phase = HeadlightReminderSchedule.phaseAt(now);
        boolean inWindow = phase != HeadlightReminderSchedule.PHASE_OFF;
        boolean enabled = preferences.getBoolean(PREF_HEADLIGHT_REMINDER, false);
        String day = HeadlightReminderSchedule.dayKey(now);

        if (!enabled || !inWindow) {
            if (active != null && "headlight".equals(active.feature)) clearActiveLocked();
            return;
        }
        if (active != null || day.equals(preferences.getString(PREF_HEADLIGHT_LAST_DAY, "")))
            return;

        // The Vietnamese text is the translation key; it is also what the TTS speaks (in the voice's language).
        String titleVi;
        if (phase == HeadlightReminderSchedule.PHASE_KEEP_ON) {
            titleVi = "core.keep_your_headlights_on_until_6";
        } else if (phase == HeadlightReminderSchedule.PHASE_TURN_ON) {
            titleVi = "core.its_dark_turn_on_your_headlights";
        } else {
            titleVi = "core.its_getting_dark_turn_on_your";
        }
        active = headlightAlert("headlight", ID_PREFIX + "headlight:" + day,
                I18n.tr(titleVi), I18n.tr("core.reminder_from_wazemod"));
        active.spokenKey = titleVi;
        if (publishNow && publishActiveLocked(app)) markDeliveredLocked(app);
    }

    private static Alert headlightAlert(String feature, String id, String title,
                                        String description) {
        // Provider LightsAlert is the discriminator used by Waze's platform-notification mapper.
        // OTHER/subtype 0 maps to MISC_HEADLIGHTS_REMINDER for this provider.
        return new Alert(feature, id, title, description,
                "icon_alerter_headlights", 6, 0, 15, LIGHTS_PROVIDER, null,
                0, 0, 0, 0, false, true);
    }

    private static Object appendActiveLocked(Object repository) {
        if (active == null) return repository;
        try {
            Object descriptor = buildDescriptor(active);
            Class<?> repositoryType = repository.getClass();
            Object builder = repositoryType.getMethod("newBuilder", repositoryType)
                    .invoke(null, repository);
            Method add = builder.getClass().getMethod("addDescriptors",
                    Integer.TYPE, descriptor.getClass());
            add.invoke(builder, Integer.valueOf(0), descriptor);
            Object patched = builder.getClass().getMethod("build").invoke(builder);
            return patched;
        } catch (Throwable error) {
            Log.w(TAG, "Unable to append custom alert: " + error.getClass().getSimpleName());
            return repository;
        }
    }

    private static boolean publishActiveLocked(Context context) {
        Object base = latestBaseRepository;
        if (base == null || active == null) return false;
        Object patched = appendActiveLocked(base);
        if (patched == base) return false;
        return publishRepository(patched);
    }

    private static boolean publishRepository(final Object repository) {
        if (repository == null) return false;
        final boolean[] accepted = {false};
        final String alertId = active == null ? "base" : active.id;
        Runnable publish = new Runnable() {
            @Override public void run() {
                try {
                    Object manager = WazeKoin.singleton("com.waze.alerters.AlerterNativeManager");
                    Object flow = alertsFlow(manager, true);
                    Method emit = findEmitter(flow.getClass(), repository.getClass());
                    Object result = emit.invoke(flow, repository);
                    accepted[0] = !(result instanceof Boolean) || ((Boolean) result).booleanValue();
                    if (accepted[0]) Log.i(TAG, "Published " + alertId);
                } catch (Throwable error) {
                    Log.w(TAG, "Unable to publish custom alert: "
                            + error.getClass().getSimpleName());
                }
            }
        };
        if (Looper.myLooper() == Looper.getMainLooper()) publish.run();
        else MAIN.post(publish);
        // A queued main-thread publish is considered accepted; failures leave no unsafe mutation.
        return Looper.myLooper() != Looper.getMainLooper() || accepted[0];
    }

    /**
     * The alerts flow of the AlerterNativeManager. 5.24: getNativeAlertsFlow(). 5.27 keeps a private mutable
     * flow in field a (what b(update) emits into) and exposes a read-only view through a().
     */
    private static Object alertsFlow(Object manager, boolean mutable) throws Exception {
        if (manager == null) throw new IllegalStateException("AlerterNativeManager not ready");
        Class<?> type = manager.getClass();
        try {
            return type.getMethod("getNativeAlertsFlow").invoke(manager);
        } catch (NoSuchMethodException legacy) {
            if (mutable) {
                java.lang.reflect.Field field = type.getDeclaredField("a");
                field.setAccessible(true);
                return field.get(manager);
            }
            return type.getMethod("a").invoke(manager);
        }
    }

    /** Read StateFlow.value so debug/API calls do not depend on a fresh native callback. */
    private static Object currentRepository() {
        try {
            Object manager = WazeKoin.singleton("com.waze.alerters.AlerterNativeManager");
            Object flow = alertsFlow(manager, false);
            for (Method method : flow.getClass().getMethods()) {
                if (method.getParameterTypes().length != 0 || method.getReturnType() == Void.TYPE)
                    continue;
                if (!"d".equals(method.getName()) && !"getValue".equals(method.getName()))
                    continue;
                Object value = method.invoke(flow);
                if (value != null && value.getClass().getName().endsWith(
                        ".NativeAlertRepositoryUpdate")) {
                    Log.i(TAG, "Loaded current native alert repository from StateFlow");
                    return value;
                }
            }
        } catch (Throwable error) {
            Log.w(TAG, "Unable to read current alert repository: "
                    + error.getClass().getSimpleName());
        }
        return null;
    }

    private static void markDeliveredLocked(Context context) {
        if (active == null || active.delivered) return;
        active.delivered = true;
        if (active.showBanner
                && CustomAlertBanner.show(active.title, active.description, active.timeoutSeconds)) {
            Log.i(TAG, "Visual delivered " + active.id);
        }
        if ("headlight".equals(active.feature)) {
            speakHeadlightLocked(active);
        }
        if ("headlight".equals(active.feature) && context != null) {
            context.getApplicationContext().getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                    .edit().putString(PREF_HEADLIGHT_LAST_DAY,
                            active.id.substring(active.id.lastIndexOf(':') + 1)).apply();
        }
        if (active.expires) scheduleExpiryLocked();
    }

    private static void speakHeadlightLocked(final Alert alert) {
        if (alert == null || alert.voicePlayed) return;
        if (WazeTtsBridge.speak(alert.spokenKey != null ? alert.spokenKey : alert.title)) {
            alert.voicePlayed = true;
            Log.i(TAG, "TTS started " + alert.id);
            return;
        }
        if (alert.voiceRetryScheduled) return;
        alert.voiceRetryScheduled = true;
        MAIN.postDelayed(new Runnable() {
            @Override public void run() {
                synchronized (CustomNativeAlerts.class) {
                    alert.voiceRetryScheduled = false;
                    if (active == alert && !alert.voicePlayed
                            && WazeTtsBridge.speak(alert.spokenKey != null ? alert.spokenKey : alert.title)) {
                        alert.voicePlayed = true;
                        Log.i(TAG, "TTS retry started " + alert.id);
                    }
                }
            }
        }, 1_000L);
    }

    private static void scheduleExpiryLocked() {
        if (expiryScheduled) return;
        expiryScheduled = true;
        MAIN.postDelayed(new Runnable() {
            @Override public void run() {
                synchronized (CustomNativeAlerts.class) {
                    expiryScheduled = false;
                    clearActiveLocked();
                }
            }
        }, DISPLAY_MS);
    }

    private static void clearActiveLocked() {
        if (active == null) return;
        active = null;
        CustomAlertBanner.dismiss();
        Object base = latestBaseRepository;
        if (base != null) publishRepository(base);
    }

    private static Object buildDescriptor(Alert alert) throws Exception {
        Class<?> idType = Class.forName("com.waze.jni.protos.alerters.AlerterId");
        Object idBuilder = idType.getMethod("newBuilder").invoke(null);
        invoke(idBuilder, "setProviderId", String.class, alert.provider);
        invoke(idBuilder, "setUniqueId", String.class, alert.id);
        invoke(idBuilder, "setUuid", String.class, alert.id);
        Object id = idBuilder.getClass().getMethod("build").invoke(idBuilder);

        Class<?> infoType = Class.forName("com.waze.jni.protos.alerters.AlerterInfo");
        Object infoBuilder = infoType.getMethod("newBuilder").invoke(null);
        invoke(infoBuilder, "setAlertId", idType, id);
        invoke(infoBuilder, "setTitle", String.class, alert.title);
        invoke(infoBuilder, "setTitleWithDistance", String.class,
                alert.titleWithDistance == null ? alert.title : alert.titleWithDistance);
        invoke(infoBuilder, "setDescription", String.class, alert.description);
        if (alert.positioned) {
            String imperialDistance = Units.imperialDistance(alert.distanceMeters, false);
            invoke(infoBuilder, "setDistanceString", String.class,
                    imperialDistance != null ? imperialDistance
                            : alert.distanceMeters < 1000 ? alert.distanceMeters + " m"
                            : String.format(java.util.Locale.US, "%.1f km",
                            alert.distanceMeters / 1000f));
        }
        invoke(infoBuilder, "setIconName", String.class, alert.icon);
        invoke(infoBuilder, "setTypeValue", Integer.TYPE, Integer.valueOf(alert.type));
        invoke(infoBuilder, "setSubType", Integer.TYPE, Integer.valueOf(alert.subType));
        invoke(infoBuilder, "setTimeoutSeconds", Integer.TYPE, Integer.valueOf(alert.timeoutSeconds));
        invoke(infoBuilder, "setTimerTypeValue", Integer.TYPE, Integer.valueOf(1)); // TIMER_BAR
        // A positioned WazeMod notice is informational. Realtime alerts marked cancellable are
        // rendered as community reports and Waze injects the default "Not there" action.
        invoke(infoBuilder, "setIsCancellable", Boolean.TYPE,
                Boolean.valueOf(!alert.positioned));
        invoke(infoBuilder, "setHideActionsWhenInvalid", Boolean.TYPE, Boolean.TRUE);
        invoke(infoBuilder, "setShouldShowStillThere", Boolean.TYPE, Boolean.FALSE);
        invoke(infoBuilder, "setShowDistance", Boolean.TYPE,
                Boolean.valueOf(alert.positioned));
        invoke(infoBuilder, "setShowThumbsUp", Boolean.TYPE, Boolean.FALSE);
        invoke(infoBuilder, "setShowWithEta", Boolean.TYPE, Boolean.FALSE);
        invoke(infoBuilder, "setIsCloseOnly", Boolean.TYPE, Boolean.TRUE);
        if (alert.positioned) {
            invoke(infoBuilder, "setIsApproachingWithValidation", Boolean.TYPE, Boolean.TRUE);
            Class<?> positionType = Class.forName(
                    "com.waze.jni.protos.Position$IntPosition");
            Object positionBuilder = positionType.getMethod("newBuilder").invoke(null);
            invoke(positionBuilder, "setLatitude", Integer.TYPE,
                    Integer.valueOf(alert.latitudeE6));
            invoke(positionBuilder, "setLongitude", Integer.TYPE,
                    Integer.valueOf(alert.longitudeE6));
            Object position = positionBuilder.getClass().getMethod("build")
                    .invoke(positionBuilder);
            invoke(infoBuilder, "setPosition", positionType, position);
        }
        invoke(infoBuilder, "setReportId", Integer.TYPE,
                Integer.valueOf(alert.id.hashCode() & 0x7fffffff));
        Class<?> validationType = Class.forName(
                "com.waze.jni.protos.alerters.AlertValidationResult");
        Object validationBuilder = validationType.getMethod("newBuilder").invoke(null);
        invoke(validationBuilder, "setIsValid", Boolean.TYPE, Boolean.TRUE);
        invoke(validationBuilder, "setDistanceMeters", Integer.TYPE,
                Integer.valueOf(alert.distanceMeters));
        Object validation = validationBuilder.getClass().getMethod("build")
                .invoke(validationBuilder);
        invoke(infoBuilder, "setValidationResult", validationType, validation);
        Object info = infoBuilder.getClass().getMethod("build").invoke(infoBuilder);

        Class<?> descriptorType = Class.forName(
                "com.waze.jni.protos.alerters.NativeAlertDescriptor");
        Object descriptorBuilder = descriptorType.getMethod("newBuilder").invoke(null);
        invoke(descriptorBuilder, "setAlertId", idType, id);
        invoke(descriptorBuilder, "setInfo", infoType, info);
        invoke(descriptorBuilder, "setTriggerDistanceMeters", Integer.TYPE,
                Integer.valueOf(alert.triggerDistanceMeters));
        Class<?> priorityType = Class.forName("com.waze.jni.protos.InsightPriority");
        Object priorityBuilder = priorityType.getMethod("newBuilder").invoke(null);
        invoke(priorityBuilder, "setValue", Integer.TYPE, Integer.valueOf(100));
        Object priority = priorityBuilder.getClass().getMethod("build").invoke(priorityBuilder);
        invoke(descriptorBuilder, "setInsightPriority", priorityType, priority);
        return descriptorBuilder.getClass().getMethod("build").invoke(descriptorBuilder);
    }

    private static void invoke(Object target, String name, Class<?> parameter, Object value)
            throws Exception {
        target.getClass().getMethod(name, parameter).invoke(target, value);
    }

    private static Method findEmitter(Class<?> type, Class<?> repositoryType)
            throws NoSuchMethodException {
        for (Method method : type.getMethods()) {
            Class<?>[] parameters = method.getParameterTypes();
            if (parameters.length == 1 && parameters[0].isAssignableFrom(repositoryType)
                    && (method.getReturnType() == Boolean.TYPE
                    || method.getReturnType() == Boolean.class)
                    && ("c".equals(method.getName()) || Modifier.isPublic(method.getModifiers()))) {
                return method;
            }
        }
        throw new NoSuchMethodException("StateFlow emitter");
    }

    private static final class Alert {
        final String feature;
        final String id;
        final String title;
        final String description;
        final String icon;
        final int type;
        final int subType;
        final int timeoutSeconds;
        final String provider;
        final String titleWithDistance;
        final int latitudeE6;
        final int longitudeE6;
        final int distanceMeters;
        final int triggerDistanceMeters;
        final boolean positioned;
        final boolean showBanner;
        final boolean expires;
        boolean delivered;
        boolean voicePlayed;
        boolean voiceRetryScheduled;
        /** Vietnamese source text for the TTS (translated per voice by WazeTtsBridge); null = speak {@link #title}. */
        String spokenKey;

        Alert(String feature, String id, String title, String description, String icon,
              int type, int subType, int timeoutSeconds, String provider,
              String titleWithDistance, int latitudeE6, int longitudeE6,
              int distanceMeters, int triggerDistanceMeters, boolean showBanner,
              boolean expires) {
            this.feature = feature;
            this.id = id;
            this.title = title;
            this.description = description;
            this.icon = icon;
            this.type = type;
            this.subType = subType;
            this.timeoutSeconds = timeoutSeconds;
            this.provider = provider;
            this.titleWithDistance = titleWithDistance;
            this.latitudeE6 = latitudeE6;
            this.longitudeE6 = longitudeE6;
            this.distanceMeters = distanceMeters;
            this.triggerDistanceMeters = triggerDistanceMeters;
            this.positioned = latitudeE6 != 0 || longitudeE6 != 0;
            this.showBanner = showBanner;
            this.expires = expires;
        }
    }
}
