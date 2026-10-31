package io.sentry.android.core;

import io.sentry.g3;

/* loaded from: classes4.dex */
public abstract /* synthetic */ class i {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ int[] f66898a;

    static {
        int[] iArr = new int[g3.values().length];
        f66898a = iArr;
        try {
            iArr[g3.INFO.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            f66898a[g3.WARNING.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            f66898a[g3.ERROR.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            f66898a[g3.FATAL.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            f66898a[g3.DEBUG.ordinal()] = 5;
        } catch (NoSuchFieldError unused5) {
        }
    }
}
