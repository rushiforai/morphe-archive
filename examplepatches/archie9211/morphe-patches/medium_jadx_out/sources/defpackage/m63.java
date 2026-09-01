package defpackage;

import com.medium.proto.obv.post.DeltaType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class m63 implements z63 {
    public final String a;
    public final String b;
    public final DeltaType c = DeltaType.REVERT;

    public m63(String str, String str2) {
        this.a = str;
        this.b = str2;
    }

    @Override // defpackage.z63
    public final DeltaType a() {
        return this.c;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof m63)) {
            return false;
        }
        m63 m63Var = (m63) obj;
        return this.a.equals(m63Var.a) && this.b.equals(m63Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return ev6.y("Revert(versionId=", this.a, ", revision=", this.b, ")");
    }
}
