package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tbg {
    public final String a;
    public final long b;
    public final int c;

    public tbg(String str, int i, long j) {
        this.a = str;
        this.b = j;
        this.c = i;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof tbg)) {
            return false;
        }
        tbg tbgVar = (tbg) obj;
        return tbgVar.a.equals(this.a) && tbgVar.b == this.b && tbgVar.c == this.c;
    }
}
