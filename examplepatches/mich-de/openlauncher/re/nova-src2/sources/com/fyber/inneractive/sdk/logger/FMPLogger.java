package com.fyber.inneractive.sdk.logger;

import android.content.Context;

/* loaded from: classes.dex */
public abstract class FMPLogger {
    public abstract void debug(String str, Object... objArr);

    public abstract void error(String str, Throwable th2, Object... objArr);

    public abstract void info(String str, Object... objArr);

    public abstract void initialize(Context context);

    public abstract void log(int i5, Exception exc, String str, Object... objArr);

    public abstract void verbose(String str, Throwable th2, Object... objArr);

    public abstract void verbose(String str, Object... objArr);

    public abstract void warning(String str, Object... objArr);
}
