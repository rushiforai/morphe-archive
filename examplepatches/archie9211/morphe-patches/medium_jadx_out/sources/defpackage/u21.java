package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class u21 extends fdb {
    public final fg3 c;
    public final String d;
    public final String e;
    public final yua f;

    public u21(fg3 fg3Var, String str, String str2) {
        this.c = fg3Var;
        this.d = str;
        this.e = str2;
        this.f = new yua(new tr0((ikc) fg3Var.c.get(1), this));
    }

    @Override // defpackage.fdb
    public final long f() {
        String str = this.e;
        if (str == null) {
            return -1L;
        }
        byte[] bArr = egf.a;
        try {
            return Long.parseLong(str);
        } catch (NumberFormatException unused) {
            return -1L;
        }
    }

    @Override // defpackage.fdb
    public final fn7 m() {
        String str = this.d;
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
        return this.f;
    }
}
