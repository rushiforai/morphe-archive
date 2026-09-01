package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class t1a {
    public static final s1a Companion = new s1a();
    public final int a;
    public final String b;

    public /* synthetic */ t1a(int i, int i2, String str) {
        if (3 != (i & 3)) {
            iq7.S(i, 3, r1a.a.a());
            throw null;
        }
        this.a = i2;
        this.b = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof t1a)) {
            return false;
        }
        t1a t1aVar = (t1a) obj;
        return this.a == t1aVar.a && g76.L(this.b, t1aVar.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("ProcessData(pid=");
        sb.append(this.a);
        sb.append(", uuid=");
        return ev6.z(sb, this.b, ')');
    }

    public t1a(int i, String str) {
        str.getClass();
        this.a = i;
        this.b = str;
    }
}
