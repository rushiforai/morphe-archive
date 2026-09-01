package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class w1a {
    public final String a;
    public final int b;
    public final int c;
    public final boolean d;

    public w1a(String str, int i, int i2, boolean z) {
        this.a = str;
        this.b = i;
        this.c = i2;
        this.d = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof w1a)) {
            return false;
        }
        w1a w1aVar = (w1a) obj;
        return this.a.equals(w1aVar.a) && this.b == w1aVar.b && this.c == w1aVar.c && this.d == w1aVar.d;
    }

    public final int hashCode() {
        return (((((this.a.hashCode() * 31) + this.b) * 31) + this.c) * 31) + (this.d ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("ProcessDetails(processName=");
        sb.append(this.a);
        sb.append(", pid=");
        sb.append(this.b);
        sb.append(", importance=");
        sb.append(this.c);
        sb.append(", isDefaultProcess=");
        return ev6.A(sb, this.d, ')');
    }
}
