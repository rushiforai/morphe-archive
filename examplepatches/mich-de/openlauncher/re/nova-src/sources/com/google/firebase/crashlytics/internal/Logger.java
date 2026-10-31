package com.google.firebase.crashlytics.internal;

import android.util.Log;

/* loaded from: classes.dex */
public class Logger {
    private int logLevel = 4;
    private final String tag;
    public static final String TAG = "FirebaseCrashlytics";
    static final Logger DEFAULT_LOGGER = new Logger(TAG);

    public Logger(String str) {
        this.tag = str;
    }

    private boolean canLog(int i5) {
        return this.logLevel <= i5 || Log.isLoggable(this.tag, i5);
    }

    public static Logger getLogger() {
        return DEFAULT_LOGGER;
    }

    public void d(String str, Throwable th2) {
        canLog(3);
    }

    public void e(String str, Throwable th2) {
        if (canLog(6)) {
            Log.e(this.tag, str, th2);
        }
    }

    public void i(String str, Throwable th2) {
        if (canLog(4)) {
            Log.i(this.tag, str, th2);
        }
    }

    public void log(int i5, String str) {
        log(i5, str, false);
    }

    public void v(String str, Throwable th2) {
        canLog(2);
    }

    public void w(String str, Throwable th2) {
        if (canLog(5)) {
            Log.w(this.tag, str, th2);
        }
    }

    public void d(String str) {
        d(str, null);
    }

    public void log(int i5, String str, boolean z11) {
        if (z11 || canLog(i5)) {
            Log.println(i5, this.tag, str);
        }
    }

    public void v(String str) {
        v(str, null);
    }

    public void e(String str) {
        e(str, null);
    }

    public void i(String str) {
        i(str, null);
    }

    public void w(String str) {
        w(str, null);
    }
}
