package com.fyber.inneractive.sdk.bidder.adm;

import com.fyber.inneractive.sdk.protobuf.d1;
import com.fyber.inneractive.sdk.protobuf.e1;

/* loaded from: classes3.dex */
public enum g implements d1 {
    AUTOSTOREKITNONE(0),
    AUTOSTOREKITPRESENTONLY(1),
    AUTOSTOREKITPRESENTANDTRACK(2),
    UNRECOGNIZED(-1);

    public static final int AUTOSTOREKITNONE_VALUE = 0;
    public static final int AUTOSTOREKITPRESENTANDTRACK_VALUE = 2;
    public static final int AUTOSTOREKITPRESENTONLY_VALUE = 1;
    private static final e1 internalValueMap = new e1() { // from class: com.fyber.inneractive.sdk.bidder.adm.f
        @Override // com.fyber.inneractive.sdk.protobuf.e1
        public final d1 a(int i5) {
            if (i5 == 0) {
                return g.AUTOSTOREKITNONE;
            }
            if (i5 == 1) {
                return g.AUTOSTOREKITPRESENTONLY;
            }
            if (i5 != 2) {
                return null;
            }
            return g.AUTOSTOREKITPRESENTANDTRACK;
        }
    };
    private final int value;

    g(int i5) {
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
