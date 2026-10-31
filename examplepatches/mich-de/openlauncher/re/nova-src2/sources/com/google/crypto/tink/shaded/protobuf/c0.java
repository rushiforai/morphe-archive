package com.google.crypto.tink.shaded.protobuf;

import java.io.Serializable;

/* loaded from: classes3.dex */
public enum c0 {
    VOID(Void.class, null),
    INT(Integer.class, 0),
    LONG(Long.class, 0L),
    FLOAT(Float.class, Float.valueOf(0.0f)),
    DOUBLE(Double.class, Double.valueOf(0.0d)),
    BOOLEAN(Boolean.class, Boolean.FALSE),
    STRING(String.class, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b),
    BYTE_STRING(i.class, i.f34608b),
    ENUM(Integer.class, null),
    MESSAGE(Object.class, null);


    /* renamed from: a, reason: collision with root package name */
    public final Object f34590a;

    c0(Class cls, Serializable serializable) {
        this.f34590a = serializable;
    }
}
