package com.fyber.inneractive.sdk.bidder;

import com.fyber.inneractive.sdk.protobuf.d1;
import com.fyber.inneractive.sdk.protobuf.e1;

/* loaded from: classes3.dex */
public enum q0 implements d1 {
    UNKNOWN(0),
    MALE(1),
    FEMALE(2),
    OTHER(3),
    UNRECOGNIZED(-1);

    public static final int FEMALE_VALUE = 2;
    public static final int MALE_VALUE = 1;
    public static final int OTHER_VALUE = 3;
    public static final int UNKNOWN_VALUE = 0;
    private static final e1 internalValueMap = new e1() { // from class: com.fyber.inneractive.sdk.bidder.p0
        @Override // com.fyber.inneractive.sdk.protobuf.e1
        public final d1 a(int i5) {
            if (i5 == 0) {
                return q0.UNKNOWN;
            }
            if (i5 == 1) {
                return q0.MALE;
            }
            if (i5 == 2) {
                return q0.FEMALE;
            }
            if (i5 != 3) {
                return null;
            }
            return q0.OTHER;
        }
    };
    private final int value;

    q0(int i5) {
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
