package org.chromium.net;

import android.net.TrafficStats;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/* loaded from: classes5.dex */
public class ThreadStatsUid {
    private static final Method sClearThreadStatsUid;
    private static final Method sSetThreadStatsUid;

    static {
        try {
            sSetThreadStatsUid = TrafficStats.class.getMethod("setThreadStatsUid", Integer.TYPE);
            sClearThreadStatsUid = TrafficStats.class.getMethod("clearThreadStatsUid", null);
        } catch (NoSuchMethodException | SecurityException e3) {
            throw new RuntimeException("Unable to get TrafficStats methods", e3);
        }
    }

    public static void clear() throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        try {
            sClearThreadStatsUid.invoke(null, null);
        } catch (IllegalAccessException e3) {
            throw new RuntimeException("TrafficStats.clearThreadStatsUid failed", e3);
        } catch (InvocationTargetException e11) {
            throw new RuntimeException("TrafficStats.clearThreadStatsUid failed", e11);
        }
    }

    public static void set(int i5) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        try {
            sSetThreadStatsUid.invoke(null, Integer.valueOf(i5));
        } catch (IllegalAccessException e3) {
            throw new RuntimeException("TrafficStats.setThreadStatsUid failed", e3);
        } catch (InvocationTargetException e11) {
            throw new RuntimeException("TrafficStats.setThreadStatsUid failed", e11);
        }
    }
}
