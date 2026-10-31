package com.google.firebase.crashlytics.internal.common;

/* loaded from: classes3.dex */
public class ResponseParser {
    public static final int ResponseActionDiscard = 0;
    public static final int ResponseActionRetry = 1;

    public static int parse(int i5) {
        if (i5 < 200 || i5 > 299) {
            return ((i5 < 300 || i5 > 399) && i5 >= 400 && i5 <= 499) ? 0 : 1;
        }
        return 0;
    }
}
