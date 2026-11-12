/*
 * SPDX-License-Identifier: GPL-3.0-only
 * Copyright (C) 2026 ShortEnigma0
 * Expert RAW extension for Morphe. See LICENSE and NOTICE in the repository root.
 */
package app.morphe.extension.expertraw;

import android.app.ActivityManager;
import android.content.ComponentName;
import android.content.ContentResolver;
import android.hardware.display.DisplayManager;
import android.hardware.display.SemWifiDisplayStatus;
import android.media.AudioManager;
import android.os.Bundle;
import android.os.PowerManager;
import android.provider.Settings;
import android.telephony.TelephonyCallback;
import android.telephony.TelephonyManager;
import android.util.Log;
import android.view.View;
import com.samsung.android.camera.mic.SemMultiMicManager;
import com.samsung.android.hardware.display.SemMdnieManager;
import com.samsung.android.os.SemDvfsManager;
import com.samsung.android.speech.SemSpeechRecognizer;
import com.samsung.android.tsp.SemTspStateManager;
import com.samsung.android.view.SemWindowManager;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.Executor;

/** Framework calls that need Samsung-signature permissions: SecurityException -> no-op / default. */
@SuppressWarnings({"unused", "deprecation"})
public final class SafeSys {
    private SafeSys() {}

    public static boolean isExternalStorageManager() {
        return true;
    }

    private static void denied(String what) {
        Log.w(PpBypass.TAG, "SafeSys denied: " + what);
    }

    public static void registerSystemKeyEvent(SemWindowManager m, int key, ComponentName c, int flags) {
        try { m.registerSystemKeyEvent(key, c, flags); } catch (SecurityException e) { denied("registerSystemKeyEvent"); }
    }

    public static void unregisterSystemKeyEvent(SemWindowManager m, int key, ComponentName c) {
        try { m.unregisterSystemKeyEvent(key, c); } catch (SecurityException e) { denied("unregisterSystemKeyEvent"); }
    }

    public static void setForcedDefaultDisplayDevice(SemWindowManager m, int d) {
        try { m.setForcedDefaultDisplayDevice(d); } catch (SecurityException e) { denied("setForcedDefaultDisplayDevice"); }
    }

    public static boolean setContentMode(SemMdnieManager m, int mode) {
        try { return m.setContentMode(mode); } catch (SecurityException e) { denied("setContentMode"); return false; }
    }

    public static void setDeadZone(View v, Bundle b) {
        try { SemTspStateManager.setDeadZone(v, b); } catch (SecurityException e) { denied("setDeadZone"); }
    }

    public static void acquire(SemDvfsManager m) {
        try { m.acquire(); } catch (SecurityException e) { denied("dvfs acquire"); }
    }

    public static void acquire(SemDvfsManager m, int t) {
        try { m.acquire(t); } catch (SecurityException e) { denied("dvfs acquire"); }
    }

    public static void setHint(SemDvfsManager m, int h) {
        try { m.setHint(h); } catch (SecurityException e) { denied("dvfs setHint"); }
    }

    public static void release(SemDvfsManager m) {
        try { m.release(); } catch (SecurityException e) { denied("dvfs release"); }
    }

    public static boolean putInt(ContentResolver cr, String name, int value) {
        try { return Settings.System.putInt(cr, name, value); } catch (SecurityException e) { denied("Settings.System.putInt " + name); return false; }
    }

    public static void setParameters(AudioManager am, String p) {
        try { am.setParameters(p); } catch (SecurityException e) { denied("AudioManager.setParameters"); }
    }

    public static boolean setMode(SemMultiMicManager m, int mode) {
        try { return m.setMode(mode); } catch (SecurityException e) { denied("SemMultiMicManager.setMode"); return false; }
    }

    public static List<ActivityManager.RunningTaskInfo> getRunningTasks(ActivityManager am, int max) {
        try { return am.getRunningTasks(max); } catch (SecurityException e) { denied("getRunningTasks"); return Collections.emptyList(); }
    }

    public static void registerTelephonyCallback(TelephonyManager tm, Executor ex, TelephonyCallback cb) {
        try { tm.registerTelephonyCallback(ex, cb); } catch (SecurityException e) { denied("registerTelephonyCallback"); }
    }

    /** Voice control needs privileged audio capture; its async AudioRecord failure would crash the app. */
    public static void startRecognition(SemSpeechRecognizer r, int mode) {
        Log.w(PpBypass.TAG, "voice control disabled (needs privileged audio capture)");
    }

    // --- Samsung methods on public SDK classes (not in android.jar): called reflectively. ---

    private static Object invoke(Object target, String name, Class<?>[] types, Object... args) {
        try {
            Method m = target.getClass().getMethod(name, types);
            return m.invoke(target, args);
        } catch (InvocationTargetException e) {
            Throwable c = e.getCause();
            if (c instanceof SecurityException) {
                denied(name);
                return null;
            }
            if (c instanceof RuntimeException) throw (RuntimeException) c;
            throw new RuntimeException(c);
        } catch (ReflectiveOperationException e) {
            throw new RuntimeException(e);
        }
    }

    public static void semSetAutoBrightnessLimit(PowerManager pm, float a, float b) {
        invoke(pm, "semSetAutoBrightnessLimit", new Class<?>[]{float.class, float.class}, a, b);
    }

    public static void semGoToSleep(PowerManager pm, long time) {
        invoke(pm, "semGoToSleep", new Class<?>[]{long.class}, time);
    }

    public static SemWifiDisplayStatus semGetWifiDisplayStatus(DisplayManager dm) {
        return (SemWifiDisplayStatus) invoke(dm, "semGetWifiDisplayStatus", new Class<?>[0]);
    }
}
