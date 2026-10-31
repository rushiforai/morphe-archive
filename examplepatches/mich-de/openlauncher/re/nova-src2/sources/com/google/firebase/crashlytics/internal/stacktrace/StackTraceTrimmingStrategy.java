package com.google.firebase.crashlytics.internal.stacktrace;

/* loaded from: classes.dex */
public interface StackTraceTrimmingStrategy {
    StackTraceElement[] getTrimmedStackTrace(StackTraceElement[] stackTraceElementArr);
}
