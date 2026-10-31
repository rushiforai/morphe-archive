package com.fyber.inneractive.sdk.bidder.adm;

import com.fyber.inneractive.sdk.protobuf.d1;
import com.fyber.inneractive.sdk.protobuf.e1;

/* loaded from: classes3.dex */
public enum s implements d1 {
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
    private static final e1 internalValueMap = new e1() { // from class: com.fyber.inneractive.sdk.bidder.adm.r
        @Override // com.fyber.inneractive.sdk.protobuf.e1
        public final d1 a(int i5) {
            if (i5 == 0) {
                return s.UNITDISPLAYTYPEUNKNOWN;
            }
            if (i5 == 1) {
                return s.BANNER;
            }
            if (i5 == 2) {
                return s.INTERSTITIAL;
            }
            if (i5 == 3) {
                return s.REWARDED;
            }
            if (i5 == 4) {
                return s.MRECT;
            }
            if (i5 != 5) {
                return null;
            }
            return s.TYPENATIVE;
        }
    };
    private final int value;

    s(int i5) {
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
