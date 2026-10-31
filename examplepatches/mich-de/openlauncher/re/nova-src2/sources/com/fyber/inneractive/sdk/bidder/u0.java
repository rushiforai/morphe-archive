package com.fyber.inneractive.sdk.bidder;

import com.fyber.inneractive.sdk.protobuf.d1;
import com.fyber.inneractive.sdk.protobuf.e1;

/* loaded from: classes3.dex */
public enum u0 implements d1 {
    NOCLICK(0),
    CTABUTTON(1),
    COMPANION(2),
    VIDEOVIEW(3),
    APPINFO(4),
    STOREPROMO(5),
    UNRECOGNIZED(-1);

    public static final int APPINFO_VALUE = 4;
    public static final int COMPANION_VALUE = 2;
    public static final int CTABUTTON_VALUE = 1;
    public static final int NOCLICK_VALUE = 0;
    public static final int STOREPROMO_VALUE = 5;
    public static final int VIDEOVIEW_VALUE = 3;
    private static final e1 internalValueMap = new e1() { // from class: com.fyber.inneractive.sdk.bidder.t0
        @Override // com.fyber.inneractive.sdk.protobuf.e1
        public final d1 a(int i5) {
            if (i5 == 0) {
                return u0.NOCLICK;
            }
            if (i5 == 1) {
                return u0.CTABUTTON;
            }
            if (i5 == 2) {
                return u0.COMPANION;
            }
            if (i5 == 3) {
                return u0.VIDEOVIEW;
            }
            if (i5 == 4) {
                return u0.APPINFO;
            }
            if (i5 != 5) {
                return null;
            }
            return u0.STOREPROMO;
        }
    };
    private final int value;

    u0(int i5) {
        this.value = i5;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.d1
    public final int a() {
        if (this != UNRECOGNIZED) {
            return this.value;
        }
        throw new IllegalArgumentException("Can't get the number of an unknown enum value.");
    }
}
