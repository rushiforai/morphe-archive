package com.fyber.inneractive.sdk.bidder.adm;

import com.fyber.inneractive.sdk.protobuf.d1;
import com.fyber.inneractive.sdk.protobuf.e1;

/* loaded from: classes3.dex */
public enum e implements d1 {
    DISPLAY(0),
    VIDEO(1),
    VIDEOANDDISPLAY(2),
    UNRECOGNIZED(-1);

    public static final int DISPLAY_VALUE = 0;
    public static final int VIDEOANDDISPLAY_VALUE = 2;
    public static final int VIDEO_VALUE = 1;
    private static final e1 internalValueMap = new e1() { // from class: com.fyber.inneractive.sdk.bidder.adm.d
        @Override // com.fyber.inneractive.sdk.protobuf.e1
        public final d1 a(int i5) {
            if (i5 == 0) {
                return e.DISPLAY;
            }
            if (i5 == 1) {
                return e.VIDEO;
            }
            if (i5 != 2) {
                return null;
            }
            return e.VIDEOANDDISPLAY;
        }
    };
    private final int value;

    e(int i5) {
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
