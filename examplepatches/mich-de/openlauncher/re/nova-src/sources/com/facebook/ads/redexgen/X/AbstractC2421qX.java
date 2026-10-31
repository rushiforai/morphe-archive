package com.facebook.ads.redexgen.X;

import com.facebook.ads.VideoStartReason;

/* renamed from: com.facebook.ads.redexgen.X.qX, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC2421qX {
    public static EnumC1664e4 A00(VideoStartReason videoStartReason) {
        switch (videoStartReason) {
            case AUTO_STARTED:
                return EnumC1664e4.A03;
            case NOT_STARTED:
                return EnumC1664e4.A04;
            case USER_STARTED:
                return EnumC1664e4.A05;
            default:
                return EnumC1664e4.A04;
        }
    }
}
