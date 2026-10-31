package io.sentry.android.core;

import android.os.Bundle;
import b.u4;
import io.sentry.ILogger;
import io.sentry.g3;
import java.util.Arrays;
import java.util.List;

/* loaded from: classes4.dex */
public abstract class n0 {
    public static boolean a(Bundle bundle, ILogger iLogger, String str, boolean z11) {
        boolean z12 = bundle.getBoolean(str, z11);
        iLogger.g(g3.DEBUG, str + " read: " + z12, new Object[0]);
        return z12;
    }

    public static Double b(Bundle bundle, ILogger iLogger, String str) {
        Double dValueOf = Double.valueOf(Float.valueOf(bundle.getFloat(str, bundle.getInt(str, -1))).doubleValue());
        iLogger.g(g3.DEBUG, str + " read: " + dValueOf, new Object[0]);
        return dValueOf;
    }

    public static List c(Bundle bundle, ILogger iLogger, String str) {
        String string = bundle.getString(str);
        iLogger.g(g3.DEBUG, u4.m(str, " read: ", string), new Object[0]);
        if (string != null) {
            return Arrays.asList(string.split(",", -1));
        }
        return null;
    }

    public static long d(Bundle bundle, ILogger iLogger, String str, long j11) {
        long j12 = bundle.getInt(str, (int) j11);
        iLogger.g(g3.DEBUG, str + " read: " + j12, new Object[0]);
        return j12;
    }

    public static String e(Bundle bundle, ILogger iLogger, String str, String str2) {
        String string = bundle.getString(str, str2);
        iLogger.g(g3.DEBUG, u4.m(str, " read: ", string), new Object[0]);
        return string;
    }

    public static String f(Bundle bundle, ILogger iLogger, String str, String str2) {
        String string = bundle.getString(str, str2);
        iLogger.g(g3.DEBUG, u4.m(str, " read: ", string), new Object[0]);
        return string;
    }
}
