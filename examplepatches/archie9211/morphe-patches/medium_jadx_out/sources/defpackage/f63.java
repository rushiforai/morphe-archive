package defpackage;

import com.medium.proto.obv.post.DeltaType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class f63 implements z63 {
    public static final f63 a = new f63();
    public static final DeltaType b = DeltaType.FAILURE;

    @Override // defpackage.z63
    public final DeltaType a() {
        return b;
    }

    public final boolean equals(Object obj) {
        return this == obj || (obj instanceof f63);
    }

    public final int hashCode() {
        return 92023932;
    }

    public final String toString() {
        return "Failure";
    }
}
