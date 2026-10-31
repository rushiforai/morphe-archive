package com.apm.insight;

/* loaded from: classes2.dex */
public interface ICrashFilter {
    boolean onJavaCrashFilter(Throwable th2, Thread thread);

    boolean onNativeCrashFilter(String str, String str2);
}
