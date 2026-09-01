package defpackage;

import com.medium.proto.obv.post.DeltaType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class i63 implements z63 {
    public static final i63 a = new i63();
    public static final DeltaType b = DeltaType.PREDEFINED;

    @Override // defpackage.z63
    public final DeltaType a() {
        return b;
    }

    public final boolean equals(Object obj) {
        return this == obj || (obj instanceof i63);
    }

    public final int hashCode() {
        return 1308411348;
    }

    public final String toString() {
        return "Predefined";
    }
}
