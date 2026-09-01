package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jx {
    public final Object a;
    public final int b;
    public int c;
    public final String d;

    public /* synthetic */ jx(ix ixVar, int i, int i2, int i3) {
        this(ixVar, i, (i3 & 4) != 0 ? Integer.MIN_VALUE : i2, (i3 & 8) != 0 ? "" : "androidx.compose.foundation.text.inlineContent");
    }

    public final lx a(int i) {
        int i2 = this.c;
        if (i2 != Integer.MIN_VALUE) {
            i = i2;
        }
        if (!(i != Integer.MIN_VALUE)) {
            c26.c("Item.end should be set first");
        }
        return new lx(this.a, this.b, i, this.d);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof jx)) {
            return false;
        }
        jx jxVar = (jx) obj;
        return g76.L(this.a, jxVar.a) && this.b == jxVar.b && this.c == jxVar.c && g76.L(this.d, jxVar.d);
    }

    public final int hashCode() {
        Object obj = this.a;
        return this.d.hashCode() + ((((((obj == null ? 0 : obj.hashCode()) * 31) + this.b) * 31) + this.c) * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("MutableRange(item=");
        sb.append(this.a);
        sb.append(", start=");
        sb.append(this.b);
        sb.append(", end=");
        sb.append(this.c);
        sb.append(", tag=");
        return ev6.z(sb, this.d, ')');
    }

    public jx(Object obj, int i, int i2, String str) {
        this.a = obj;
        this.b = i;
        this.c = i2;
        this.d = str;
    }
}
