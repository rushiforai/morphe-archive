package com.fyber.inneractive.sdk.bidder;

import com.fyber.inneractive.sdk.protobuf.d1;
import com.fyber.inneractive.sdk.protobuf.e1;

/* loaded from: classes.dex */
public enum m0 implements d1 {
    UNITCONTENTTYPEUNKNOWN(0),
    DISPLAY(1),
    VIDEO(2),
    UNRECOGNIZED(-1);

    public static final int DISPLAY_VALUE = 1;
    public static final int UNITCONTENTTYPEUNKNOWN_VALUE = 0;
    public static final int VIDEO_VALUE = 2;
    private static final e1 internalValueMap = new e1() { // from class: com.fyber.inneractive.sdk.bidder.l0
        @Override // com.fyber.inneractive.sdk.protobuf.e1
        public final d1 a(int i5) {
            if (i5 == 0) {
                return m0.UNITCONTENTTYPEUNKNOWN;
            }
            if (i5 == 1) {
                return m0.DISPLAY;
            }
            if (i5 != 2) {
                return null;
            }
            return m0.VIDEO;
        }
    };
    private final int value;

    m0(int i5) {
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
