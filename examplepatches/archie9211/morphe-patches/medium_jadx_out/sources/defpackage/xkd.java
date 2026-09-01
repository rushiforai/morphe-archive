package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xkd {
    public final String a;
    public final String b;
    public final String c;
    public final boolean d;

    public xkd(String str, String str2, String str3, boolean z) {
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof xkd)) {
            return false;
        }
        xkd xkdVar = (xkd) obj;
        return this.a.equals(xkdVar.a) && this.b.equals(xkdVar.b) && this.c.equals(xkdVar.c) && this.d == xkdVar.d;
    }

    public final int hashCode() {
        return wgd.o(wgd.o(this.a.hashCode() * 31, 31, this.b), 31, this.c) + (this.d ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("ThreadDump(name=", this.a, ", state=", this.b, ", stack=");
        sbU.append(this.c);
        sbU.append(", crashed=");
        sbU.append(this.d);
        sbU.append(")");
        return sbU.toString();
    }
}
