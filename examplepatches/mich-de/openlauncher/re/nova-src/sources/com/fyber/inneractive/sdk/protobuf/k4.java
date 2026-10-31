package com.fyber.inneractive.sdk.protobuf;

import java.io.Serializable;

/* loaded from: classes3.dex */
public enum k4 {
    INT(0),
    LONG(0L),
    FLOAT(Float.valueOf(0.0f)),
    DOUBLE(Double.valueOf(0.0d)),
    BOOLEAN(Boolean.FALSE),
    STRING(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b),
    BYTE_STRING(s.f30889b),
    ENUM(null),
    MESSAGE(null);

    private final Object defaultDefault;

    k4(Serializable serializable) {
        this.defaultDefault = serializable;
    }
}
