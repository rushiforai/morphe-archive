package com.fyber.inneractive.sdk.bidder.adm;

import com.fyber.inneractive.sdk.protobuf.d1;
import com.fyber.inneractive.sdk.protobuf.e1;

/* loaded from: classes3.dex */
public enum n implements d1 {
    NONE(0),
    SINGLETAP(1),
    TRUESINGLETAP(2),
    UNRECOGNIZED(-1);

    public static final int NONE_VALUE = 0;
    public static final int SINGLETAP_VALUE = 1;
    public static final int TRUESINGLETAP_VALUE = 2;
    private static final e1 internalValueMap = new e1() { // from class: com.fyber.inneractive.sdk.bidder.adm.m
        @Override // com.fyber.inneractive.sdk.protobuf.e1
        public final d1 a(int i5) {
            if (i5 == 0) {
                return n.NONE;
            }
            if (i5 == 1) {
                return n.SINGLETAP;
            }
            if (i5 != 2) {
                return null;
            }
            return n.TRUESINGLETAP;
        }
    };
    private final int value;

    n(int i5) {
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
