package com.fyber.inneractive.sdk.flow;

import com.fyber.inneractive.sdk.external.InneractiveErrorCode;

/* loaded from: classes3.dex */
public abstract /* synthetic */ class f0 {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ int[] f28145a;

    static {
        int[] iArr = new int[InneractiveErrorCode.values().length];
        f28145a = iArr;
        try {
            iArr[InneractiveErrorCode.CONNECTION_ERROR.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            f28145a[InneractiveErrorCode.NO_FILL.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            f28145a[InneractiveErrorCode.NATIVE_AD_FAILED_TO_LOAD.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
    }
}
