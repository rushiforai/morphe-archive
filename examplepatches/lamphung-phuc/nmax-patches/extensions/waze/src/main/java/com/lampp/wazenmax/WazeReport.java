package com.lampp.wazenmax;

import android.util.Log;
import java.lang.reflect.Method;

/**
 * Drops a Waze report where the rider is, as Waze's own report screen does: {@code NativeManager.sendAlertRequest(
 * imageDir, imageName, description, direction, type, subtype, timeIndex, useCase)} (Waze 5.27, com.waze.reports.dh's
 * send; it posts to Waze's native thread), after {@code RtAlertsNativeManager.setAndRetrieveReportLocation()}. Types are RtAlertItem.Type: 1 police, 2 accident, 3 traffic jam, 5 hazard.
 */
final class WazeReport {
    private static final String TAG = "WazeNmaxReport";
    private static final int MY_SIDE = 1; // 2 = the other side of the road
    private static final int NONE = -1; // no subtype, no closure time

    private WazeReport() {
    }

    /** False when Waze isn't up or the method moved (logged). */
    static boolean send(int type) {
        try {
            ClassLoader loader = WazeReport.class.getClassLoader();
            // Waze's report menu saves the rider's position when it opens; without it native answers "Can't find your
            // position on the map" (or reports at the place of the last menu). Both calls queue on Waze's native thread.
            Class<?> rt = Class.forName("com.waze.rtalerts.RtAlertsNativeManager", true, loader);
            rt.getMethod("setAndRetrieveReportLocation").invoke(rt.getMethod("getInstance").invoke(null));
            Class<?> nm = Class.forName("com.waze.NativeManager", true, loader);
            Object waze = nm.getMethod("getInstance").invoke(null);
            for (Method m : nm.getMethods()) {
                Class<?>[] p = m.getParameterTypes();
                // the last parameter is an obfuscated use-case enum (rtalerts): its first constant is DEFAULT
                if (m.getName().equals("sendAlertRequest") && p.length == 8 && p[7].isEnum()) {
                    m.invoke(waze, null, null, null, MY_SIDE, type, NONE, NONE, p[7].getEnumConstants()[0]);
                    Log.i(TAG, "reported type " + type);
                    return true;
                }
            }
            throw new NoSuchMethodException("NativeManager.sendAlertRequest");
        } catch (Throwable t) {
            Log.w(TAG, "report type " + type + " failed", t);
            return false;
        }
    }
}
