package com.google.firebase.crashlytics.internal.stacktrace;

import java.util.Stack;

/* loaded from: classes3.dex */
public class TrimmedThrowableData {
    public final TrimmedThrowableData cause;
    public final String className;
    public final String localizedMessage;
    public final StackTraceElement[] stacktrace;

    private TrimmedThrowableData(String str, String str2, StackTraceElement[] stackTraceElementArr, TrimmedThrowableData trimmedThrowableData) {
        this.localizedMessage = str;
        this.className = str2;
        this.stacktrace = stackTraceElementArr;
        this.cause = trimmedThrowableData;
    }

    public static TrimmedThrowableData makeTrimmedThrowableData(Throwable th2, StackTraceTrimmingStrategy stackTraceTrimmingStrategy) {
        Stack stack = new Stack();
        while (th2 != null) {
            stack.push(th2);
            th2 = th2.getCause();
        }
        TrimmedThrowableData trimmedThrowableData = null;
        while (!stack.isEmpty()) {
            Throwable th3 = (Throwable) stack.pop();
            trimmedThrowableData = new TrimmedThrowableData(th3.getLocalizedMessage(), th3.getClass().getName(), stackTraceTrimmingStrategy.getTrimmedStackTrace(th3.getStackTrace()), trimmedThrowableData);
        }
        return trimmedThrowableData;
    }
}
