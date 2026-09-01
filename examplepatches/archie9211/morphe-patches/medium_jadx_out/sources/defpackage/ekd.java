package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ekd {
    public final long a;
    public final long b;

    public ekd(long j, long j2) {
        this.a = j;
        this.b = j2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ekd)) {
            return false;
        }
        ekd ekdVar = (ekd) obj;
        long j = ekdVar.a;
        int i = uu1.i;
        return ezd.a(this.a, j) && ezd.a(this.b, ekdVar.b);
    }

    public final int hashCode() {
        int i = uu1.i;
        return ev6.n(this.b) + (ev6.n(this.a) * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("SelectionColors(selectionHandleColor=");
        ev6.F(this.a, ", selectionBackgroundColor=", sb);
        sb.append((Object) uu1.h(this.b));
        sb.append(')');
        return sb.toString();
    }
}
