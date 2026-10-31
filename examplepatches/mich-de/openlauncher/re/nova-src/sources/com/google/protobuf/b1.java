package com.google.protobuf;

import java.io.Serializable;

/* loaded from: classes.dex */
public enum b1 {
    VOID(Void.class, null),
    INT(Integer.class, 0),
    LONG(Long.class, 0L),
    FLOAT(Float.class, Float.valueOf(0.0f)),
    DOUBLE(Double.class, Double.valueOf(0.0d)),
    BOOLEAN(Boolean.class, Boolean.FALSE),
    STRING(String.class, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b),
    BYTE_STRING(l.class, l.f34884b),
    ENUM(Integer.class, null),
    MESSAGE(Object.class, null);


    /* renamed from: a, reason: collision with root package name */
    public final Object f34824a;

    b1(Class cls, Serializable serializable) {
        this.f34824a = serializable;
    }
}
