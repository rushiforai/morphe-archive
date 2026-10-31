package com.google.protobuf;

import java.io.Serializable;

/* loaded from: classes3.dex */
public enum u2 {
    INT(0),
    LONG(0L),
    FLOAT(Float.valueOf(0.0f)),
    DOUBLE(Double.valueOf(0.0d)),
    BOOLEAN(Boolean.FALSE),
    STRING(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b),
    BYTE_STRING(l.f34884b),
    ENUM(null),
    MESSAGE(null);


    /* renamed from: a, reason: collision with root package name */
    public final Object f34995a;

    u2(Serializable serializable) {
        this.f34995a = serializable;
    }
}
