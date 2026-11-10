/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.extension;

/**
 * Analytics blocking for MetricQueue.queueMetric: the collected metric is discarded before it
 * leaves the app.
 */
@SuppressWarnings("unused")
public final class TrackingPatch {
    /** Metrics arrive in bursts, so only every Nth blocked one is worth a log line. */
    private static final int LOG_ONE_IN = 50;

    private static int blockedCount;

    public static boolean blockTracking() {
        if (!Settings.blockTracking()) return false;
        blockedCount++;
        // 1st, 51st, 101st ... blocked metric: enough to see the hook working without flooding.
        if (blockedCount % LOG_ONE_IN == 1) Settings.debugLog("tracking events blocked: " + blockedCount);
        return true;
    }
}
