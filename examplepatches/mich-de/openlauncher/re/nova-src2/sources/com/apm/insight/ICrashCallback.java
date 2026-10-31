package com.apm.insight;

/* loaded from: classes2.dex */
public interface ICrashCallback {
    void onCrash(CrashType crashType, String str, Thread thread);
}
