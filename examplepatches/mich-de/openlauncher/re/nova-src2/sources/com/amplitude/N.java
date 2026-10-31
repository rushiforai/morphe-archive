package com.amplitude;

import com.amplitude.android.sessionreplay.config.MaskLevel;

/* loaded from: classes2.dex */
public abstract /* synthetic */ class N {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ int[] f20332a;

    static {
        int[] iArr = new int[MaskLevel.values().length];
        try {
            iArr[MaskLevel.LIGHT.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[MaskLevel.MEDIUM.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[MaskLevel.CONSERVATIVE.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        f20332a = iArr;
    }
}
