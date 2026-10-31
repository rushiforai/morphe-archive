package androidx.datastore.preferences.protobuf;

import java.io.Serializable;

/* loaded from: classes.dex */
public enum w1 {
    INT(0),
    LONG(0L),
    FLOAT(Float.valueOf(0.0f)),
    DOUBLE(Double.valueOf(0.0d)),
    BOOLEAN(Boolean.FALSE),
    STRING(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b),
    BYTE_STRING(h.f14324c),
    ENUM(null),
    MESSAGE(null);


    /* renamed from: a, reason: collision with root package name */
    public final Object f14428a;

    w1(Serializable serializable) {
        this.f14428a = serializable;
    }
}
