package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class i3c {
    public static final i3c d = new i3c(0.0f, op8.l(4278190080L), 0);
    public final long a;
    public final long b;
    public final float c;

    public i3c(float f, long j, long j2) {
        this.a = j;
        this.b = j2;
        this.c = f;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof i3c)) {
            return false;
        }
        i3c i3cVar = (i3c) obj;
        long j = i3cVar.a;
        int i = uu1.i;
        return ezd.a(this.a, j) && ip8.b(this.b, i3cVar.b) && this.c == i3cVar.c;
    }

    public final int hashCode() {
        int i = uu1.i;
        return Float.floatToIntBits(this.c) + ((ev6.n(this.b) + (ev6.n(this.a) * 31)) * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Shadow(color=");
        ev6.F(this.a, ", offset=", sb);
        sb.append((Object) ip8.g(this.b));
        sb.append(", blurRadius=");
        return lv8.s(sb, this.c, ')');
    }
}
