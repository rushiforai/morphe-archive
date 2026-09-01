package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lx {
    public final Object a;
    public final int b;
    public final int c;
    public final String d;

    public lx(Object obj, int i, int i2, String str) {
        this.a = obj;
        this.b = i;
        this.c = i2;
        this.d = str;
        if (i <= i2) {
            return;
        }
        c26.a("Reversed range is not supported");
    }

    public static lx a(lx lxVar, ix ixVar, int i, int i2) {
        Object obj = ixVar;
        if ((i2 & 1) != 0) {
            obj = lxVar.a;
        }
        int i3 = lxVar.b;
        if ((i2 & 4) != 0) {
            i = lxVar.c;
        }
        return new lx(obj, i3, i, lxVar.d);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof lx)) {
            return false;
        }
        lx lxVar = (lx) obj;
        return g76.L(this.a, lxVar.a) && this.b == lxVar.b && this.c == lxVar.c && g76.L(this.d, lxVar.d);
    }

    public final int hashCode() {
        Object obj = this.a;
        return this.d.hashCode() + ((((((obj == null ? 0 : obj.hashCode()) * 31) + this.b) * 31) + this.c) * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Range(item=");
        sb.append(this.a);
        sb.append(", start=");
        sb.append(this.b);
        sb.append(", end=");
        sb.append(this.c);
        sb.append(", tag=");
        return ev6.z(sb, this.d, ')');
    }

    public lx(int i, int i2, Object obj) {
        this(obj, i, i2, "");
    }
}
