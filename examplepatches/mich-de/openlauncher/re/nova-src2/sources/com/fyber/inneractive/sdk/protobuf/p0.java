package com.fyber.inneractive.sdk.protobuf;

/* loaded from: classes.dex */
public enum p0 {
    SCALAR(false),
    VECTOR(true),
    PACKED_VECTOR(true),
    MAP(false);

    private final boolean isList;

    p0(boolean z11) {
        this.isList = z11;
    }

    public final boolean a() {
        return this.isList;
    }
}
