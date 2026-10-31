package com.facebook.ads.redexgen.X;

import com.facebook.ads.VideoStartReason;

/* renamed from: com.facebook.ads.redexgen.X.qW, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public /* synthetic */ class C2420qW {
    public static final /* synthetic */ int[] A00 = new int[VideoStartReason.values().length];

    static {
        try {
            A00[VideoStartReason.AUTO_STARTED.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            A00[VideoStartReason.NOT_STARTED.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            A00[VideoStartReason.USER_STARTED.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
    }
}
