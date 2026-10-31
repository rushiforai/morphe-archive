package com.fyber.inneractive.sdk.bidder;

import com.fyber.inneractive.sdk.protobuf.d1;
import com.fyber.inneractive.sdk.protobuf.e1;

/* loaded from: classes.dex */
public enum o0 implements d1 {
    UNITDISPLAYTYPEUNKNOWN(0),
    BANNER(1),
    INTERSTITIAL(2),
    REWARDED(3),
    MRECT(4),
    TYPENATIVE(5),
    UNRECOGNIZED(-1);

    public static final int BANNER_VALUE = 1;
    public static final int INTERSTITIAL_VALUE = 2;
    public static final int MRECT_VALUE = 4;
    public static final int REWARDED_VALUE = 3;
    public static final int TYPENATIVE_VALUE = 5;
    public static final int UNITDISPLAYTYPEUNKNOWN_VALUE = 0;
    private static final e1 internalValueMap = new e1() { // from class: com.fyber.inneractive.sdk.bidder.n0
        @Override // com.fyber.inneractive.sdk.protobuf.e1
        public final d1 a(int i5) {
            return o0.a(i5);
        }
    };
    private final int value;

    o0(int i5) {
        this.value = i5;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.d1
    public final int a() {
        if (this != UNRECOGNIZED) {
            return this.value;
        }
        throw new IllegalArgumentException("Can't get the number of an unknown enum value.");
    }

    public static o0 a(int i5) {
        if (i5 == 0) {
            return UNITDISPLAYTYPEUNKNOWN;
        }
        if (i5 == 1) {
            return BANNER;
        }
        if (i5 == 2) {
            return INTERSTITIAL;
        }
        if (i5 == 3) {
            return REWARDED;
        }
        if (i5 == 4) {
            return MRECT;
        }
        if (i5 != 5) {
            return null;
        }
        return TYPENATIVE;
    }
}
