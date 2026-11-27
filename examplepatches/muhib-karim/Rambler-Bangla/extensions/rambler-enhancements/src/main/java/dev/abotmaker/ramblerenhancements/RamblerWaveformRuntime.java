package dev.abotmaker.ramblerenhancements;

import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.SystemClock;
import android.provider.Settings;
import android.util.Log;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.util.WeakHashMap;

/**
 * Runtime hook backing the Rambler Waveform Animation patch.
 * Reads obfuscated field names from {@link RamblerDynamicConfig} so the hook works across
 * obfuscated Gboard versions without hardcoded field names.
 */
public final class RamblerWaveformRuntime {
    private static final String TAG = "RamblerWaveform";
    private static final long SPEECH_STALE_MS = 260L;

    private static final Object LOCK = new Object();
    private static final WeakHashMap<Drawable, Session> SESSIONS =
            new WeakHashMap<Drawable, Session>();

    private static volatile Context applicationContext;
    private static volatile RamblerWaveformSettings.SettingsSnapshot snapshotOverrideForTesting;
    private static volatile ReflectionHandles cachedHandles;

    private RamblerWaveformRuntime() {
    }

    public static void seedApplicationContext(Context context) {
        if (context == null) {
            return;
        }
        Context app = context.getApplicationContext();
        applicationContext = app != null ? app : context;
        RamblerFlagRuntime.seedAndRefreshIfNeeded(context);
    }

    static void setSnapshotOverrideForTesting(
            RamblerWaveformSettings.SettingsSnapshot override) {
        snapshotOverrideForTesting = override;
    }

    static void clearForTesting() {
        snapshotOverrideForTesting = null;
        cachedHandles = null;
        synchronized (LOCK) {
            SESSIONS.clear();
        }
    }

    public static void onAttach(View view, Drawable drawable) {
        try {
            if (view != null) {
                seedApplicationContext(view.getContext());
            }
            if (drawable == null) {
                return;
            }
            synchronized (LOCK) {
                Session session = SESSIONS.get(drawable);
                if (session == null) {
                    session = new Session();
                    SESSIONS.put(drawable, session);
                }
                if (view != null) {
                    session.hostView = new WeakReference<View>(view);
                }
            }
        } catch (Throwable throwable) {
            logWarningSafely("Failed in Rambler waveform onAttach", throwable);
        }
    }

    public static void onSpeechLevel(int level, Drawable drawable, View view) {
        try {
            if (view != null) {
                seedApplicationContext(view.getContext());
            }
            if (drawable == null) {
                return;
            }
            long nowMs = SystemClock.uptimeMillis();
            synchronized (LOCK) {
                Session session = SESSIONS.get(drawable);
                if (session == null) {
                    session = new Session();
                    SESSIONS.put(drawable, session);
                }
                if (view != null) {
                    session.hostView = new WeakReference<View>(view);
                }
                session.speechLevel = Math.max(0, Math.min(100, level));
                session.lastSpeechMs = nowMs;
            }
        } catch (Throwable throwable) {
            logWarningSafely("Failed in Rambler waveform onSpeechLevel", throwable);
        }
    }

    public static boolean maybeDraw(Drawable drawable, Canvas canvas) {
        try {
            if (drawable == null || canvas == null) {
                return false;
            }
            Session session;
            View hostView;
            int speechLevel;
            long lastSpeechMs;
            synchronized (LOCK) {
                session = SESSIONS.get(drawable);
                if (session == null) {
                    session = new Session();
                    SESSIONS.put(drawable, session);
                }
                hostView = session.hostView == null ? null : session.hostView.get();
                speechLevel = session.speechLevel;
                lastSpeechMs = session.lastSpeechMs;
            }

            Context context = hostView != null ? hostView.getContext() : applicationContext;
            if (context != null) {
                seedApplicationContext(context);
            }
            RamblerWaveformSettings.SettingsSnapshot settings = resolveSettings(context);
            if (settings == null || settings.isStock()) {
                return false;
            }

            Rect bounds = drawable.getBounds();
            if (bounds == null || bounds.width() <= 4 || bounds.height() <= 4) {
                return false;
            }

            float density = context != null
                    ? context.getResources().getDisplayMetrics().density
                    : 3.0f;
            boolean isDark = context == null || isDarkMode(context);
            boolean reduceMotion = context != null && isReduceMotion(context);
            int themeAccent = resolveThemeAccent(context);

            DrawableState state = readDrawableState(drawable);

            long nowNanos = SystemClock.elapsedRealtimeNanos();
            float dt;
            if (session.lastDrawNanos == 0L) {
                dt = 1.0f / 60.0f;
            } else {
                dt = (nowNanos - session.lastDrawNanos) * 1e-9f;
                if (dt < 0.0f || dt > 0.06f) {
                    dt = 1.0f / 60.0f;
                }
            }
            session.lastDrawNanos = nowNanos;

            long nowMs = SystemClock.uptimeMillis();
            int effectiveLevel = (lastSpeechMs > 0L && (nowMs - lastSpeechMs) <= SPEECH_STALE_MS)
                    ? speechLevel
                    : 0;
            float loudnessDb = HexDotScopeSimulation.loudnessFromSpeechLevel(effectiveLevel);

            HexDotScopeSimulation.Stage stage;
            if (state.collapsing) {
                stage = HexDotScopeSimulation.Stage.DONE;
            } else if (state.processing) {
                stage = HexDotScopeSimulation.Stage.PROCESSING;
            } else {
                stage = HexDotScopeSimulation.Stage.RECORDING;
            }

            float widthDp = bounds.width() / Math.max(1.0f, density);
            computeEdgeInsetsDp(hostView, widthDp, density, session.edgeInsets);
            float windowFadeDp = widthDp >= 220.0f ? 28.0f : 16.0f;

            if (settings.isAndroidWaveListening()
                    && stage == HexDotScopeSimulation.Stage.RECORDING) {
                session.androidWaveSimulation.advance(
                        dt, effectiveLevel / 100.0f, settings.getVoiceResponse(), reduceMotion);
                session.simulation.configureForBounds(
                        bounds.width(), bounds.height(), density, settings.getDotSpacingDp());
                session.simulation.setProcessingMode(settings.getProcessingMode());
                session.simulation.setVoiceResponse(settings.getVoiceResponse());
                session.simulation.primeVisibleForHandoff();

                session.androidWaveRenderer.draw(
                        canvas,
                        bounds,
                        density,
                        state.cornerRadiusPx,
                        session.edgeInsets[0],
                        session.edgeInsets[1],
                        windowFadeDp,
                        isDark,
                        themeAccent,
                        settings,
                        session.androidWaveSimulation,
                        state.externalOpacity);
                return true;
            }

            session.simulation.configureForBounds(
                    bounds.width(), bounds.height(), density, settings.getDotSpacingDp());
            session.simulation.setProcessingMode(settings.getProcessingMode());
            session.simulation.setVoiceResponse(settings.getVoiceResponse());
            session.simulation.advance(dt, stage, true, loudnessDb, reduceMotion);

            session.renderer.draw(
                    canvas,
                    bounds,
                    density,
                    state.cornerRadiusPx,
                    session.edgeInsets[0],
                    session.edgeInsets[1],
                    windowFadeDp,
                    isDark,
                    themeAccent,
                    settings,
                    session.simulation,
                    state.externalOpacity);
            return true;
        } catch (Throwable throwable) {
            logWarningSafely("Failed in Rambler waveform maybeDraw", throwable);
            return false;
        }
    }

    private static RamblerWaveformSettings.SettingsSnapshot resolveSettings(Context context) {
        RamblerWaveformSettings.SettingsSnapshot override = snapshotOverrideForTesting;
        if (override != null) {
            return override;
        }
        return RamblerWaveformSettings.snapshot(context);
    }

    private static void computeEdgeInsetsDp(
            View hostView, float widthDp, float density, float[] outInsets) {
        float defaultLead = widthDp >= 220.0f ? 44.0f : 12.0f;
        float defaultTrail = widthDp >= 220.0f ? 44.0f : 12.0f;
        if (!(hostView instanceof ViewGroup group) || widthDp < 180.0f) {
            outInsets[0] = defaultLead;
            outInsets[1] = defaultTrail;
            return;
        }
        int hostWidth = group.getWidth();
        if (hostWidth <= 0) {
            outInsets[0] = defaultLead;
            outInsets[1] = defaultTrail;
            return;
        }
        float maxEdgePx = hostWidth * 0.25f;
        float measuredLeadPx = 0.0f;
        float measuredTrailPx = 0.0f;
        int count = group.getChildCount();
        for (int i = 0; i < count; i++) {
            View child = group.getChildAt(i);
            if (child == null || child.getVisibility() != View.VISIBLE) {
                continue;
            }
            float childAlpha = child.getAlpha();
            if (childAlpha <= 0.05f) {
                continue;
            }
            int cw = child.getWidth();
            if (cw <= 0 || cw > maxEdgePx) {
                continue;
            }
            int left = child.getLeft();
            int right = child.getRight();
            if (left <= maxEdgePx * 0.5f) {
                measuredLeadPx = Math.max(measuredLeadPx, right * childAlpha);
            }
            if (hostWidth - right <= maxEdgePx * 0.5f) {
                measuredTrailPx = Math.max(measuredTrailPx, (hostWidth - left) * childAlpha);
            }
        }
        float invDensity = 1.0f / Math.max(1.0f, density);
        outInsets[0] = measuredLeadPx > 0.0f
                ? Math.min(measuredLeadPx * invDensity, widthDp * 0.22f)
                : defaultLead;
        outInsets[1] = measuredTrailPx > 0.0f
                ? Math.min(measuredTrailPx * invDensity, widthDp * 0.22f)
                : (widthDp >= 220.0f ? 16.0f : defaultTrail);
    }

    private static DrawableState readDrawableState(Drawable drawable) {
        DrawableState state = new DrawableState();
        ReflectionHandles handles = resolveHandles(drawable.getClass());
        if (handles == null) {
            return state;
        }
        try {
            if (handles.cornerRadiusField != null) {
                state.cornerRadiusPx = Math.max(0.0f, handles.cornerRadiusField.getFloat(drawable));
            }
            if (handles.stateHolderField != null) {
                Object shader = handles.stateHolderField.get(drawable);
                if (shader != null) {
                    handles.ensureShaderFields(shader.getClass());
                    if (handles.shaderProcessingField != null) {
                        state.processing = handles.shaderProcessingField.getBoolean(shader);
                    }
                    if (handles.shaderCollapsingField != null) {
                        state.collapsing = handles.shaderCollapsingField.getBoolean(shader);
                    }
                    if (handles.shaderExitFadeField != null
                            && handles.shaderExitFadeField.getBoolean(shader)) {
                        if (handles.shaderGlobalAlphaField != null) {
                            state.externalOpacity = HexDotScopeSimulation.clamp(
                                    handles.shaderGlobalAlphaField.getFloat(shader), 0.0f, 1.0f);
                        }
                    }
                }
            }
        } catch (Throwable ignored) {
            // Fall back to default recording state if reflection fails.
        }
        return state;
    }

    private static ReflectionHandles resolveHandles(Class<?> drawableClass) {
        ReflectionHandles current = cachedHandles;
        if (current != null && current.drawableClass == drawableClass) {
            return current;
        }
        ReflectionHandles next = ReflectionHandles.forDrawableClass(drawableClass);
        cachedHandles = next;
        return next;
    }

    private static boolean isDarkMode(Context context) {
        try {
            return (context.getResources().getConfiguration().uiMode
                    & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
        } catch (Throwable ignored) {
            return true;
        }
    }

    private static boolean isReduceMotion(Context context) {
        try {
            float scale = Settings.Global.getFloat(
                    context.getContentResolver(),
                    Settings.Global.ANIMATOR_DURATION_SCALE,
                    1.0f);
            return scale <= 0.01f;
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static int resolveThemeAccent(Context context) {
        if (context == null) {
            return Color.parseColor("#4285F4");
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            try {
                return context.getColor(android.R.color.system_accent1_500);
            } catch (Throwable ignored) {
                // Fall back to theme attribute lookup.
            }
        }
        try {
            TypedValue out = new TypedValue();
            if (context.getTheme() != null
                    && context.getTheme().resolveAttribute(android.R.attr.colorAccent, out, true)) {
                return out.data;
            }
        } catch (Throwable ignored) {
            // Fall back to default accent.
        }
        return Color.parseColor("#4285F4");
    }

    private static void logWarningSafely(String message, Throwable throwable) {
        try {
            Log.w(TAG, message, throwable);
        } catch (Throwable ignored) {
            // Hooks must never throw into Gboard.
        }
    }

    private static final class Session {
        final HexDotScopeSimulation simulation = new HexDotScopeSimulation();
        final HexDotScopeRenderer renderer = new HexDotScopeRenderer();
        final HexAndroidWaveSimulation androidWaveSimulation = new HexAndroidWaveSimulation();
        final HexAndroidWaveRenderer androidWaveRenderer = new HexAndroidWaveRenderer();
        final float[] edgeInsets = new float[2];
        WeakReference<View> hostView;
        int speechLevel;
        long lastSpeechMs;
        long lastDrawNanos;
    }

    private static final class DrawableState {
        float cornerRadiusPx = 0.0f;
        boolean processing = false;
        boolean collapsing = false;
        float externalOpacity = 1.0f;
    }

    private static final class ReflectionHandles {
        final Class<?> drawableClass;
        final Field stateHolderField;
        final Field cornerRadiusField;
        volatile Class<?> shaderClass;
        volatile Field shaderProcessingField;
        volatile Field shaderCollapsingField;
        volatile Field shaderExitFadeField;
        volatile Field shaderGlobalAlphaField;

        private ReflectionHandles(
                Class<?> drawableClass, Field stateHolderField, Field cornerRadiusField) {
            this.drawableClass = drawableClass;
            this.stateHolderField = stateHolderField;
            this.cornerRadiusField = cornerRadiusField;
        }

        static ReflectionHandles forDrawableClass(Class<?> cls) {
            Field shaderField = findField(cls, RamblerDynamicConfig.DRAWABLE_SHADER_FIELD, null);
            Field radiusField = findField(
                    cls, RamblerDynamicConfig.DRAWABLE_CORNER_RADIUS_FIELD, float.class);
            if (shaderField == null && radiusField == null) {
                return null;
            }
            return new ReflectionHandles(cls, shaderField, radiusField);
        }

        void ensureShaderFields(Class<?> cls) {
            if (shaderClass == cls) {
                return;
            }
            shaderProcessingField = findField(
                    cls, RamblerDynamicConfig.SHADER_PROCESSING_FIELD, boolean.class);
            shaderCollapsingField = findField(
                    cls, RamblerDynamicConfig.SHADER_COLLAPSING_FIELD, boolean.class);
            shaderExitFadeField = findField(
                    cls, RamblerDynamicConfig.SHADER_EXIT_FADE_FIELD, boolean.class);
            shaderGlobalAlphaField = findField(
                    cls, RamblerDynamicConfig.SHADER_GLOBAL_ALPHA_FIELD, float.class);
            shaderClass = cls;
        }

        private static Field findField(Class<?> cls, String name, Class<?> expectedType) {
            if (name == null || name.isEmpty()) {
                return null;
            }
            try {
                Field f = cls.getDeclaredField(name);
                if (expectedType != null && f.getType() != expectedType) {
                    return null;
                }
                f.setAccessible(true);
                return f;
            } catch (Throwable ignored) {
                return null;
            }
        }
    }
}
