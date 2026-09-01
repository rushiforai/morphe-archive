package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class qva extends fdb {
    public final String c;
    public final long d;
    public final yua e;

    public qva(String str, long j, yua yuaVar) {
        this.c = str;
        this.d = j;
        this.e = yuaVar;
    }

    @Override // defpackage.fdb
    public final long f() {
        return this.d;
    }

    @Override // defpackage.fdb
    public final fn7 m() {
        String str = this.c;
        if (str != null) {
            x2b x2bVar = fn7.d;
            try {
                return en7.x(str);
            } catch (IllegalArgumentException unused) {
            }
        }
        return null;
    }

    @Override // defpackage.fdb
    public final zz0 v0() {
        return this.e;
    }
}
