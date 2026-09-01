package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vqd {
    public final long a;
    public final long b;
    public final boolean c;

    public vqd(long j, long j2, boolean z) {
        this.a = j;
        this.b = j2;
        this.c = z;
    }

    public final vqd a(vqd vqdVar) {
        return new vqd(ip8.e(this.a, vqdVar.a), Math.max(this.b, vqdVar.b), this.c || vqdVar.c);
    }
}
