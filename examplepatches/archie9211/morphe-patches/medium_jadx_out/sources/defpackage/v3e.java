package defpackage;

import androidx.emoji2.text.flatbuffer.aI.aJzfoQ;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class v3e implements y3e {
    public final b24 a;

    public v3e(b24 b24Var) {
        this.a = b24Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof v3e) && this.a.equals(((v3e) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return ho2.E(aJzfoQ.GMjWYu, this.a, ")");
    }
}
