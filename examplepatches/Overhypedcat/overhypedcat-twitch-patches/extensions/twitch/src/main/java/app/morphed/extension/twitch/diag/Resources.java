package app.morphed.extension.twitch.diag;

import android.app.ActivityManager;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build;
import android.os.Debug;
import android.os.PowerManager;
import android.os.Process;
import android.os.SystemClock;
import android.view.Display;
import android.view.WindowManager;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.Locale;

/**
 * The phone's resources for the detailed log: what the app uses (CPU, memory) and what the phone has left (memory,
 * heat, CPU speed). An app can't read the GPU's load: the video's dropped frames and the screen's stalls stand in
 * for it (see VideoWatch, MainWatch), with the phone's heat, which slows CPU and GPU alike.
 */
public final class Resources {
    private static long lastCpuMs = -1, lastWallMs = -1;

    private Resources() {
    }

    /** Once, at the log's start: what the phone is. */
    public static String device(Context context) {
        StringBuilder out = new StringBuilder("Device: ");
        int cores = Runtime.getRuntime().availableProcessors();
        out.append(cores).append(" cores");
        String maxSpeeds = cpuSpeeds("cpuinfo_max_freq");
        if (maxSpeeds != null) out.append(" (max ").append(maxSpeeds).append(')');
        ActivityManager.MemoryInfo memory = memory(context);
        if (memory != null) out.append(", RAM ").append(memory.totalMem / (1024 * 1024)).append(" MB");
        if (Build.VERSION.SDK_INT >= 31) out.append(", SoC ").append(Build.SOC_MANUFACTURER).append(' ').append(Build.SOC_MODEL);
        try {
            WindowManager windows = (WindowManager) context.getSystemService(Context.WINDOW_SERVICE);
            Display display = windows.getDefaultDisplay();
            out.append(String.format(Locale.US, ", screen %.0f Hz", display.getRefreshRate()));
        } catch (Throwable ignored) {
            // (not said: no screen to ask)
        }
        return out.toString();
    }

    /** Every status line: what the app uses now and what the phone has left. */
    public static String now(Context context) {
        StringBuilder out = new StringBuilder();
        long cpuMs = Process.getElapsedCpuTime(), wallMs = SystemClock.elapsedRealtime();
        int cores = Runtime.getRuntime().availableProcessors();
        if (lastCpuMs >= 0) {
            out.append(String.format(Locale.US, "app CPU %.0f%%", cpuPercent(cpuMs - lastCpuMs, wallMs - lastWallMs, cores)));
        } else {
            out.append("app CPU -");
        }
        lastCpuMs = cpuMs;
        lastWallMs = wallMs;
        String speeds = cpuSpeeds("scaling_cur_freq");
        if (speeds != null) out.append(", CPU speeds ").append(speeds);

        Runtime runtime = Runtime.getRuntime();
        long heapMb = (runtime.totalMemory() - runtime.freeMemory()) / (1024 * 1024);
        out.append(", java heap ").append(heapMb).append('/').append(runtime.maxMemory() / (1024 * 1024)).append(" MB");
        out.append(", native heap ").append(Debug.getNativeHeapAllocatedSize() / (1024 * 1024)).append(" MB");
        ActivityManager.MemoryInfo memory = memory(context);
        if (memory != null) {
            out.append(", phone RAM free ").append(memory.availMem / (1024 * 1024)).append('/')
                    .append(memory.totalMem / (1024 * 1024)).append(" MB");
            if (memory.lowMemory) out.append(" (LOW)");
        }
        if (Build.VERSION.SDK_INT >= 29) {
            try {
                PowerManager power = (PowerManager) context.getSystemService(Context.POWER_SERVICE);
                out.append(", heat ").append(thermal(power.getCurrentThermalStatus()));
                if (Build.VERSION.SDK_INT >= 30) {
                    float headroom = power.getThermalHeadroom(10);
                    if (!Float.isNaN(headroom) && headroom > 0) {
                        out.append(String.format(Locale.US, " (%.0f%% of throttling)", headroom * 100));
                    }
                }
            } catch (Throwable ignored) {
                // (not said: the phone doesn't tell)
            }
        }
        try {
            Intent battery = context.registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
            if (battery != null) {
                int tenths = battery.getIntExtra(BatteryManager.EXTRA_TEMPERATURE, Integer.MIN_VALUE);
                int level = battery.getIntExtra(BatteryManager.EXTRA_LEVEL, -1);
                int status = battery.getIntExtra(BatteryManager.EXTRA_STATUS, -1);
                if (tenths != Integer.MIN_VALUE) out.append(String.format(Locale.US, ", battery %.1f°C", tenths / 10.0));
                if (level >= 0) out.append(' ').append(level).append('%');
                if (status == BatteryManager.BATTERY_STATUS_CHARGING) out.append(" charging");
            }
        } catch (Throwable ignored) {
            // (not said: no battery to ask)
        }
        if (Build.VERSION.SDK_INT >= 28) {
            try {
                PowerManager power = (PowerManager) context.getSystemService(Context.POWER_SERVICE);
                if (power.isPowerSaveMode()) out.append(", battery saver ON");
            } catch (Throwable ignored) {
                // (not said)
            }
        }
        return out.toString();
    }

    /** The app's share of the whole phone's CPU, in percent: its CPU time over the time passed on all cores. */
    static double cpuPercent(long cpuMs, long wallMs, int cores) {
        if (wallMs <= 0 || cores <= 0) return 0;
        return Math.max(0, Math.min(100, 100.0 * cpuMs / (wallMs * (double) cores)));
    }

    static String thermal(int status) {
        switch (status) {
            case 0: return "none";
            case 1: return "light";
            case 2: return "moderate";
            case 3: return "SEVERE (slowed down)";
            case 4: return "CRITICAL (slowed down)";
            case 5: return "EMERGENCY";
            case 6: return "SHUTDOWN";
            default: return "unknown " + status;
        }
    }

    private static ActivityManager.MemoryInfo memory(Context context) {
        try {
            ActivityManager manager = (ActivityManager) context.getSystemService(Context.ACTIVITY_SERVICE);
            ActivityManager.MemoryInfo info = new ActivityManager.MemoryInfo();
            manager.getMemoryInfo(info);
            return info;
        } catch (Throwable t) {
            return null;
        }
    }

    /** Each core's speed in GHz ("2.4 2.4 1.8 ..."), from the files the phone lets apps read, or null. */
    private static String cpuSpeeds(String file) {
        StringBuilder out = new StringBuilder();
        int cores = Runtime.getRuntime().availableProcessors();
        for (int i = 0; i < cores; i++) {
            File speed = new File("/sys/devices/system/cpu/cpu" + i + "/cpufreq/" + file);
            try (BufferedReader reader = new BufferedReader(new FileReader(speed))) {
                String line = reader.readLine();
                // (under 100 MHz is no real speed: some phones and emulators put 0 or a token value there)
                if (line == null || Long.parseLong(line.trim()) < 100_000) continue;
                if (out.length() > 0) out.append(' ');
                out.append(String.format(Locale.US, "%.1f", Long.parseLong(line.trim()) / 1_000_000.0));
            } catch (Throwable unreadable) {
                // (a core that's off, or a phone that doesn't let apps read it)
            }
        }
        return out.length() == 0 ? null : out + " GHz";
    }
}
