package defpackage;

import com.medium.proto.obv.post.DeltaType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e63 implements z63 {
    public static final e63 a = new e63();
    public static final DeltaType b = DeltaType.CLONE;

    @Override // defpackage.z63
    public final DeltaType a() {
        return b;
    }

    public final boolean equals(Object obj) {
        return this == obj || (obj instanceof e63);
    }

    public final int hashCode() {
        return 355200207;
    }

    public final String toString() {
        return "Clone";
    }
}
