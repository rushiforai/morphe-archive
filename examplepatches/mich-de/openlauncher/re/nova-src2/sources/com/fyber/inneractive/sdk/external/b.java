package com.fyber.inneractive.sdk.external;

import android.content.SharedPreferences;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.lang.Thread;

/* loaded from: classes.dex */
public final class b implements Thread.UncaughtExceptionHandler {

    /* renamed from: a, reason: collision with root package name */
    public SharedPreferences f28013a;

    /* renamed from: b, reason: collision with root package name */
    public final Thread.UncaughtExceptionHandler f28014b = Thread.getDefaultUncaughtExceptionHandler();

    @Override // java.lang.Thread.UncaughtExceptionHandler
    public final void uncaughtException(Thread thread, Throwable th2) {
        SharedPreferences sharedPreferences = this.f28013a;
        if (sharedPreferences != null) {
            StringWriter stringWriter = new StringWriter();
            th2.printStackTrace(new PrintWriter(stringWriter));
            String string = stringWriter.getBuffer().toString();
            if (string.contains("com.fyber.inneractive")) {
                sharedPreferences.edit().putString("FyberExceptionKey", string).putString("FyberVersionKey", InneractiveAdManager.getVersion()).putString("FyberNameKey", th2.getClass().getName()).putString("FyberDescriptionKey", th2.getLocalizedMessage()).commit();
            }
        }
        Thread.UncaughtExceptionHandler uncaughtExceptionHandler = this.f28014b;
        if (uncaughtExceptionHandler != null) {
            try {
                uncaughtExceptionHandler.uncaughtException(thread, th2);
            } catch (Throwable unused) {
            }
        }
    }
}
