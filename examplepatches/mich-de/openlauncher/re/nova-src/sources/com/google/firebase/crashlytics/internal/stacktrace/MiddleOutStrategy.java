package com.google.firebase.crashlytics.internal.stacktrace;

/* loaded from: classes.dex */
public class MiddleOutStrategy implements StackTraceTrimmingStrategy {
    private final int trimmedSize;

    public MiddleOutStrategy(int i5) {
        this.trimmedSize = i5;
    }

    @Override // com.google.firebase.crashlytics.internal.stacktrace.StackTraceTrimmingStrategy
    public StackTraceElement[] getTrimmedStackTrace(StackTraceElement[] stackTraceElementArr) {
        int length = stackTraceElementArr.length;
        int i5 = this.trimmedSize;
        if (length <= i5) {
            return stackTraceElementArr;
        }
        int i11 = i5 / 2;
        int i12 = i5 - i11;
        StackTraceElement[] stackTraceElementArr2 = new StackTraceElement[i5];
        System.arraycopy(stackTraceElementArr, 0, stackTraceElementArr2, 0, i12);
        System.arraycopy(stackTraceElementArr, stackTraceElementArr.length - i11, stackTraceElementArr2, i12, i11);
        return stackTraceElementArr2;
    }
}
