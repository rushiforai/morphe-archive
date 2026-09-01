package defpackage;

import com.google.android.material.internal.It.KLTXZbnQvj;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public enum gy {
    ALL(null),
    FIELD(null),
    FILE(null),
    PROPERTY(null),
    PROPERTY_GETTER("get"),
    PROPERTY_SETTER("set"),
    RECEIVER(null),
    CONSTRUCTOR_PARAMETER("param"),
    SETTER_PARAMETER("setparam"),
    PROPERTY_DELEGATE_FIELD(KLTXZbnQvj.mabwJvenZ);

    public final String a;

    gy(String str) {
        this.a = str == null ? sgg.a0(name()) : str;
    }

    public final String getRenderName() {
        return this.a;
    }
}
