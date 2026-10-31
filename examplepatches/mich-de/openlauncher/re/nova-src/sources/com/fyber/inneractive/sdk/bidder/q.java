package com.fyber.inneractive.sdk.bidder;

import com.fyber.inneractive.sdk.protobuf.d1;
import com.fyber.inneractive.sdk.protobuf.e1;

/* loaded from: classes.dex */
public enum q implements d1 {
    NATIVE(0),
    UNITY3D(1),
    UNRECOGNIZED(-1);

    public static final int NATIVE_VALUE = 0;
    public static final int UNITY3D_VALUE = 1;
    private static final e1 internalValueMap = new e1() { // from class: com.fyber.inneractive.sdk.bidder.p
        @Override // com.fyber.inneractive.sdk.protobuf.e1
        public final d1 a(int i5) {
            if (i5 == 0) {
                return q.NATIVE;
            }
            if (i5 != 1) {
                return null;
            }
            return q.UNITY3D;
        }
    };
    private final int value;

    q(int i5) {
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
